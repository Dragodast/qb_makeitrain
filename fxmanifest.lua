fx_version 'cerulean'
game 'gta5'

description 'QB-MakeItRain
version '1.0.0'

client_scripts {
	'client/main.lua'
}

shared_scripts {
	'@qb-core/shared/locale.lua',
	'locales/*.lua',
	'config.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua'
}
