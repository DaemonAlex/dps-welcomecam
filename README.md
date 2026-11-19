<p align="center"><img src=".github/dps-logo.svg" alt="DelPerroSands" width="360"></p>

# dps-welcomecam

Aims the first camera a new player sees.

## What it is for

wasabi_multichar shows a welcome camera before character select. Its config takes a position and
nothing else, so the camera faces wherever the script decides, the view is blurred, and the
weather can hide the city behind haze. This script takes that same camera and points it where you
want, sharp and clear. The first thing a player sees of your server is a view you chose.

## What it does

- Finds the welcome camera when it appears at your chosen position.
- Turns it to your heading and pitch.
- Switches off the blur, and loads the distant scenery so the skyline is drawn.
- Holds clear weather, and optionally a fixed hour, while the camera is up.
- Puts everything back the moment the player leaves the camera.

It does not create a camera of its own and does not touch wasabi_multichar's files, so an update
to the paid script does not undo it.

## The hold, and the falling character

Two things added on 13 November 2026, both for the moment just after the loading screen ends.

**The hold.** A plain navy cover with the logo stays up until the world has loaded, so nobody
watches it being built. It waits until the game has stopped asking for models and textures and
has stayed quiet for a moment. It never takes the mouse or keyboard, runs once per join, and
always lets go after `Config.Hold.max`. To give everything longer to load, raise
`Config.Hold.min`.

**The falling character.** The game drops the default character into the world near the camera,
250 m up, and it used to fall straight past the lens. The player's own body is now hidden and
held still while the welcome camera is up, and put back as it was afterwards.

| Setting | Default | Meaning |
|---|---|---|
| `Config.Hold.enabled` | `true` | Turn the hold on. |
| `Config.Hold.min` | `4000` | Shortest time the cover stays up, in milliseconds. |
| `Config.Hold.max` | `15000` | Longest it can ever stay up. |
| `Config.Hold.maxRequests`, `quiet` | `2`, `1500` | The world counts as loaded when the game waits for no more than this many pieces, for this long. |
| `Config.Hold.fade` | `700` | How long the cover takes to fade. |
| `Config.Hold.text` | `'Loading the city'` | The line under the logo. |
| `Config.Hold.debug` | `true` | Prints how long each hold lasted to the F8 console. |
| `Config.HideBody` | `true` | Hide and hold the player's body while the welcome camera is up. |
| `Config.HideBodyRadius` | `400.0` | Only a body within this many metres of the camera is touched. |

## On its own, and with other scripts

**On its own it does nothing.** It is a helper for one paid script. Without wasabi_multichar there
is no welcome camera to aim.

**With wasabi_multichar.** Set the same position in both configs. wasabi places the camera, this
aims it and clears the view.

**With a weather script.** The clear weather is a local override for that one player while the
camera is up. Your weather sync is untouched and takes over again afterwards.

## Requirements

- wasabi_multichar (paid), with `Config.WelcomeCam` set to the same position as below.

## Install

1. Put the folder in your resources and add `ensure dps-welcomecam` after `wasabi_multichar`.
2. Stand where you want the camera, note the position and heading, and set them in `config.lua`.
3. Set the same position in wasabi_multichar's `Config.WelcomeCam`.

## Configuration

`config.lua`:

| Setting | Meaning |
|---|---|
| `Config.Pos` | Where the welcome camera is. Must match wasabi_multichar. |
| `Config.Heading` | Which way it faces, in degrees. |
| `Config.Pitch` | Tilt. Negative looks down. |
| `Config.Radius` | How close a camera must be to `Pos` to count as the welcome camera. |
| `Config.Sharp` | `true` switches off the depth-of-field blur. |
| `Config.Weather` | Weather held while the camera is up, or `false` to leave it alone. |
| `Config.Hour` | Hour of day held while the camera is up, or `false` to leave it alone. |

## Recent changes

- **13 November 2026.** Version 1.1.0: the hold after the loading screen, and the default character no longer falls past the camera.
- **12 November 2026.** First version: aims the welcome camera, clears blur and haze.

## Author

Made by [DaemonAlex](https://github.com/DaemonAlex) for DelPerroSands.

## Other DPS scripts

All of these are made for DelPerroSands and run together on one Qbox server. Each one works on
its own. The ones marked "pairs with" do more when both are running.

| Script | What it does |
|---|---|
| [dps-inventory](https://github.com/DaemonAlex/dps-inventory) | The inventory: ox_inventory with equipment slots, backpacks, armour plates and a self status panel, in the DelPerroSands colours. |
| [dps-medical](https://github.com/DaemonAlex/dps-medical) | Patient records, illness and diagnostic tests. A companion to wasabi_ambulance. Pairs with dps-inventory: symptoms and diagnoses show on the status panel. |
| [dps-insurance](https://github.com/DaemonAlex/dps-insurance) | Ties m-Insurance into the MDT, impound, hospital and medical chart, and raises premiums for incidents other scripts report. Pairs with dps-medical and dps-fuel. |
| [dps-studio](https://github.com/DaemonAlex/dps-studio) | Build rooms, doors and portals in game from one panel (`/studio`), with owners and managers so staff do not have to support them. |
| [dps-shops](https://github.com/DaemonAlex/dps-shops) | Shop clerks who greet, react to robberies, talk back through dps-ainpcs and remember trouble, plus player-owned stores with delivery runs. Pairs with dps-ainpcs. |
| [dps-fleet](https://github.com/DaemonAlex/dps-fleet) | Vehicle browser and workshop on one panel: extras, liveries and mods for emergency vehicles. |
| [dps-parking](https://github.com/DaemonAlex/dps-parking) | Parking with valet, impound, violations and reserved spots. |
| [dps-vehiclepersistence](https://github.com/DaemonAlex/dps-vehiclepersistence) | Vehicles stay where they were parked. Pairs with dps-parking. |
| [dps-towjob](https://github.com/DaemonAlex/dps-towjob) | Queue-based tow job with jg-mechanic integration. |
| [dps-services](https://github.com/DaemonAlex/dps-services) | Request a tow and follow it live on the lb-phone and lb-tablet. Pairs with dps-towjob. |
| [dps-autoshops](https://github.com/DaemonAlex/dps-autoshops) | Self-service repair shops when no mechanic is on duty. |
| [dps-cityworker](https://github.com/DaemonAlex/dps-cityworker) | City infrastructure job and career. |
| [dps-ainpcs](https://github.com/DaemonAlex/dps-ainpcs) | NPCs you can talk to, with trust, quests and intel. Other scripts can make their own NPCs talk (dps-shops clerks). |
| [dps-badpeds](https://github.com/DaemonAlex/dps-badpeds) | Police interaction with NPCs: stops, arrests, intel and jail records. |
| [dps-gangwars](https://github.com/DaemonAlex/dps-gangwars) | Ambient gang NPCs, territory population and war reinforcements. |
| [dps-rotations](https://github.com/DaemonAlex/dps-rotations) | Moves dealers, harvests and other spots on a fixed schedule. |
| [dps-trains](https://github.com/DaemonAlex/dps-trains) | The train system. Pairs with dps-trains-stock, dps-traintools and dps-transitapp. |
| [dps-transitapp](https://github.com/DaemonAlex/dps-transitapp) | Live train arrival boards on the lb-phone. |
| [dps-faceplant](https://github.com/DaemonAlex/dps-faceplant) | City help, reports and staff tools on the lb-phone and lb-tablet. |
| [dps-chat](https://github.com/DaemonAlex/dps-chat) | A command box for voice-only servers. No chat feed. |
| [dps-filmmode](https://github.com/DaemonAlex/dps-filmmode) | One key hides every HUD layer and gives a smooth free camera for recording. |
| [dps-fuel](https://github.com/DaemonAlex/dps-fuel) | Gas station drive-offs for the ox_fuel nozzle: ripped hose, pump fire, station camera and a police call, by odds. Pairs with dps-insurance. |
| [dps-voice](https://github.com/DaemonAlex/dps-voice) | Spoken lines for NPCs, station announcements, dispatch and shops, from local voice models first. Pairs with dps-ainpcs. |
| [dps-bags](https://github.com/DaemonAlex/dps-bags) | Real bags for ox_inventory: the bag you carry shows on your character. |
| [dps-items](https://github.com/DaemonAlex/dps-items) | Item rules for ox_inventory: locked items, glovebox seats and an exploit watch. |
| [dps-furniture](https://github.com/DaemonAlex/dps-furniture) | Puts streamed furniture packs into the qs-housing furniture shop. |
| [dps-shellbrowser](https://github.com/DaemonAlex/dps-shellbrowser) | Staff tool to look at every qs-housing shell and set its door. |
| [dps-signs](https://github.com/DaemonAlex/dps-signs) | Rotates city messages across the SmartSigns road boards. |
| [dps-stationclear](https://github.com/DaemonAlex/dps-stationclear) | Hides map props that are in the way and keeps stray game peds off chosen spots. |
| [dps-citymap](https://github.com/DaemonAlex/dps-citymap) | A ready-made map of the whole city, cut into tiles for in-game screens. |
| [dps-cayo](https://github.com/DaemonAlex/dps-cayo) | Switches on the game's own Cayo Perico island, and nothing else. |
| [dps-aviation](https://github.com/DaemonAlex/dps-aviation) | Flight behaviour: aircraft idle instead of cutting out, sane taxi speed, a real start sequence. |
| [dps-airlines](https://github.com/DaemonAlex/dps-airlines) | Airlines job: passenger flights, cargo, charters, flight school and maintenance. |
| [dps-traintools](https://github.com/DaemonAlex/dps-traintools) | Rider tools for trains: board, sit, get off at a stop, ambient passengers. Pairs with dps-trains. |
| [dps-trains-stock](https://github.com/DaemonAlex/dps-trains-stock) | Train models and carriage sets for the train system. No scripts. Pairs with dps-trains. |
| [dps-traintracks](https://github.com/DaemonAlex/dps-traintracks) | Extra train track data. No scripts. Pairs with dps-trains. |
| [dps-crossings](https://github.com/DaemonAlex/dps-crossings) | Level crossings that close when a train comes. Pairs with dps-trains. |
| [dps-transit](https://github.com/DaemonAlex/dps-transit) | Passenger rail planning and scheduling (older system; dps-trains runs today). |
| [dps-maritime](https://github.com/DaemonAlex/dps-maritime) | Dock work and boat deliveries with progression. |
| [dps-maritime-maps](https://github.com/DaemonAlex/dps-maritime-maps) | Map files for the Jetsam docks, the map half of dps-maritime. |
| [dps-proracing](https://github.com/DaemonAlex/dps-proracing) | Circuit racing with lobbies, an AI practice grid and lap times. |
| [dps-carmenu](https://github.com/DaemonAlex/dps-carmenu) | Staff vehicle browser and spawner over the live Qbox vehicle list. |
| [dps-clothingbrowser](https://github.com/DaemonAlex/dps-clothingbrowser) | Staff tool to browse, identify and export clothing and uniforms. |
| [dps-lootpeds](https://github.com/DaemonAlex/dps-lootpeds) | Loot dead NPCs, with loot tables per model. |
| [dps-hookers](https://github.com/DaemonAlex/dps-hookers) | Adults-only RP (18+), adapted from MH Hookers by MaDHouSe. |
| [dps-weatherbridge](https://github.com/DaemonAlex/dps-weatherbridge) | Lets qb-weathersync and Renewed-Weathersync scripts work with night_natural_disasters. |
| [dps-fixes](https://github.com/DaemonAlex/dps-fixes) | Small server fixes kept in one resource. |
| [dps-bucketfix](https://github.com/DaemonAlex/dps-bucketfix) | Puts players back in the main world after spawning. |
| [dps-unfocus](https://github.com/DaemonAlex/dps-unfocus) | One key that frees a player stuck in a menu. |
| [dps-handlingdump](https://github.com/DaemonAlex/dps-handlingdump) | Developer tool: saves the stock handling of every vanilla vehicle. |
| [dps-weaponsounds](https://github.com/DaemonAlex/dps-weaponsounds) | Custom weapon sounds (planning; no code yet). |
| [dps-events](https://github.com/DaemonAlex/dps-events) | Playtime reward events (planning; no code yet). |
