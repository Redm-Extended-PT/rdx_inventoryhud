Config = {}
Config.Locale = 'en'
Config.IncludeCash = true -- DONT TOUCH!
Config.IncludeWeapons = true -- TRUE or FALSE
Config.IncludeAccounts = true -- TRUE or FALSE
Config.ExcludeAccountsList = {"bank", "money"} --  DONT TOUCH!
Config.OpenControl = 0xD8F73058 -- Key for opening inventory. Edit html/js/config.js to change key for closing it.
Config.OpenKey = 0xE30CD707

-- List of item names that will close ui when used
Config.CloseUiItems = {
	"bread",
	"water"
}

Config.OpenTime = 750

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 25000

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 1