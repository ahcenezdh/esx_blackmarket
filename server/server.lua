RegisterServerEvent('esx_blackmarket:grossiste',function(data, value)
	local money = exports.ox_inventory:GetItem(source, 'money', nil, false)
	local total = data.price * value
	if money.count >= total then
		exports.ox_inventory:RemoveItem(source, 'money', total)
		exports.ox_inventory:AddItem(source, data.item, value)
	else
		TriggerClientEvent('ox_lib:notify', source, {type = 'error', description = "Vous n'avez pas assez d'argent"})
	end
end)