local parent = script:FindFirstAncestor("TTINavigationTracking").Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local useNavigation = require(parent.Navigation).useNavigation
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local milestone = timeToInteractiveTracker.Milestone
local hooks = timeToInteractiveTracker.Hooks or nil
local trackMilestone = timeToInteractiveTracker.trackMilestone or nil

return function(value)
	-- upvalues: hooks (ref), useNavigation (ref), reactModule (ref), timeToInteractiveTracker (ref), roactNavigationModule (ref), trackMilestone (ref), milestone (ref)
	hooks.useTTIRenderAndMountedTracking(value)
	local var1 = useNavigation()
	reactModule.useEffect(function()
		-- upvalues: timeToInteractiveTracker (copy), value (ref), var1 (ref), roactNavigationModule (copy), trackMilestone (copy), milestone (copy)
		timeToInteractiveTracker.trackEnd(value)
		local var2 = var1.addListener(roactNavigationModule.Events.WillFocus, function()
			-- upvalues: timeToInteractiveTracker (copy), value (copy), trackMilestone (copy), milestone (copy)
			local var3 = timeToInteractiveTracker.getEvents(false)[value]
			
			if var3 and var3.startTime then
				trackMilestone(value, milestone.RenderStarted)
			end
		end)
		local var3 = var1.addListener(roactNavigationModule.Events.DidFocus, function()
			-- upvalues: timeToInteractiveTracker (copy), value (copy), trackMilestone (copy), milestone (copy)
			local var4 = timeToInteractiveTracker.getEvents(false)[value]
			
			if var4 and var4.startTime then
				trackMilestone(value, milestone.SurfaceMounted)
				timeToInteractiveTracker.trackEnd(value)
				
				return
			end
		end)
		
		return function()
			-- upvalues: var2 (ref), var3 (ref)
			var2.remove()
			var3.remove()
		end
	end, {})
end