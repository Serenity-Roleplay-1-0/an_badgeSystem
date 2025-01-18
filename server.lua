local QBCore = exports['qb-core']:GetCoreObject()

local cachedBadges = {}

Citizen.CreateThread(function()
    for k,v in pairs(Config.Settings) do
        QBCore.Functions.CreateUseableItem(v.itemName, function(src, item)
            local Player = QBCore.Functions.GetPlayer(src)
            if not Player.Functions.GetItemByName(item.name) then return end

            local itemData = Player.Functions.GetItemByName(item.name)
            local badgeAvatar = ''
            local fullname = ''
            local rank = ''
            local cs = Config.DefaultCallsign

            if Config.Inventory == "qb" then
                badgeAvatar = itemData.info.badge_avatar
                fullname = itemData.info.fullname
                rank = itemData.info.rank
                cs = itemData.info.callsign
            elseif Config.Inventory == "ox" then
                badgeAvatar = itemData.metadata.badge_avatar
                fullname = itemData.metadata.fullname
                rank = itemData.metadata.rank
                cs = itemData.metadata.callsign
            end
            if itemData and badgeAvatar and fullname and rank and cs then
                TriggerClientEvent("an_badges:showBadge", src, v.design, badgeAvatar, fullname, v.number, rank, cs)
            else
                if Player.PlayerData.job.name == v.job then
                    if Config.Notify == "qb" then
                        TriggerClientEvent("an_badges:notify", src, "You have not yet created your badge, please provide a picture URL to be used in your badge", "error")
                    elseif Config.Notify == "ox" then
                        TriggerClientEvent('ox_lib:notify', src, {
                                description = 'You have not yet created your badge! Please provide a photo URL to be used on your badge.',
                                duration = 5000,
                                positon = 'top-right',
                                type = 'error'
                            })
                    end
                    TriggerClientEvent("an_badges:createBadge", src, item.name)
                else
                    if Config.Notify == "qb" then
                        TriggerClientEvent("an_badges:notify", src, "That is not yours.", "error")
                    elseif Config.Notify == "ox" then
                        TriggerClientEvent('ox_lib:notify', src, {
                            description = 'That badge is not yours!',
                            duration = 5000,
                            positon = 'top-right',
                            type = 'error'
                        })
                    end
                end
            end
        end)
    end
end)

RegisterNetEvent('an_badges:showSV', function(pid, data)
    TriggerClientEvent("an_badges:showCL", pid, data)
end)

RegisterNetEvent('an_badges:updateBadge', function(url, itemName)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local jobName = Player.PlayerData.job.name
        local cs = Player.PlayerData.metadata["callsign"]
        if not cs or cs == "NO CALLSIGN" then
            cs = Config.DefaultCallsign
        end
        local rank = Config.Ranks[jobName][Player.PlayerData.job.grade.level]
        local fullname = Player.PlayerData.charinfo.firstname .." ".. Player.PlayerData.charinfo.lastname
        local itemData = Player.Functions.GetItemByName(itemName)
        local playerItem = Player.PlayerData.items[itemData.slot]

        if Config.Inventory == "qb" then
            playerItem.info.badge_avatar = url
            playerItem.info.fullname = fullname
            playerItem.info.rank = rank
            playerItem.info.callsign = cs
            Player.Functions.SetInventory(Player.PlayerData.items, true)
        elseif Config.Inventory == "ox" then
            local ox_inventory = exports.ox_inventory
            local itemInfo = {
                badge_avatar = url,
                fullname = fullname,
                rank = rank,
                callsign = cs
            }
            ox_inventory:RemoveItem(src, itemName, 1)
            ox_inventory:AddItem(src, itemName, 1, itemInfo)
        end

        if Config.Notify == "qb" then
            TriggerClientEvent("an_badges:notify", src, "Your badge avatar was updated successfully.", "success")
        elseif Config.Notify == "ox" then
            TriggerClientEvent('ox_lib:notify', src, {
                description = 'Your badge avatar was successfully updated!',
                duration = 5000,
                positon = 'top-right',
                type = 'success',
            })
        end
    end
end)