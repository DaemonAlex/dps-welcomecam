Config = {}

-- Must match Config.WelcomeCam in wasabi_multichar/config/client/config.lua.
-- The helper only acts on a camera sitting at this point, so the character scenes are left alone.
Config.Pos = vector3(-223.62, -2013.37, 251.81)

-- Which way the welcome camera looks.
-- Heading: 0 = north, 90 = west, 180 = south, 270 = east (the same number /coords gives as the 4th value).
-- Pitch: 0 = level, minus = down, plus = up.
Config.Heading = 329.39
Config.Pitch = -8.0

-- How close (metres) a camera must be to Config.Pos to count as the welcome camera.
Config.Radius = 2.0

-- true = load full detail around the camera and switch off blur effects on it.
Config.Sharp = true

-- Haze: force this weather on the welcome screen only (this player only). 'EXTRASUNNY' is the clearest. false = leave the live weather.
Config.Weather = 'EXTRASUNNY'

-- Force the hour of day on the welcome screen only (0-23). false = leave the live time. Midday (12) has the least haze.
Config.Hour = false

-- The default character the game drops in near the camera falls past the lens. true = keep the
-- player's own body hidden and still while the welcome camera is up, and put it back after.
-- (2026-11-13, Damon: "I see the generic character fall right in front of the camera".)
Config.HideBody = true
-- Only a body within this many metres of the camera is touched.
Config.HideBodyRadius = 400.0

-- THE HOLD (2026-11-13, Damon: "allow things to load longer").
-- A plain cover with the logo stays up after the loading screen until the world has loaded,
-- so nobody watches it being built. It runs once, when a player joins.
Config.Hold = {
    enabled = true,
    -- Shortest time the cover stays up once the player is in the session (milliseconds).
    -- Raise this to give everything longer to load. 4000 = 4 seconds.
    min = 4000,
    -- Longest it can ever stay up. A player is never stuck behind it.
    max = 15000,
    -- The world counts as loaded when the game is waiting for no more than `maxRequests`
    -- pieces, and has stayed that way for `quiet` milliseconds.
    maxRequests = 2,
    quiet = 1500,
    -- How long the cover takes to fade away.
    fade = 700,
    -- The line under the logo. '' for none.
    text = 'Loading the city',
    -- true prints how long each hold lasted to the player's F8 console.
    debug = true,
}
