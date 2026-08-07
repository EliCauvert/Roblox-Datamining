return function(p0, p1, p2) --[[ line: 4 | named "removeRange" ]]
	assert(p1 <= p2, "startIndex must be less than or equal to endIndex")
	local t = {}
	local var1 = 1
	
	for i = 1, math.min(#p0, p1 - 1) do
		t[var1] = p0[i]
		var1 += 1
	end
	for i_1 = p2 + 1, #p0 do
		t[var1] = p0[i_1]
		var1 += 1
	end
	return t
end