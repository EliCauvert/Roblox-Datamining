local function _(p1)
	return math.max(p1 - 2, 1)
end

local function getDefaultDots(vectorA, vectorB, p1)
	local t = {}
	
	for i = 1, vectorB do
		table.insert(t, { isActive = i == vectorA, page = i, size = p1 })
	end
	return t
end

local function getOverflowDots(vectorA, vectorB, p2, p3, p4)
	local t = {}
	
	for i = p2, math.min(vectorA + 2, vectorB) do
		table.insert(t, {
			isActive = i == vectorA,
			page = i,
			size = if math.abs(i - vectorA) == 2 then p4 else p3
		})
	end
	return t
end

return function(vectorA, vectorB, p5, p6)
	-- upvalues: getOverflowDots (ref), getDefaultDots (ref)
	local maxValue = math.max(math.floor(p6), 1)
	local clampedValue = math.clamp(math.floor(p5), 1, maxValue)
	local minValue = math.min(maxValue, 5)
	local var1 = maxValue > 5
	local var2 = if var1 then math.max(clampedValue - 2, 1) else 1
	
	return {
		activeVisibleIndex = clampedValue - var2 + 1,
		page = clampedValue,
		dots = if var1 then getOverflowDots(clampedValue, maxValue, var2, vectorA, vectorB) else getDefaultDots(clampedValue, minValue, vectorA),
		count = maxValue
	}
end