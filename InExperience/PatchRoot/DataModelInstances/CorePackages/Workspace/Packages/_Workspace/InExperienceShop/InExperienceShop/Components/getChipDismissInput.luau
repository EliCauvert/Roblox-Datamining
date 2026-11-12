local UserInputService = game:GetService("UserInputService")

return function()
	-- upvalues: UserInputService (copy)
	return UserInputService.MouseEnabled, UserInputService.TouchEnabled
end