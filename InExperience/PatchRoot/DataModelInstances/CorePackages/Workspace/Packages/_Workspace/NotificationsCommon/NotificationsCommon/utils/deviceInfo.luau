local UserInputService = game:GetService("UserInputService")
local IsTenFootInterfaceFunction = require(script:FindFirstAncestor("NotificationsCommon").Parent.AppCommonLib).isTenFootInterface

return {
	isDesktopDevice = function(): boolean --[[ Line: 6 ]]
		-- upvalues: UserInputService (copy)
		local None = Enum.Platform.None
		pcall(function() --[[ Line: 8 ]]
			-- upvalues: None (ref), UserInputService (upval)
			None = UserInputService:GetPlatform()
		end)
		
		return None == Enum.Platform.Windows or (None == Enum.Platform.OSX or None == Enum.Platform.UWP)
	end,
	isConsole = function() --[[ Line: 14 ]]
		-- upvalues: IsTenFootInterfaceFunction (copy)
		return IsTenFootInterfaceFunction()
	end
}