JWORK = nil

TriggerEvent('jwork:getSharedObject', function(obj) JWORK = obj end)

RegisterServerEvent('jammu:buy')
AddEventHandler('jammu:buy', function(name, arme, quantite, prix)
	local xPlayer = JWORK.GetPlayerFromId(source)

	xPlayer.addWeapon(arme, quantite)
	xPlayer.removeMoney(prix)

	TriggerClientEvent("jwork:showNotification", source, "~g~Vous avez payé ~b~"..name.."~g~ à "..prix.."$.")
end)
