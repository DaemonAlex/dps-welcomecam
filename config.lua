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
