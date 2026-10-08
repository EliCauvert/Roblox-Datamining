return function(p1, p2, p3, p4)
	local maxValue = math.max(1, p3)
	local maxValue_1 = math.max(0, math.min(p1, p4) - maxValue + 1)
	local list = table.create(maxValue_1)
	
	for i = 1, maxValue_1 do
		list[i] = p2(maxValue + i - 1)
	end
	return list
end