local userInputService = game:GetService("UserInputService")

return {
	connectInputChanged = function(p1)
		-- upvalues: userInputService (ref)
		return userInputService.InputChanged:Connect(p1)
	end,
	connectInputEnded = function(p1)
		-- upvalues: userInputService (ref)
		return userInputService.InputEnded:Connect(p1)
	end
}