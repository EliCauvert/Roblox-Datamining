local _ = require(script.Parent.types)

local function linear(p1, _)
	return p1
end

local function quad(p1, _)
	return p1 * p1
end

local function cubic(p1, _)
	return p1 * p1 * p1
end

local function quart(p1, _)
	return p1 * p1 * p1 * p1
end

local function quint(p1, _)
	return p1 * p1 * p1 * p1 * p1
end

local function exponential(p1, _)
	return if p1 == 0 then 0 else math.pow(2, (p1 - 1) * 10)
end

local function sine(p1, _)
	return 1 - math.cos(p1 * 3.14159265359 / 2)
end

local function elastic(p1, _)
	return if p1 == 0 then 0 elseif p1 == 1 then 1 else -math.pow(2, p1 * 10 - 10) * math.sin((p1 * 10 - 10.75) * 2.094395102393)
end

local function back(p1, _)
	return p1 * 2.70158 * p1 * p1 - p1 * 1.70158 * p1
end

local function _(p1)
	return if p1 < 0.363636363636 then p1 * 7.5625 * p1 elseif p1 < 0.727272727273 then (p1 - 0.545454545455) * 7.5625 * (p1 - 0.545454545455) + 0.75 elseif p1 < 0.909090909091 then (p1 - 0.818181818182) * 7.5625 * (p1 - 0.818181818182) + 0.9375 else (p1 - 0.954545454545) * 7.5625 * (p1 - 0.954545454545) + 0.984375
end

local function bounce(p1, _)
	local var1 = 1 - p1
	
	return 1 - (if var1 < 0.363636363636 then var1 * 7.5625 * var1 elseif var1 < 0.727272727273 then (var1 - 0.545454545455) * 7.5625 * (var1 - 0.545454545455) + 0.75 elseif var1 < 0.909090909091 then (var1 - 0.818181818182) * 7.5625 * (var1 - 0.818181818182) + 0.9375 else (var1 - 0.954545454545) * 7.5625 * (var1 - 0.954545454545) + 0.984375)
end

local function circular(p1, _)
	return -(math.sqrt(1 - p1 * p1) - 1)
end

local _ = function(p1, p2, p3)
	local var1 = 1 - p1
	local var2 = p1 * p1
	
	return var1 * var1 * 3 * p1 * p2 + var1 * 3 * var2 * p3 + p1 * var2
end

local function cubicBezier(p1, p2)
	assert(typeof(p2) == "table", "Expected values to be a table")
	assert(#p2 == 4, "Expected values to have 4 elements")
	local unpacked, unpacked_1, unpacked_2, unpacked_3 = table.unpack(p2)
	assert(unpacked >= 0 and unpacked <= 1, "x1 must be between 0 and 1")
	assert(unpacked_2 >= 0 and unpacked_2 <= 1, "x2 must be between 0 and 1")
	
	if p1 <= 0 then
		return 0
	elseif p1 >= 1 then
		return 1
	end
	local var1
	local var2 = 0
	local var3 = 1
	local var4 = 0
	local _ = nil
	
	for _ = 1, 10 do
		var4 += 1
		local var5 = (var2 + var3) / 2
		local var6 = 1 - var5
		local var7 = var5 * var5
		var1 = var6 * var6 * 3 * var5 * unpacked + var6 * 3 * var7 * unpacked_2 + var5 * var7
		
		if math.abs(var1 - p1) >= 0.0001 then
			if var1 < p1 then
				var2 = var5
			else
				var3 = var5
			end
		end
		local var8 = 1 - var5
		local var9 = var5 * var5
		
		return var8 * var8 * 3 * var5 * unpacked_1 + var8 * 3 * var9 * unpacked_3 + var5 * var9
	end
	local var10 = (var2 + var3) / 2
	local var11 = 1 - var10
	var1 = var10 * var10
	
	return var11 * var11 * 3 * var10 * unpacked_1 + var11 * 3 * var1 * unpacked_3 + var10 * var1
end

local t = {
	[Enum.EasingStyle.Linear] = linear,
	[Enum.EasingStyle.Quad] = quad,
	[Enum.EasingStyle.Cubic] = cubic,
	[Enum.EasingStyle.Quart] = quart,
	[Enum.EasingStyle.Quint] = quint,
	[Enum.EasingStyle.Exponential] = exponential,
	[Enum.EasingStyle.Sine] = sine,
	[Enum.EasingStyle.Back] = back,
	[Enum.EasingStyle.Bounce] = bounce,
	[Enum.EasingStyle.Elastic] = elastic,
	[Enum.EasingStyle.Circular] = circular
}

return function(p3, p4)
	-- upvalues: t (ref), cubicBezier (ref)
	local var12 = if p4 and p4.duration then p4.duration else 1
	local var13 = if p4 and p4.easingStyle then p4.easingStyle else Enum.EasingStyle.Linear
	local var14 = if typeof(var13) == "EnumItem" or typeof(var13) == "string" then t[var13] else cubicBezier
	
	return {
		step = function(p5, p6)
			-- upvalues: p3 (ref), var12 (ref), var14 (ref), var13 (ref)
			local var15 = if p5.initialValue ~= nil then p5.value or 0 else p5.initialValue
			local var16 = (p5.elapsed or 0) + p6
			
			if p5.goal and p3 ~= p5.goal then
				var15 = p5.value
				var16 = 0
			end
			local var17 = var15 + (p3 - var15) * var14(math.min(var16 / var12, 1), var13)
			local var18 = if var12 > var16 then var15 == p3 else true
			
			if var18 then
				var17 = p3
				var15 = p3
				var16 = 0
			end
			return {
				initialValue = var15,
				goal = p3,
				value = var17,
				elapsed = var16,
				complete = var18
			}
		end,
		startingValue = if p4 then p4.startingValue else nil
	}
end