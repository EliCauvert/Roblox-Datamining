local ReactModule = require(script:FindFirstAncestor("AccountRecovery").Parent.React)
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

return function()
	-- upvalues: ReactModule (copy), UserInputService (copy), GuiService (copy)
	return ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), GuiService (upval)
		return function()
			-- upvalues: UserInputService (upval), GuiService (upval)
			local FocusedTextBox = UserInputService:GetFocusedTextBox()
			
			if FocusedTextBox then
				FocusedTextBox:ReleaseFocus()
			end
			if GuiService.SelectedObject ~= nil then
				GuiService.SelectedObject = nil
			end
		end
	end, {})
end