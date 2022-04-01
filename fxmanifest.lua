fx_version("cerulean")
game("gta5")
author("Csoki")

shared_script("@es_extended/imports.lua")

shared_script("shared.lua")

client_scripts({
	"client.lua",
})

server_scripts({
	"server.lua",
})

-- ui_page("ui/dist/index.html")
ui_page("http://localhost:3000")

files({
	"ui/dist/**",
})
