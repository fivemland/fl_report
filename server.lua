ESX.RegisterServerCallback("requestUserData", function(player, cb, identifier)
	print(identifier)
	print(ESX.GetPlayerFromId(player).identifier)

	local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
	if not xPlayer then
		return cb("Player not found!")
	end

	local userData = {
		{ "Identifier", xPlayer.identifier },
		{ "Steam Name", GetPlayerName(xPlayer.source) },
		{ "Character Name", xPlayer.getName() },
	}

	for _, account in pairs(xPlayer.getAccounts()) do
		table.insert(userData, {
			account.label,
			MONEY_UNIT:format(account.money)
		})
	end

	local job = xPlayer.getJob()

	table.insert(userData, {
		"Job Name",
		job.label,
	})

	table.insert(userData, {
		"Job Grade",
		job.grade_label,
	})

	table.insert(userData, {
		"Job Salary",
		MONEY_UNIT:format(job.grade_salary)
	})

	print(ESX.DumpTable(xPlayer.getJob()))

	cb(_, userData)
end)
