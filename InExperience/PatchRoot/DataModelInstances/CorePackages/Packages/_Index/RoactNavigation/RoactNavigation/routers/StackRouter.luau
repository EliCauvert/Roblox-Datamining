local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local NavigationActionsModule = require(Parent.NavigationActions)
local StackActionsModule = require(script.Parent.StackActions)
local KeyGeneratorModule = require(Parent.utils.KeyGenerator)
local StateUtilsModule = require(Parent.StateUtils)
local GetScreenForRouteNameModule = require(script.Parent.getScreenForRouteName)
local CreateConfigGetterModule = require(script.Parent.createConfigGetter)
local ValidateRouteConfigArrayModule = require(script.Parent.validateRouteConfigArray)
local ValidateRouteConfigMapModule = require(script.Parent.validateRouteConfigMap)
local InvariantModule = require(Parent.utils.invariant)
local CreatePathParserFunction = require(script.Parent.pathUtils).createPathParser
local ChildIsScreenRouterSymbolRobloxModule = require(script.Parent["ChildIsScreenRouterSymbol.roblox"])

local function v14() --[[ Line: 28 ]]
	return {}
end

local function _(p1): boolean --[[ Line: 32 | Named "behavesLikePushAction" ]]
	-- upvalues: NavigationActionsModule (copy), StackActionsModule (copy)
	return p1.type == NavigationActionsModule.Navigate or p1.type == StackActionsModule.Push
end

local _ = function(p1): boolean --[[ Line: 36 | Named "isResetToRootStack" ]]
	-- upvalues: StackActionsModule (copy)
	return p1.type == StackActionsModule.Reset and p1.key == nil
end

local function mapToRouteName(p1) --[[ Line: 40 ]]
	return (next(p1))
end

local function foldToRoutes(p1, p2, _) --[[ Line: 45 ]]
	local Key, Value = next(p2)
	p1[Key] = Value
	
	return p1
end

return function(p1, p2) --[[ Line: 51 ]]
	-- upvalues: ValidateRouteConfigArrayModule (copy), ValidateRouteConfigMapModule (copy), Array (copy), foldToRoutes (copy), mapToRouteName (copy), ChildIsScreenRouterSymbolRobloxModule (copy), v14 (copy), NavigationActionsModule (copy), StackActionsModule (copy), Object (copy), KeyGeneratorModule (copy), CreatePathParserFunction (copy), InvariantModule (copy), GetScreenForRouteNameModule (copy), StateUtilsModule (copy), CreateConfigGetterModule (copy)
	ValidateRouteConfigArrayModule(p1)
	local P7 = p2 or {}
	local ValidateRouteConfigMapModuleResult = ValidateRouteConfigMapModule(Array.reduce(p1, foldToRoutes, {}))
	local Order = P7.order or Array.map(p1, mapToRouteName)
	local ChildIsScreenRouterSymbolRobloxModules = {}
	
	for _, value in Order do
		local ValidateRouteConfigMapModuleResultEntry = ValidateRouteConfigMapModuleResult[value]
		local Screen = if type(ValidateRouteConfigMapModuleResultEntry) == "table" and ValidateRouteConfigMapModuleResultEntry.screen then ValidateRouteConfigMapModuleResultEntry.screen else ValidateRouteConfigMapModuleResultEntry
		
		if type(Screen) == "table" and Screen.router then
			ChildIsScreenRouterSymbolRobloxModules[value] = Screen.router
		else
			ChildIsScreenRouterSymbolRobloxModules[value] = ChildIsScreenRouterSymbolRobloxModule
		end
	end
	local InitialRouteParams = P7.initialRouteParams
	local GetCustomActionCreators = P7.getCustomActionCreators or v14
	local InitialRouteName = P7.initialRouteName or Order[1]
	local ChildIsScreenRouterSymbolRobloxModule1 = ChildIsScreenRouterSymbolRobloxModules[InitialRouteName]
	
	if Array.indexOf(Order, InitialRouteName) < 1 then
		local Text = ""
		
		for _, value1 in Order do
			Text ..= value1 .. ","
		end
		error(string.format("Invalid initialRouteName '%s'. Must be one of [%s]", InitialRouteName, Text), 2)
	end
	local function getInitialState(p3) --[[ Line: 97 ]]
		-- upvalues: ChildIsScreenRouterSymbolRobloxModules (copy), NavigationActionsModule (upval), StackActionsModule (upval), ChildIsScreenRouterSymbolRobloxModule (upval), Object (upval), KeyGeneratorModule (upval), ChildIsScreenRouterSymbolRobloxModule1 (copy), InitialRouteName (copy), InitialRouteParams (copy), ValidateRouteConfigMapModuleResult (copy), P7 (ref)
		local StateForAction = {}
		local ChildIsScreenRouterSymbolRobloxModule2 = ChildIsScreenRouterSymbolRobloxModules[p3.routeName]
		
		if (p3.type == NavigationActionsModule.Navigate or p3.type == StackActionsModule.Push) and ChildIsScreenRouterSymbolRobloxModule2 ~= nil then
			return {
				key = "StackRouterRoot",
				isTransitioning = false,
				index = 1,
				routes = {
					Object.assign({ params = p3.params }, if ChildIsScreenRouterSymbolRobloxModule2 == ChildIsScreenRouterSymbolRobloxModule then {} else ChildIsScreenRouterSymbolRobloxModule2.getStateForAction(p3.action or NavigationActionsModule.init({ params = p3.params })), {
						key = p3.key or KeyGeneratorModule.generateKey(),
						routeName = p3.routeName
					})
				}
			}
		end
		if ChildIsScreenRouterSymbolRobloxModule1 ~= nil and ChildIsScreenRouterSymbolRobloxModule1 ~= ChildIsScreenRouterSymbolRobloxModule then
			StateForAction = ChildIsScreenRouterSymbolRobloxModule1.getStateForAction(NavigationActionsModule.navigate({
				routeName = InitialRouteName,
				params = InitialRouteParams
			}))
		end
		local ValidateRouteConfigMapModuleResultEntry = ValidateRouteConfigMapModuleResult[InitialRouteName]
		local Params = type(ValidateRouteConfigMapModuleResultEntry) == "table" and ValidateRouteConfigMapModuleResultEntry.params
		local InitialRouteKey = P7.initialRouteKey
		
		return {
			key = "StackRouterRoot",
			isTransitioning = false,
			index = 1,
			routes = {
				(Object.assign(table.clone(StateForAction), {
					params = if Params or StateForAction.params or p3.params then Object.assign(if Params then table.clone(Params) else {}, StateForAction.params or {}, p3.params or {}, InitialRouteParams or {}) else InitialRouteParams and Object.assign(if Params then table.clone(Params) else {}, StateForAction.params or {}, p3.params or {}, InitialRouteParams or {}),
					routeName = InitialRouteName,
					key = p3.key or (InitialRouteKey or KeyGeneratorModule.generateKey())
				}))
			}
		}
	end
	
	local function getParamsForRouteAndAction(RouteName, p3) --[[ Line: 162 ]]
		-- upvalues: Object (upval), ValidateRouteConfigMapModuleResult (copy)
		if p3.params == Object.None then
			return nil
		else
			local ValidateRouteConfigMapModuleResultEntry = ValidateRouteConfigMapModuleResult[RouteName]
			
			return if type(ValidateRouteConfigMapModuleResultEntry) == "table" and ValidateRouteConfigMapModuleResultEntry.params then Object.assign(table.clone(ValidateRouteConfigMapModuleResultEntry.params), p3.params) elseif p3.params then Object.assign({}, p3.params) else nil
		end
	end
	
	local PathParser = CreatePathParserFunction(ChildIsScreenRouterSymbolRobloxModules, ValidateRouteConfigMapModuleResult, P7)
	local GetPathAndParamsForRouteFunction = PathParser.getPathAndParamsForRoute
	local GetActionForPathAndParamsFunction = PathParser.getActionForPathAndParams
	local ChildRouters = {}
	
	for i, childIsScreenRouterSymbolRobloxModule in ChildIsScreenRouterSymbolRobloxModules do
		if childIsScreenRouterSymbolRobloxModule ~= ChildIsScreenRouterSymbolRobloxModule then
			ChildRouters[i] = childIsScreenRouterSymbolRobloxModule
		end
	end
	return {
		childRouters = ChildRouters,
		_CHILD_IS_SCREEN = ChildIsScreenRouterSymbolRobloxModule,
		getComponentForState = function(InitialState) --[[ Line: 199 ]]
			-- upvalues: InvariantModule (upval), ChildIsScreenRouterSymbolRobloxModules (copy), ChildIsScreenRouterSymbolRobloxModule (upval), GetScreenForRouteNameModule (upval), ValidateRouteConfigMapModuleResult (copy)
			local Route = InitialState.routes[InitialState.index] or {}
			local RouteName = Route.routeName
			InvariantModule(RouteName, "There is no route defined for index '%d'. Make sure that you passed in a navigation state with a valid stack index.", InitialState.index)
			local ChildIsScreenRouterSymbolRobloxModule1 = ChildIsScreenRouterSymbolRobloxModules[RouteName]
			
			return if ChildIsScreenRouterSymbolRobloxModule1 == nil or ChildIsScreenRouterSymbolRobloxModule1 == ChildIsScreenRouterSymbolRobloxModule then GetScreenForRouteNameModule(ValidateRouteConfigMapModuleResult, RouteName) else ChildIsScreenRouterSymbolRobloxModules[RouteName].getComponentForState(Route)
		end,
		getComponentForRouteName = function(p3) --[[ Line: 220 ]]
			-- upvalues: GetScreenForRouteNameModule (upval), ValidateRouteConfigMapModuleResult (copy)
			return GetScreenForRouteNameModule(ValidateRouteConfigMapModuleResult, p3)
		end,
		getActionCreators = function(p3, Key) --[[ Line: 224 ]]
			-- upvalues: Object (upval), GetCustomActionCreators (copy), StackActionsModule (upval), InvariantModule (upval), NavigationActionsModule (upval)
			return Object.assign(table.clone(GetCustomActionCreators(p3, Key)), {
				pop = function(AssignResult, p4) --[[ Line: 226 ]]
					-- upvalues: StackActionsModule (upval), Object (upval)
					return StackActionsModule.pop(Object.assign({ n = AssignResult }, p4 or {}))
				end,
				popToTop = function(p4) --[[ Line: 229 ]]
					-- upvalues: StackActionsModule (upval)
					return StackActionsModule.popToTop(p4)
				end,
				push = function(RouteName, Params, Action) --[[ Line: 232 ]]
					-- upvalues: StackActionsModule (upval)
					return StackActionsModule.push({ routeName = RouteName, params = Params, action = Action })
				end,
				replace = function(RouteName, Params, Action, NewKey) --[[ Line: 239 ]]
					-- upvalues: StackActionsModule (upval), p3 (copy), InvariantModule (upval)
					if type(RouteName) == "string" then
						return StackActionsModule.replace({
							routeName = RouteName,
							params = Params,
							action = Action,
							key = p3.key,
							newKey = NewKey
						})
					else
						InvariantModule(type(RouteName) == "table", "replaceWith must be a table or string")
						InvariantModule(Params == nil, "params must not be provided to .replace() when specifying a table")
						InvariantModule(Action == nil, "Child action must not be provided to .replace() when specifying a table")
						InvariantModule(NewKey == nil, "newKey must not be provided to .replace() when specifying a table")
						
						return StackActionsModule.replace(RouteName)
					end
				end,
				reset = function(Actions, p4) --[[ Line: 257 ]]
					-- upvalues: StackActionsModule (upval), Key (copy)
					return StackActionsModule.reset({
						actions = Actions,
						index = if p4 == nil then #Actions else p4,
						key = Key
					})
				end,
				dismiss = function() --[[ Line: 269 ]]
					-- upvalues: NavigationActionsModule (upval), Key (copy)
					return NavigationActionsModule.back({ key = Key })
				end
			})
		end,
		getStateForAction = function(Action, Tbl) --[[ Line: 277 ]]
			-- upvalues: getInitialState (copy), StackActionsModule (upval), NavigationActionsModule (upval), ChildIsScreenRouterSymbolRobloxModules (copy), ChildIsScreenRouterSymbolRobloxModule (upval), StateUtilsModule (upval), Object (upval), InvariantModule (upval), Array (upval), getParamsForRouteAndAction (copy), KeyGeneratorModule (upval)
			if not Tbl then
				return (getInitialState(Action))
			end
			local Route = Tbl.routes[Tbl.index]
			
			if Action.type == StackActionsModule.Reset and Action.key == nil or Action.type == NavigationActionsModule.Navigate then
				if Action.type == NavigationActionsModule.Navigate then
					local Route1 = nil
					local StateForAction = nil
					for i = #Tbl.routes, 1, -1 do
						Route1 = Tbl.routes[i]
						local ChildIsScreenRouterSymbolRobloxModule2 = ChildIsScreenRouterSymbolRobloxModules[Route1.routeName]
						local Action1 = if Action.routeName == Route1.routeName and Action.action then Action.action else Action
						
						if ChildIsScreenRouterSymbolRobloxModule2 ~= nil and ChildIsScreenRouterSymbolRobloxModule2 ~= ChildIsScreenRouterSymbolRobloxModule then
							StateForAction = ChildIsScreenRouterSymbolRobloxModule2.getStateForAction(Action1, Route1)
							
							if StateForAction == nil or StateForAction ~= Route1 then
								local ReplaceAndPruneResult = StateUtilsModule.replaceAndPrune(Tbl, if StateForAction then StateForAction.key else Route1.key, StateForAction or Route1)
								
								return Object.assign(table.clone(ReplaceAndPruneResult), {
									isTransitioning = if Tbl.index == ReplaceAndPruneResult.index then Tbl.isTransitioning else Action.immediate ~= true
								})
							end
						end
					end
				end
			else
				local ChildIsScreenRouterSymbolRobloxModule1 = ChildIsScreenRouterSymbolRobloxModules[Route.routeName]
				
				if ChildIsScreenRouterSymbolRobloxModule1 ~= nil and ChildIsScreenRouterSymbolRobloxModule1 ~= ChildIsScreenRouterSymbolRobloxModule then
					local StateForAction = ChildIsScreenRouterSymbolRobloxModule1.getStateForAction(Action, Route)
					
					if StateForAction ~= nil and StateForAction ~= Route then
						return StateUtilsModule.replaceAt(Tbl, Route.key, StateForAction, Action.type == NavigationActionsModule.SetParams)
					end
				end
			end
			if (Action.type == NavigationActionsModule.Navigate or Action.type == StackActionsModule.Push) and ChildIsScreenRouterSymbolRobloxModules[Action.routeName] ~= nil then
				local ChildIsScreenRouterSymbolRobloxModule3 = ChildIsScreenRouterSymbolRobloxModules[Action.routeName]
				InvariantModule(Action.type ~= StackActionsModule.Push or Action.key == nil, "StackRouter does not support key on the push action")
				local Index2: number = Array.findIndex(Tbl.routes, if Action.key then function(p3): boolean --[[ Line: 353 ]]
					-- upvalues: Action (copy)
					return p3.key == Action.key
				end else function(p3): boolean --[[ Line: 349 ]]
					-- upvalues: Action (copy)
					return p3.routeName == Action.routeName
				end)
				
				if Action.type == StackActionsModule.Push or Index2 <= 0 then
					return Object.assign(StateUtilsModule.push(Tbl, if ChildIsScreenRouterSymbolRobloxModule3 == ChildIsScreenRouterSymbolRobloxModule then {
						params = getParamsForRouteAndAction(Action.routeName, Action),
						routeName = Action.routeName,
						key = Action.key or KeyGeneratorModule.generateKey()
					} else Object.assign({
						params = getParamsForRouteAndAction(Action.routeName, Action)
					}, ChildIsScreenRouterSymbolRobloxModule3.getStateForAction(Action.action or NavigationActionsModule.init({
						params = getParamsForRouteAndAction(Action.routeName, Action)
					})), {
						routeName = Action.routeName,
						key = Action.key or KeyGeneratorModule.generateKey()
					})), { isTransitioning = Action.immediate ~= true })
				end
				if Tbl.index == Index2 and not Action.params then
					return nil
				end
				local SliceResult = Array.slice(Tbl.routes, 1, Index2 + 1)
				
				if Action.params then
					local Route2 = Tbl.routes[Index2]
					SliceResult[Index2] = Object.assign(table.clone(Route2), {
						params = if Action.params == Object.None then Object.None elseif Route2.params then Object.assign(table.clone(Route2.params), Action.params) else table.clone(Action.params)
					})
				end
				return Object.assign(table.clone(Tbl), {
					isTransitioning = if Tbl.index == Index2 then Tbl.isTransitioning else Action.immediate ~= true,
					index = Index2,
					routes = SliceResult
				})
			else
				if Action.type == StackActionsModule.Push and ChildIsScreenRouterSymbolRobloxModules[Action.routeName] == nil then
					return Tbl
				end
				if Action.type == NavigationActionsModule.Navigate or Action.type == StackActionsModule.Push then
					local Tbl1 = nil
					for childIsScreenRouterSymbolRobloxModule in ChildIsScreenRouterSymbolRobloxModules do
						local ChildIsScreenRouterSymbolRobloxModule4 = ChildIsScreenRouterSymbolRobloxModules[childIsScreenRouterSymbolRobloxModule]
						
						if ChildIsScreenRouterSymbolRobloxModule4 ~= nil and ChildIsScreenRouterSymbolRobloxModule4 ~= ChildIsScreenRouterSymbolRobloxModule then
							local StateForAction1 = ChildIsScreenRouterSymbolRobloxModule4.getStateForAction(NavigationActionsModule.init())
							local StateForAction2 = ChildIsScreenRouterSymbolRobloxModule4.getStateForAction(Action, StateForAction1)
							Tbl1 = nil
							
							if StateForAction2 == nil then
								Tbl1 = StateForAction1
							elseif StateForAction2 ~= StateForAction1 then
								Tbl1 = StateForAction2
							end
							if Tbl1 then
								return Object.assign(StateUtilsModule.push(Tbl, (Object.assign(table.clone(Tbl1), {
									routeName = childIsScreenRouterSymbolRobloxModule,
									key = Action.key or KeyGeneratorModule.generateKey()
								}))), { isTransitioning = Action.immediate ~= true })
							end
						end
					end
				end
				if Action.type == StackActionsModule.PopToTop then
					return if Action.key and Tbl.key ~= Action.key then Tbl elseif Tbl.index > 1 then Object.assign(table.clone(Tbl), {
						index = 1,
						isTransitioning = Action.immediate ~= true,
						routes = { Tbl.routes[1] }
					}) else Tbl
				end
				if Action.type == StackActionsModule.Replace then
					local CountRoutes = if Action.key == nil and #Tbl.routes > 0 then #Tbl.routes else Array.findIndex(Tbl.routes, function(p3): boolean --[[ Line: 496 ]]
						-- upvalues: Action (copy)
						return p3.key == Action.key
					end)
					
					if CountRoutes > 0 then
						local ChildIsScreenRouterSymbolRobloxModule5 = ChildIsScreenRouterSymbolRobloxModules[Action.routeName]
						local Copy = table.clone(Tbl.routes)
						Copy[CountRoutes] = Object.assign({
							params = getParamsForRouteAndAction(Action.routeName, Action)
						}, if ChildIsScreenRouterSymbolRobloxModule5 == nil or ChildIsScreenRouterSymbolRobloxModule5 == ChildIsScreenRouterSymbolRobloxModule then {} else ChildIsScreenRouterSymbolRobloxModule5.getStateForAction(Action.action or NavigationActionsModule.init({
							params = getParamsForRouteAndAction(Action.routeName, Action)
						})), {
							routeName = Action.routeName,
							key = Action.newKey or KeyGeneratorModule.generateKey()
						})
						
						return Object.assign(table.clone(Tbl), { routes = Copy })
					end
				end
				if Action.type == StackActionsModule.CompleteTransition and (Action.key == nil or Action.key == Tbl.key) and (Action.toChildKey == Tbl.routes[Tbl.index].key and Tbl.isTransitioning) then
					return Object.assign(table.clone(Tbl), { isTransitioning = false })
				end
				if Action.type == NavigationActionsModule.SetParams then
					local Key = Action.key
					local Index3: number = Array.findIndex(Tbl.routes, function(p3): boolean --[[ Line: 545 ]]
						-- upvalues: Key (copy)
						return p3.key == Key
					end)
					
					if Index3 > 0 then
						local Route3 = Tbl.routes[Index3]
						local Copy = table.clone(Tbl.routes)
						Copy[Index3] = Object.assign(table.clone(Route3), {
							params = if Action.params == Object.None then Object.None elseif Route3.params and Action.params then Object.assign(table.clone(Route3.params), Action.params) elseif Route3.params then table.clone(Route3.params) elseif Action.params then table.clone(Action.params) else {}
						})
						
						return Object.assign(table.clone(Tbl), { routes = Copy })
					end
				end
				if Action.type == StackActionsModule.Reset then
					return if Action.key == nil or Action.key == Tbl.key then Object.assign(table.clone(Tbl), {
						routes = if Action.actions then Array.map(Action.actions, function(p3) --[[ Line: 576 ]]
							-- upvalues: ChildIsScreenRouterSymbolRobloxModules (upval), ChildIsScreenRouterSymbolRobloxModule (upval), NavigationActionsModule (upval), getParamsForRouteAndAction (upval), Object (upval), KeyGeneratorModule (upval)
							local ChildIsScreenRouterSymbolRobloxModule1 = ChildIsScreenRouterSymbolRobloxModules[p3.routeName]
							
							return Object.assign({ params = getParamsForRouteAndAction(p3.routeName, p3) }, if ChildIsScreenRouterSymbolRobloxModule1 == nil or ChildIsScreenRouterSymbolRobloxModule1 == ChildIsScreenRouterSymbolRobloxModule then {} else ChildIsScreenRouterSymbolRobloxModule1.getStateForAction(p3.action or NavigationActionsModule.init({ params = getParamsForRouteAndAction(p3.routeName, p3) })), {
								routeName = p3.routeName,
								key = p3.key or KeyGeneratorModule.generateKey()
							})
						end) else {},
						index = Action.index
					}) else Tbl
				end
				if Action.type == NavigationActionsModule.Back or Action.type == StackActionsModule.Pop then
					local Key1 = Action.key
					local N = Action.n
					local Immediate = Action.immediate
					local Prune = Action.prune
					
					if Action.type == StackActionsModule.Pop and Prune == false and Key1 then
						local Index: number = Array.findIndex(Tbl.routes, function(p3): boolean --[[ Line: 617 ]]
							-- upvalues: Key1 (copy)
							return p3.key == Key1
						end)
						
						if Index > 0 then
							local ConcatResult = Array.concat(Array.slice(Tbl.routes, 1, math.max(Index - (N or 1), 1) + 1), Array.slice(Tbl.routes, Index + 1))
							
							if #ConcatResult > 0 then
								return Object.assign(table.clone(Tbl), {
									routes = ConcatResult,
									index = #ConcatResult,
									isTransitioning = Immediate ~= true
								})
							end
						end
					else
						local Index1 = Tbl.index
						
						if Action.type == StackActionsModule.Pop and N ~= nil then
							Index1 = math.max(2, Tbl.index - N + 1)
						elseif Key1 then
							Index1 = Array.findIndex(Tbl.routes, function(p3): boolean --[[ Line: 642 ]]
								-- upvalues: Key1 (copy)
								return p3.key == Key1
							end)
						end
						if Index1 > 1 then
							return Object.assign(table.clone(Tbl), {
								routes = Array.slice(Tbl.routes, 1, Index1),
								index = Index1 - 1,
								isTransitioning = Immediate ~= true
							})
						end
					end
				end
				local IndexOfResult = if Action.key then StateUtilsModule.indexOf(Tbl, Action.key) else nil
				local Route4 = nil
				local StateForAction = nil
				for i1 = #Tbl.routes, 1, -1 do
					Route4 = Tbl.routes[i1]
					local NoChildIsScreenRouterSymbolRobloxModule: boolean = Route4.key == Route.key or IndexOfResult ~= 1 and Route4.key ~= Action.key
					local ChildIsScreenRouterSymbolRobloxModule6 = nil
					
					if not NoChildIsScreenRouterSymbolRobloxModule then
						ChildIsScreenRouterSymbolRobloxModule6 = ChildIsScreenRouterSymbolRobloxModules[Route4.routeName]
						NoChildIsScreenRouterSymbolRobloxModule = ChildIsScreenRouterSymbolRobloxModule6 == nil or ChildIsScreenRouterSymbolRobloxModule6 == ChildIsScreenRouterSymbolRobloxModule
					end
					if not NoChildIsScreenRouterSymbolRobloxModule then
						StateForAction = ChildIsScreenRouterSymbolRobloxModule6.getStateForAction(Action, Route4)
						
						if StateForAction == nil then
							return Tbl
						end
						if StateForAction ~= Route4 then
							return StateUtilsModule.replaceAt(Tbl, Route4.key, StateForAction, Action.preserveFocus)
						end
					end
				end
				return Tbl
			end
		end,
		getPathAndParamsForState = function(InitialState) --[[ Line: 696 ]]
			-- upvalues: GetPathAndParamsForRouteFunction (copy)
			return GetPathAndParamsForRouteFunction(InitialState.routes[InitialState.index])
		end,
		getActionForPathAndParams = function(p3, p4) --[[ Line: 701 ]]
			-- upvalues: GetActionForPathAndParamsFunction (copy)
			return GetActionForPathAndParamsFunction(p3, p4)
		end,
		getScreenOptions = CreateConfigGetterModule(ValidateRouteConfigMapModuleResult, P7.defaultNavigationOptions)
	}
end