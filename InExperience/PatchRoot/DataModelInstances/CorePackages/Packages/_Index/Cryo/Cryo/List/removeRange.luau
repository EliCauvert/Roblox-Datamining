return function(p1, p2, p3)
	assert(p2 <= p3, "startIndex must be less than or equal to endIndex")
	local t = {}
	local var1 = 1
	
	for i = 1, math.min(#p1, p2 - 1) do
		t[var1] = p1[i]
		var1 += 1
	end
	for i_1 = p3 + 1, #p1 do
		t[var1] = p1[i_1]
		var1 += 1
	end
	return t
end