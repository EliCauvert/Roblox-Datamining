return function(p1, p2: number, p3: number) --[[ Line: 5 | Named "getRange" ]]
	assert(p2 <= p3, "startIndex must be less than or equal to endIndex")
	local t = {}
	local Count = 1
	
	for i = math.max(1, p2), math.min(#p1, p3) do
		t[Count] = p1[i]
		Count += 1
	end
	return t
end