local userInputService = game:GetService("UserInputService")

return function()
	-- upvalues: userInputService (ref)
	return not userInputService.TouchEnabled and not userInputService.MouseEnabled
end