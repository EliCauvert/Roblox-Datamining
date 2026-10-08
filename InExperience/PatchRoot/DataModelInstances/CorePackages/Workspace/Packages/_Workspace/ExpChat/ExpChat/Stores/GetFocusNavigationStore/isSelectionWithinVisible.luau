return function(p1, p2)
	if p1 == nil or p2 == nil then
		return false
	elseif p1 ~= p2 and not p1:IsDescendantOf(p2) then
		return false
	end
	local var1 = p1
	while var1 ~= nil do
		if not var1:IsA("GuiObject") or var1.Visible then
			if var1 == p2 then break end
			var1 = var1.Parent
		end
		return false
	end
	return true
end