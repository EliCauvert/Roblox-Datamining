local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")

return function() --[[ line: 4 | named "releaseAnyFocus" ]]
	-- upvalues: userInputService (ref), guiService (ref)
	local focusedTextBox = userInputService:GetFocusedTextBox()
	
	if focusedTextBox then
		focusedTextBox:ReleaseFocus()
	end
	if guiService.SelectedObject ~= nil then
		guiService.SelectedObject = nil
	end
end