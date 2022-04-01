local visible = false

--TODO: Test table!
local users = {
	{
		charName = "Clark Melton",
		name = "Csoki",
		identifier = "aba55cba6cf5d2841819a1fd86878c86fca9fbda",
		online = true,
		messages = {
			{
				dbID = 1,
				sender = "aba55cba6cf5d2841819a1fd86878c86fca9fbda",
				time = GetCloudTimeAsInt(),
				text = "üzenet 1",
			},
			{
				dbID = 2,
				sender = "asdasdasdasdasd",
				time = GetCloudTimeAsInt(),
				text = "üzenet 2",
			},
		},
	},
}

function togglePanel()
	visible = not visible

	print("visible", visible)

	SetNuiFocus(visible, visible)
	SendNUIMessage({ visible = visible })

	if visible then
		SendNUIMessage({ users = users })
	end
end
RegisterCommand("reports", togglePanel)

function updateMyUser()
	local player = PlayerId()
	local xPlayer = ESX.GetPlayerData()

	SendNUIMessage({
		myUser = {
			serverId = GetPlayerServerId(player),
			identifier = xPlayer.identifier,
			name = GetPlayerName(player),
		},
	})
end

CreateThread(function()
	Wait(1000)

	updateMyUser()
	togglePanel()
end)

RegisterNUICallback("close", function()
	SetNuiFocus(false, false)
	visible = false
end)

RegisterNUICallback("requestUserData", function(data, cb)
	if not visible then
		return cb({ error = "Panel not opened!" })
	end

	if not data.identifier then
		return cb({ error = "Failed to fetch user data!" })
	end

	ESX.TriggerServerCallback("requestUserData", function(error, userData)
    if (error) then 
      return cb({error = error})
    end

		cb({ userData = userData })
	end, data.identifier)
end)
