local Parent = script:FindFirstAncestor("TTINavigationTracking").Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local RobloxAppNavigationModule = require(Parent.RobloxAppNavigation)
local FFlagEnableOnScreenAPIIntegration = require(Parent.SharedFlags).FFlagEnableOnScreenAPIIntegration
local UseOnScreenNavigationListener = if FFlagEnableOnScreenAPIIntegration then RobloxAppNavigationModule.useOnScreenNavigationListener else nil
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local Milestone = TimeToInteractiveTracker.Milestone
local Hooks = TimeToInteractiveTracker.Hooks or nil
local TrackMilestone = TimeToInteractiveTracker.trackMilestone or nil

return function(p1)
	-- upvalues: Hooks (copy), UseNavigationFunction (copy), TimeToInteractiveTracker (copy), TrackMilestone (copy), Milestone (copy), FFlagEnableOnScreenAPIIntegration (copy), UseOnScreenNavigationListener (copy), ReactModule (copy), RoactNavigationModule (copy)
	Hooks.useTTIRenderAndMountedTracking(p1)
	local UseNavigationResult = UseNavigationFunction()
	
	local function onWillFocus()
		-- upvalues: TimeToInteractiveTracker (upval), p1 (copy), TrackMilestone (upval), Milestone (upval)
		local Event = TimeToInteractiveTracker.getEvents(false)[p1]
		
		if Event and Event.startTime then
			TrackMilestone(p1, Milestone.RenderStarted)
		end
	end
	
	local function onDidFocus()
		-- upvalues: TimeToInteractiveTracker (upval), p1 (copy), TrackMilestone (upval), Milestone (upval)
		local Event = TimeToInteractiveTracker.getEvents(false)[p1]
		
		if Event and Event.startTime then
			TrackMilestone(p1, Milestone.SurfaceMounted)
			TimeToInteractiveTracker.trackEnd(p1)
			
			return
		end
	end
	
	if FFlagEnableOnScreenAPIIntegration then
		UseOnScreenNavigationListener(function()
			-- upvalues: UseNavigationResult (copy), TimeToInteractiveTracker (upval), p1 (copy), TrackMilestone (upval), Milestone (upval)
			if UseNavigationResult.isFocused() then return end
			local Event = TimeToInteractiveTracker.getEvents(false)[p1]
			
			if Event and Event.startTime then
				TrackMilestone(p1, Milestone.RenderStarted)
			end
			local Event1 = TimeToInteractiveTracker.getEvents(false)[p1]
			
			if Event1 then
				if not Event1.startTime then return end
				TrackMilestone(p1, Milestone.SurfaceMounted)
				TimeToInteractiveTracker.trackEnd(p1)
			end
		end, nil)
	end
	ReactModule.useEffect(function()
		-- upvalues: TimeToInteractiveTracker (upval), p1 (copy), UseNavigationResult (copy), RoactNavigationModule (upval), onWillFocus (copy), onDidFocus (copy)
		TimeToInteractiveTracker.trackEnd(p1)
		local AddListenerResult = UseNavigationResult.addListener(RoactNavigationModule.Events.WillFocus, onWillFocus)
		local AddListenerResult1 = UseNavigationResult.addListener(RoactNavigationModule.Events.DidFocus, onDidFocus)
		
		return function()
			-- upvalues: AddListenerResult (copy), AddListenerResult1 (copy)
			AddListenerResult.remove()
			AddListenerResult1.remove()
		end
	end, {})
end