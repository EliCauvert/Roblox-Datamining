return function(p0, p1) --[[ line: 1 ]]
	local descendants = p0:GetDescendants()
	table.insert(descendants, p0)
	local t = {}
	
	for i, v in descendants do
		if v.Name == p1 then
			table.insert(t, v)
		end
	end
	return t
end