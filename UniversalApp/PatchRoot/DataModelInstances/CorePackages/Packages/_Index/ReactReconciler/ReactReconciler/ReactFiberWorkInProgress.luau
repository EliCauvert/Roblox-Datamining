local ReactFiberLaneModule = require(script.Parent.ReactFiberLane)
local NoLanes = ReactFiberLaneModule.NoLanes
local MergeLanesFunction = ReactFiberLaneModule.mergeLanes

return {
	workInProgressRootSkippedLanes = function(p1)
		-- upvalues: NoLanes (ref)
		if p1 == nil then
			return NoLanes
		else
			NoLanes = p1
			
			return NoLanes
		end
	end,
	markSkippedUpdateLanes = function(p1)
		-- upvalues: NoLanes (ref), MergeLanesFunction (copy)
		NoLanes = MergeLanesFunction(p1, NoLanes)
	end
}