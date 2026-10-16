local UserInputService = game:GetService("UserInputService")

return function(): boolean --[[ Line: 3 | Named "getUserInputIsSelectionOnly" ]]
	-- upvalues: UserInputService (copy)
	return not UserInputService.TouchEnabled and not UserInputService.MouseEnabled
end