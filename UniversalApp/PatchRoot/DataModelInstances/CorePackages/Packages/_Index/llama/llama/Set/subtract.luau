return function(List, ...) --[[ Line: 2 | Named "subtract" ]]
	local t = {}
	
	for i, _ in pairs(List) do
		t[i] = true
	end
	for i1 = 1, select("#", ...) do
		t[select(i1, ...)] = nil
	end
	return t
end