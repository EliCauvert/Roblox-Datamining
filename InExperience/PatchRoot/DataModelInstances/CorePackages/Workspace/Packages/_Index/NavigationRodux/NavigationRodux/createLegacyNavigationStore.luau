local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local cryoModule = require(parent.Cryo)
local tutilsModule = require(parent.tutils)
local navigationModule = require(parent.Navigation)
local getCurrentRouteState = navigationModule.getCurrentRouteState
local getCurrentNavigationState = navigationModule.getCurrentNavigationState
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAppIaHomeSubTab = sharedFlagsModule.FFlagAppIaHomeSubTab
local fFlagSignalsNavProjected = sharedFlagsModule.FFlagSignalsNavProjected
local fFlagSignalsNavP3Final = sharedFlagsModule.FFlagSignalsNavP3Final
local fFlagSignalsNavP2NavigationPrimitives = sharedFlagsModule.FFlagSignalsNavP2NavigationPrimitives
local constantsModule = require(navigationRodux.Constants)
local _ = require(navigationRodux.types)
local utilsModule = require(script.Parent.Utils)
local getLegacyPageFromRoactNavigationRoute = utilsModule.getLegacyPageFromRoactNavigationRoute
local getLegacyRouteFromRoactNavigationState = utilsModule.getLegacyRouteFromRoactNavigationState

local function legacyPageEqual(p1, p2)
	-- upvalues: tutilsModule (ref)
	return tutilsModule.shallowEqual(p1, p2)
end

local function legacyRouteEqual(p1, p2)
	-- upvalues: tutilsModule (ref)
	if p1 == p2 then
		return true
	elseif p1 == nil or p2 == nil or #p1 ~= #p2 then
		return false
	end
	for i = 1, #p1 do
		if tutilsModule.shallowEqual(p1[i], p2[i]) then
			continue
		end
		return false
	end
	return true
end

local function legacyHistoryEqual(p3, p4)
	-- upvalues: legacyRouteEqual (ref)
	if p3 == p4 then
		return true
	elseif p3 == nil or p4 == nil or #p3 ~= #p4 then
		return false
	end
	for i = 1, #p3 do
		if legacyRouteEqual(p3[i], p4[i]) then
			continue
		end
		return false
	end
	return true
end

local function routeStateEqual(p5, p6)
	-- upvalues: tutilsModule (ref)
	if p5 == p6 then
		return true
	elseif type(p5) ~= "table" or type(p6) ~= "table" then
		return false
	end
	local var1 = false
	
	if p5.routeName == p6.routeName then
		var1 = false
		
		if p5.key == p6.key then
			var1 = tutilsModule.shallowEqual
			var1 = var1(p5.params or {}, p6.params or {})
		end
	end
	return var1
end

return function(p5)
	-- upvalues: signalsModule (ref), constantsModule (ref), fFlagAppIaHomeSubTab (ref), getLegacyPageFromRoactNavigationRoute (ref), cryoModule (ref), fFlagSignalsNavP3Final (ref), legacyHistoryEqual (ref), getLegacyRouteFromRoactNavigationState (ref), legacyRouteEqual (ref), fFlagSignalsNavProjected (ref), getCurrentNavigationState (ref), getCurrentRouteState (ref), routeStateEqual (ref), legacyPageEqual (ref), fFlagSignalsNavP2NavigationPrimitives (ref)
	local var1 = signalsModule.createComputed(function(p6)
		-- upvalues: p5 (ref), constantsModule (copy), fFlagAppIaHomeSubTab (copy), getLegacyPageFromRoactNavigationRoute (copy), cryoModule (copy)
		local t = {}
		local state = p5.getState(p6)
		
		for i = 1, state.index do
			local var2 = state.routes[i]
			
			if var2.routes and var2.routeName == constantsModule.TempRnSwitchNavigatorName then
				var2 = var2.routes[var2.index]
			end
			if fFlagAppIaHomeSubTab and var2.routes and var2.routeName == constantsModule.HomeContainerName then
				var2 = var2.routes[var2.index]
			end
			table.insert(t, cryoModule.List.join(t[i - 1] or {}, { getLegacyPageFromRoactNavigationRoute(var2) }))
		end
		return t
	end, if fFlagSignalsNavP3Final then legacyHistoryEqual else nil)
	local var3 = signalsModule.createComputed(function(p7)
		-- upvalues: p5 (ref), getLegacyRouteFromRoactNavigationState (copy)
		return getLegacyRouteFromRoactNavigationState(p5.getState(p7))
	end, if fFlagSignalsNavP3Final then legacyRouteEqual else nil)
	local var4 = signalsModule.createComputed(function(p7)
		-- upvalues: fFlagSignalsNavProjected (copy), p5 (ref), getCurrentNavigationState (copy), getCurrentRouteState (copy)
		return if fFlagSignalsNavProjected then getCurrentNavigationState(p5.getState(p7)) else getCurrentRouteState(p5.getNavigation(p7))
	end, if fFlagSignalsNavP3Final then routeStateEqual else nil)
	local var5 = signalsModule.createComputed(function(p7)
		-- upvalues: var1 (ref)
		local var6 = var1(p7)
		
		return var6[#var6]
	end, if fFlagSignalsNavP3Final then legacyRouteEqual else nil)
	local var6 = signalsModule.createComputed(function(p7)
		-- upvalues: var1 (ref)
		local var7 = var1(p7)
		local var8 = var7[#var7]
		
		return var8[#var8]
	end, if fFlagSignalsNavP3Final then legacyPageEqual else nil)
	local var7 = if fFlagSignalsNavP2NavigationPrimitives then signalsModule.createComputed(function(p7)
		-- upvalues: var1 (ref)
		local var8 = var1(p7)
		local var9 = var8[#var8]
		
		return var9[#var9].name
	end) else nil
	local t = {}
	local t_1 = {}
	
	return {
		getHistory = var1,
		getCurrentRoute = var4,
		getCurrentLegacyRoute = var5,
		getCurrentPage = var6,
		getCurrentPageName = var7,
		getIsCurrentPageSignal = function(value)
			-- upvalues: t (ref), signalsModule (copy), var7 (ref)
			local var8 = t[value]
			
			if var8 then
				return var8
			end
			local var9 = signalsModule.createComputed(function(p7)
				-- upvalues: var7 (copy), value (ref)
				return var7(p7) == value
			end)
			t[value] = var9
			
			return var9
		end,
		getRouteContainsPageSignal = function(value)
			-- upvalues: t_1 (ref), signalsModule (copy), var3 (ref)
			local var8 = t_1[value]
			
			if var8 then
				return var8
			end
			local var9 = signalsModule.createComputed(function(p7)
				-- upvalues: var3 (copy), value (ref)
				local var10 = var3(p7)
				
				if var10 then
					for i, v in var10 do
						if v.name == value then
							return true
						end
					end
				end
				return false
			end)
			t_1[value] = var9
			
			return var9
		end,
		getCurrentTabName = if fFlagSignalsNavP2NavigationPrimitives then signalsModule.createComputed(function(p7)
			-- upvalues: var1 (ref)
			local var10 = var1(p7)
			
			return var10[#var10][1].name
		end) else nil,
		getCanGoBack = if fFlagSignalsNavP2NavigationPrimitives then signalsModule.createComputed(function(p7)
			-- upvalues: var1 (ref)
			local var10 = var1(p7)
			
			return #var10[#var10] > 1
		end) else nil,
		getRouteDepth = if fFlagSignalsNavP2NavigationPrimitives then signalsModule.createComputed(function(p7)
			-- upvalues: var1 (ref)
			local var10 = var1(p7)
			
			return #var10[#var10]
		end) else nil,
		getCurrentRouteKey = if fFlagSignalsNavP2NavigationPrimitives then signalsModule.createComputed(function(p7)
			-- upvalues: var4 (ref)
			return var4(p7).key or ""
		end) else nil
	}
end