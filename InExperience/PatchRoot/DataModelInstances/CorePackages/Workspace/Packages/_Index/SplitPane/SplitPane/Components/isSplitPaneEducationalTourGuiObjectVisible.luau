return function(Gui): boolean --[[ Line: 2 ]]
	if Gui.Parent == nil then
		return false
	end
	local Gui1 = Gui
	while Gui1 ~= nil do
		if Gui1:IsA("GuiObject") and not Gui1.Visible then
			return false
		end
		Gui1 = Gui1.Parent
	end
	return true
end