-- One log line per player per session, so we can see from the server log that the helper found the camera.
local seen = {}

RegisterNetEvent('dps-welcomecam:aimed', function()
    local src = source
    if seen[src] then return end
    seen[src] = true
    print(('[dps-welcomecam] welcome camera found and aimed for %s (%s)'):format(GetPlayerName(src) or '?', src))
end)

AddEventHandler('playerDropped', function()
    seen[source] = nil
end)
