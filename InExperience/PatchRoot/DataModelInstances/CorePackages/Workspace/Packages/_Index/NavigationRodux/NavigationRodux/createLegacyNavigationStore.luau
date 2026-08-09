local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local cryoModule = require(parent.Cryo)
local getCurrentRouteState = require(parent.Navigation).getCurrentRouteState
local signalsModule = require(parent.Signals)
local fFlagAppIaHomeSubTab = require(parent.SharedFlags).FFlagAppIaHomeSubTab
local constantsModule = require(navigationRodux.Constants)
local _ = require(navigationRodux.types)
local getLegacyPageFromRoactNavigationRoute = require(script.Parent.Utils).getLegacyPageFromRoactNavigationRoute

return function(p0) --[[ line: 28 | named "createLegacyNavigationStore" ]]
	-- upvalues: signalsModule (ref), constantsModule (ref), fFlagAppIaHomeSubTab (ref), getLegacyPageFromRoactNavigationRoute (ref), cryoModule (ref), getCurrentRouteState (ref)
	local var4 = signalsModule.createComputed(function(p1) --[[ line: 29 ]]
		-- upvalues: p0 (ref), constantsModule (copy), fFlagAppIaHomeSubTab (copy), getLegacyPageFromRoactNavigationRoute (copy), cryoModule (copy)
		local t = {}
		local state = p0.getState(p1)
		
		for i = 1, state.index do
			local var7 = state.routes[i]
			
			if var7.routes and var7.routeName == constantsModule.TempRnSwitchNavigatorName then
				var7 = var7.routes[var7.index]
			end
			if fFlagAppIaHomeSubTab and var7.routes and var7.routeName == constantsModule.HomeContainerName then
				var7 = var7.routes[var7.index]
			end
			table.insert(t, cryoModule.List.join(t[i - 1] or {}, { getLegacyPageFromRoactNavigationRoute(var7) }))
		end
		return t
	end)
	
	return {
		getHistory = var4,
		getCurrentRoute = signalsModule.createComputed(function(p2) --[[ line: 51 ]]
			-- upvalues: p0 (ref), getCurrentRouteState (copy)
			return getCurrentRouteState(p0.getNavigation(p2))
		end),
		getCurrentLegacyRoute = signalsModule.createComputed(function(p3) --[[ line: 56 ]]
			-- upvalues: var4 (ref)
			local var8 = var4(p3)
			
			return var8[#var8]
		end),
		getCurrentPage = signalsModule.createComputed(function(p4) --[[ line: 61 ]]
			-- upvalues: var4 (ref)
			local var9 = var4(p4)
			local var10 = var9[#var9]
			
			return var10[#var10]
		end)
	}
end