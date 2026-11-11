local Parent = script:FindFirstAncestor("TTINavigationTracking").Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local Milestone = TimeToInteractiveTracker.Milestone
local Hooks = TimeToInteractiveTracker.Hooks or nil
local TrackMilestone = TimeToInteractiveTracker.trackMilestone or nil

return function(p1)
	-- upvalues: Hooks (copy), UseNavigationFunction (copy), ReactModule (copy), TimeToInteractiveTracker (copy), RoactNavigationModule (copy), TrackMilestone (copy), Milestone (copy)
	Hooks.useTTIRenderAndMountedTracking(p1)
	local UseNavigationResult = UseNavigationFunction()
	ReactModule.useEffect(function()
		-- upvalues: TimeToInteractiveTracker (upval), p1 (copy), UseNavigationResult (copy), RoactNavigationModule (upval), TrackMilestone (upval), Milestone (upval)
		TimeToInteractiveTracker.trackEnd(p1)
		local AddListenerResult = UseNavigationResult.addListener(RoactNavigationModule.Events.WillFocus, function()
			-- upvalues: TimeToInteractiveTracker (upval), p1 (upval), TrackMilestone (upval), Milestone (upval)
			local Event = TimeToInteractiveTracker.getEvents(false)[p1]
			
			if Event and Event.startTime then
				TrackMilestone(p1, Milestone.RenderStarted)
			end
		end)
		local AddListenerResult1 = UseNavigationResult.addListener(RoactNavigationModule.Events.DidFocus, function()
			-- upvalues: TimeToInteractiveTracker (upval), p1 (upval), TrackMilestone (upval), Milestone (upval)
			local Event = TimeToInteractiveTracker.getEvents(false)[p1]
			
			if Event and Event.startTime then
				TrackMilestone(p1, Milestone.SurfaceMounted)
				TimeToInteractiveTracker.trackEnd(p1)
				
				return
			end
		end)
		
		return function()
			-- upvalues: AddListenerResult (copy), AddListenerResult1 (copy)
			AddListenerResult.remove()
			AddListenerResult1.remove()
		end
	end, {})
end