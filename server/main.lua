local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('QB-MakeItRain:Server:Payment')
AddEventHandler('QB-MakeItRain:Server:Payment', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local money = Player.Functions.GetMoney()
    local price = Config.Payment
    if money.cash >= price then
        Player.Functions.RemoveMoney(price)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('not_enough'))
    end
end)