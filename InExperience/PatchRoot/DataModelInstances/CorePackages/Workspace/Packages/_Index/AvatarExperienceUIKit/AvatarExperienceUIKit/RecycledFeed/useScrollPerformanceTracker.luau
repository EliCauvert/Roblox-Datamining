local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local CreateScrollIntervalPerformanceTrackerFunction = require(Parent.IntervalPerformanceTracker).createScrollIntervalPerformanceTracker

return function(p1, Object)
	-- upvalues: ReactModule (copy), CreateScrollIntervalPerformanceTrackerFunction (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), Object (copy), CreateScrollIntervalPerformanceTrackerFunction (upval)
		if p1 == nil or Object == nil then return end
		local ScrollIntervalPerformanceTracker = CreateScrollIntervalPerformanceTrackerFunction(p1, Object)
		local Connection = Object:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
			-- upvalues: Object (upval), ScrollIntervalPerformanceTracker (copy)
			if Object.Visible then
				ScrollIntervalPerformanceTracker.onScrollTick()
			end
		end)
		
		return function()
			-- upvalues: Connection (copy), ScrollIntervalPerformanceTracker (copy)
			Connection:Disconnect()
			ScrollIntervalPerformanceTracker.cleanup()
		end
	end, { p1, Object })
end