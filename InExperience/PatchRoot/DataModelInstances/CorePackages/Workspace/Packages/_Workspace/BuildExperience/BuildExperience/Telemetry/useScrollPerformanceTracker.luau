local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local createScrollIntervalPerformanceTracker = require(parent.IntervalPerformanceTracker).createScrollIntervalPerformanceTracker

return function(p1, p2)
	-- upvalues: reactModule (ref), createScrollIntervalPerformanceTracker (ref)
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), createScrollIntervalPerformanceTracker (copy), p1 (ref)
		local current = p2.current
		
		if current == nil then
			return
		end
		local var1 = createScrollIntervalPerformanceTracker(p1, current)
		local var2 = current:GetPropertyChangedSignal("CanvasPosition"):Connect(var1.onScrollTick)
		
		return function()
			-- upvalues: var2 (ref), var1 (ref)
			var2:Disconnect()
			var1.cleanup()
		end
	end, { p1 })
end