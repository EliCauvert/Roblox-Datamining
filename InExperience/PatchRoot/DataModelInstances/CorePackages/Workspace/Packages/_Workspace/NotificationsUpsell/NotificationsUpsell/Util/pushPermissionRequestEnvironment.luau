local UserInputService = game:GetService("UserInputService")

return {
	statusReadTimeoutSeconds = 1,
	getPlatform = function()
		-- upvalues: UserInputService (copy)
		return UserInputService:GetPlatform()
	end
}