local _ = require(script.Parent.types)

local function linear(p0, _) --[[ line: 24 ]]
	return p0
end

local function quad(p1, _) --[[ line: 28 ]]
	return p1 * p1
end

local function cubic(p2, _) --[[ line: 32 ]]
	return p2 * p2 * p2
end

local function quart(p3, _) --[[ line: 36 ]]
	return p3 * p3 * p3 * p3
end

local function quint(p4, _) --[[ line: 40 ]]
	return p4 * p4 * p4 * p4 * p4
end

local function exponential(p5, _) --[[ line: 44 ]]
	return if p5 == 0 then 0 else math.pow(2, (p5 - 1) * 10)
end

local function sine(p6, _) --[[ line: 48 ]]
	return 1 - math.cos(p6 * 3.14159265359 / 2)
end

local function elastic(p7, _) --[[ line: 52 ]]
	return if p7 == 0 then 0 elseif p7 == 1 then 1 else -math.pow(2, p7 * 10 - 10) * math.sin((p7 * 10 - 10.75) * 2.094395102393)
end

local function back(p8, _) --[[ line: 56 ]]
	return p8 * 2.70158 * p8 * p8 - p8 * 1.70158 * p8
end

local function _(p9) --[[ line: 62 | named "easeOutBounce" ]]
	return if p9 < 0.363636363636 then p9 * 7.5625 * p9 elseif p9 < 0.727272727273 then (p9 - 0.545454545455) * 7.5625 * (p9 - 0.545454545455) + 0.75 elseif p9 < 0.909090909091 then (p9 - 0.818181818182) * 7.5625 * (p9 - 0.818181818182) + 0.9375 else (p9 - 0.954545454545) * 7.5625 * (p9 - 0.954545454545) + 0.984375
end

local function bounce(p10, _) --[[ line: 77 ]]
	local var13 = 1 - p10
	
	return 1 - (if var13 < 0.363636363636 then var13 * 7.5625 * var13 elseif var13 < 0.727272727273 then (var13 - 0.545454545455) * 7.5625 * (var13 - 0.545454545455) + 0.75 elseif var13 < 0.909090909091 then (var13 - 0.818181818182) * 7.5625 * (var13 - 0.818181818182) + 0.9375 else (var13 - 0.954545454545) * 7.5625 * (var13 - 0.954545454545) + 0.984375)
end

local function circular(p11, _) --[[ line: 81 ]]
	return -(math.sqrt(1 - p11 * p11) - 1)
end

local _ = function(p12, p13, p14) --[[ line: 86 | named "evaluateBezier" ]]
	local var14 = 1 - p12
	local var15 = p12 * p12
	
	return var14 * var14 * 3 * p12 * p13 + var14 * 3 * var15 * p14 + p12 * var15
end

local function cubicBezier(p15, p16) --[[ line: 95 ]]
	assert(typeof(p16) == "table", "Expected values to be a table")
	assert(#p16 == 4, "Expected values to have 4 elements")
	local unpacked, unpacked_1, unpacked_2, unpacked_3 = table.unpack(p16)
	assert(unpacked >= 0 and unpacked <= 1, "x1 must be between 0 and 1")
	assert(unpacked_2 >= 0 and unpacked_2 <= 1, "x2 must be between 0 and 1")
	
	if p15 <= 0 then
		return 0
	elseif p15 >= 1 then
		return 1
	end
	local var26
	local var20 = 0
	local var21 = 1
	local var22 = 0
	local _ = nil
	
	for _ = 1, 10 do
		var22 += 1
		local var23 = (var20 + var21) / 2
		local var24 = 1 - var23
		local var25 = var23 * var23
		var26 = var24 * var24 * 3 * var23 * unpacked + var24 * 3 * var25 * unpacked_2 + var23 * var25
		
		if math.abs(var26 - p15) >= 0.0001 then
			if var26 < p15 then
				var20 = var23
			else
				var21 = var23
			end
		end
		local var27 = 1 - var23
		local var28 = var23 * var23
		
		return var27 * var27 * 3 * var23 * unpacked_1 + var27 * 3 * var28 * unpacked_3 + var23 * var28
	end
	local var29 = (var20 + var21) / 2
	local var30 = 1 - var29
	var26 = var29 * var29
	
	return var30 * var30 * 3 * var29 * unpacked_1 + var30 * 3 * var26 * unpacked_3 + var29 * var26
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

return function(p17, p18) --[[ line: 158 | named "ease" ]]
	-- upvalues: t (ref), cubicBezier (ref)
	local var31 = if p18 and p18.duration then p18.duration else 1
	local var32 = if p18 and p18.easingStyle then p18.easingStyle else Enum.EasingStyle.Linear
	local var33 = if typeof(var32) == "EnumItem" or typeof(var32) == "string" then t[var32] else cubicBezier
	
	return {
		step = function(p19, p20) --[[ line: 169 ]]
			-- upvalues: p17 (ref), var31 (ref), var33 (ref), var32 (ref)
			local var34 = if p19.initialValue ~= nil then p19.value or 0 else p19.initialValue
			local var35 = (p19.elapsed or 0) + p20
			
			if p19.goal and p17 ~= p19.goal then
				var34 = p19.value
				var35 = 0
			end
			local var36 = var34 + (p17 - var34) * var33(math.min(var35 / var31, 1), var32)
			local var37 = if var31 > var35 then var34 == p17 else true
			
			if var37 then
				var36 = p17
				var34 = p17
				var35 = 0
			end
			return {
				initialValue = var34,
				goal = p17,
				value = var36,
				elapsed = var35,
				complete = var37
			}
		end,
		startingValue = if p18 then p18.startingValue else nil
	}
end