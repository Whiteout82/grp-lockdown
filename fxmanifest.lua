fx_version 'cerulean'
game 'gta5'

author 'GRP'
description 'Lockdown control for LEOs for Samy Shutters'
version '1.1.1'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_script 'client.lua'
server_script 'server.lua'

dependencies {
    'ox_lib',
    'ox_target',
    'qbx_core',
    'samy_shutters'
}
