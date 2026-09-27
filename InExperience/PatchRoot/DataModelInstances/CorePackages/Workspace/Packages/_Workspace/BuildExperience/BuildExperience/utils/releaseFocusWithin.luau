local userInputService = game:GetService("UserInputService")

return function(p1, p2)
	-- upvalues: userInputService (ref)
	local focusedTextBox = (p2 or userInputService):GetFocusedTextBox()
	
	if p1 == nil or focusedTextBox == nil or not focusedTextBox:IsDescendantOf(p1) then
		return false
	end
	focusedTextBox:ReleaseFocus()
	
	return true
end