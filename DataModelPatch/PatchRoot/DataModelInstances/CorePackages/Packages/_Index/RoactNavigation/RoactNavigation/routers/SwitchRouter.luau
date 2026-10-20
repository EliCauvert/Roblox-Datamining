local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local NavigationActionsModule = require(Parent.NavigationActions)
local BackBehaviorModule = require(Parent.BackBehavior)
local GetScreenForRouteNameModule = require(script.Parent.getScreenForRouteName)
local CreateConfigGetterModule = require(script.Parent.createConfigGetter)
local ValidateRouteConfigMapModule = require(script.Parent.validateRouteConfigMap)
local ValidateRouteConfigArrayModule = require(script.Parent.validateRouteConfigArray)
local InvariantModule = require(Parent.utils.invariant)
local StackActionsModule = require(Parent.routers.StackActions)
local SwitchActionsModule = require(script.Parent.SwitchActions)
local CreatePathParserFunction = require(script.Parent.pathUtils).createPathParser

local function defaultActionCreators()
	return {}
end

local function mapToRouteName(p1)
	return (next(p1))
end

local function foldToRoutes(p1, p2)
	local Key, Value = next(p2)
	p1[Key] = Value
	
	return p1
end

return function(p1, p2)
	-- upvalues: ValidateRouteConfigArrayModule (copy), ValidateRouteConfigMapModule (copy), Array (copy), foldToRoutes (copy), mapToRouteName (copy), defaultActionCreators (copy), BackBehaviorModule (copy), GetScreenForRouteNameModule (copy), Object (copy), CreatePathParserFunction (copy), NavigationActionsModule (copy), CreateConfigGetterModule (copy), SwitchActionsModule (copy), StackActionsModule (copy), InvariantModule (copy)
	ValidateRouteConfigArrayModule(p1)
	local P4 = p2 or {}
	local ValidateRouteConfigMapModuleResult = ValidateRouteConfigMapModule(Array.reduce(p1, foldToRoutes, {}))
	local Order = P4.order or Array.map(p1, mapToRouteName)
	local GetCustomActionCreators = P4.getCustomActionCreators or defaultActionCreators
	local InitialRouteParams = P4.initialRouteParams
	local InitialRouteName = P4.initialRouteName or Order[1]
	local BackBehavior = P4.backBehavior or BackBehaviorModule.None
	local NoResetOnBlur = P4.resetOnBlur == nil or P4.resetOnBlur
	local IndexOfResult: number = Array.indexOf(Order, InitialRouteName)
	
	if IndexOfResult < 1 then
		error(("Invalid initialRouteName '%s'. Should be one of %s"):format(InitialRouteName, (table.concat(Array.map(Order, function(p3): string
			return ("\"%s\""):format(p3)
		end), ", "))), 2)
	end
	local ChildRouters = {}
	
	for _, value in Order do
		local ScreenForRouteNameModule = GetScreenForRouteNameModule(ValidateRouteConfigMapModuleResult, value)
		
		if type(ScreenForRouteNameModule) == "table" and ScreenForRouteNameModule.router then
			ChildRouters[value] = ScreenForRouteNameModule.router
		else
			ChildRouters[value] = false
		end
	end
	local function _(p3, p4)
		-- upvalues: ValidateRouteConfigMapModuleResult (copy), Object (upval)
		local ValidateRouteConfigMapModuleResultEntry = ValidateRouteConfigMapModuleResult[p3]
		
		return if type(ValidateRouteConfigMapModuleResultEntry) == "table" and ValidateRouteConfigMapModuleResultEntry.params then if p4 then Object.assign(table.clone(ValidateRouteConfigMapModuleResultEntry.params), p4) else table.clone(ValidateRouteConfigMapModuleResultEntry.params) else p4
	end
	
	local PathParser = CreatePathParserFunction(ChildRouters, ValidateRouteConfigMapModuleResult, P4)
	local GetPathAndParamsForRouteFunction = PathParser.getPathAndParamsForRoute
	local GetActionForPathAndParamsFunction = PathParser.getActionForPathAndParams
	
	local function resetChildRoute(RouteName)
		-- upvalues: InitialRouteName (copy), InitialRouteParams (copy), ValidateRouteConfigMapModuleResult (copy), Object (upval), ChildRouters (copy), NavigationActionsModule (upval)
		local InitialRouteParams1 = if RouteName == InitialRouteName then InitialRouteParams else nil
		local ValidateRouteConfigMapModuleResultEntry = ValidateRouteConfigMapModuleResult[RouteName]
		local AssignResult = if type(ValidateRouteConfigMapModuleResultEntry) == "table" and ValidateRouteConfigMapModuleResultEntry.params then if InitialRouteParams1 then Object.assign(table.clone(ValidateRouteConfigMapModuleResultEntry.params), InitialRouteParams1) else table.clone(ValidateRouteConfigMapModuleResultEntry.params) else InitialRouteParams1
		local ChildRouter = ChildRouters[RouteName]
		
		return if ChildRouter then Object.assign(table.clone(ChildRouter.getStateForAction((NavigationActionsModule.init()))), {
			key = RouteName,
			routeName = RouteName,
			params = AssignResult
		}) else {
			key = RouteName,
			routeName = RouteName,
			params = AssignResult
		}
	end
	
	local function getNextState(p3, p4, Tbl)
		-- upvalues: NoResetOnBlur (ref), resetChildRoute (copy), Object (upval), BackBehavior (copy), BackBehaviorModule (upval), NavigationActionsModule (upval), Array (upval)
		local Tbl1 = Tbl
		
		if p4 and Tbl and p4.index ~= Tbl.index and NoResetOnBlur then
			local Copy = table.clone(Tbl.routes)
			Copy[p4.index] = resetChildRoute(p4.routes[p4.index].routeName)
			Tbl1 = Object.assign(table.clone(Tbl), { routes = Copy })
		end
		if BackBehavior ~= BackBehaviorModule.History or p4 and Tbl1 and Tbl1.index == p4.index then
			return Tbl1
		end
		local RouteKeyHistory = if p4 then p4.routeKeyHistory else {}
		
		if p3.type == NavigationActionsModule.Navigate then
			local Key = Tbl1.routes[Tbl1.index].key
			RouteKeyHistory = Array.filter(RouteKeyHistory, function(Key1): boolean
				-- upvalues: Key (copy)
				return Key1 ~= Key
			end)
			table.insert(RouteKeyHistory, Key)
		elseif p3.type == NavigationActionsModule.Back then
			RouteKeyHistory = table.clone(RouteKeyHistory)
			table.remove(RouteKeyHistory, #RouteKeyHistory)
		end
		return Object.assign(table.clone(Tbl1), { routeKeyHistory = RouteKeyHistory })
	end
	
	local function getInitialState()
		-- upvalues: Array (upval), Order (copy), resetChildRoute (copy), IndexOfResult (copy), BackBehavior (copy), BackBehaviorModule (upval)
		local MapResult = Array.map(Order, resetChildRoute)
		local config = { routes = MapResult, index = IndexOfResult }
		
		if BackBehavior == BackBehaviorModule.History then
			config.routeKeyHistory = { MapResult[IndexOfResult].key }
		end
		return config
	end
	
	return {
		childRouters = ChildRouters,
		getActionCreators = function(p3, p4)
			-- upvalues: GetCustomActionCreators (copy)
			return GetCustomActionCreators(p3, p4)
		end,
		getScreenOptions = CreateConfigGetterModule(ValidateRouteConfigMapModuleResult, P4.defaultNavigationOptions),
		getStateForAction = function(Action, Tbl)
			-- upvalues: getInitialState (copy), NavigationActionsModule (upval), Array (upval), InitialRouteName (copy), InitialRouteParams (copy), Object (upval), SwitchActionsModule (upval), getNextState (copy), ChildRouters (copy), Order (copy), BackBehavior (copy), BackBehaviorModule (upval), IndexOfResult (copy), StackActionsModule (upval)
			local Copy = if Tbl then table.clone(Tbl) else nil
			local Tbl2 = Tbl or getInitialState()
			local Index = Tbl2.index
			
			if Action.type == NavigationActionsModule.Init then
				local Params = Action.params
				
				if Params then
					Tbl2.routes = Array.map(Tbl2.routes, function(Tbl)
						-- upvalues: InitialRouteName (upval), InitialRouteParams (upval), Object (upval), Params (copy)
						local InitialRouteParams1 = Tbl.routeName == InitialRouteName and InitialRouteParams or {}
						
						return Object.assign(table.clone(Tbl), {
							params = if Tbl.params then Object.assign(table.clone(Tbl.params), Params, InitialRouteParams1) else Object.assign(table.clone(Params), InitialRouteParams1)
						})
					end)
				end
			end
			if Action.type == SwitchActionsModule.JumpTo and (Action.key == nil or Action.key == Tbl2.key) then
				local Params1 = Action.params
				local Index1: number = Array.findIndex(Tbl2.routes, function(p3): boolean
					-- upvalues: Action (copy)
					return p3.routeName == Action.routeName
				end)
				
				if Index1 < 1 then
					error(("There is no route named '%s' in the navigator with the key '%s'.\n"):format(Action.routeName, Action.key) .. "Must be one of: " .. table.concat(Array.map(Tbl2.routes, function(p3)
						return p3.routeName
					end), ","))
				end
				local Routes = Tbl2.routes
				
				return if Params1 then Tbl2.routes.map(function(Tbl, Index)
					-- upvalues: Index1 (copy), Object (upval), Params1 (copy)
					return if Index == Index1 then Object.assign(table.clone(Tbl), { params = Object.assign(table.clone(Tbl.params), Params1) }) else Tbl
				end) else getNextState(Action, Copy, Object.assign(table.clone(Tbl2), { routes = Routes, index = Index1 }))
			else
				local Route = Tbl2.routes[Tbl2.index]
				local ChildRouter = ChildRouters[Order[Tbl2.index]]
				
				if ChildRouter then
					local StateForAction = ChildRouter.getStateForAction(Action, Route)
					
					if not StateForAction and Tbl then
						return nil
					end
					if StateForAction and StateForAction ~= Route then
						local Copy1 = table.clone(Tbl2.routes)
						Copy1[Tbl2.index] = StateForAction
						
						return getNextState(Action, Copy, Object.assign(table.clone(Tbl2), { routes = Copy1 }))
					end
				end
				local NoKey: boolean = Action.key == nil or Action.key == Route.key
				
				if Action.type == NavigationActionsModule.Back then
					if NoKey and BackBehavior == BackBehaviorModule.InitialRoute then
						Index = IndexOfResult
					elseif NoKey and BackBehavior == BackBehaviorModule.Order then
						Index = math.max(1, Index - 1)
					elseif NoKey and BackBehavior == BackBehaviorModule.History and #Tbl2.routeKeyHistory > 1 then
						Index = Array.indexOf(Order, Tbl2.routeKeyHistory[#Tbl2.routeKeyHistory - 1])
					end
				end
				local HasFindResult = false
				
				if Action.type == NavigationActionsModule.Navigate then
					HasFindResult = Array.find(Order, function(RouteName, p3): boolean
						-- upvalues: Action (copy), Index (ref)
						if RouteName == Action.routeName then
							Index = p3
							
							return true
						else
							return false
						end
					end) ~= nil
					
					if HasFindResult then
						local Route1 = Tbl2.routes[Index]
						local ChildRouter1 = ChildRouters[Action.routeName]
						local Tbl1 = Route1
						
						if Action.action and ChildRouter1 then
							local StateForAction = ChildRouter1.getStateForAction(Action.action, Route1)
							
							if StateForAction then
								Tbl1 = StateForAction
							end
						end
						if Action.params then
							Tbl1 = Object.assign(table.clone(Tbl1), {
								params = if Action.params == Object.None then Object.None elseif Tbl1.params then Object.assign(table.clone(Tbl1.params), Action.params) else table.clone(Action.params)
							})
						end
						if Tbl1 ~= Route1 then
							local Copy2 = table.clone(Tbl2.routes)
							Copy2[Index] = Tbl1
							
							return getNextState(Action, Copy, (Object.assign(table.clone(Tbl2), { routes = Copy2, index = Index })))
						end
						if Tbl1 == Route1 and Tbl2.index == Index and Copy then
							return nil
						end
					end
				end
				if Action.type == NavigationActionsModule.SetParams then
					local Key = Action.key
					local Index2: number = Array.findIndex(Tbl2.routes, function(p3): boolean
						-- upvalues: Key (copy)
						return p3.key == Key
					end)
					
					if Index2 > 0 then
						local Route2 = Tbl2.routes[Index2]
						local Copy3 = table.clone(Tbl2.routes)
						Copy3[Index2] = Object.assign(table.clone(Route2), {
							params = if Action.params == Object.None then Object.None elseif Route2.params and Action.params then Object.assign(table.clone(Route2.params), Action.params) elseif Route2.params then table.clone(Route2.params) elseif Action.params then table.clone(Action.params) else {}
						})
						
						return getNextState(Action, Copy, Object.assign(table.clone(Tbl2), { routes = Copy3 }))
					end
				end
				if Index ~= Tbl2.index then
					return getNextState(Action, Copy, Object.assign(table.clone(Tbl2), { index = Index }))
				end
				if HasFindResult and not Tbl then
					return Tbl2
				end
				if HasFindResult then
					return table.clone(Tbl2)
				end
				if not (Action.type == NavigationActionsModule.Back or (Action.type == StackActionsModule.Pop or Action.type == StackActionsModule.PopToTop)) or Action.type == NavigationActionsModule.Back and Action.key ~= nil then
					local Index3 = Tbl2.index
					local Routes = Tbl2.routes
					Array.find(Order, function(p3, Index): boolean
						-- upvalues: ChildRouters (upval), Index3 (ref), Routes (ref), Action (copy)
						local ChildRouter = ChildRouters[p3]
						
						if Index == Index3 then
							return false
						end
						local Route = Routes[Index]
						
						if ChildRouter then
							Route = ChildRouter.getStateForAction(Action, Route)
						end
						if not Route then
							Index3 = Index
							
							return true
						elseif Route == Routes[Index] then
							return false
						else
							Routes = table.clone(Routes)
							Routes[Index] = Route
							Index3 = Index
							
							return true
						end
					end)
					
					if Action.preserveFocus then
						Index3 = Tbl2.index
					end
					if Index3 ~= Tbl2.index or Routes ~= Tbl2.routes then
						return getNextState(Action, Copy, Object.assign(table.clone(Tbl2), { index = Index3, routes = Routes }))
					end
				end
				return Tbl2
			end
		end,
		getComponentForState = function(Route)
			-- upvalues: InvariantModule (upval), ChildRouters (copy), GetScreenForRouteNameModule (upval), ValidateRouteConfigMapModuleResult (copy)
			local RouteName = (Route.routes[Route.index] or {}).routeName
			InvariantModule(RouteName, "There is no route defined for index '%d'. Check that you passed in a navigation state with a valid tab/screen index.", Route.index)
			local ChildRouter = ChildRouters[RouteName]
			
			return if ChildRouter then ChildRouter.getComponentForState(Route.routes[Route.index]) else GetScreenForRouteNameModule(ValidateRouteConfigMapModuleResult, RouteName)
		end,
		getComponentForRouteName = function(p3)
			-- upvalues: GetScreenForRouteNameModule (upval), ValidateRouteConfigMapModuleResult (copy)
			return GetScreenForRouteNameModule(ValidateRouteConfigMapModuleResult, p3)
		end,
		getPathAndParamsForState = function(p3)
			-- upvalues: GetPathAndParamsForRouteFunction (copy)
			return GetPathAndParamsForRouteFunction(p3.routes[p3.index])
		end,
		getActionForPathAndParams = function(p3, p4)
			-- upvalues: GetActionForPathAndParamsFunction (copy)
			return GetActionForPathAndParamsFunction(p3, p4)
		end
	}
end