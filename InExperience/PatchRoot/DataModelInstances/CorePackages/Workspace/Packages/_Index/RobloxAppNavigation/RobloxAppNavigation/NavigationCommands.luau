local Parent = script:FindFirstAncestor("RobloxAppNavigation").Parent
local RoactNavigationModule = require(Parent.RoactNavigation)
local AppNavigationRegistryModule = require(script.Parent.AppNavigationRegistry)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSignalsNavPendingLock = SharedFlagsModule.FFlagSignalsNavPendingLock
local FFlagSignalsNavHomeFlowBegin = SharedFlagsModule.FFlagSignalsNavHomeFlowBegin
local HomePageLoadTracker = if FFlagSignalsNavHomeFlowBegin then require(Parent.HomePageLoadTracker).HomePageLoadTracker else nil
local Home = require(Parent.RobloxAppEnums).AppPage.Home
local TrackStartFunction = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker.trackStart

local function _(p1)
	-- upvalues: FFlagSignalsNavPendingLock (copy), AppNavigationRegistryModule (copy)
	return if FFlagSignalsNavPendingLock then not p1 and AppNavigationRegistryModule.isNavigationLocked(false) else not p1 and AppNavigationRegistryModule.get().getIsNavigating(false)
end

local _ = function(p1)
	-- upvalues: Home (copy), HomePageLoadTracker (copy)
	if p1 and p1.routeName == Home then
		HomePageLoadTracker.beginVisit()
	end
end

return {
	back = function(p1)
		-- upvalues: FFlagSignalsNavPendingLock (copy), AppNavigationRegistryModule (copy), RoactNavigationModule (copy)
		if not (if FFlagSignalsNavPendingLock then not p1 and AppNavigationRegistryModule.isNavigationLocked(false) else not p1 and AppNavigationRegistryModule.get().getIsNavigating(false)) then
			AppNavigationRegistryModule.get().dispatch(RoactNavigationModule.Actions.back())
			
			return
		end
	end,
	down = function(p1, p2)
		-- upvalues: FFlagSignalsNavPendingLock (copy), AppNavigationRegistryModule (copy), TrackStartFunction (copy), FFlagSignalsNavHomeFlowBegin (copy), Home (copy), HomePageLoadTracker (copy), RoactNavigationModule (copy)
		if if FFlagSignalsNavPendingLock then not p2 and AppNavigationRegistryModule.isNavigationLocked(false) else not p2 and AppNavigationRegistryModule.get().getIsNavigating(false) then return end
		if TrackStartFunction then
			TrackStartFunction("NavigateTo_" .. p1.routeName, true)
		end
		if FFlagSignalsNavHomeFlowBegin and p1 and p1.routeName == Home then
			HomePageLoadTracker.beginVisit()
		end
		AppNavigationRegistryModule.get().dispatch(RoactNavigationModule.StackActions.push(p1))
	end,
	to = function(p1, p2)
		-- upvalues: FFlagSignalsNavPendingLock (copy), AppNavigationRegistryModule (copy), TrackStartFunction (copy), FFlagSignalsNavHomeFlowBegin (copy), Home (copy), HomePageLoadTracker (copy), RoactNavigationModule (copy)
		if if FFlagSignalsNavPendingLock then not p2 and AppNavigationRegistryModule.isNavigationLocked(false) else not p2 and AppNavigationRegistryModule.get().getIsNavigating(false) then return end
		if TrackStartFunction then
			TrackStartFunction("NavigateTo_" .. p1.routeName, true)
		end
		if FFlagSignalsNavHomeFlowBegin and p1 and p1.routeName == Home then
			HomePageLoadTracker.beginVisit()
		end
		AppNavigationRegistryModule.get().dispatch(RoactNavigationModule.Actions.navigate(p1))
	end,
	sideways = function(p1, p2)
		-- upvalues: FFlagSignalsNavPendingLock (copy), AppNavigationRegistryModule (copy), TrackStartFunction (copy), FFlagSignalsNavHomeFlowBegin (copy), Home (copy), HomePageLoadTracker (copy), RoactNavigationModule (copy)
		if if FFlagSignalsNavPendingLock then not p2 and AppNavigationRegistryModule.isNavigationLocked(false) else not p2 and AppNavigationRegistryModule.get().getIsNavigating(false) then return end
		if TrackStartFunction then
			TrackStartFunction("NavigateTo_" .. p1.routeName, true)
		end
		if FFlagSignalsNavHomeFlowBegin and p1 and p1.routeName == Home then
			HomePageLoadTracker.beginVisit()
		end
		AppNavigationRegistryModule.get().dispatch(RoactNavigationModule.Actions.navigate(p1))
	end,
	fromWebView = function(p1, p2)
		-- upvalues: FFlagSignalsNavPendingLock (copy), AppNavigationRegistryModule (copy), TrackStartFunction (copy), FFlagSignalsNavHomeFlowBegin (copy), Home (copy), HomePageLoadTracker (copy), RoactNavigationModule (copy)
		if if FFlagSignalsNavPendingLock then not p2 and AppNavigationRegistryModule.isNavigationLocked(false) else not p2 and AppNavigationRegistryModule.get().getIsNavigating(false) then return end
		if TrackStartFunction then
			TrackStartFunction("NavigateTo_" .. p1.routeName, true)
		end
		if FFlagSignalsNavHomeFlowBegin and p1 and p1.routeName == Home then
			HomePageLoadTracker.beginVisit()
		end
		AppNavigationRegistryModule.get().dispatch(RoactNavigationModule.StackActions.replace(p1))
	end,
	resetStack = function(List, p1, p2)
		-- upvalues: FFlagSignalsNavPendingLock (copy), AppNavigationRegistryModule (copy), RoactNavigationModule (copy), TrackStartFunction (copy), FFlagSignalsNavHomeFlowBegin (copy), Home (copy), HomePageLoadTracker (copy)
		if if FFlagSignalsNavPendingLock then not p2 and AppNavigationRegistryModule.isNavigationLocked(false) else not p2 and AppNavigationRegistryModule.get().getIsNavigating(false) then return end
		local Actions = {}
		local WrapAction = if p1 then p1.wrapAction else nil
		for _, value in List do
			local NavigateResult = RoactNavigationModule.Actions.navigate(value)
			
			if WrapAction then
				NavigateResult = WrapAction(NavigateResult, value) or NavigateResult
			end
			table.insert(Actions, NavigateResult)
		end
		if TrackStartFunction then
			local Entry = List[#List]
			
			if Entry then
				TrackStartFunction("NavigateTo_" .. Entry.routeName, true)
			end
		end
		if FFlagSignalsNavHomeFlowBegin then
			local Entry = List[#List]
			
			if Entry and Entry.routeName == Home then
				HomePageLoadTracker.beginVisit()
			end
		end
		AppNavigationRegistryModule.get().dispatch(RoactNavigationModule.StackActions.reset({ index = #Actions, actions = Actions }))
	end,
	fromLegacyPage = function(List)
		local Params = nil
		
		for i, value in List do
			if i ~= "name" and i ~= "rnKey" and i ~= "key" then
				if Params == nil then
					Params = {}
				end
				Params[i] = value
			end
		end
		return {
			routeName = List.name,
			params = Params,
			key = List.rnKey or List.key
		}
	end
}