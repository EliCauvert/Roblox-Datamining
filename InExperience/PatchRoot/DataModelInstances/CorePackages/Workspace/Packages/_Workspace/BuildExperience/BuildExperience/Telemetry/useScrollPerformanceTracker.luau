local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local CreateScrollIntervalPerformanceTrackerFunction = require(Parent.IntervalPerformanceTracker).createScrollIntervalPerformanceTracker

return function(p1, p2)
	-- upvalues: ReactModule (copy), CreateScrollIntervalPerformanceTrackerFunction (copy)
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), CreateScrollIntervalPerformanceTrackerFunction (upval), p1 (copy)
		local Current = p2.current
		
		if Current == nil then return end
		local ScrollIntervalPerformanceTracker = CreateScrollIntervalPerformanceTrackerFunction(p1, Current)
		local Connection = Current:GetPropertyChangedSignal("CanvasPosition"):Connect(ScrollIntervalPerformanceTracker.onScrollTick)
		
		return function()
			-- upvalues: Connection (copy), ScrollIntervalPerformanceTracker (copy)
			Connection:Disconnect()
			ScrollIntervalPerformanceTracker.cleanup()
		end
	end, { p1 })
end