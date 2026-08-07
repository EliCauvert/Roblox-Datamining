return function(p0) --[[ line: 1 | named "getFirstFocusableDescendant" ]]
	for i, v in p0:GetDescendants() do
		if v:IsA("GuiObject") and v.Selectable and v.Visible then
			return v
		end
	end
	return nil
end