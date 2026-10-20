local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local Parent = NavigationRodux.Parent
local CryoModule = require(Parent.Cryo)
local TutilsModule = require(Parent.tutils)
local NavigationModule = require(Parent.Navigation)
local GetCurrentRouteStateFunction = NavigationModule.getCurrentRouteState
local GetCurrentNavigationStateFunction = NavigationModule.getCurrentNavigationState
local SignalsModule = require(Parent.Signals)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAppIaHomeSubTab = SharedFlagsModule.FFlagAppIaHomeSubTab
local FFlagSignalsNavProjected = SharedFlagsModule.FFlagSignalsNavProjected
local FFlagSignalsNavP3Final = SharedFlagsModule.FFlagSignalsNavP3Final
local FFlagSignalsNavP2NavigationPrimitives = SharedFlagsModule.FFlagSignalsNavP2NavigationPrimitives
local ConstantsModule = require(NavigationRodux.Constants)
local _ = require(NavigationRodux.types)
local UtilsModule = require(script.Parent.Utils)
local GetLegacyPageFromRoactNavigationRouteFunction = UtilsModule.getLegacyPageFromRoactNavigationRoute
local GetLegacyRouteFromRoactNavigationStateFunction = UtilsModule.getLegacyRouteFromRoactNavigationState

local function legacyPageEqual(p1, p2)
	-- upvalues: TutilsModule (copy)
	return TutilsModule.shallowEqual(p1, p2)
end

local function legacyRouteEqual(p1, p2): boolean
	-- upvalues: TutilsModule (copy)
	if p1 == p2 then
		return true
	end
	if p1 == nil or p2 == nil or #p1 ~= #p2 then
		return false
	end
	for i = 1, #p1 do
		if not TutilsModule.shallowEqual(p1[i], p2[i]) then
			return false
		end
	end
	return true
end

local function legacyHistoryEqual(p3, p4): boolean
	-- upvalues: legacyRouteEqual (copy)
	if p3 == p4 then
		return true
	end
	if p3 == nil or p4 == nil or #p3 ~= #p4 then
		return false
	end
	for i = 1, #p3 do
		if not legacyRouteEqual(p3[i], p4[i]) then
			return false
		end
	end
	return true
end

local function routeStateEqual(p5, p6)
	-- upvalues: TutilsModule (copy)
	return p5 == p6 or type(p5) == "table" and type(p6) == "table" and (p5.routeName == p6.routeName and p5.key == p6.key and TutilsModule.shallowEqual(p5.params or {}, p6.params or {}))
end

return function(p5)
	-- upvalues: SignalsModule (copy), ConstantsModule (copy), FFlagAppIaHomeSubTab (copy), GetLegacyPageFromRoactNavigationRouteFunction (copy), CryoModule (copy), FFlagSignalsNavP3Final (copy), legacyHistoryEqual (copy), GetLegacyRouteFromRoactNavigationStateFunction (copy), legacyRouteEqual (copy), FFlagSignalsNavProjected (copy), GetCurrentNavigationStateFunction (copy), GetCurrentRouteStateFunction (copy), routeStateEqual (copy), legacyPageEqual (copy), FFlagSignalsNavP2NavigationPrimitives (copy)
	local Computed = SignalsModule.createComputed(function(p6)
		-- upvalues: p5 (copy), ConstantsModule (upval), FFlagAppIaHomeSubTab (upval), GetLegacyPageFromRoactNavigationRouteFunction (upval), CryoModule (upval)
		local JoinResults = {}
		local State = p5.getState(p6)
		
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
	end, if FFlagSignalsNavP3Final then legacyHistoryEqual else nil)
	local Computed1 = SignalsModule.createComputed(function(p7)
		-- upvalues: p5 (copy), GetLegacyRouteFromRoactNavigationStateFunction (upval)
		return GetLegacyRouteFromRoactNavigationStateFunction((p5.getState(p7)))
	end, if FFlagSignalsNavP3Final then legacyRouteEqual else nil)
	local Computed2 = SignalsModule.createComputed(function(p7)
		-- upvalues: FFlagSignalsNavProjected (upval), p5 (copy), GetCurrentNavigationStateFunction (upval), GetCurrentRouteStateFunction (upval)
		return if FFlagSignalsNavProjected then GetCurrentNavigationStateFunction((p5.getState(p7))) else GetCurrentRouteStateFunction((p5.getNavigation(p7)))
	end, if FFlagSignalsNavP3Final then routeStateEqual else nil)
	local Computed3 = if FFlagSignalsNavP2NavigationPrimitives then SignalsModule.createComputed(function(p7)
		-- upvalues: Computed (copy)
		local ComputedResult = Computed(p7)
		local ComputedResultEntry = ComputedResult[#ComputedResult]
		
		return ComputedResultEntry[#ComputedResultEntry].name
	end) else nil
	local t = {}
	local t1 = {}
	
	return {
		getHistory = Computed,
		getCurrentRoute = Computed2,
		getCurrentLegacyRoute = SignalsModule.createComputed(function(p7)
			-- upvalues: Computed (copy)
			local ComputedResult = Computed(p7)
			
			return ComputedResult[#ComputedResult]
		end, if FFlagSignalsNavP3Final then legacyRouteEqual else nil),
		getCurrentPage = SignalsModule.createComputed(function(p7)
			-- upvalues: Computed (copy)
			local ComputedResult = Computed(p7)
			local ComputedResultEntry = ComputedResult[#ComputedResult]
			
			return ComputedResultEntry[#ComputedResultEntry]
		end, if FFlagSignalsNavP3Final then legacyPageEqual else nil),
		getCurrentPageName = Computed3,
		getIsCurrentPageSignal = function(Key)
			-- upvalues: t (copy), SignalsModule (upval), Computed3 (copy)
			local Entry = t[Key]
			
			if Entry then
				return Entry
			else
				local Computed = SignalsModule.createComputed(function(p7): boolean
					-- upvalues: Computed3 (upval), Key (copy)
					return Computed3(p7) == Key
				end)
				t[Key] = Computed
				
				return Computed
			end
		end,
		getRouteContainsPageSignal = function(Key)
			-- upvalues: t1 (copy), SignalsModule (upval), Computed1 (copy)
			local Entry = t1[Key]
			
			if Entry then
				return Entry
			else
				local Computed = SignalsModule.createComputed(function(p7): boolean
					-- upvalues: Computed1 (upval), Key (copy)
					local ComputedResult = Computed1(p7)
					
					if ComputedResult then
						for _, value in ComputedResult do
							if value.name == Key then
								return true
							end
						end
					end
					return false
				end)
				t1[Key] = Computed
				
				return Computed
			end
		end,
		getCurrentTabName = if FFlagSignalsNavP2NavigationPrimitives then SignalsModule.createComputed(function(p7)
			-- upvalues: Computed (copy)
			local ComputedResult = Computed(p7)
			
			return ComputedResult[#ComputedResult][1].name
		end) else nil,
		getCanGoBack = if FFlagSignalsNavP2NavigationPrimitives then SignalsModule.createComputed(function(p7): boolean
			-- upvalues: Computed (copy)
			local ComputedResult = Computed(p7)
			
			return #ComputedResult[#ComputedResult] > 1
		end) else nil,
		getRouteDepth = if FFlagSignalsNavP2NavigationPrimitives then SignalsModule.createComputed(function(p7): number
			-- upvalues: Computed (copy)
			local ComputedResult = Computed(p7)
			
			return #ComputedResult[#ComputedResult]
		end) else nil,
		getCurrentRouteKey = if FFlagSignalsNavP2NavigationPrimitives then SignalsModule.createComputed(function(p7)
			-- upvalues: Computed2 (copy)
			return Computed2(p7).key or ""
		end) else nil
	}
end