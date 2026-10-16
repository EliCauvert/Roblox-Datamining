local UserInputService = game:GetService("UserInputService")

return function(Ancestor, p1): boolean --[[ Line: 7 | Named "releaseFocusWithin" ]]
	-- upvalues: UserInputService (copy)
	local FocusedTextBox = (p1 or UserInputService):GetFocusedTextBox()
	
	if Ancestor == nil or FocusedTextBox == nil or not FocusedTextBox:IsDescendantOf(Ancestor) then
		return false
	else
		FocusedTextBox:ReleaseFocus()
		
		return true
	end
end