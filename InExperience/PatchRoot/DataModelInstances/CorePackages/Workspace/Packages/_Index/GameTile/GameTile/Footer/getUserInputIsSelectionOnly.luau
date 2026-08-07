local userInputService = game:GetService("UserInputService")

return function() --[[ line: 3 | named "getUserInputIsSelectionOnly" ]]
	-- upvalues: userInputService (ref)
	return not userInputService.TouchEnabled and not userInputService.MouseEnabled
end