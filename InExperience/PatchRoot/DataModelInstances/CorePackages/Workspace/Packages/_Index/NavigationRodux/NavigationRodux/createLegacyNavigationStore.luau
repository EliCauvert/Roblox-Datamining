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

local function legacyPageEqual(p0, p1) --[[ line: 36 ]]
	-- upvalues: tutilsModule (ref)
	return tutilsModule.shallowEqual(p0, p1)
end

local function legacyRouteEqual(p2, p3) --[[ line: 40 ]]
	-- upvalues: tutilsModule (ref)
	if p2 == p3 then
		return true
	elseif p2 == nil or p3 == nil or #p2 ~= #p3 then
		return false
	end
	for i = 1, #p2 do
		if tutilsModule.shallowEqual(p2[i], p3[i]) then
			continue
		end
		return false
	end
	return true
end

local function legacyHistoryEqual(p4, p5) --[[ line: 55 ]]
	-- upvalues: legacyRouteEqual (ref)
	if p4 == p5 then
		return true
	elseif p4 == nil or p5 == nil or #p4 ~= #p5 then
		return false
	end
	for i = 1, #p4 do
		if legacyRouteEqual(p4[i], p5[i]) then
			continue
		end
		return false
	end
	return true
end

local function routeStateEqual(p6, p7) --[[ line: 70 ]]
	-- upvalues: tutilsModule (ref)
	if p6 == p7 then
		return true
	elseif type(p6) ~= "table" or type(p7) ~= "table" then
		return false
	end
	local var12 = false
	
	if p6.routeName == p7.routeName then
		var12 = false
		
		if p6.key == p7.key then
			var12 = tutilsModule.shallowEqual
			var12 = var12(p6.params or {}, p7.params or {})
		end
	end
	return var12
end

return function(p8) --[[ line: 100 | named "createLegacyNavigationStore" ]]
	-- upvalues: signalsModule (ref), constantsModule (ref), fFlagAppIaHomeSubTab (ref), getLegacyPageFromRoactNavigationRoute (ref), cryoModule (ref), fFlagSignalsNavP3Final (ref), legacyHistoryEqual (ref), getLegacyRouteFromRoactNavigationState (ref), legacyRouteEqual (ref), fFlagSignalsNavProjected (ref), getCurrentNavigationState (ref), getCurrentRouteState (ref), routeStateEqual (ref), legacyPageEqual (ref), fFlagSignalsNavP2NavigationPrimitives (ref)
	local var13 = signalsModule.createComputed(function(p9) --[[ line: 106 ]]
		-- upvalues: p8 (ref), constantsModule (copy), fFlagAppIaHomeSubTab (copy), getLegacyPageFromRoactNavigationRoute (copy), cryoModule (copy)
		local t = {}
		local state = p8.getState(p9)
		
		for i = 1, state.index do
			local var23 = state.routes[i]
			
			if var23.routes and var23.routeName == constantsModule.TempRnSwitchNavigatorName then
				var23 = var23.routes[var23.index]
			end
			if fFlagAppIaHomeSubTab and var23.routes and var23.routeName == constantsModule.HomeContainerName then
				var23 = var23.routes[var23.index]
			end
			table.insert(t, cryoModule.List.join(t[i - 1] or {}, { getLegacyPageFromRoactNavigationRoute(var23) }))
		end
		return t
	end, if fFlagSignalsNavP3Final then legacyHistoryEqual else nil)
	local var14 = signalsModule.createComputed(function(p10) --[[ line: 132 ]]
		-- upvalues: p8 (ref), getLegacyRouteFromRoactNavigationState (copy)
		return getLegacyRouteFromRoactNavigationState(p8.getState(p10))
	end, if fFlagSignalsNavP3Final then legacyRouteEqual else nil)
	local var15 = signalsModule.createComputed(function(p11) --[[ line: 137 ]]
		-- upvalues: fFlagSignalsNavProjected (copy), p8 (ref), getCurrentNavigationState (copy), getCurrentRouteState (copy)
		return if fFlagSignalsNavProjected then getCurrentNavigationState(p8.getState(p11)) else getCurrentRouteState(p8.getNavigation(p11))
	end, if fFlagSignalsNavP3Final then routeStateEqual else nil)
	local var16 = signalsModule.createComputed(function(p12) --[[ line: 151 ]]
		-- upvalues: var13 (ref)
		local var24 = var13(p12)
		
		return var24[#var24]
	end, if fFlagSignalsNavP3Final then legacyRouteEqual else nil)
	local var17 = signalsModule.createComputed(function(p13) --[[ line: 156 ]]
		-- upvalues: var13 (ref)
		local var25 = var13(p13)
		local var26 = var25[#var25]
		
		return var26[#var26]
	end, if fFlagSignalsNavP3Final then legacyPageEqual else nil)
	local var18 = if fFlagSignalsNavP2NavigationPrimitives then signalsModule.createComputed(function(p14) --[[ line: 163 ]]
		-- upvalues: var13 (ref)
		local var27 = var13(p14)
		local var28 = var27[#var27]
		
		return var28[#var28].name
	end) else nil
	local t = {}
	local t_1 = {}
	
	return {
		getHistory = var13,
		getCurrentRoute = var15,
		getCurrentLegacyRoute = var16,
		getCurrentPage = var17,
		getCurrentPageName = var18,
		getIsCurrentPageSignal = function(value) --[[ line: 174 ]]
			-- upvalues: t (ref), signalsModule (copy), var18 (ref)
			local var29 = t[value]
			
			if var29 then
				return var29
			end
			local var30 = signalsModule.createComputed(function(p15) --[[ line: 179 ]]
				-- upvalues: var18 (copy), value (ref)
				return var18(p15) == value
			end)
			t[value] = var30
			
			return var30
		end,
		getRouteContainsPageSignal = function(value) --[[ line: 192 ]]
			-- upvalues: t_1 (ref), signalsModule (copy), var14 (ref)
			local var31 = t_1[value]
			
			if var31 then
				return var31
			end
			local var32 = signalsModule.createComputed(function(p16) --[[ line: 197 ]]
				-- upvalues: var14 (copy), value (ref)
				local var33 = var14(p16)
				
				if var33 then
					for i, v in var33 do
						if v.name == value then
							return true
						end
					end
				end
				return false
			end)
			t_1[value] = var32
			
			return var32
		end,
		getCurrentTabName = if fFlagSignalsNavP2NavigationPrimitives then signalsModule.createComputed(function(p17) --[[ line: 213 ]]
			-- upvalues: var13 (ref)
			local var34 = var13(p17)
			
			return var34[#var34][1].name
		end) else nil,
		getCanGoBack = if fFlagSignalsNavP2NavigationPrimitives then signalsModule.createComputed(function(p18) --[[ line: 221 ]]
			-- upvalues: var13 (ref)
			local var35 = var13(p18)
			
			return #var35[#var35] > 1
		end) else nil,
		getRouteDepth = if fFlagSignalsNavP2NavigationPrimitives then signalsModule.createComputed(function(p19) --[[ line: 229 ]]
			-- upvalues: var13 (ref)
			local var36 = var13(p19)
			
			return #var36[#var36]
		end) else nil,
		getCurrentRouteKey = if fFlagSignalsNavP2NavigationPrimitives then signalsModule.createComputed(function(p20) --[[ line: 237 ]]
			-- upvalues: var15 (ref)
			return var15(p20).key or ""
		end) else nil
	}
end