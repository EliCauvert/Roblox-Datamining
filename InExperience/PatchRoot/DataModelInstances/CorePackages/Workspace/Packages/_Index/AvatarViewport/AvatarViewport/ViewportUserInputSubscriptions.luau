local UserInputService = game:GetService("UserInputService")

return {
	connectInputChanged = function(Callback) --[[ Line: 5 ]]
		-- upvalues: UserInputService (copy)
		return UserInputService.InputChanged:Connect(Callback)
	end,
	connectInputEnded = function(Callback) --[[ Line: 11 ]]
		-- upvalues: UserInputService (copy)
		return UserInputService.InputEnded:Connect(Callback)
	end
}