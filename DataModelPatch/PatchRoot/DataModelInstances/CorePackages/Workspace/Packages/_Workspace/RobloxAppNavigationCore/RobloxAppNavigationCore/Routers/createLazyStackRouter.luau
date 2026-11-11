local Parent = script:FindFirstAncestor("RobloxAppNavigationCore").Parent
local InspectRouteEntryFunction = require(Parent.Navigation).inspectRouteEntry
local RoactNavigationModule = require(Parent.RoactNavigation)
local CreateConfigGetterFunction = RoactNavigationModule.createConfigGetter
local GetScreenForRouteNameFunction = RoactNavigationModule.getScreenForRouteName
local ValidateRouteConfigMapFunction = RoactNavigationModule.validateRouteConfigMap
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local StateUtilsModule = require(script.Parent.StateUtils)
local DEV = _G.__DEV__
local config = {
	Init = RoactNavigationModule.Actions.Init,
	Back = RoactNavigationModule.Actions.Back,
	Navigate = RoactNavigationModule.Actions.Navigate,
	SetParams = RoactNavigationModule.Actions.SetParams,
	Pop = RoactNavigationModule.StackActions.Pop,
	PopToTop = RoactNavigationModule.StackActions.PopToTop,
	Push = RoactNavigationModule.StackActions.Push,
	Reset = RoactNavigationModule.StackActions.Reset,
	Replace = RoactNavigationModule.StackActions.Replace,
	CompleteTransition = RoactNavigationModule.StackActions.CompleteTransition
}
local Text = tostring(math.random(100000, 1000000))
local Count = 0

local function _(): string
	-- upvalues: Count (ref), Text (copy)
	Count += 1
	
	return `id-{Text}-{tostring(Count)}`
end

local _ = function(p1): boolean
	-- upvalues: config (copy)
	return p1.type == config.Reset and p1.key == nil
end

local _ = function(p1)
	-- upvalues: Object (copy)
	return if p1.params == Object.None then nil else p1.params
end

return function(p1, p2)
	-- upvalues: Array (copy), InspectRouteEntryFunction (copy), DEV (copy), ValidateRouteConfigMapFunction (copy), GetScreenForRouteNameFunction (copy), config (copy), Count (ref), Text (copy), RoactNavigationModule (copy), Object (copy), StateUtilsModule (copy), CreateConfigGetterFunction (copy)
	local MapResult = Array.map(p1, function(p3)
		-- upvalues: InspectRouteEntryFunction (upval)
		return (InspectRouteEntryFunction(p3))
	end)
	local ReduceResult = Array.reduce(p1, function(p3, p4)
		-- upvalues: InspectRouteEntryFunction (upval)
		local InspectRouteEntryResult, InspectRouteEntryResult2 = InspectRouteEntryFunction(p4)
		p3[InspectRouteEntryResult] = InspectRouteEntryResult2
		
		return p3
	end, {})
	
	if DEV then
		ValidateRouteConfigMapFunction(ReduceResult)
	end
	local P3 = p2 or {}
	local InitialRouteName = P3.initialRouteName or MapResult[1]
	
	if DEV and ReduceResult[InitialRouteName] == nil then
		error(`Invalid initialRouteName: '{InitialRouteName}'. Should be one of: {table.concat(MapResult, ", ")}`)
	end
	local Routers = {}
	
	local function _(Key)
		-- upvalues: Routers (copy), ReduceResult (copy), GetScreenForRouteNameFunction (upval)
		if Routers[Key] == nil and ReduceResult[Key] ~= nil then
			local ScreenForRouteName = GetScreenForRouteNameFunction(ReduceResult, Key)
			
			if typeof(ScreenForRouteName) == "table" and ScreenForRouteName.router then
				Routers[Key] = ScreenForRouteName.router
			else
				Routers[Key] = false
			end
		end
		return Routers[Key]
	end
	
	local function getInitialState(AssignResult)
		-- upvalues: config (upval), ReduceResult (copy), Count (upval), Text (upval), Routers (copy), GetScreenForRouteNameFunction (upval), RoactNavigationModule (upval), Object (upval), InitialRouteName (copy)
		if (AssignResult.type == config.Navigate or AssignResult.type == config.Push) and ReduceResult[AssignResult.routeName] ~= nil then
			local AssignResult2 = {}
			local Key = AssignResult.key
			
			if not Key then
				Count += 1
				Key = `id-{Text}-{tostring(Count)}`
			end
			AssignResult2.key = Key
			AssignResult2.routeName = AssignResult.routeName
			AssignResult2.params = AssignResult.params
			local RouteName = AssignResult.routeName
			
			if Routers[RouteName] == nil and ReduceResult[RouteName] ~= nil then
				local ScreenForRouteName = GetScreenForRouteNameFunction(ReduceResult, RouteName)
				
				if typeof(ScreenForRouteName) == "table" and ScreenForRouteName.router then
					Routers[RouteName] = ScreenForRouteName.router
				else
					Routers[RouteName] = false
				end
			end
			local Router = Routers[RouteName]
			
			if Router then
				AssignResult2 = Object.assign(table.clone((Router.getStateForAction(AssignResult.action or RoactNavigationModule.Actions.init()))), AssignResult2)
			end
			return {
				key = "StackRouterRoot",
				index = 1,
				isTransitioning = false,
				routes = { AssignResult2 }
			}
		else
			Count += 1
			local AssignResult1 = {
				key = `id-{Text}-{tostring(Count)}`,
				routeName = InitialRouteName
			}
			
			if Routers[InitialRouteName] == nil and ReduceResult[InitialRouteName] ~= nil then
				local ScreenForRouteName = GetScreenForRouteNameFunction(ReduceResult, InitialRouteName)
				
				if typeof(ScreenForRouteName) == "table" and ScreenForRouteName.router then
					Routers[InitialRouteName] = ScreenForRouteName.router
				else
					Routers[InitialRouteName] = false
				end
			end
			local Router = Routers[InitialRouteName]
			
			if Router then
				AssignResult1 = Object.assign(table.clone((Router.getStateForAction((RoactNavigationModule.Actions.init())))), AssignResult1)
			end
			return {
				key = "StackRouterRoot",
				index = 1,
				isTransitioning = false,
				routes = { AssignResult1 }
			}
		end
	end
	
	return {
		childRouters = Routers,
		getStateForAction = function(Action, Route)
			-- upvalues: getInitialState (copy), config (upval), Routers (copy), ReduceResult (copy), GetScreenForRouteNameFunction (upval), StateUtilsModule (upval), Object (upval), DEV (upval), Array (upval), RoactNavigationModule (upval), Count (upval), Text (upval)
			local Tbl = Route or getInitialState(Action)
			
			if not Route then
				return Tbl
			end
			local Route1 = Tbl.routes[Tbl.index]
			
			if Action.type == config.Reset and Action.key == nil or Action.type == config.Navigate then
				if Action.type == config.Navigate then
					local Route2 = nil
					local StateForAction2 = nil
					for i = #Tbl.routes, 1, -1 do
						Route2 = Tbl.routes[i]
						local RouteName = Route2.routeName
						
						if Routers[RouteName] == nil and ReduceResult[RouteName] ~= nil then
							local ScreenForRouteName = GetScreenForRouteNameFunction(ReduceResult, RouteName)
							
							if typeof(ScreenForRouteName) == "table" and ScreenForRouteName.router then
								Routers[RouteName] = ScreenForRouteName.router
							else
								Routers[RouteName] = false
							end
						end
						local Router = Routers[RouteName]
						local Action1 = if Action.routeName == Route2.routeName and Action.action then Action.action else Action
						
						if Router then
							StateForAction2 = Router.getStateForAction(Action1, Route2)
							
							if StateForAction2 == nil or StateForAction2 ~= Route2 then
								local ReplaceAndPruneResult = StateUtilsModule.replaceAndPrune(Tbl, if StateForAction2 then StateForAction2.key else Route2.key, StateForAction2 or Route2)
								
								return Object.assign(table.clone(ReplaceAndPruneResult), {
									isTransitioning = if Tbl.index == ReplaceAndPruneResult.index then Tbl.isTransitioning else Action.immediate ~= true
								})
							end
						end
					end
				end
			else
				local RouteName = Route1.routeName
				
				if Routers[RouteName] == nil and ReduceResult[RouteName] ~= nil then
					local ScreenForRouteName = GetScreenForRouteNameFunction(ReduceResult, RouteName)
					
					if typeof(ScreenForRouteName) == "table" and ScreenForRouteName.router then
						Routers[RouteName] = ScreenForRouteName.router
					else
						Routers[RouteName] = false
					end
				end
				local Router = Routers[RouteName]
				
				if Router then
					local StateForAction = Router.getStateForAction(Action, Route1)
					
					if StateForAction ~= nil and StateForAction ~= Route1 then
						return StateUtilsModule.replaceAt(Tbl, Route1.key, StateForAction, Action.type == config.SetParams)
					end
				end
			end
			if (Action.type == config.Navigate or Action.type == config.Push) and ReduceResult[Action.routeName] ~= nil then
				local RouteName = Action.routeName
				
				if Routers[RouteName] == nil and ReduceResult[RouteName] ~= nil then
					local ScreenForRouteName = GetScreenForRouteNameFunction(ReduceResult, RouteName)
					
					if typeof(ScreenForRouteName) == "table" and ScreenForRouteName.router then
						Routers[RouteName] = ScreenForRouteName.router
					else
						Routers[RouteName] = false
					end
				end
				local Router = Routers[RouteName]
				
				if DEV then
					assert(Action.type ~= config.Push or Action.key == nil, "StackRouter does not support key on the push action")
				end
				local Index1: number = Array.findIndex(Tbl.routes, if Action.key then function(p3): boolean
					-- upvalues: Action (copy)
					return p3.key == Action.key
				end else function(p3): boolean
					-- upvalues: Action (copy)
					return p3.routeName == Action.routeName
				end)
				
				if Action.type == config.Push or Index1 <= 0 then
					local AssignResult = nil
					if Router then
						local AssignFunction1 = Object.assign
						local config3 = {
							params = if Action.params == Object.None then nil else Action.params
						}
						local StateForAction3 = Router.getStateForAction(Action.action or RoactNavigationModule.Actions.init({
							params = if Action.params == Object.None then nil else Action.params
						}))
						local config4 = { routeName = Action.routeName }
						local Key2 = Action.key
						
						if not Key2 then
							Count += 1
							Key2 = `id-{Text}-{tostring(Count)}`
						end
						config4.key = Key2
						AssignResult = AssignFunction1(config3, StateForAction3, config4)
					else
						local config5 = {
							params = if Action.params == Object.None then nil else Action.params,
							routeName = Action.routeName
						}
						local Key3 = Action.key
						
						if not Key3 then
							Count += 1
							Key3 = `id-{Text}-{tostring(Count)}`
						end
						config5.key = Key3
						AssignResult = config5
					end
					return Object.assign(StateUtilsModule.push(Tbl, AssignResult), { isTransitioning = Action.immediate ~= true })
				else
					if Tbl.index == Index1 and not Action.params then
						return nil
					end
					local SliceResult = Array.slice(Tbl.routes, 1, Index1 + 1)
					
					if Action.params then
						local Route3 = Tbl.routes[Index1]
						SliceResult[Index1] = Object.assign(table.clone(Route3), {
							params = if Action.params == Object.None then Object.None elseif Route3.params then Object.assign(table.clone(Route3.params), Action.params) else table.clone(Action.params)
						})
					end
					return Object.assign(table.clone(Tbl), {
						isTransitioning = if Tbl.index == Index1 then Tbl.isTransitioning else Action.immediate ~= true,
						index = Index1,
						routes = SliceResult
					})
				end
			else
				if Action.type == config.Push and ReduceResult[Action.routeName] == nil then
					return Tbl
				end
				if Action.type == config.Navigate or Action.type == config.Push then
					local Tbl1 = nil
					for RouteName in ReduceResult do
						if Routers[RouteName] == nil and ReduceResult[RouteName] ~= nil then
							local ScreenForRouteName = GetScreenForRouteNameFunction(ReduceResult, RouteName)
							
							if typeof(ScreenForRouteName) == "table" and ScreenForRouteName.router then
								Routers[RouteName] = ScreenForRouteName.router
							else
								Routers[RouteName] = false
							end
						end
						local Router = Routers[RouteName]
						
						if Router then
							local StateForAction4 = Router.getStateForAction(RoactNavigationModule.Actions.init())
							local StateForAction5 = Router.getStateForAction(Action, StateForAction4)
							Tbl1 = nil
							
							if StateForAction5 == nil then
								Tbl1 = StateForAction4
							elseif StateForAction5 ~= StateForAction4 then
								Tbl1 = StateForAction5
							end
							if Tbl1 then
								local AssignFunction2 = Object.assign
								local Copy1 = table.clone(Tbl1)
								local config6 = { routeName = RouteName }
								local Key4 = Action.key
								
								if not Key4 then
									Count += 1
									Key4 = `id-{Text}-{tostring(Count)}`
								end
								config6.key = Key4
								
								return Object.assign(StateUtilsModule.push(Tbl, (AssignFunction2(Copy1, config6))), { isTransitioning = Action.immediate ~= true })
							end
						end
					end
				end
				if Action.type == config.PopToTop then
					return if Action.key and Tbl.key ~= Action.key then Tbl elseif Tbl.index > 1 then Object.assign(table.clone(Tbl), {
						index = 1,
						isTransitioning = Action.immediate ~= true,
						routes = { Tbl.routes[1] }
					}) else Tbl
				end
				if Action.type == config.Replace then
					local CountRoutes = if Action.key == nil and #Tbl.routes > 0 then #Tbl.routes else Array.findIndex(Tbl.routes, function(p3): boolean
						-- upvalues: Action (copy)
						return p3.key == Action.key
					end)
					
					if CountRoutes > 0 then
						local RouteName1 = Action.routeName
						
						if Routers[RouteName1] == nil and ReduceResult[RouteName1] ~= nil then
							local ScreenForRouteName = GetScreenForRouteNameFunction(ReduceResult, RouteName1)
							
							if typeof(ScreenForRouteName) == "table" and ScreenForRouteName.router then
								Routers[RouteName1] = ScreenForRouteName.router
							else
								Routers[RouteName1] = false
							end
						end
						local Router1 = Routers[RouteName1]
						local Copy = table.clone(Tbl.routes)
						local AssignFunction = Object.assign
						local config1 = {
							params = if Action.params == Object.None then nil else Action.params
						}
						local StateForAction = if Router1 then Router1.getStateForAction(Action.action or RoactNavigationModule.Actions.init({
							params = if Action.params == Object.None then nil else Action.params
						})) else {}
						local config2 = { routeName = Action.routeName }
						local Text1 = Action.newKey
						
						if not Text1 then
							Count += 1
							Text1 = `id-{Text}-{tostring(Count)}`
						end
						config2.key = Text1
						Copy[CountRoutes] = AssignFunction(config1, StateForAction, config2)
						
						return Object.assign(table.clone(Tbl), { routes = Copy })
					end
				end
				if Action.type == config.CompleteTransition and (Action.key == nil or Action.key == Tbl.key) and (Action.toChildKey == Tbl.routes[Tbl.index].key and Tbl.isTransitioning) then
					return Object.assign(table.clone(Tbl), { isTransitioning = false })
				end
				if Action.type == config.SetParams then
					local Key = Action.key
					local Index: number = Array.findIndex(Tbl.routes, function(p3): boolean
						-- upvalues: Key (copy)
						return p3.key == Key
					end)
					
					if Index > 0 then
						local Route4 = Tbl.routes[Index]
						local Copy2 = table.clone(Tbl.routes)
						Copy2[Index] = Object.assign(table.clone(Route4), {
							params = if Action.params == Object.None then Object.None elseif Route4.params and Action.params then Object.assign(table.clone(Route4.params), Action.params) elseif Route4.params then table.clone(Route4.params) elseif Action.params then table.clone(Action.params) else {}
						})
						
						return Object.assign(table.clone(Tbl), { routes = Copy2 })
					end
				end
				if Action.type == config.Reset then
					return if Action.key == nil or Action.key == Tbl.key then Object.assign(table.clone(Tbl), {
						routes = if Action.actions then Array.map(Action.actions, function(AssignResult)
							-- upvalues: Routers (upval), ReduceResult (upval), GetScreenForRouteNameFunction (upval), RoactNavigationModule (upval), Object (upval), Count (upval), Text (upval)
							local RouteName = AssignResult.routeName
							
							if Routers[RouteName] == nil and ReduceResult[RouteName] ~= nil then
								local ScreenForRouteName = GetScreenForRouteNameFunction(ReduceResult, RouteName)
								
								if typeof(ScreenForRouteName) == "table" and ScreenForRouteName.router then
									Routers[RouteName] = ScreenForRouteName.router
								else
									Routers[RouteName] = false
								end
							end
							local Router = Routers[RouteName]
							local AssignFunction = Object.assign
							local config = {
								params = if AssignResult.params == Object.None then nil else AssignResult.params
							}
							local StateForAction = if Router then Router.getStateForAction(AssignResult.action or RoactNavigationModule.Actions.init({
								params = if AssignResult.params == Object.None then nil else AssignResult.params
							})) else {}
							local config1 = { routeName = AssignResult.routeName }
							local Key = AssignResult.key
							
							if not Key then
								Count += 1
								Key = `id-{Text}-{tostring(Count)}`
							end
							config1.key = Key
							
							return AssignFunction(config, StateForAction, config1)
						end) else {},
						index = Action.index
					}) else Tbl
				end
				if Action.type == config.Back or Action.type == config.Pop then
					local Key5 = Action.key
					local N = Action.n
					local Immediate = Action.immediate
					local Prune = Action.prune
					
					if Action.type == config.Pop and (Prune == false and Key5) then
						local Index: number = Array.findIndex(Tbl.routes, function(p3): boolean
							-- upvalues: Key5 (copy)
							return p3.key == Key5
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
						local Index2 = Tbl.index
						
						if Action.type == config.Pop and N ~= nil then
							Index2 = math.max(2, Tbl.index - N + 1)
						elseif Key5 then
							Index2 = Array.findIndex(Tbl.routes, function(p3): boolean
								-- upvalues: Key5 (copy)
								return p3.key == Key5
							end)
						end
						if Index2 > 1 then
							return Object.assign(table.clone(Tbl), {
								routes = Array.slice(Tbl.routes, 1, Index2),
								index = Index2 - 1,
								isTransitioning = Immediate ~= true
							})
						end
					end
				end
				local Key1 = Action.key
				local IndexOfResult = if Key1 then StateUtilsModule.indexOf(Tbl, Key1) else nil
				local Route5 = nil
				local StateForAction1 = nil
				for i1 = #Tbl.routes, 1, -1 do
					Route5 = Tbl.routes[i1]
					
					if Route5.key ~= Route1.key and (IndexOfResult == 1 or Route5.key == Key1) then
						local RouteName2 = Route5.routeName
						
						if Routers[RouteName2] == nil and ReduceResult[RouteName2] ~= nil then
							local ScreenForRouteName = GetScreenForRouteNameFunction(ReduceResult, RouteName2)
							
							if typeof(ScreenForRouteName) == "table" and ScreenForRouteName.router then
								Routers[RouteName2] = ScreenForRouteName.router
							else
								Routers[RouteName2] = false
							end
						end
						local Router2 = Routers[RouteName2]
						
						if Router2 then
							StateForAction1 = Router2.getStateForAction(Action, Route5)
							
							if StateForAction1 == nil then
								return Tbl
							end
							if StateForAction1 ~= Route5 then
								return StateUtilsModule.replaceAt(Tbl, Route5.key, StateForAction1, Action.preserveFocus)
							end
						end
					end
				end
				return Tbl
			end
		end,
		getComponentForRouteName = function(p3)
			-- upvalues: GetScreenForRouteNameFunction (upval), ReduceResult (copy)
			return GetScreenForRouteNameFunction(ReduceResult, p3)
		end,
		getActionCreators = function(p3, Key)
			-- upvalues: P3 (copy), Object (upval), RoactNavigationModule (upval), DEV (upval)
			return Object.assign(table.clone((P3.getCustomActionCreators or function()
				return {}
			end)(p3, Key)), {
				pop = function(p4, p5)
					-- upvalues: RoactNavigationModule (upval), Object (upval)
					return RoactNavigationModule.StackActions.pop(Object.assign({ n = p4 }, p5 or {}))
				end,
				popToTop = function(p4)
					-- upvalues: RoactNavigationModule (upval)
					return RoactNavigationModule.StackActions.popToTop(p4)
				end,
				push = function(RouteName, Params, Action)
					-- upvalues: RoactNavigationModule (upval)
					return RoactNavigationModule.StackActions.push({ routeName = RouteName, params = Params, action = Action })
				end,
				replace = function(RouteName, Params, Action, NewKey)
					-- upvalues: RoactNavigationModule (upval), p3 (copy), DEV (upval)
					if typeof(RouteName) == "string" then
						return RoactNavigationModule.StackActions.replace({
							routeName = RouteName,
							params = Params,
							action = Action,
							key = p3.key,
							newKey = NewKey
						})
					end
					if DEV then
						assert(typeof(RouteName) == "table", "replaceWith must be a table or string")
						assert(Params == nil, "params must not be provided to .replace() when specifying a table")
						assert(Action == nil, "Child action must not be provided to .replace() when specifying a table")
						assert(NewKey == nil, "newKey must not be provided to .replace() when specifying a table")
					end
					return RoactNavigationModule.StackActions.replace(RouteName)
				end,
				reset = function(Actions, p4)
					-- upvalues: RoactNavigationModule (upval), Key (copy)
					return RoactNavigationModule.StackActions.reset({
						actions = Actions,
						index = if p4 == nil then #Actions else p4,
						key = Key
					})
				end,
				dismiss = function()
					-- upvalues: RoactNavigationModule (upval), Key (copy)
					return RoactNavigationModule.Actions.back({ key = Key })
				end
			})
		end,
		getScreenOptions = CreateConfigGetterFunction(ReduceResult, P3.defaultNavigationOptions)
	}
end