local SnapMathModule = {
	advanceCriticalDampedSpring = function(p1, p2, p3, p4, p5: number)
		local v1 = 6.283185307179586 * p5
		local v2 = p1 - p3
		local v3 = v1 * p4
		local Exponential = math.exp(-v3)
		local v4 = p2 + v1 * v2
		
		return p3 + (v2 + v4 * p4) * Exponential, (p2 - v4 * v3) * Exponential
	end,
	offsetForIndex = function(p1: number, p2)
		return (p1 - 1) * p2
	end,
	clampIndex = function(Value: number, MaxValue: number): number
		return if MaxValue <= 0 then 1 else math.clamp(Value, 1, MaxValue)
	end,
	projectSnapOffset = function(p1, p2, p3)
		return p1 - p2 * p3
	end
}

function SnapMathModule.resolveSnapIndex(p1, p2, p3: number, p4: number, p5)
	-- upvalues: SnapMathModule (copy)
	if p4 <= 0 or p3 <= 0 then
		return 1
	else
		local Value = p1 / p3
		local ProjectSnapOffsetResultDelta = SnapMathModule.projectSnapOffset(p1, p2, p5) - p1
		local v1 = p3 * 0.5
		
		return SnapMathModule.clampIndex(if v1 < ProjectSnapOffsetResultDelta then math.floor(Value) + 2 elseif ProjectSnapOffsetResultDelta < -v1 then math.ceil(Value) else math.round(Value) + 1, p4)
	end
end

function SnapMathModule.getVisibleWindow(p1, p2, p3: number)
	-- upvalues: SnapMathModule (copy)
	if p3 <= 0 then
		return { startIndex = 1, endIndex = 0 }
	else
		local ClampIndexResult = SnapMathModule.clampIndex(p1, p3)
		
		return {
			startIndex = math.max(1, ClampIndexResult - p2),
			endIndex = math.min(p3, ClampIndexResult + p2)
		}
	end
end

function SnapMathModule.reindexAfterRemoval(p1: number, p2, p3: number)
	-- upvalues: SnapMathModule (copy)
	return if p3 <= 0 then 1 elseif p2 < p1 then SnapMathModule.clampIndex(p1 - 1, p3) else SnapMathModule.clampIndex(p1, p3)
end

function SnapMathModule.neighborForRemoval(p1: number, p2): number
	return if p1 < p2 then p1 + 1 else p1 - 1
end

function SnapMathModule.nearestIndexForOffset(p1, p2: number, p3: number)
	-- upvalues: SnapMathModule (copy)
	return if p3 <= 0 then 1 elseif p2 <= 0 then 1 else SnapMathModule.clampIndex(math.round(p1 / p2) + 1, p3)
end

function SnapMathModule.resolveSettleIndex(p1: number, p2, p3: number, p4: number, p5, p6: number)
	-- upvalues: SnapMathModule (copy)
	if p4 <= 0 or p3 <= 0 then
		return SnapMathModule.clampIndex(p1, p4)
	end
	local OffsetForIndexResultRatio = (p2 - SnapMathModule.offsetForIndex(p1, p3)) / p3
	local v1: number = p1
	
	if p5 < OffsetForIndexResultRatio then
		local Largest = math.max(1, (math.round(OffsetForIndexResultRatio)))
		
		if p6 ~= nil then
			Largest = math.min(Largest, p6)
		end
		v1 = p1 + Largest
	elseif OffsetForIndexResultRatio < -p5 then
		local Smallest = math.min(-1, (math.round(OffsetForIndexResultRatio)))
		
		if p6 ~= nil then
			Smallest = math.max(Smallest, -p6)
		end
		v1 = p1 + Smallest
	end
	return SnapMathModule.clampIndex(v1, p4)
end

return SnapMathModule