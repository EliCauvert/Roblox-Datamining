local reactFiberLaneModule = require(script.Parent.ReactFiberLane)
local noLanes = reactFiberLaneModule.NoLanes
local mergeLanes = reactFiberLaneModule.mergeLanes

return {
	workInProgressRootSkippedLanes = function(p0)
		-- upvalues: noLanes (write)
		if p0 == nil then
			return noLanes
		end
		noLanes = p0
		
		return noLanes
	end,
	markSkippedUpdateLanes = function(p1)
		-- upvalues: noLanes (write), mergeLanes (ref)
		noLanes = mergeLanes(p1, noLanes)
	end
}