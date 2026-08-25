return function(p0, p1, p2)
	assert(p1 <= p2, "startIndex must be less than or equal to endIndex")
	local t = {}
	local var1 = 1
	
	for i = math.max(1, p1), math.min(#p0, p2) do
		t[var1] = p0[i]
		var1 += 1
	end
	return t
end