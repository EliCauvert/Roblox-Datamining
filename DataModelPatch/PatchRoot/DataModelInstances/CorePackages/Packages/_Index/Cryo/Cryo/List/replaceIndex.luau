return function(p1, p2, p3)
	local t = {}
	local CountP0 = #p1
	assert(p2 <= CountP0, "index must be less or equal than the list length")
	
	for i = 1, CountP0 do
		if i == p2 then
			t[i] = p3
		else
			t[i] = p1[i]
		end
	end
	return t
end