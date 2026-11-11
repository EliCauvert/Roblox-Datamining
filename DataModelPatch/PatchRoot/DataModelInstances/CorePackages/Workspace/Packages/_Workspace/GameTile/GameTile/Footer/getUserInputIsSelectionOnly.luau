local UserInputService = game:GetService("UserInputService")

return function(): boolean
	-- upvalues: UserInputService (copy)
	return not UserInputService.TouchEnabled and not UserInputService.MouseEnabled
end