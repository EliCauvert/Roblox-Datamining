return function(Object) --[[ Line: 1 | Named "getFirstFocusableDescendant" ]]
	for _, Gui in Object:GetDescendants() do
		if Gui:IsA("GuiObject") and Gui.Selectable and Gui.Visible then
			return Gui
		end
	end
	return nil
end