return function(p0, p1) --[[ line: 1 | named "expectedFields" ]]
	local t = {}
	
	for i, v in ipairs(p1) do
		t[v] = true
	end
	for i_1 in pairs(t) do
		assert(p0[i_1] ~= nil, string.format("Expected field %q", i_1))
	end
	for i_2 in pairs(p0) do
		assert(t[i_2] ~= nil, string.format("Did not expect field %q", i_2))
	end
end