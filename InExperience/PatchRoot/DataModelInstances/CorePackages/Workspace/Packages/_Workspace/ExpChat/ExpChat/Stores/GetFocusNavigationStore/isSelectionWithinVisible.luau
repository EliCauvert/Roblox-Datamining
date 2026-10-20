return function(Ancestor, Ancestor1): boolean
	if Ancestor == nil or Ancestor1 == nil then
		return false
	end
	if Ancestor ~= Ancestor1 and not Ancestor:IsDescendantOf(Ancestor1) then
		return false
	end
	local Gui = Ancestor
	while Gui ~= nil do
		if Gui:IsA("GuiObject") and not Gui.Visible then
			return false
		end
		if Gui == Ancestor1 then break end
		Gui = Gui.Parent
	end
	return true
end