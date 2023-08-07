fx_version 'cerulean' 

games { 'gta5' } 

author 'Wave'

lua54 'on'

client_scripts
{ 

    "src/Rage/RMenu.lua",
    "src/Rage/menu/RageUI.lua",
    "src/Rage/menu/Menu.lua",
    "src/Rage/menu/MenuController.lua",
    "src/Rage/components/*.lua",
    "src/Rage/menu/elements/*.lua",
    "src/Rage/menu/items/*.lua",
    "src/Rage/menu/panels/*.lua",
    "src/Rage/menu/windows/*.lua",
        
}

shared_scripts 
{
    "config/*.*"
}

client_scripts 
{
    "client/*.*"
}

server_scripts 
{
    "server/*.*",
    --'@oxmysql/lib/MySQL.lua',
    '@mysql-async/lib/MySQL.lua',
}