local t = {
	advanceCriticalDampedSpring = function(p1, p2, p3, p4, p5)
		local var1 = 6.28318530718 * p5
		local var2 = p1 - p3
		local var3 = var1 * p4
		local expValue = math.exp(-var3)
		local var4 = p2 + var1 * var2
		
		return p3 + (var2 + var4 * p4) * expValue, (p2 - var4 * var3) * expValue
	end,
	offsetForIndex = function(value, p1)
		return (value - 1) * p1
	end,
	clampIndex = function(value, minValue)
		return if minValue <= 0 then 1 else math.clamp(value, 1, minValue)
	end,
	projectSnapOffset = function(value, p1, p2)
		return value - p1 * p2
	end
}

function t.resolveSnapIndex(p1, p2, p3, p4, p5)
	-- upvalues: t (ref)
	if p4 <= 0 or p3 <= 0 then
		return 1
	end
	local var1 = p1 / p3
	local var2 = t.projectSnapOffset(p1, p2, p5) - p1
	local var3 = p3 * 0.5
	
	return t.clampIndex(if var3 < var2 then math.floor(var1) + 2 elseif var2 < -var3 then math.ceil(var1) else math.round(var1) + 1, p4)
end

function t.getVisibleWindow(p1, p2, p3)
	-- upvalues: t (ref)
	if p3 <= 0 then
		return { startIndex = 1, endIndex = 0 }
	end
	local var1 = t.clampIndex(p1, p3)
	
	return {
		startIndex = math.max(1, var1 - p2),
		endIndex = math.min(p3, var1 + p2)
	}
end

function t.reindexAfterRemoval(p1, p2, p3)
	-- upvalues: t (ref)
	return if p3 <= 0 then 1 elseif p2 < p1 then t.clampIndex(p1 - 1, p3) else t.clampIndex(p1, p3)
end

function t.neighborForRemoval(p1, p2)
	return if p1 < p2 then p1 + 1 else p1 - 1
end

function t.nearestIndexForOffset(value, p1, p2)
	-- upvalues: t (ref)
	return if p2 <= 0 then 1 elseif p1 <= 0 then 1 else t.clampIndex(math.round(value / p1) + 1, p2)
end

function t.resolveSettleIndex(value, p1, p2, p3, p4, p5)
	-- upvalues: t (ref)
	if p3 <= 0 or p2 <= 0 then
		return t.clampIndex(value, p3)
	end
	local var1 = (p1 - t.offsetForIndex(value, p2)) / p2
	local var2 = value
	
	if p4 < var1 then
		local maxValue = math.max(1, math.round(var1))
		
		if p5 ~= nil then
			maxValue = math.min(maxValue, p5)
		end
		var2 = value + maxValue
	elseif var1 < -p4 then
		local minValue = math.min(-1, math.round(var1))
		
		if p5 ~= nil then
			minValue = math.max(minValue, -p5)
		end
		var2 = value + minValue
	end
	return t.clampIndex(var2, p3)
end

return t