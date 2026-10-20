local UserInputService = game:GetService("UserInputService")

return {
	connectInputChanged = function(Callback)
		-- upvalues: UserInputService (copy)
		return UserInputService.InputChanged:Connect(Callback)
	end,
	connectInputEnded = function(Callback)
		-- upvalues: UserInputService (copy)
		return UserInputService.InputEnded:Connect(Callback)
	end
}