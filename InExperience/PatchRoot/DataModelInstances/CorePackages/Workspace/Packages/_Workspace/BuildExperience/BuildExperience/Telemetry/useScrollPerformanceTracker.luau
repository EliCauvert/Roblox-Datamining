local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local createScrollIntervalPerformanceTracker = require(parent.IntervalPerformanceTracker).createScrollIntervalPerformanceTracker

return function(p0, p1)
	-- upvalues: reactModule (ref), createScrollIntervalPerformanceTracker (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), createScrollIntervalPerformanceTracker (copy), p0 (ref)
		local current = p1.current
		
		if current == nil then
			return
		end
		local var1 = createScrollIntervalPerformanceTracker(p0, current)
		local var2 = current:GetPropertyChangedSignal("CanvasPosition"):Connect(var1.onScrollTick)
		
		return function()
			-- upvalues: var2 (ref), var1 (ref)
			var2:Disconnect()
			var1.cleanup()
		end
	end, { p0 })
end