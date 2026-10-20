return function(p1, p2: number, p3: number, ...)
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local ValueType1 = type(p2)
	assert(ValueType1 == "number" and p2 % 1 == 0, "expected an integer for second argument, got " .. ValueType1)
	local ValueType2 = type(p3)
	assert(ValueType2 == "number" and p3 % 1 == 0, "expected an integer for third argument, got " .. ValueType2)
	assert(p2 <= p3, "start index must be less than or equal to end index")
	local t = {}
	local Count = 1
	local CountP0 = #p1
	local Largest = math.max(p2, 1)
	local _ = math.min(Largest, CountP0)
	
	for i = 1, CountP0 do
		local Largest1: number = i
		
		if Largest1 ~= Largest then
			t[Count] = p1[Largest1]
			Count += 1
			continue
		end
		for i1 = 1, select("#", ...) do
			t[Count] = select(i1, ...)
			Count += 1
		end
	end
	return t
end