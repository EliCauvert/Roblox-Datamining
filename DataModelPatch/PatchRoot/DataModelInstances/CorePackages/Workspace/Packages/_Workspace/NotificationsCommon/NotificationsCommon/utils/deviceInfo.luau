local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

return {
	isDesktopDevice = function(): boolean
		-- upvalues: UserInputService (copy)
		local None = Enum.Platform.None
		pcall(function()
			-- upvalues: None (ref), UserInputService (upval)
			None = UserInputService:GetPlatform()
		end)
		
		return None == Enum.Platform.Windows or (None == Enum.Platform.OSX or None == Enum.Platform.UWP)
	end,
	isConsole = function()
		-- upvalues: GuiService (copy)
		return GuiService:IsTenFootInterface()
	end
}