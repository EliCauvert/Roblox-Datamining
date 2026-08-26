return function(p1, p2)
	local t = {}
	
	for i, v in ipairs(p2) do
		t[v] = true
	end
	for i_1 in pairs(t) do
		assert(p1[i_1] ~= nil, string.format("Expected field %q", i_1))
	end
	for i_2 in pairs(p1) do
		assert(t[i_2] ~= nil, string.format("Did not expect field %q", i_2))
	end
end