local _ = require(script:FindFirstAncestor("AnalyticsMetricChart").Components.MetricChart.MetricChartTypes)
local config = {
	minX = 0,
	maxX = 1,
	minY = 0,
	maxY = 1,
	points = {},
	yTicks = {}
}

local function _(p1: number, p2): number
	if p1 <= 0 then
		return 1
	else
		local Floored = math.floor((math.log(p1, 10)))
		local v1 = p1 / 10 ^ Floored
		
		return (if p2 then if v1 < 1.5 then 1 elseif v1 < 3 then 2 elseif v1 < 7 then 5 else 10 elseif v1 <= 1 then 1 elseif v1 <= 2 then 2 elseif v1 <= 5 then 5 else 10) * 10 ^ Floored
	end
end

local function computeYAxis(Value: number, Largest: number)
	if Largest == Value then
		local ScaledMagnitude: number = if Value == 0 then 1 else math.abs(Value) * 0.5
		
		return Value - ScaledMagnitude, Value + ScaledMagnitude, { Value }
	end
	local LargestRatio = (Largest - Value) / 2
	local v1 = nil
	
	if LargestRatio <= 0 then
		v1 = 1
	else
		local Floored = math.floor((math.log(LargestRatio, 10)))
		local LargestRatioRatio = LargestRatio / 10 ^ Floored
		v1 = (if LargestRatioRatio < 1.5 then 1 elseif LargestRatioRatio < 3 then 2 elseif LargestRatioRatio < 7 then 5 else 10) * 10 ^ Floored
	end
	local ScaledFloored = math.floor(Value / v1) * v1
	local ScaledCeiled = math.ceil(Largest / v1) * v1
	
	if ScaledCeiled - ScaledFloored < v1 * 2 then
		ScaledCeiled = ScaledFloored + v1 * 2
	end
	return ScaledFloored, ScaledCeiled, {
		ScaledFloored,
		(ScaledFloored + ScaledCeiled) / 2,
		ScaledCeiled
	}
end

return function(Entry)
	-- upvalues: config (copy), computeYAxis (copy)
	if Entry == nil or #Entry == 0 then
		return config
	end
	local Points = {}
	local Value = Entry[1].value
	local Value1 = Entry[1].value
	
	for i, value in Entry do
		Points[i] = Vector2.new(i - 1, value.value)
		Value = math.min(Value, value.value)
		Value1 = math.max(Value1, value.value)
	end
	local CountEntry = #Entry
	local YAxis, YAxis2, YAxis3 = computeYAxis(Value, Value1)
	local ScaledYAxis = (YAxis2 - YAxis) * 0.1
	
	return {
		minX = 0,
		points = Points,
		maxX = math.max(CountEntry - 1, 1),
		minY = YAxis - ScaledYAxis,
		maxY = YAxis2 + ScaledYAxis,
		yTicks = YAxis3
	}
end