local _ = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.ExperienceAnalytics)
local t = {
	minX = 0,
	maxX = 1,
	minY = 0,
	maxY = 1,
	points = {},
	yTicks = {}
}

local function _(p1, p2)
	if p1 <= 0 then
		return 1
	end
	local floored = math.floor(math.log(p1, 10))
	local var1 = p1 / 10 ^ floored
	
	return (if p2 then if var1 < 1.5 then 1 elseif var1 < 3 then 2 elseif var1 < 7 then 5 else 10 elseif var1 <= 1 then 1 elseif var1 <= 2 then 2 elseif var1 <= 5 then 5 else 10) * 10 ^ floored
end

local function computeYAxis(p1, p2)
	if p2 == p1 then
		local var1 = if p1 == 0 then 1 else math.abs(p1) * 0.5
		
		return p1 - var1, p1 + var1, { p1 }
	end
	local var2
	local var3 = (p2 - p1) / 2
	
	if var3 <= 0 then
		var2 = 1
	else
		local floored = math.floor(math.log(var3, 10))
		local var4 = var3 / 10 ^ floored
		var2 = (if var4 < 1.5 then 1 elseif var4 < 3 then 2 elseif var4 < 7 then 5 else 10) * 10 ^ floored
	end
	local var5 = math.floor(p1 / var2) * var2
	local var6 = math.ceil(p2 / var2) * var2
	
	if var6 - var5 < var2 * 2 then
		var6 = var5 + var2 * 2
	end
	return var5, var6, { var5, (var5 + var6) / 2, var6 }
end

return function(p1)
	-- upvalues: t (ref), computeYAxis (ref)
	local var1 = if p1 ~= nil then nil else p1.dataPoints
	
	if var1 == nil or #var1 == 0 then
		return t
	end
	local t_1 = {}
	local value = var1[1].value
	local value_1 = var1[1].value
	
	for i, v in var1 do
		t_1[i] = Vector2.new(i - 1, v.value)
		value = math.min(value, v.value)
		value_1 = math.max(value_1, v.value)
	end
	local var11Count = #var1
	local var2, var3, var4 = computeYAxis(value, value_1)
	local var5 = (var3 - var2) * 0.1
	
	return {
		minX = 0,
		points = t_1,
		maxX = math.max(var11Count - 1, 1),
		minY = var2 - var5,
		maxY = var3 + var5,
		yTicks = var4
	}
end