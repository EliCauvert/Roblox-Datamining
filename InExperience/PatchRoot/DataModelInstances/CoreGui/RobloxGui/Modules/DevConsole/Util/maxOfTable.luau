return function(p1, p2)
	local t = {}
	
	for i, v in pairs(p1) do
		if not p2[i] then
			error("tables did not have matching indices")
			
			return
		end
		t[i] = if v < p2[i] then p2[i] else v
	end
	return t
end