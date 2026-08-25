return function(p1, p2)
	local ok, _ = pcall(Instance.new, p2)
	assert(ok, `{p2} does not exist. Did you make a typo?`)
	local descendants = p1:GetDescendants()
	table.insert(descendants, p1)
	local t = {}
	
	for i, v in descendants do
		if v:IsA(p2) then
			table.insert(t, v)
		end
	end
	return t
end