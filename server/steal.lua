RegisterServerEvent('ALERTAROBO')
AddEventHandler('ALERTAROBO', function(source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, {type = 'error', text = 'Alguém Acabou de te Roubar',length = 8000})
end)

RegisterServerEvent('robo:jugador')
AddEventHandler('robo:jugador', function(targetid, playerheading, playerCoords,  playerlocation)
	_source = source

	TriggerClientEvent('robo:getarrested', targetid, playerheading, playerCoords, playerlocation)
	TriggerClientEvent('robo:doarrested', _source)
end)
