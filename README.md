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

## Other DPS scripts

All of these are made for DelPerroSands and run together on one Qbox server. Each one works on
its own. The ones marked "pairs with" do more when both are running.

| Script | What it does |
|---|---|
| [dps-inventory](https://github.com/DaemonAlex/dps-inventory) | The inventory: ox_inventory with equipment slots, backpacks, armour plates and a self status panel, in the DelPerroSands colours. |
| [dps-medical](https://github.com/DaemonAlex/dps-medical) | Patient records, illness and diagnostic tests. A companion to wasabi_ambulance. Pairs with dps-inventory: symptoms and diagnoses show on the status panel. |
| [dps-insurance](https://github.com/DaemonAlex/dps-insurance) | Ties m-Insurance into the MDT, impound, hospital and medical chart. Pairs with dps-medical. |
| [dps-studio](https://github.com/DaemonAlex/dps-studio) | Build rooms, doors and portals in game from one panel (`/studio`), with owners and managers so staff do not have to support them. |
| [dps-shops](https://github.com/DaemonAlex/dps-shops) | Shop clerks who greet and react to a robbery, then player-owned shops. |
| [dps-fleet](https://github.com/DaemonAlex/dps-fleet) | Vehicle browser and workshop on one panel: extras, liveries and mods for emergency vehicles. |
| [dps-parking](https://github.com/DaemonAlex/dps-parking) | Parking with valet, impound, violations and reserved spots. |
| [dps-vehiclepersistence](https://github.com/DaemonAlex/dps-vehiclepersistence) | Vehicles stay where they were parked. Pairs with dps-parking. |
| [dps-towjob](https://github.com/DaemonAlex/dps-towjob) | Queue-based tow job with jg-mechanic integration. |
| [dps-services](https://github.com/DaemonAlex/dps-services) | Request a tow and follow it live on the lb-phone and lb-tablet. Pairs with dps-towjob. |
| [dps-autoshops](https://github.com/DaemonAlex/dps-autoshops) | Self-service repair shops when no mechanic is on duty. |
| [dps-cityworker](https://github.com/DaemonAlex/dps-cityworker) | City infrastructure job and career. |
| [dps-ainpcs](https://github.com/DaemonAlex/dps-ainpcs) | NPCs you can talk to, with trust, quests and intel. |
| [dps-badpeds](https://github.com/DaemonAlex/dps-badpeds) | Police interaction with NPCs: stops, arrests, intel and jail records. |
| [dps-gangwars](https://github.com/DaemonAlex/dps-gangwars) | Ambient gang NPCs, territory population and war reinforcements. |
| [dps-rotations](https://github.com/DaemonAlex/dps-rotations) | Moves dealers, harvests and other spots on a fixed schedule. |
| [dps-trains](https://github.com/DaemonAlex/dps-trains) | The train system. Pairs with dps-trains-stock, dps-traintools and dps-transitapp. |
| [dps-transitapp](https://github.com/DaemonAlex/dps-transitapp) | Live train arrival boards on the lb-phone. |
| [dps-faceplant](https://github.com/DaemonAlex/dps-faceplant) | City help, reports and staff tools on the lb-phone and lb-tablet. |
| [dps-chat](https://github.com/DaemonAlex/dps-chat) | A command box for voice-only servers. No chat feed. |
| [dps-filmmode](https://github.com/DaemonAlex/dps-filmmode) | One key hides every HUD layer and gives a smooth free camera for recording. |
