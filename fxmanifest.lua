fx_version "adamant"

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

games {"rdr3"}
description 'Inventory HUD for RDX'

version '1.0.0'

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  '@rdx_core/locale.lua',
  "server/main.lua",
  "server/steal.lua",
  "locales/en.lua",
  "config.lua"
}

client_scripts {
  '@rdx_core/locale.lua',
  "client/main.lua",	
  "client/property.lua",
  "client/player.lua",
  "client/steal.lua",
  "locales/en.lua",
  "config.lua"
}

ui_page {
	'html/ui.html'
}

files {
  "html/ui.html",
  "html/css/ui.css",
  "html/css/jquery-ui.css",
  "html/js/inventory.js",
  "html/js/config.js",
  -- JS LOCALES
  "html/locales/en.js",
  "html/locales/nl.js",
  "html/locales/fr.js",
  'html/fonts/crock.ttf',
  --Fonts
    'html/fonts/pdown.ttf',
	'html/fonts/bankgothic.ttf',
	'html/fonts/RDR/HapnaSlabSerif-DemiBold.eot',
	'html/fonts/RDR/HapnaSlabSerif-DemiBold.ttf',
	'html/fonts/RDR/HapnaSlabSerif-DemiBold.woff',
	'html/fonts/RDR/HapnaSlabSerif-DemiBold.woff2',
	'html/fonts/RDR/RDRCatalogueBold-Bold.eot',
	'html/fonts/RDR/RDRCatalogueBold-Bold.ttf',
	'html/fonts/RDR/RDRCatalogueBold-Bold.woff',
	'html/fonts/RDR/RDRCatalogueBold-Bold.woff2',
	'html/fonts/RDR/RDRGothica-Regular.eot',
	'html/fonts/RDR/RDRGothica-Regular.ttf',
	'html/fonts/RDR/RDRGothica-Regular.woff',
	'html/fonts/RDR/RDRGothica-Regular.woff2',
	'html/fonts/RDR/RDRLino-Regular.eot',
	'html/fonts/RDR/RDRLino-Regular.ttf',
	'html/fonts/RDR/RDRLino-Regular.woff',
	'html/fonts/RDR/RDRLino-Regular.woff2',
	'html/fonts/RDR/Redemption.eot',
	'html/fonts/RDR/Redemption.ttf',
	'html/fonts/RDR/Redemption.woff',
	'html/fonts/RDR/Redemption.woff2', 
  -- IMAGES
  "html/img/*.png",
  "html/img/items/*.png",
}

dependencies {
	'rdx_core'
}
