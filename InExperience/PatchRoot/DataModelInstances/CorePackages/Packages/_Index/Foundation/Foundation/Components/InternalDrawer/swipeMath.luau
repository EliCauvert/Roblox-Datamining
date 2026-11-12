local Foundation = script:FindFirstAncestor("Foundation")
local DragIntentModule = require(Foundation.Enums.DragIntent)
local InternalDrawerSideModule = require(Foundation.Enums.InternalDrawerSide)

local function _(p1, p2)
	return if p1 == nil then p2 else p1
end

return {
	DEFAULT_DISTANCE_FRACTION = 0.3,
	DEFAULT_VELOCITY_THRESHOLD = 400,
	classifyDrag = function(Value: number, Value1: number, p1, p2)
		-- upvalues: DragIntentModule (copy)
		local Magnitude = math.abs(Value)
		local Magnitude1 = math.abs(Value1)
		
		return if p1 < Magnitude1 and Magnitude <= Magnitude1 then DragIntentModule.Ignore elseif Magnitude <= p1 then DragIntentModule.Pending elseif p2 == nil or Value * p2 > 0 then DragIntentModule.Claim else DragIntentModule.Ignore
	end,
	closeSign = function(Start)
		-- upvalues: InternalDrawerSideModule (copy)
		return -(if Start == InternalDrawerSideModule.Start then 1 else -1)
	end,
	distanceAlong = function(p1, p2, p3): number
		return (math.max(0, (p3 - p2) * p1))
	end,
	freshVelocity = function(p1, p2, p3)
		return if p3 - p2 > 0.1 then 0 else p1
	end,
	openSign = function(Start): number
		-- upvalues: InternalDrawerSideModule (copy)
		return if Start == InternalDrawerSideModule.Start then 1 else -1
	end,
	passedThreshold = function(p1: number, p2: number, p3, p4, p5): boolean
		return p2 > 0 and (p5 <= p3 or p1 > 0 and p4 * p2 <= p1)
	end,
	progress = function(p1, p2: number): number
		return if p2 <= 0 then 0 else math.clamp(p1 / p2, 0, 1)
	end,
	resolveThresholds = function(p1)
		local DistanceFraction = p1.distanceFraction
		local DistanceFraction1 = if DistanceFraction == nil then 0.3 else DistanceFraction
		local VelocityThreshold = p1.velocityThreshold
		
		if VelocityThreshold == nil then
			return DistanceFraction1, 400
		else
			return DistanceFraction1, VelocityThreshold
		end
	end,
	shouldCommit = function(p1, p2, p3: number, p4, p5, p6): boolean
		local Largest = math.max(0, (p1.lastX - p1.startX) * p2)
		local VelocityX = p1.velocityX
		local v1 = (if p6 - p1.lastTime > 0.1 then 0 else VelocityX) * p2
		
		return p3 > 0 and (p5 <= v1 or Largest > 0 and p4 * p3 <= Largest)
	end,
	velocityAlong = function(p1, p2)
		return p2 * p1
	end
}