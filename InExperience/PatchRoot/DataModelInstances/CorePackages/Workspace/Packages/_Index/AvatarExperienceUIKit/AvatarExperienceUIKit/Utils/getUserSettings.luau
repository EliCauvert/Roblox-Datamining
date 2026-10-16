local UserGameSettings = UserSettings():GetService("UserGameSettings")

return function() --[[ Line: 3 | Named "getUserSettings" ]]
	-- upvalues: UserGameSettings (copy)
	return UserGameSettings
end