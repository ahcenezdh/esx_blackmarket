fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'Azael_Hasch#6575'

description 'esx_blackmarket'

version '1.8.5'

shared_scripts {
	'@ox_lib/init.lua',
	'@es_extended/imports.lua',
    '@es_extended/locale.lua',
    'shared/*.lua'
}

server_scripts {
    'server/*.lua'
}

client_scripts {
    'client/*.lua'
}

escrow_ignore {
    'shared/*.lua'
}