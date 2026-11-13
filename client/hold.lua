-- The hold: a plain cover that stays up after the loading screen until the world has had time
-- to load, so the player does not watch it being built. It only ever runs once, on joining.
-- It never takes the mouse or keyboard, and it always lets go after Config.Hold.max.
if not Config.Hold or not Config.Hold.enabled then return end

-- Started in the middle of a session (a script restart)? Then the player is already in the
-- world and there is nothing to cover.
if not GetIsLoadingScreenActive() and NetworkIsPlayerActive(PlayerId()) then return end

local function requests()
    -- how many models, textures and map pieces the game is still waiting for
    return Citizen.InvokeNative(0x4060057271CEBC89, Citizen.ResultAsInteger()) or 0
end

local function trace(msg)
    if Config.Hold.debug then print('[dps-welcomecam] hold: ' .. msg) end
end

CreateThread(function()
    -- the page needs a moment before it can take a message
    Wait(500)
    SendNUIMessage({ action = 'hold', show = true, text = Config.Hold.text })

    -- the clock starts when the player is really in the session
    while not (NetworkIsSessionStarted() and NetworkIsPlayerActive(PlayerId())) do Wait(100) end

    local began = GetGameTimer()
    local quietSince = nil
    local reason = 'world loaded'

    while true do
        Wait(100)

        local now = GetGameTimer()
        local ped = PlayerPedId()
        -- keep the default character from dropping into view before the camera is up
        if WelcomeBody then WelcomeBody.hide() end
        local busy = requests()
        local settled = busy <= Config.Hold.maxRequests
            and (ped == 0 or HasCollisionLoadedAroundEntity(ped))
            and not IsNetworkLoadingScene()

        if settled then
            quietSince = quietSince or now
        else
            quietSince = nil
        end

        if now - began >= Config.Hold.max then
            reason = 'time limit'
            break
        end

        if quietSince and now - quietSince >= Config.Hold.quiet and now - began >= Config.Hold.min then
            break
        end
    end

    trace(('released after %.1f s (%s)'):format((GetGameTimer() - began) / 1000.0, reason))
    SendNUIMessage({ action = 'hold', show = false, fade = Config.Hold.fade })

    -- If the welcome camera is showing, it keeps the body hidden and puts it back itself.
    -- If it is not (a returning player on the character screen), put the body back now.
    if WelcomeBody and not WelcomeBody.camUp() then WelcomeBody.show() end
end)
