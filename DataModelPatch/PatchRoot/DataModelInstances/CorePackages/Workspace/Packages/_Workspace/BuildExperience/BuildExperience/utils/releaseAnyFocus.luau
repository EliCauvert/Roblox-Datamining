local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")

return function()
	-- upvalues: UserInputService (copy), GuiService (copy)
	local FocusedTextBox = UserInputService:GetFocusedTextBox()
	
	if FocusedTextBox then
		FocusedTextBox:ReleaseFocus()
	end
	if GuiService.SelectedObject ~= nil then
		GuiService.SelectedObject = nil
	end
end