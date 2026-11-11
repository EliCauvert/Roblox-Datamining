local Parent = script:FindFirstAncestor("RobloxAppNavigationCore").Parent
local InspectRouteEntryFunction = require(Parent.Navigation).inspectRouteEntry
local RoactNavigationModule = require(Parent.RoactNavigation)
local CreateConfigGetterFunction = RoactNavigationModule.createConfigGetter
local GetScreenForRouteNameFunction = RoactNavigationModule.getScreenForRouteName
local ValidateRouteConfigMapFunction = RoactNavigationModule.validateRouteConfigMap
local StackActions = RoactNavigationModule.StackActions
local BackBehavior = RoactNavigationModule.BackBehavior
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local FFlagFixInactiveChildStateForwarding = require(Parent.SharedFlags).FFlagFixInactiveChildStateForwarding
local DEV = _G.__DEV__
local config = {
	Init = RoactNavigationModule.Actions.Init,
	Back = RoactNavigationModule.Actions.Back,
	Navigate = RoactNavigationModule.Actions.Navigate,
	SetParams = RoactNavigationModule.Actions.SetParams
}

return function(p1, p2)
	-- upvalues: Array (copy), InspectRouteEntryFunction (copy), DEV (copy), ValidateRouteConfigMapFunction (copy), BackBehavior (copy), GetScreenForRouteNameFunction (copy), RoactNavigationModule (copy), Object (copy), config (copy), StackActions (copy), FFlagFixInactiveChildStateForwarding (copy), CreateConfigGetterFunction (copy)
	local MapResult = Array.map(p1, function(p3)
		-- upvalues: InspectRouteEntryFunction (upval)
		return (InspectRouteEntryFunction(p3))
	end)
	local ReduceResult = Array.reduce(MapResult, function(p3, Key, p4)
		p3[Key] = p4
		
		return p3
	end, {})
	local ReduceResult1 = Array.reduce(p1, function(p3, p4)
		-- upvalues: InspectRouteEntryFunction (upval)
		local InspectRouteEntryResult, InspectRouteEntryResult2 = InspectRouteEntryFunction(p4)
		p3[InspectRouteEntryResult] = InspectRouteEntryResult2
		
		return p3
	end, {})
	
	if DEV then
		ValidateRouteConfigMapFunction(ReduceResult1)
	end
	local P1 = p2 or {}
	local InitialRouteName = P1.initialRouteName or MapResult[1]
	local BackBehavior1 = P1.backBehavior or BackBehavior.None
	
	if DEV and ReduceResult1[InitialRouteName] == nil then
		error(`Invalid initialRouteName: '{InitialRouteName}'. Should be one of: {table.concat(MapResult, ", ")}`)
	end
	local Routers = {}
	
	local function _(Key)
		-- upvalues: Routers (copy), ReduceResult1 (copy), GetScreenForRouteNameFunction (upval)
		if Routers[Key] == nil and ReduceResult1[Key] ~= nil then
			local ScreenForRouteName = GetScreenForRouteNameFunction(ReduceResult1, Key)
			
			if typeof(ScreenForRouteName) == "table" and ScreenForRouteName.router then
				Routers[Key] = ScreenForRouteName.router
			else
				Routers[Key] = false
			end
		end
		return Routers[Key]
	end
	
	local function initializeChildRoute(Key)
		-- upvalues: Routers (copy), ReduceResult1 (copy), GetScreenForRouteNameFunction (upval), RoactNavigationModule (upval), Object (upval)
		local AssignResult = { key = Key, routeName = Key }
		
		if Routers[Key] == nil and ReduceResult1[Key] ~= nil then
			local ScreenForRouteName = GetScreenForRouteNameFunction(ReduceResult1, Key)
			
			if typeof(ScreenForRouteName) == "table" and ScreenForRouteName.router then
				Routers[Key] = ScreenForRouteName.router
			else
				Routers[Key] = false
			end
		end
		local Router = Routers[Key]
		
		if Router then
			AssignResult = Object.assign(table.clone((Router.getStateForAction((RoactNavigationModule.Actions.init())))), AssignResult)
		end
		return AssignResult
	end
	
	local _ = function()
		-- upvalues: initializeChildRoute (copy), InitialRouteName (copy)
		return {
			index = 1,
			routes = { (initializeChildRoute(InitialRouteName)) }
		}
	end
	
	local function getNextState(p3, InitialState, Tbl)
		-- upvalues: BackBehavior1 (copy), BackBehavior (upval), config (upval), Object (upval)
		if BackBehavior1 ~= BackBehavior.History or InitialState and InitialState.routes[InitialState.index].key == Tbl.routes[Tbl.index].key then
			return Tbl
		end
		local RouteKeyHistory = InitialState and InitialState.routeKeyHistory or {}
		
		if p3.type == config.Init then
			RouteKeyHistory = { Tbl.routes[Tbl.index].key }
		elseif p3.type == config.Navigate then
			RouteKeyHistory = table.clone(RouteKeyHistory)
			table.insert(RouteKeyHistory, Tbl.routes[Tbl.index].key)
		elseif p3.type == config.Back then
			RouteKeyHistory = table.clone(RouteKeyHistory)
			table.remove(RouteKeyHistory)
		end
		return Object.assign(table.clone(Tbl), { routeKeyHistory = RouteKeyHistory })
	end
	
	local function sortRoutes(List, Key)
		-- upvalues: ReduceResult (copy), Array (upval)
		table.sort(List, function(A, B): boolean
			-- upvalues: ReduceResult (upval)
			return ReduceResult[A.routeName] < ReduceResult[B.routeName]
		end)
		
		return Array.findIndex(List, function(p3): boolean
			-- upvalues: Key (copy)
			return p3.key == Key
		end)
	end
	
	return {
		childRouters = Routers,
		getStateForAction = function(Action, StateForAction)
			-- upvalues: initializeChildRoute (copy), InitialRouteName (copy), config (upval), getNextState (copy), Routers (copy), ReduceResult1 (copy), GetScreenForRouteNameFunction (upval), Object (upval), BackBehavior1 (copy), BackBehavior (upval), MapResult (copy), Array (upval), sortRoutes (copy), StackActions (upval), FFlagFixInactiveChildStateForwarding (upval)
			local Tbl = StateForAction or {
				index = 1,
				routes = { (initializeChildRoute(InitialRouteName)) }
			}
			
			if Action.type == config.Init then
				return getNextState(Action, StateForAction, Tbl)
			end
			local Route = Tbl.routes[Tbl.index]
			local RouteName = Route.routeName
			
			if Routers[RouteName] == nil and ReduceResult1[RouteName] ~= nil then
				local ScreenForRouteName = GetScreenForRouteNameFunction(ReduceResult1, RouteName)
				
				if typeof(ScreenForRouteName) == "table" and ScreenForRouteName.router then
					Routers[RouteName] = ScreenForRouteName.router
				else
					Routers[RouteName] = false
				end
			end
			local Router = Routers[RouteName]
			
			if Router then
				local StateForAction1 = Router.getStateForAction(Action, Route)
				
				if StateForAction1 == nil then
					return if StateForAction == nil then getNextState(Action, StateForAction, Tbl) else nil
				end
				if StateForAction1 ~= Route then
					local Copy = table.clone(Tbl.routes)
					Copy[Tbl.index] = StateForAction1
					
					return getNextState(Action, StateForAction, (Object.assign(table.clone(Tbl), { routes = Copy })))
				end
			end
			if Action.type == config.Back then
				local Route1 = Tbl.routes[Tbl.index]
				
				if Action.key == nil or Action.key == Route1.key then
					local Key = Route1.key
					
					if BackBehavior1 == BackBehavior.InitialRoute then
						Key = InitialRouteName
					elseif BackBehavior1 == BackBehavior.Order then
						Key = MapResult[math.max(1, table.find(MapResult, Key) - 1)]
					elseif BackBehavior1 == BackBehavior.History then
						local RouteKeyHistory = Tbl.routeKeyHistory
						
						if #RouteKeyHistory > 1 then
							Key = RouteKeyHistory[#RouteKeyHistory - 1]
						end
					end
					if Key ~= Route1.key then
						local Index: number = Array.findIndex(Tbl.routes, function(p3): boolean
							-- upvalues: Key (ref)
							return p3.key == Key
						end)
						
						if Index > 0 then
							return getNextState(Action, StateForAction, (Object.assign(table.clone(Tbl), { index = Index })))
						else
							local Copy = table.clone(Tbl.routes)
							table.insert(Copy, (initializeChildRoute(Key)))
							
							return getNextState(Action, StateForAction, (Object.assign(table.clone(Tbl), { routes = Copy, index = sortRoutes(Copy, Key) })))
						end
					end
				end
			end
			if Action.type == config.Navigate then
				local RouteName1 = Action.routeName
				
				if ReduceResult1[RouteName1] ~= nil then
					local Index: number = Array.findIndex(Tbl.routes, function(p3): boolean
						-- upvalues: RouteName1 (copy)
						return p3.routeName == RouteName1
					end)
					local Route2 = Tbl.routes[Index]
					local InitializeChildRouteResult = if Index < 0 then initializeChildRoute(RouteName1) else Route2
					
					if Action.action then
						if Routers[RouteName1] == nil and ReduceResult1[RouteName1] ~= nil then
							local ScreenForRouteName = GetScreenForRouteNameFunction(ReduceResult1, RouteName1)
							
							if typeof(ScreenForRouteName) == "table" and ScreenForRouteName.router then
								Routers[RouteName1] = ScreenForRouteName.router
							else
								Routers[RouteName1] = false
							end
						end
						local Router1 = Routers[RouteName1]
						
						if Router1 then
							local StateForAction2 = Router1.getStateForAction(Action.action, InitializeChildRouteResult)
							
							if StateForAction2 then
								InitializeChildRouteResult = StateForAction2
							end
						end
					end
					if Action.params then
						InitializeChildRouteResult = Object.assign(table.clone(InitializeChildRouteResult), {
							params = if Action.params == Object.None then Object.None elseif InitializeChildRouteResult.params then Object.assign(table.clone(InitializeChildRouteResult.params), Action.params) else Action.params
						})
					end
					if Index < 0 then
						local Copy1 = table.clone(Tbl.routes)
						table.insert(Copy1, InitializeChildRouteResult)
						
						return getNextState(Action, StateForAction, (Object.assign(table.clone(Tbl), { routes = Copy1, index = sortRoutes(Copy1, RouteName1) })))
					elseif Route2 == InitializeChildRouteResult then
						return if Tbl.index == Index then if StateForAction == nil then getNextState(Action, StateForAction, Tbl) else nil else getNextState(Action, StateForAction, (Object.assign(table.clone(Tbl), { index = Index })))
					else
						local Copy2 = table.clone(Tbl.routes)
						Copy2[Index] = InitializeChildRouteResult
						
						return getNextState(Action, StateForAction, (Object.assign(table.clone(Tbl), { routes = Copy2, index = Index })))
					end
				end
			end
			if Action.type == config.SetParams then
				local Index: number = Array.findIndex(Tbl.routes, function(p3): boolean
					-- upvalues: Action (copy)
					return p3.key == Action.key
				end)
				
				if Index > 0 then
					local Route3 = Tbl.routes[Index]
					local Copy3 = table.clone(Tbl.routes)
					Copy3[Index] = Object.assign(table.clone(Route3), {
						params = if Action.params == Object.None then Object.None elseif Route3.params and Action.params then Object.assign(table.clone(Route3.params), Action.params) else Action.params or (Route3.params or {})
					})
					
					return getNextState(Action, StateForAction, (Object.assign(table.clone(Tbl), { routes = Copy3 })))
				end
			end
			if not (Action.type == config.Back or (Action.type == StackActions.Pop or Action.type == StackActions.PopToTop)) or Action.type == config.Back and Action.key ~= nil then
				local SortRoutesResult = Tbl.index
				local Copy = Tbl.routes
				local RouteName1 = Copy[SortRoutesResult].routeName
				local ReduceResult = Array.reduce(Copy, function(p3, p4, p5)
					p3[p4.routeName] = p5
					
					return p3
				end, {})
				local Entry = nil
				local StateForAction3 = nil
				local StateForAction4 = nil
				local ReduceResultEntry = nil
				local InitializeChildRouteResult = nil
				
				for _, value in MapResult do
					if value ~= RouteName1 then
						if Routers[value] == nil and ReduceResult1[value] ~= nil then
							local ScreenForRouteName = GetScreenForRouteNameFunction(ReduceResult1, value)
							
							if typeof(ScreenForRouteName) == "table" and ScreenForRouteName.router then
								Routers[value] = ScreenForRouteName.router
							else
								Routers[value] = false
							end
						end
						local Router2 = Routers[value]
						
						if Router2 then
							ReduceResultEntry = ReduceResult[value]
							
							if ReduceResultEntry == nil then
								InitializeChildRouteResult = initializeChildRoute(value)
								StateForAction4 = Router2.getStateForAction(Action, InitializeChildRouteResult)
								
								if StateForAction4 then
									if StateForAction4 ~= InitializeChildRouteResult then
										Copy = table.clone(Copy)
										table.insert(Copy, StateForAction4)
										SortRoutesResult = sortRoutes(Copy, value)
										break
									end
								else
									Copy = table.clone(Copy)
									table.insert(Copy, InitializeChildRouteResult)
									SortRoutesResult = sortRoutes(Copy, value)
									break
								end
							else
								Entry = Copy[ReduceResultEntry]
								StateForAction3 = Router2.getStateForAction(Action, Entry)
								
								if StateForAction3 then
									if StateForAction3 ~= Entry then
										Copy = table.clone(Copy)
										Copy[ReduceResultEntry] = if FFlagFixInactiveChildStateForwarding then StateForAction3 else Entry
										SortRoutesResult = ReduceResultEntry
										break
									end
								else
									SortRoutesResult = ReduceResultEntry
									break
								end
							end
						end
					end
				end
				if Action.preserveFocus then
					SortRoutesResult = Tbl.index
				end
				if SortRoutesResult ~= Tbl.index or Copy ~= Tbl.routes then
					return getNextState(Action, StateForAction, (Object.assign(table.clone(Tbl), { index = SortRoutesResult, routes = Copy })))
				end
			end
			return Tbl
		end,
		getComponentForRouteName = function(p3)
			-- upvalues: GetScreenForRouteNameFunction (upval), ReduceResult1 (copy)
			return GetScreenForRouteNameFunction(ReduceResult1, p3)
		end,
		getActionCreators = function(p3, p4)
			-- upvalues: P1 (copy)
			return (P1.getCustomActionCreators or function()
				return {}
			end)(p3, p4)
		end,
		getScreenOptions = CreateConfigGetterFunction(ReduceResult1, P1.defaultNavigationOptions)
	}
end