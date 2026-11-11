local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local Parent = NavigationRodux.Parent
local CryoModule = require(Parent.Cryo)
local GetCurrentRouteStateFunction = require(Parent.Navigation).getCurrentRouteState
local SignalsModule = require(Parent.Signals)
local FFlagAppIaHomeSubTab = require(Parent.SharedFlags).FFlagAppIaHomeSubTab
local ConstantsModule = require(NavigationRodux.Constants)
local _ = require(NavigationRodux.types)
local GetLegacyPageFromRoactNavigationRouteFunction = require(script.Parent.Utils).getLegacyPageFromRoactNavigationRoute

return function(p1)
	-- upvalues: SignalsModule (copy), ConstantsModule (copy), FFlagAppIaHomeSubTab (copy), GetLegacyPageFromRoactNavigationRouteFunction (copy), CryoModule (copy), GetCurrentRouteStateFunction (copy)
	local Computed = SignalsModule.createComputed(function(p2)
		-- upvalues: p1 (copy), ConstantsModule (upval), FFlagAppIaHomeSubTab (upval), GetLegacyPageFromRoactNavigationRouteFunction (upval), CryoModule (upval)
		local JoinResults = {}
		local State = p1.getState(p2)
		
		for i = 1, State.index do
			local Route = State.routes[i]
			
			if Route.routes and Route.routeName == ConstantsModule.TempRnSwitchNavigatorName then
				Route = Route.routes[Route.index]
			end
			if FFlagAppIaHomeSubTab and Route.routes and Route.routeName == ConstantsModule.HomeContainerName then
				Route = Route.routes[Route.index]
			end
			table.insert(JoinResults, CryoModule.List.join(JoinResults[i - 1] or {}, { (GetLegacyPageFromRoactNavigationRouteFunction(Route)) }))
		end
		return JoinResults
	end)
	
	return {
		getHistory = Computed,
		getCurrentRoute = SignalsModule.createComputed(function(p3)
			-- upvalues: p1 (copy), GetCurrentRouteStateFunction (upval)
			return (GetCurrentRouteStateFunction((p1.getNavigation(p3))))
		end),
		getCurrentLegacyRoute = SignalsModule.createComputed(function(p3)
			-- upvalues: Computed (copy)
			local ComputedResult = Computed(p3)
			
			return ComputedResult[#ComputedResult]
		end),
		getCurrentPage = SignalsModule.createComputed(function(p3)
			-- upvalues: Computed (copy)
			local ComputedResult = Computed(p3)
			local ComputedResultEntry = ComputedResult[#ComputedResult]
			
			return ComputedResultEntry[#ComputedResultEntry]
		end)
	}
end