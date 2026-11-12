-- The welcome camera belongs to wasabi_multichar (locked). We never create or destroy it.
-- We only turn it, and make the game load full detail around it, while it sits at the welcome point.
local reported = false
local active = false

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
        ClearFocus()
        if Config.Weather then ClearOverrideWeather() end
        if Config.Hour then NetworkClearClockTimeOverride() end
    end
end)
