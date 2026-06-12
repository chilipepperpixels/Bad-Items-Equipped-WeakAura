function()
    local badItems = { -- Item list: [itemId from wowhead] = "<name>",
        -- Black Temple teleport neck
        [32757] = "Blessed Medallion of Karabor",

        -- Timeless Isle teleport trinket
        [103678] = "Time-Lost Artifact",

        -- Fishing pole
        [19970] = "Arcanite Fishing Pole",

        -- Guild teleport cloaks
        [63352] = "Shroud of Cooperation",
        [63207] = "Shroud of Cooperation",
        [63206] = "Wrap of Unity",
        [65360] = "Cloak of Coordination",
        [65274] = "Cloak of Coordination",

        -- Dalaran teleport rings
        [40585] = "Signet of the Kirin Tor",
        [51557] = "Runed Signet of the Kirin Tor",
        [45691] = "Inscribed Signet of the Kirin Tor",

        -- Tabards
        [63379] = "Baradin's Wardens Tabard",
        [63378] = "Hellscream's Reach Tabard",
        [46874] = "Argent Crusader's Tabard",

        -- Other equipped teleport items
        [37863] = "Direbrew's Remote",
        [64457] = "The Last Relic of Argus",
        [50287] = "Boots of the Bay",
    }

    aura_env.itemName = nil

    local _, instanceType = GetInstanceInfo()
    local isGrouped = IsInGroup()

    if instanceType ~= "raid" and instanceType ~= "party" and not isGrouped then
        return false
    end

    for slot = 1, 19 do
        local itemID = GetInventoryItemID("player", slot)

        if itemID and badItems[itemID] then
            aura_env.itemName = badItems[itemID]
            aura_env.itemID = itemID
            aura_env.slot = slot
            return true
        end
    end

    return false
end
