return function(p1, p2)
	local descendants = p1:GetDescendants()
	table.insert(descendants, p1)
	local t = {}
	
	for i, v in descendants do
		if v.Name == p2 then
			table.insert(t, v)
		end
	end
	return t
end