return function(List, p1)
	local t = {}
	
	for i, value in pairs(List) do
		t[i] = {}
		
		for i1, value1 in pairs(value) do
			t[i][i1] = value1
		end
		local v1 = p1 and p1[i]
		
		if v1 then
			t[i].lastUpdated = v1.lastUpdated
		end
	end
	return t
end