local _ = require(script.Parent.types)

local function _(p1: number): number --[[ Line: 62 | Named "easeOutBounce" ]]
	return if p1 < 0.36363636363636365 then p1 * 7.5625 * p1 elseif p1 < 0.7272727272727273 then (p1 - 0.5454545454545454) * 7.5625 * (p1 - 0.5454545454545454) + 0.75 elseif p1 < 0.9090909090909091 then (p1 - 0.8181818181818182) * 7.5625 * (p1 - 0.8181818181818182) + 0.9375 else (p1 - 0.9545454545454546) * 7.5625 * (p1 - 0.9545454545454546) + 0.984375
end

local _ = function(p1: number, p2, p3): number --[[ Line: 86 | Named "evaluateBezier" ]]
	local v1 = 1 - p1
	local v2 = p1 * p1
	
	return v1 * v1 * 3 * p1 * p2 + v1 * 3 * v2 * p3 + p1 * v2
end

local function cubicBezier(p1: number, p2): number --[[ Line: 95 ]]
	assert(typeof(p2) == "table", "Expected values to be a table")
	assert(#p2 == 4, "Expected values to have 4 elements")
	local Unpacked, Unpacked2, Unpacked3, Unpacked4 = table.unpack(p2)
	assert(Unpacked >= 0 and Unpacked <= 1, "x1 must be between 0 and 1")
	assert(Unpacked3 >= 0 and Unpacked3 <= 1, "x2 must be between 0 and 1")
	
	if p1 <= 0 then
		return 0
	end
	if p1 >= 1 then
		return 1
	end
	local v1 = 0
	local v2 = 1
	local Count = 0
	local v3 = nil
	
	for _ = 1, 10 do
		Count += 1
		v3 = (v1 + v2) / 2
		local v4 = 1 - v3
		local v5 = v3 * v3
		local NewUnpacked = v4 * v4 * 3 * v3 * Unpacked + v4 * 3 * v5 * Unpacked3 + v3 * v5
		
		if math.abs(NewUnpacked - p1) < 0.0001 then
			local v6 = 1 - v3
			local v7 = v3 * v3
			
			return v6 * v6 * 3 * v3 * Unpacked2 + v6 * 3 * v7 * Unpacked4 + v3 * v7
		end
		if NewUnpacked < p1 then
			v1 = v3
		else
			v2 = v3
		end
	end
	local v8 = (v1 + v2) / 2
	local v9 = 1 - v8
	local v10 = v8 * v8
	
	return v9 * v9 * 3 * v8 * Unpacked2 + v9 * 3 * v10 * Unpacked4 + v8 * v10
end

local config = {
	[Enum.EasingStyle.Linear] = function(p3, _) --[[ Line: 24 ]]
		return p3
	end,
	[Enum.EasingStyle.Quad] = function(p3, _) --[[ Line: 28 ]]
		return p3 * p3
	end,
	[Enum.EasingStyle.Cubic] = function(p3, _) --[[ Line: 32 ]]
		return p3 * p3 * p3
	end,
	[Enum.EasingStyle.Quart] = function(p3, _) --[[ Line: 36 ]]
		return p3 * p3 * p3 * p3
	end,
	[Enum.EasingStyle.Quint] = function(p3, _) --[[ Line: 40 ]]
		return p3 * p3 * p3 * p3 * p3
	end,
	[Enum.EasingStyle.Exponential] = function(p3: number, _): number --[[ Line: 44 ]]
		return if p3 == 0 then 0 else math.pow(2, (p3 - 1) * 10)
	end,
	[Enum.EasingStyle.Sine] = function(p3: number, _): number --[[ Line: 48 ]]
		return 1 - math.cos(p3 * 3.141592653589793 / 2)
	end,
	[Enum.EasingStyle.Back] = function(p3: number, _): number --[[ Line: 56 ]]
		return p3 * 2.70158 * p3 * p3 - p3 * 1.70158 * p3
	end,
	[Enum.EasingStyle.Bounce] = function(p3: number, _): number --[[ Line: 77 ]]
		local v11 = 1 - p3
		
		return 1 - (if v11 < 0.36363636363636365 then v11 * 7.5625 * v11 elseif v11 < 0.7272727272727273 then (v11 - 0.5454545454545454) * 7.5625 * (v11 - 0.5454545454545454) + 0.75 elseif v11 < 0.9090909090909091 then (v11 - 0.8181818181818182) * 7.5625 * (v11 - 0.8181818181818182) + 0.9375 else (v11 - 0.9545454545454546) * 7.5625 * (v11 - 0.9545454545454546) + 0.984375)
	end,
	[Enum.EasingStyle.Elastic] = function(p3: number, _) --[[ Line: 52 ]]
		return if p3 == 0 then 0 elseif p3 == 1 then 1 else -math.pow(2, p3 * 10 - 10) * math.sin((p3 * 10 - 10.75) * 2.0943951023931953)
	end,
	[Enum.EasingStyle.Circular] = function(p3, _) --[[ Line: 81 ]]
		return -(math.sqrt(1 - p3 * p3) - 1)
	end
}

return function(Goal, p3) --[[ Line: 158 | Named "ease" ]]
	-- upvalues: config (copy), cubicBezier (copy)
	local Duration = if p3 and p3.duration then p3.duration else 1
	local EasingStyle = if p3 and p3.easingStyle then p3.easingStyle else Enum.EasingStyle.Linear
	local Entry = if typeof(EasingStyle) == "EnumItem" or typeof(EasingStyle) == "string" then config[EasingStyle] else cubicBezier
	
	return {
		step = function(p4, p5) --[[ Line: 169 ]]
			-- upvalues: Goal (copy), Duration (copy), Entry (copy), EasingStyle (copy)
			local Value = if p4.initialValue == nil then p4.value or 0 else p4.initialValue
			local Elapsed = (p4.elapsed or 0) + p5
			
			if p4.goal and Goal ~= p4.goal then
				Value = p4.value
				Elapsed = 0
			end
			local NewValue = Value + (Goal - Value) * Entry(math.min(Elapsed / Duration, 1), EasingStyle)
			local IsDurationBelow: boolean = Duration <= Elapsed or Value == Goal
			
			if IsDurationBelow then
				NewValue = Goal
				Value = Goal
				Elapsed = 0
			end
			return {
				initialValue = Value,
				goal = Goal,
				value = NewValue,
				elapsed = Elapsed,
				complete = IsDurationBelow
			}
		end,
		startingValue = if p3 then p3.startingValue else nil
	}
end