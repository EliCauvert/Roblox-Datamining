return function(List)
	local t = {}
	local Count = 1
	
	for _, value in pairs(List) do
		t[Count] = value
		Count += 1
	end
	return t
end