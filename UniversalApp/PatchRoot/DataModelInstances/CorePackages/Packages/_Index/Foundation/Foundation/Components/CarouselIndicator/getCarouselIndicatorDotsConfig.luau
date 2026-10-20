local function _(p1: number): number
	return (math.max(p1 - 2, 1))
end

local function getDefaultDots(ClampedValue, Smallest, Size)
	local List = {}
	
	for i = 1, Smallest do
		local config = { isActive = i == ClampedValue }
		config.page = i
		config.size = Size
		table.insert(List, config)
	end
	return List
end

local function getOverflowDots(ClampedValue: number, Largest: number, Largest1, p1, p2)
	local List = {}
	
	for i = Largest1, math.min(ClampedValue + 2, Largest) do
		local config = { isActive = i == ClampedValue }
		config.page = i
		config.size = if math.abs(i - ClampedValue) == 2 then p2 else p1
		table.insert(List, config)
	end
	return List
end

return function(Size, p3, Value1: number, Value: number)
	-- upvalues: getOverflowDots (copy), getDefaultDots (copy)
	local Largest = math.max(math.floor(Value), 1)
	local ClampedValue = math.clamp(math.floor(Value1), 1, Largest)
	local Smallest = math.min(Largest, 5)
	local IsLargestAbove = Largest > 5
	local Largest1: number = if IsLargestAbove then math.max(ClampedValue - 2, 1) else 1
	
	return {
		activeVisibleIndex = ClampedValue - Largest1 + 1,
		page = ClampedValue,
		dots = if IsLargestAbove then getOverflowDots(ClampedValue, Largest, Largest1, Size, p3) else getDefaultDots(ClampedValue, Smallest, Size),
		count = Largest
	}
end