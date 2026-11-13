fx_version "cerulean"
game "gta5"
name "dps-welcomecam"
author "DelPerroSands"
description "Aims the wasabi_multichar welcome camera, which only takes a position and no direction"
version "1.1.0"
lua54 "yes"
shared_scripts { "config.lua" }
client_scripts { "client/main.lua", "client/hold.lua" }

-- The hold cover (client/hold.lua). It never takes focus.
ui_page "html/hold.html"
files { "html/hold.html", "html/dps-logo.svg" }
server_scripts { "server/main.lua" }
