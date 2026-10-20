return function(List)
	local t = {}
	local Count = 1
	
	for i, _ in pairs(List) do
		t[Count] = i
		Count += 1
	end
	return t
end