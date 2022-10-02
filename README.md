## Installation
You need to do a couple steps to get it working.
First you ensure adding the resources to your server.cfg

## Requirements
- [rdx_core](https://github.com/Redm-Extended-PT/rdx_core)
- [cron](https://github.com/RalivTV/cron)
- [rdx_addonaccount](https://github.com/Redm-Extended-PT/rdx_addonaccount)
- [rdx_addoninventory](https://github.com/Redm-Extended-PT/rdx_addoninventory)
- [rdx_datastore](https://github.com/Redm-Extended-PT/rdx_datastore)

- Put all folders in your resources folder and ensure:
```
ensure rdx_core
ensure cron
ensure rdx_addonaccount
ensure rdx_addoninventory
ensure rdx_datastore
ensure rdx_inventoryhud
```

## Usage

- Press U for your personal inventory.
- Press ESC to close your personal inventory.

### Disable default rdx inventory:

Open rdx_core, then find and remove this code in `client/main.lua`:
```
-- Menu interactions
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		if IsControlJustReleased(0, Keys['*******']) and IsInputDisabled(0) and not isDead and not RDX.UI.Menu.IsOpen('default', 'redm_extended', 'inventory') then
			RDX.ShowInventory()
		end

	end
end)
```


## Features
- Drag and drop
- Using items
- Dropping items
- Giving items
- Cash included
- Accounts support (bank, black money, ...)
- Weapons support
- rdx_property support
- Another players inventory support
- steal included

## Language support
Currently, only EN/PT is supported. If you want to translate it then feel free to do it!

## Screens
![1](https://media.discordapp.net/attachments/686807996420063232/1023376640874651678/unknown.png?width=960&height=375)

## Credits
[esx-ORG](https://github.com/esx-framework)
