local userInputService = game:GetService("UserInputService")

return {
	connectInputChanged = function(p0) --[[ line: 5 ]]
		-- upvalues: userInputService (ref)
		return userInputService.InputChanged:Connect(p0)
	end,
	connectInputEnded = function(p1) --[[ line: 11 ]]
		-- upvalues: userInputService (ref)
		return userInputService.InputEnded:Connect(p1)
	end
}