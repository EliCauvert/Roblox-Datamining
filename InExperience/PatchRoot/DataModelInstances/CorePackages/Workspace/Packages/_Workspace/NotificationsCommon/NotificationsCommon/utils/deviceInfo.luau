local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")

return {
	isDesktopDevice = function() --[[ line: 4 ]]
		-- upvalues: userInputService (ref)
		local none = Enum.Platform.None
		pcall(function() --[[ line: 6 ]]
			-- upvalues: none (write), userInputService (copy)
			none = userInputService:GetPlatform()
		end)
		
		return if none ~= Enum.Platform.Windows then if none ~= Enum.Platform.OSX then none == Enum.Platform.UWP else true else true
	end,
	isConsole = function() --[[ line: 12 ]]
		-- upvalues: guiService (ref)
		return guiService:IsTenFootInterface()
	end
}