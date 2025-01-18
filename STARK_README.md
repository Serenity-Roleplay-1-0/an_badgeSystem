# Acknowledgements

## aymannajim
I would very much like to thank the orignial developer for creating an excellent script for QBCore that allows players to utilize a badge for identification purposes enhancing law enforcement and medical roleplay.

## SneakEOne
I would like to thank my dear friend and fellow developer, SneakEOne, for his help, guidance, suggestions, and more in my conversion of this script to support more than one inventory resource, allowing for more widespread use across all of FiveM.

## QBCore
I would like to thank the developers of QBCore for creating a solid RP framework for FiveM servers that allows for easy development of scripts to enhance gameplay.

## QBox
I would also like to thank the developers of Qbox for creating a solid, alternative RP framework for FiveM servers that allows for easy development of scripts to enhance gameplay.

## Overextended
I would like to thank the amazing developers at Overextended for creating stellar resources in both Ox Inventory and Ox Lib.

# Description
AN Badge System is a resource that allows LEOs and EMS to identify themselves in any roleplay scenario as being a member of either a law enforcement agency or hospital.

## Installation
1. Add an_badgeSystem to your resources folder for your server
2. Be sure to remove the '-main' from the end of the folder name
3. Customize the script to your liking in the Config!
4. Add ```ensure an_badgeSystem``` to your server.cfg
5. Restart your server and enjoy!!

## Inventory
1. qb-inventory
Add the following lines to qb-core/shared/items.lua
badge                        = { name = 'badge', label = 'LSPD Badge', weight = 500, type = 'item', image = 'lspd-2.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'LSPD Badge' },
sdbadge                      = { name = 'sdbadge', label = 'BCSO Badge', weight = 500, type = 'item', image = 'bcso-2.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'BCSO Badge' },
emsbadge                     = { name = 'emsbadge', label = 'EMS Badge', weight = 500, type = 'item', image = 'ems.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'EMS Badge' },

2. ox_inventory
Add the following to ox_inventory/data/items.lua

	["badge"] = {
		label = "LSPD Badge",
		weight = 500,
		stack = false,
		close = true,
		description = "LSPD Badge",
		client = {
			image = "lspd-2.png",
		}
	},

    ["sdbadge"] = {
		label = "BCSO Badge",
		weight = 500,
		stack = false,
		close = true,
		description = "BCSO Badge",
		client = {
			image = "bcso-2.png",
		}
	},

    ["emsbadge"] = {
		label = "EMS Badge",
		weight = 500,
		stack = false,
		close = true,
		description = "EMS Badge",
		client = {
			image = "ems.png",
		}
	},

# Features
1. Unique Badges For LEOs and EMS

# Supported Frameworks
1. QBCore
2. QBox

# Dependencies
1. qb-inventory or ox_inventory
2. ox lib