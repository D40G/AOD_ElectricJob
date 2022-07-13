if Config.Framework =='esx' then
	ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif Config.Framework =='QBCore' then
	QBCore = exports['qb-core']:GetCoreObject()
else
	print('no framework set or standalone')
end

RegisterServerEvent('GetPaid')
AddEventHandler('GetPaid', function()
    if Config.Framework == 'esx' then
        if Config.Payment == 'cash' then
            local _source = source
            local xPlayer = ESX.GetPlayerFromId(_source)
            xPlayer.addMoney(Config.JobPay)
        elseif Config.Payment == 'bank' then
            local _source = source
            local xPlayer = ESX.GetPlayerFromId(_source)
            xPlayer.addAccountMoney('bank', Config.JobPay)
        end

    elseif Config.Framework == 'QBCore' then
        if Config.Payment == 'cash' then
            local _source = source
            local Player = QBCore.Functions.GetPlayer(_source)
            Player.Functions.AddMoney('cash', Config.JobPay)
        elseif Config.Payment == 'bank' then
            local _source = source
            local Player = QBCore.Functions.GetPlayer(_source)
            Player.Functions.AddMoney('bank', Config.JobPay, "Electric Job")
        end
    else
        print('no framework selected')
    end
end)

RegisterServerEvent('setlight:on')
AddEventHandler('setlight:on', function(location)
    local loc = location
    TriggerClientEvent("setlight:on", -1, loc)
end)

RegisterServerEvent('setlight:off')
AddEventHandler('setlight:off', function(location)
    local loc = location
    TriggerClientEvent("setlight:off", -1, loc)
end)