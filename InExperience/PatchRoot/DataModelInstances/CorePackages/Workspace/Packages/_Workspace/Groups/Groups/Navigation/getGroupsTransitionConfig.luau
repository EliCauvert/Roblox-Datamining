local UserGameSettings = UserSettings():GetService("UserGameSettings")

return function()
	-- upvalues: UserGameSettings (copy)
	return if UserGameSettings.ReducedMotion then {
		transitionSpec = { frequency = 1000000, dampingRatio = 1 }
	} else {}
end