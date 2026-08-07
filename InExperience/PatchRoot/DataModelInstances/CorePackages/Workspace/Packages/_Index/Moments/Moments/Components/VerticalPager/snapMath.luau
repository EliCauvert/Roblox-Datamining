local t = {
	advanceCriticalDampedSpring = function(p0, p1, p2, p3, p4) --[[ line: 25 ]]
		local var1 = 6.28318530718 * p4
		local var2 = p0 - p2
		local var3 = var1 * p3
		local expValue = math.exp(-var3)
		local var5 = p1 + var1 * var2
		
		return p2 + (var2 + var5 * p3) * expValue, (p1 - var5 * var3) * expValue
	end,
	offsetForIndex = function(value, p5) --[[ line: 45 ]]
		return (value - 1) * p5
	end,
	clampIndex = function(value, minValue) --[[ line: 50 ]]
		return if minValue <= 0 then 1 else math.clamp(value, 1, minValue)
	end,
	projectSnapOffset = function(value, p6, p7) --[[ line: 62 ]]
		return value - p6 * p7
	end
}

function t.resolveSnapIndex(p8, p9, p10, p11, p12) --[[ line: 77 ]]
	-- upvalues: t (ref)
	if p11 <= 0 or p10 <= 0 then
		return 1
	end
	local var6 = p8 / p10
	local var7 = t.projectSnapOffset(p8, p9, p12) - p8
	local var8 = p10 * 0.5
	
	return t.clampIndex(if var8 < var7 then math.floor(var6) + 2 elseif var7 < -var8 then math.ceil(var6) else math.round(var6) + 1, p11)
end

function t.getVisibleWindow(p13, p14, p15) --[[ line: 109 ]]
	-- upvalues: t (ref)
	if p15 <= 0 then
		return { startIndex = 1, endIndex = 0 }
	end
	local var9 = t.clampIndex(p13, p15)
	
	return {
		startIndex = math.max(1, var9 - p14),
		endIndex = math.min(p15, var9 + p14)
	}
end

function t.reindexAfterRemoval(p16, p17, p18) --[[ line: 130 ]]
	-- upvalues: t (ref)
	return if p18 <= 0 then 1 elseif p17 < p16 then t.clampIndex(p16 - 1, p18) else t.clampIndex(p16, p18)
end

function t.neighborForRemoval(p19, p20) --[[ line: 145 ]]
	return if p19 < p20 then p19 + 1 else p19 - 1
end

function t.nearestIndexForOffset(value, p21, p22) --[[ line: 155 ]]
	-- upvalues: t (ref)
	return if p22 <= 0 then 1 elseif p21 <= 0 then 1 else t.clampIndex(math.round(value / p21) + 1, p22)
end

function t.resolveSettleIndex(value, p23, p24, p25, p26, p27) --[[ line: 178 ]]
	-- upvalues: t (ref)
	if p25 <= 0 or p24 <= 0 then
		return t.clampIndex(value, p25)
	end
	local var10 = (p23 - t.offsetForIndex(value, p24)) / p24
	local var11 = value
	
	if p26 < var10 then
		local maxValue = math.max(1, math.round(var10))
		
		if p27 ~= nil then
			maxValue = math.min(maxValue, p27)
		end
		var11 = value + maxValue
	elseif var10 < -p26 then
		local minValue = math.min(-1, math.round(var10))
		
		if p27 ~= nil then
			minValue = math.max(minValue, -p27)
		end
		var11 = value + minValue
	end
	return t.clampIndex(var11, p25)
end

return t