return function(List, List1)
	local t = {}
	
	for _, value in ipairs(List1) do
		t[value] = true
	end
	for i in pairs(t) do
		assert(List[i] ~= nil, string.format("Expected field %q", i))
	end
	for i1 in pairs(List) do
		assert(t[i1] ~= nil, string.format("Did not expect field %q", i1))
	end
end