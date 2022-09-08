ESX.RegisterServerCallback("requestUserData", function(player, cb, identifier)
	print(identifier)

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
			tostring(account.money):format(MONEY_UNIT)
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
		tostring(job.grade_salary):format(MONEY_UNIT)
	})

	print(ESX.DumpTable(xPlayer.getJob()))

	cb(_, userData)
end)
