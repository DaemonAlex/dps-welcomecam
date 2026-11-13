-- The welcome camera belongs to wasabi_multichar (locked). We never create or destroy it.
-- We only turn it, and make the game load full detail around it, while it sits at the welcome point.
local reported = false
local active = false

-- The player's own body, while the welcome camera is up. The game drops the default character
-- into the world near the camera, 250 m up, and it falls straight past the lens. We hide it and
-- hold it still for as long as the welcome camera is showing, then put it back as it was.
local hidden = false     -- we made the body invisible
local froze = false      -- we froze it (it was not frozen before)

local function hideBody()
    if not Config.HideBody then return end
    local ped = PlayerPedId()
    if ped == 0 or not DoesEntityExist(ped) then return end
    if #(GetEntityCoords(ped) - Config.Pos) > (Config.HideBodyRadius or 400.0) then return end
    if IsEntityVisible(ped) then
        SetEntityVisible(ped, false, false)
        hidden = true
    end
    if not IsEntityPositionFrozen(ped) then
        FreezeEntityPosition(ped, true)
        froze = true
    end
end

local function showBody()
    local ped = PlayerPedId()
    if ped ~= 0 and DoesEntityExist(ped) then
        if hidden then SetEntityVisible(ped, true, false) end
        if froze then FreezeEntityPosition(ped, false) end
    end
    hidden, froze = false, false
end

-- Shared with client/hold.lua, which keeps the body hidden before the camera is up.
WelcomeBody = { hide = hideBody, show = showBody, camUp = function() return active end }

CreateThread(function()
    while true do
        local wait = 250
        local cam = GetRenderingCam()
        local atWelcome = cam ~= -1 and DoesCamExist(cam) and #(GetCamCoord(cam) - Config.Pos) <= Config.Radius

        if atWelcome then
            wait = 0
            if not active then
                active = true
                -- The player's body is parked far away, so the game only loads low detail here (blurry view).
                -- Moving the streaming focus to the camera makes it load the full-detail world at this spot.
                SetFocusPosAndVel(Config.Pos.x, Config.Pos.y, Config.Pos.z, 0.0, 0.0, 0.0)
                -- Clearest weather, for this player only and only on this screen. It sits on top of the synced weather.
                if Config.Weather then SetOverrideWeather(Config.Weather) end
            end
            if Config.Weather then
                -- Any colour or fog filter laid over the view is removed while the welcome screen is up.
                ClearTimecycleModifier()
                ClearExtraTimecycleModifier()
            end
            if Config.Hour then NetworkOverrideClockTime(Config.Hour, 0, 0) end
            hideBody()
            -- If the owner pointed it at a coord, that would win over a rotation every frame.
            StopCamPointing(cam)
            SetCamRot(cam, Config.Pitch, 0.0, Config.Heading, 2)
            if Config.Sharp then
                -- Depth-of-field blur off for this camera, and no full-screen blur effect.
                SetCamUseShallowDofMode(cam, false)
                SetCamDofStrength(cam, 0.0)
                if IsScreenblurFadeRunning() then TriggerScreenblurFadeOut(0.0) end
            end
            if not reported then
                reported = true
                TriggerServerEvent('dps-welcomecam:aimed')
            end
        elseif active then
            active = false
            showBody()
            -- Hand streaming back to the player's body, which is where the character scenes are built.
            ClearFocus()
            if Config.Weather then ClearOverrideWeather() end
            if Config.Hour then NetworkClearClockTimeOverride() end
        end
        Wait(wait)
    end
end)

AddEventHandler('onResourceStop', function(res)
    if res == GetCurrentResourceName() and active then
        showBody()
        ClearFocus()
        if Config.Weather then ClearOverrideWeather() end
        if Config.Hour then NetworkClearClockTimeOverride() end
    end
end)
