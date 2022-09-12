local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('QB-MakeItRain:Server:Payment')
AddEventHandler('QB-MakeItRain:Server:Payment', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local money = Player.Functions.GetMoney('cash')
    local price = Config.Payment
    if money >= price then
        Player.Functions.RemoveMoney('cash', price)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('not_enough'))
    end
end)