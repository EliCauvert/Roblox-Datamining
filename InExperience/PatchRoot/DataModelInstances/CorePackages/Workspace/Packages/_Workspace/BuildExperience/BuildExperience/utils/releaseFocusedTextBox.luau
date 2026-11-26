local UserInputService = game:GetService("UserInputService")

return function()
	-- upvalues: UserInputService (copy)
	local FocusedTextBox = UserInputService:GetFocusedTextBox()
	
	if FocusedTextBox ~= nil then
		FocusedTextBox:ReleaseFocus()
	end
end