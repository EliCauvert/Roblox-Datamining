return function(p0, p1) --[[ line: 1 ]]
	local ok, _ = pcall(Instance.new, p1)
	assert(ok, `{p1} does not exist. Did you make a typo?`)
	local descendants = p0:GetDescendants()
	table.insert(descendants, p0)
	local t = {}
	
	for i, v in descendants do
		if v:IsA(p1) then
			table.insert(t, v)
		end
	end
	return t
end