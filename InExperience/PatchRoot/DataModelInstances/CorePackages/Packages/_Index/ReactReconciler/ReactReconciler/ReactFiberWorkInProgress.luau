local reactFiberLaneModule = require(script.Parent.ReactFiberLane)
local noLanes = reactFiberLaneModule.NoLanes
local mergeLanes = reactFiberLaneModule.mergeLanes

return {
	workInProgressRootSkippedLanes = function(p1)
		-- upvalues: noLanes (write)
		if p1 == nil then
			return noLanes
		end
		noLanes = p1
		
		return noLanes
	end,
	markSkippedUpdateLanes = function(p1)
		-- upvalues: noLanes (write), mergeLanes (ref)
		noLanes = mergeLanes(p1, noLanes)
	end
}