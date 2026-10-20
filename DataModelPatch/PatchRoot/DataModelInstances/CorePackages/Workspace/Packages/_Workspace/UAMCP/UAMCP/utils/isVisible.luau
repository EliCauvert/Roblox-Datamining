return function(Parent)
	local Parent1 = Parent
	while Parent1 do
		if not Parent1:IsA("GuiObject") then
			return not Parent1:IsA("LayerCollector") or Parent1.Enabled
		end
		if not Parent1.Visible then
			return false
		end
		Parent1 = Parent1.Parent
	end
	return true
end