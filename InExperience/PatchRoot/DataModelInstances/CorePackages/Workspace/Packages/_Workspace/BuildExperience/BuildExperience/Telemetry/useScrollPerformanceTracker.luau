local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local CreateScrollIntervalPerformanceTrackerFunction = require(Parent.IntervalPerformanceTracker).createScrollIntervalPerformanceTracker

return function(p1, p2) --[[ Line: 9 | Named "useScrollPerformanceTracker" ]]
	-- upvalues: ReactModule (copy), CreateScrollIntervalPerformanceTrackerFunction (copy)
	ReactModule.useEffect(function() --[[ Line: 10 ]]
		-- upvalues: p2 (copy), CreateScrollIntervalPerformanceTrackerFunction (upval), p1 (copy)
		local Current = p2.current
		
		if Current == nil then return end
		local ScrollIntervalPerformanceTracker = CreateScrollIntervalPerformanceTrackerFunction(p1, Current)
		local Connection = Current:GetPropertyChangedSignal("CanvasPosition"):Connect(ScrollIntervalPerformanceTracker.onScrollTick)
		
		return function() --[[ Line: 19 ]]
			-- upvalues: Connection (copy), ScrollIntervalPerformanceTracker (copy)
			Connection:Disconnect()
			ScrollIntervalPerformanceTracker.cleanup()
		end
	end, { p1 })
end