return function(p1, p2: number, p3: number)
	assert(p2 <= p3, "startIndex must be less than or equal to endIndex")
	local t = {}
	local Count = 1
	
	for i = 1, math.min(#p1, p2 - 1) do
		t[Count] = p1[i]
		Count += 1
	end
	for i1 = p3 + 1, #p1 do
		t[Count] = p1[i1]
		Count += 1
	end
	return t
end