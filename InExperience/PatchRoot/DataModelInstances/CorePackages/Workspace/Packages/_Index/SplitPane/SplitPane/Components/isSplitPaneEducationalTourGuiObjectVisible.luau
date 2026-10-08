return function(p1)
	if p1.Parent == nil then
		return false
	end
	local var1 = p1
	while var1 ~= nil do
		if not var1:IsA("GuiObject") or var1.Visible then
			var1 = var1.Parent
			continue
		end
		return false
	end
	return true
end