return function(p1)
	for i, v in p1:GetDescendants() do
		if v:IsA("GuiObject") and v.Selectable and v.Visible then
			return v
		end
	end
	return nil
end