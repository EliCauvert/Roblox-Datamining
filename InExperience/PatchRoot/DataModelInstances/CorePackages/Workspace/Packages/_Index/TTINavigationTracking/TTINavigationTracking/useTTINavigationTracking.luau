local Parent = script:FindFirstAncestor("TTINavigationTracking").Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local RobloxAppNavigationModule = require(Parent.RobloxAppNavigation)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableOnScreenAPIIntegration = SharedFlagsModule.FFlagEnableOnScreenAPIIntegration
local FFlagLuaAppNavTTIMeasurementV2 = SharedFlagsModule.FFlagLuaAppNavTTIMeasurementV2
local UseOnScreenNavigationListener = if FFlagEnableOnScreenAPIIntegration then RobloxAppNavigationModule.useOnScreenNavigationListener else nil
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local Milestone = TimeToInteractiveTracker.Milestone
local Hooks = TimeToInteractiveTracker.Hooks or nil
local TrackMilestone = TimeToInteractiveTracker.trackMilestone or nil

return function(p1)
	-- upvalues: Hooks (copy), UseNavigationFunction (copy), FFlagLuaAppNavTTIMeasurementV2 (copy), TimeToInteractiveTracker (copy), TrackMilestone (copy), Milestone (copy), FFlagEnableOnScreenAPIIntegration (copy), UseOnScreenNavigationListener (copy), ReactModule (copy), RoactNavigationModule (copy)
	Hooks.useTTIRenderAndMountedTracking(p1)
	local UseNavigationResult = UseNavigationFunction()
	
	local function _()
		-- upvalues: FFlagLuaAppNavTTIMeasurementV2 (upval), TimeToInteractiveTracker (upval), p1 (copy)
		if FFlagLuaAppNavTTIMeasurementV2 then
			TimeToInteractiveTracker.discardOlderNavigationStarts(p1)
			TimeToInteractiveTracker.trackEndAtNextFrame(p1)
			
			return
		else
			TimeToInteractiveTracker.trackEnd(p1)
		end
	end
	
	local function onWillFocus()
		-- upvalues: TimeToInteractiveTracker (upval), p1 (copy), TrackMilestone (upval), Milestone (upval)
		local Event = TimeToInteractiveTracker.getEvents(false)[p1]
		
		if Event and Event.startTime then
			TrackMilestone(p1, Milestone.RenderStarted)
		end
	end
	
	local function onDidFocus()
		-- upvalues: TimeToInteractiveTracker (upval), p1 (copy), TrackMilestone (upval), Milestone (upval), FFlagLuaAppNavTTIMeasurementV2 (upval)
		local Event = TimeToInteractiveTracker.getEvents(false)[p1]
		
		if not Event or not Event.startTime then return end
		TrackMilestone(p1, Milestone.SurfaceMounted)
		
		if FFlagLuaAppNavTTIMeasurementV2 then
			TimeToInteractiveTracker.discardOlderNavigationStarts(p1)
			TimeToInteractiveTracker.trackEndAtNextFrame(p1)
			
			return
		else
			TimeToInteractiveTracker.trackEnd(p1)
		end
	end
	
	if FFlagEnableOnScreenAPIIntegration then
		UseOnScreenNavigationListener(function()
			-- upvalues: UseNavigationResult (copy), TimeToInteractiveTracker (upval), p1 (copy), TrackMilestone (upval), Milestone (upval), FFlagLuaAppNavTTIMeasurementV2 (upval)
			if UseNavigationResult.isFocused() then return end
			local Event = TimeToInteractiveTracker.getEvents(false)[p1]
			
			if Event and Event.startTime then
				TrackMilestone(p1, Milestone.RenderStarted)
			end
			local Event1 = TimeToInteractiveTracker.getEvents(false)[p1]
			
			if Event1 then
				if not Event1.startTime then return end
				TrackMilestone(p1, Milestone.SurfaceMounted)
				
				if FFlagLuaAppNavTTIMeasurementV2 then
					TimeToInteractiveTracker.discardOlderNavigationStarts(p1)
					TimeToInteractiveTracker.trackEndAtNextFrame(p1)
					
					return
				else
					TimeToInteractiveTracker.trackEnd(p1)
				end
			end
		end, nil)
	end
	ReactModule.useEffect(function()
		-- upvalues: FFlagLuaAppNavTTIMeasurementV2 (upval), TimeToInteractiveTracker (upval), p1 (copy), UseNavigationResult (copy), RoactNavigationModule (upval), onWillFocus (copy), onDidFocus (copy)
		if FFlagLuaAppNavTTIMeasurementV2 then
			TimeToInteractiveTracker.discardOlderNavigationStarts(p1)
			TimeToInteractiveTracker.trackEndAtNextFrame(p1)
		else
			TimeToInteractiveTracker.trackEnd(p1)
		end
		local AddListenerResult = UseNavigationResult.addListener(RoactNavigationModule.Events.WillFocus, onWillFocus)
		local AddListenerResult1 = UseNavigationResult.addListener(RoactNavigationModule.Events.DidFocus, onDidFocus)
		
		return function()
			-- upvalues: AddListenerResult (copy), AddListenerResult1 (copy)
			AddListenerResult.remove()
			AddListenerResult1.remove()
		end
	end, {})
end