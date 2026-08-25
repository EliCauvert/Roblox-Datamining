return function(p0)
	for i, v in p0:GetDescendants() do
		if v:IsA("GuiObject") and v.Selectable and v.Visible then
			return v
		end
	end
	return nil
end