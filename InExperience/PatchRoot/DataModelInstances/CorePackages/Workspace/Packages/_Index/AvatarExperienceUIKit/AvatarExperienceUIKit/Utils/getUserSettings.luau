local UserGameSettings = UserSettings():GetService("UserGameSettings")

return function()
	-- upvalues: UserGameSettings (copy)
	return UserGameSettings
end