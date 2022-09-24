RDX = nil

TriggerEvent(
	"rdx:getSharedObject",
	function(obj)
		RDX = obj
	end
)

RDX.RegisterServerCallback(
	"rdx_inventoryhud:getPlayerInventory",
	function(source, cb, target)
		local targetXPlayer = RDX.GetPlayerFromId(target)

		if targetXPlayer ~= nil then
			cb({inventory = targetXPlayer.inventory, money = targetXPlayer.getMoney(), accounts = targetXPlayer.accounts, weapons = targetXPlayer.loadout, weight = targetXPlayer.getWeight(), maxWeight = targetXPlayer.maxWeight})
		else
			cb(nil)
		end
	end
)

RegisterServerEvent("rdx_inventoryhud:tradePlayerItem")
AddEventHandler(
	"rdx_inventoryhud:tradePlayerItem",
	function(from, target, type, itemName, itemCount)
		local _source = from

		local sourceXPlayer = RDX.GetPlayerFromId(_source)
		local targetXPlayer = RDX.GetPlayerFromId(target)

		if type == "item_standard" then
			local sourceItem = sourceXPlayer.getInventoryItem(itemName)
			local targetItem = targetXPlayer.getInventoryItem(itemName)

			if itemCount > 0 and sourceItem.count >= itemCount then
				if targetXPlayer.canCarryItem(itemName, itemCount) then
				--if targetItem.weight ~= -1 and (targetItem.count + itemCount) > targetItem.weight then
					sourceXPlayer.removeInventoryItem(itemName, itemCount)
					TriggerClientEvent('b1g_notify:client:Notify', sourceXPlayer, { type = 'true', text = itemName})
					targetXPlayer.addInventoryItem(itemName, itemCount)
					TriggerClientEvent('b1g_notify:client:Notify', targetXPlayer, { type = 'true', text = itemName})
				else
					TriggerClientEvent('b1g_notify:client:Notify', targetXPlayer, { type = 'false', text =  itemName})
					TriggerClientEvent('b1g_notify:client:Notify', sourceXPlayer, { type = 'false', text =  itemName})
				end
			end
		elseif type == "item_money" then
			if itemCount > 0 and sourceXPlayer.getMoney() >= itemCount then
				sourceXPlayer.removeMoney(itemCount)
				TriggerClientEvent('b1g_notify:client:Notify', sourceXPlayer, { type = 'true', text =  itemCount})
				targetXPlayer.addMoney(itemCount)
				TriggerClientEvent('b1g_notify:client:Notify', targetXPlayer, { type = 'true', text =  itemCount})
			end
		elseif type == "item_account" then
			if itemCount > 0 and sourceXPlayer.getAccount(itemName).money >= itemCount then
				sourceXPlayer.removeAccountMoney(itemName, itemCount)
				TriggerClientEvent('b1g_notify:client:Notify', sourceXPlayer, { type = 'true', text =  itemCount , itemName})
				targetXPlayer.addAccountMoney(itemName, itemCount)
				TriggerClientEvent('b1g_notify:client:Notify', targetXPlayer, { type = 'true', text =  itemCount, itemName})
			end
		elseif type == "item_weapon" then
			if not targetXPlayer.hasWeapon(itemName) then
				sourceXPlayer.removeWeapon(itemName)
				TriggerClientEvent('b1g_notify:client:Notify', sourceXPlayer, { type = 'true', text =  itemName})
				targetXPlayer.addWeapon(itemName, itemCount)
				TriggerClientEvent('b1g_notify:client:Notify', targetXPlayer, { type = 'true', text =  itemName})
			end
		end
	end
)

Citizen.CreateThread(function()
	if GetCurrentResourceName() ~= "rdx_inventoryhud" then
		print("^1=====================================")
		print("^1SCRIPT NAME OTHER THAN ORIGINAL")
		print("^1YOU SHOULD STOP SCRIPT")
		print("^1CHANGE NAME TO: ^2rdx_inventoryhud^1")
		print("^1=====================================^0")
	end
end)

RegisterCommand(
	"openinventory",
	function(source, args, rawCommand)
		if IsPlayerAceAllowed(source, "inventory.openinventory") then
			local target = tonumber(args[1])
			local targetXPlayer = RDX.GetPlayerFromId(target)

			if targetXPlayer ~= nil then
				TriggerClientEvent("rdx_inventoryhud:openPlayerInventory", source, target, targetXPlayer.name)
			else
				TriggerClientEvent('b1g_notify:client:Notify', source, { type = 'false', text = 'Nenhum Jogador'})
			end
		else
				TriggerClientEvent('b1g_notify:client:Notify', source, { type = 'false', text = 'Sem Prems'})
		end
	end
)