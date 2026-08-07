return function(p0, p1, p2) --[[ line: 5 | named "replaceIndex" ]]
	local t = {}
	local p0Count = #p0
	assert(p1 <= p0Count, "index must be less or equal than the list length")
	
	for i = 1, p0Count do
		if i == p1 then
			t[i] = p2
		else
			t[i] = p0[i]
		end
	end
	return t
end