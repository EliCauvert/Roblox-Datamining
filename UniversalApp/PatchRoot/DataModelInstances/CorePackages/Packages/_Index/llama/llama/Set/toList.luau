return function(List) --[[ Line: 2 | Named "toList" ]]
	local t = {}
	local Count = 1
	
	for i, _ in pairs(List) do
		t[Count] = i
		Count += 1
	end
	return t
end