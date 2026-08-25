return function(p0, p1)
	local t = {}
	
	for i, v in pairs(p0) do
		if not p1[i] then
			error("tables did not have matching indices")
			
			return
		end
		t[i] = if v < p1[i] then p1[i] else v
	end
	return t
end