return function(List) --[[ Line: 4 | Named "keys" ]]
	local t = {}
	local Count = 1
	
	for i in pairs(List) do
		t[Count] = i
		Count += 1
	end
	return t
end