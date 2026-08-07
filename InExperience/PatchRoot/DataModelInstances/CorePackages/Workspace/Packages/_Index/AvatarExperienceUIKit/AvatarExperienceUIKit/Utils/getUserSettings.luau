local userGameSettingsService = UserSettings():GetService("UserGameSettings")

return function() --[[ line: 3 | named "getUserSettings" ]]
	-- upvalues: userGameSettingsService (ref)
	return userGameSettingsService
end