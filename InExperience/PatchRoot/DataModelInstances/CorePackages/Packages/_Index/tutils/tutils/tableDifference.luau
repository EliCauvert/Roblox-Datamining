return function(List, List1)
	local t = {}
	
	for i, value in pairs(List) do
		if List1[i] ~= List[i] then
			t[i] = value
		end
	end
	for i1, value1 in pairs(List1) do
		if List1[i1] ~= List[i1] then
			t[i1] = value1
		end
	end
	return t
end