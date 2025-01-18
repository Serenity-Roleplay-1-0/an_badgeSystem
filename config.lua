Config = {}

Config.Inventory = "ox" -- supported: "qb" or "ox"

Config.Notify = "ox" -- supported: "qb" or "ox"

Config.Settings = {
    { -- LSPD Example
        itemName = "badge",    -- item name -- you need to add this item on your qbcore/shared/items.lua
        design = "lspd-2.png", -- imagename.png
        job = "police",        -- job name that will show this badge
        number = "#69",        -- callsign department number - It shows before the officer callsign
    },
    { -- BCSO Example
        itemName = "sdbadge",  -- you need to add this item on your qbcore/shared/items.lua
        design = "bcso-2.png",
        job = "sheriff",
        number = "#14",
    },
    { -- Ambulance Badge Example
        itemName = "emsbadge",  -- you need to add this item on your qbcore/shared/items.lua
        design = "ems.png",
        job = "ambulance",
        number = "EMS",
    },
}

Config.Ranks = {
    ["police"] = {    -- Job Name
        [0] = "Cdt.", -- Grade Level → Grade Name that you want to show before the name in the badge
        [1] = "Ofc.",
        [2] = "Sgt.",
        [3] = "Cpt.",
        [4] = "CoP.",
        [5] = "CoP.",
        [6] = "CoP.",
        [7] = "CoP.",
        [8] = "CoP.",
        [9] = "CoP.",
        [10] = "CoP.",
    },
    ["sheriff"] = {
        [0] = "Cdt.",
        [1] = "Dep.",
        [2] = "Cpl.",
        [3] = "Lt.",
        [4] = "S.",
    },
    ["ambulance"] = {
        [0] = "Rct.",
        [1] = "Para.",
        [2] = "Dr.",
        [3] = "Sgn.",
        [4] = "Chief",
    },
}

Config.DefaultCallsign = "000" -- This will only be used if you don't have a callsign yet