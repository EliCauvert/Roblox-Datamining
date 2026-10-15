local parent = script:FindFirstAncestor("TTINavigationTracking").Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local useNavigation = require(parent.Navigation).useNavigation
local fFlagEnableOnScreenAPIIntegration = require(parent.SharedFlags).FFlagEnableOnScreenAPIIntegration
local var1 = if fFlagEnableOnScreenAPIIntegration then require(parent.RobloxAppNavigation).useOnScreenNavigationListener else nil
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local milestone = timeToInteractiveTracker.Milestone
local hooks = timeToInteractiveTracker.Hooks or nil
local trackMilestone = timeToInteractiveTracker.trackMilestone or nil

return function(value)
	-- upvalues: hooks (ref), useNavigation (ref), timeToInteractiveTracker (ref), trackMilestone (ref), milestone (ref), fFlagEnableOnScreenAPIIntegration (ref), var1 (ref), reactModule (ref), roactNavigationModule (ref)
	hooks.useTTIRenderAndMountedTracking(value)
	local var2 = useNavigation()
	
	local function onWillFocus()
		-- upvalues: timeToInteractiveTracker (copy), value (ref), trackMilestone (copy), milestone (copy)
		local var3 = timeToInteractiveTracker.getEvents(false)[value]
		
		if var3 and var3.startTime then
			trackMilestone(value, milestone.RenderStarted)
		end
	end
	
	local function onDidFocus()
		-- upvalues: timeToInteractiveTracker (copy), value (ref), trackMilestone (copy), milestone (copy)
		local var3 = timeToInteractiveTracker.getEvents(false)[value]
		
		if var3 and var3.startTime then
			trackMilestone(value, milestone.SurfaceMounted)
			timeToInteractiveTracker.trackEnd(value)
			
			return
		end
	end
	
	if fFlagEnableOnScreenAPIIntegration then
		var1(function()
			-- upvalues: var2 (ref), timeToInteractiveTracker (copy), value (ref), trackMilestone (copy), milestone (copy)
			if var2.isFocused() then return end
			local var3 = timeToInteractiveTracker.getEvents(false)[value]
			
			if var3 and var3.startTime then
				trackMilestone(value, milestone.RenderStarted)
			end
			local var4 = timeToInteractiveTracker.getEvents(false)[value]
			
			if var4 then
				if not var4.startTime then return end
				trackMilestone(value, milestone.SurfaceMounted)
				timeToInteractiveTracker.trackEnd(value)
			end
		end, nil)
	end
	reactModule.useEffect(function()
		-- upvalues: timeToInteractiveTracker (copy), value (ref), var2 (ref), roactNavigationModule (copy), onWillFocus (ref), onDidFocus (ref)
		timeToInteractiveTracker.trackEnd(value)
		local var3 = var2.addListener(roactNavigationModule.Events.WillFocus, onWillFocus)
		local var4 = var2.addListener(roactNavigationModule.Events.DidFocus, onDidFocus)
		
		return function()
			-- upvalues: var3 (ref), var4 (ref)
			var3.remove()
			var4.remove()
		end
	end, {})
end