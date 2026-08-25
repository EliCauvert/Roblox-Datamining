local userGameSettingsService = UserSettings():GetService("UserGameSettings")

return function()
	-- upvalues: userGameSettingsService (ref)
	return userGameSettingsService
end