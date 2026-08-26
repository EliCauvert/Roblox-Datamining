local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local navigationActionsModule = require(parent.NavigationActions)
local stackActionsModule = require(script.Parent.StackActions)
local keyGeneratorModule = require(parent.utils.KeyGenerator)
local stateUtilsModule = require(parent.StateUtils)
local getScreenForRouteNameModule = require(script.Parent.getScreenForRouteName)
local createConfigGetterModule = require(script.Parent.createConfigGetter)
local validateRouteConfigArrayModule = require(script.Parent.validateRouteConfigArray)
local validateRouteConfigMapModule = require(script.Parent.validateRouteConfigMap)
local invariantModule = require(parent.utils.invariant)
local createPathParser = require(script.Parent.pathUtils).createPathParser
local unknownModule = require(script.Parent["ChildIsScreenRouterSymbol.roblox"])

local var1 = function()
	return {}
end

local function _(p1)
	-- upvalues: navigationActionsModule (ref), stackActionsModule (ref)
	return if p1.type ~= navigationActionsModule.Navigate then p1.type == stackActionsModule.Push else true
end

local _ = function(value)
	-- upvalues: stackActionsModule (ref)
	return value.type == stackActionsModule.Reset and value.key == nil
end

local function mapToRouteName(p1)
	return next(p1)
end

local function foldToRoutes(p1, p2, _)
	local var2, var3 = next(p2)
	p1[var2] = var3
	
	return p1
end

return function(p1, p2)
	-- upvalues: validateRouteConfigArrayModule (ref), validateRouteConfigMapModule (ref), array (ref), foldToRoutes (ref), mapToRouteName (ref), unknownModule (ref), var1 (ref), navigationActionsModule (ref), stackActionsModule (ref), object (ref), keyGeneratorModule (ref), createPathParser (ref), invariantModule (ref), getScreenForRouteNameModule (ref), stateUtilsModule (ref), createConfigGetterModule (ref)
	validateRouteConfigArrayModule(p1)
	p2 = p2 or {}
	local var2 = validateRouteConfigMapModule(array.reduce(p1, foldToRoutes, {}))
	local order = p2.order or array.map(p1, mapToRouteName)
	local t = {}
	
	for i, v in order do
		local var3 = var2[v]
		local getParamsForRouteAndAction = if type(var3) == "table" and var3.screen then var3.screen else var3
		
		if type(getParamsForRouteAndAction) == "table" and getParamsForRouteAndAction.router then
			t[v] = getParamsForRouteAndAction.router
		else
			t[v] = unknownModule
		end
	end
	local initialRouteParams = p2.initialRouteParams
	local getCustomActionCreators = p2.getCustomActionCreators or var1
	local initialRouteName = p2.initialRouteName or order[1]
	local var4 = t[initialRouteName]
	
	if array.indexOf(order, initialRouteName) < 1 then
		local var3 = ""
		
		for i_1, v_1 in order do
			var3 ..= v_1 .. ","
		end
		error(string.format("Invalid initialRouteName '%s'. Must be one of [%s]", initialRouteName, var3), 2)
	end
	local function var22(p3)
		-- upvalues: t (ref), navigationActionsModule (copy), stackActionsModule (copy), unknownModule (copy), object (copy), keyGeneratorModule (copy), var4 (ref), initialRouteName (ref), initialRouteParams (ref), var2 (ref), p2 (write)
		local t_1 = {}
		local routeName = t[p3.routeName]
		local var5 = if p3.type ~= navigationActionsModule.Navigate then p3.type == stackActionsModule.Push else true
		
		if var5 and routeName ~= nil then
			var5 = {}
			
			if routeName ~= unknownModule then
				var5 = routeName.getStateForAction(p3.action or navigationActionsModule.init({ params = p3.params }))
			end
			return {
				key = "StackRouterRoot",
				isTransitioning = false,
				index = 1,
				routes = {
					object.assign({ params = p3.params }, var5, {
						key = p3.key or keyGeneratorModule.generateKey(),
						routeName = p3.routeName
					})
				}
			}
		elseif var4 ~= nil and var4 ~= unknownModule then
			t_1 = var4.getStateForAction(navigationActionsModule.navigate({
				routeName = initialRouteName,
				params = initialRouteParams
			}))
		end
		local var6
		local var7 = var2[initialRouteName]
		local var8 = type(var7) == "table" and var7.params
		
		if not var8 and not t_1.params and not p3.params then
			var6 = initialRouteParams
			
			if var6 then
				var6 = object.assign
				var6 = var6(if var8 then table.clone(var8) else {}, t_1.params or {}, p3.params or {}, initialRouteParams or {})
			end
			return {
				key = "StackRouterRoot",
				isTransitioning = false,
				index = 1,
				routes = {
					object.assign(table.clone(t_1), {
						params = var6,
						routeName = initialRouteName,
						key = p3.key or (p2.initialRouteKey or keyGeneratorModule.generateKey())
					})
				}
			}
		end
	end
	
	local function getParamsForRouteAndAction(p3, p4)
		-- upvalues: object (copy), var2 (ref)
		if p4.params == object.None then
			return nil
		end
		local var5 = var2[p3]
		
		return if type(var5) == "table" and var5.params then object.assign(table.clone(var5.params), p4.params) elseif p4.params then object.assign({}, p4.params) else nil
	end
	
	local var5 = createPathParser(t, var2, p2)
	local getPathAndParamsForRoute = var5.getPathAndParamsForRoute
	local getActionForPathAndParams = var5.getActionForPathAndParams
	local t_1 = {}
	
	for i_1, v_1 in t do
		if v_1 ~= unknownModule then
			t_1[i_1] = v_1
		end
	end
	return {
		childRouters = t_1,
		_CHILD_IS_SCREEN = unknownModule,
		getComponentForState = function(p3)
			-- upvalues: invariantModule (copy), t (ref), unknownModule (copy), getScreenForRouteNameModule (copy), var2 (ref)
			local index = p3.routes[p3.index] or {}
			local routeName = index.routeName
			invariantModule(routeName, "There is no route defined for index '%d'. Make sure that you passed in a navigation state with a valid stack index.", p3.index)
			local var6 = t[routeName]
			
			return if var6 == nil or var6 == unknownModule then getScreenForRouteNameModule(var2, routeName) else t[routeName].getComponentForState(index)
		end,
		getComponentForRouteName = function(p3)
			-- upvalues: getScreenForRouteNameModule (copy), var2 (ref)
			return getScreenForRouteNameModule(var2, p3)
		end,
		getActionCreators = function(p3, p4)
			-- upvalues: object (copy), getCustomActionCreators (ref), stackActionsModule (copy), invariantModule (copy), navigationActionsModule (copy)
			return object.assign(table.clone(getCustomActionCreators(p3, p4)), {
				pop = function(p5, p6)
					-- upvalues: stackActionsModule (copy), object (copy)
					return stackActionsModule.pop(object.assign({ n = p5 }, p6 or {}))
				end,
				popToTop = function(p5)
					-- upvalues: stackActionsModule (copy)
					return stackActionsModule.popToTop(p5)
				end,
				push = function(p5, p6, p7)
					-- upvalues: stackActionsModule (copy)
					return stackActionsModule.push({ routeName = p5, params = p6, action = p7 })
				end,
				replace = function(p5, p6, p7, p8)
					-- upvalues: stackActionsModule (copy), p3 (ref), invariantModule (copy)
					if type(p5) == "string" then
						return stackActionsModule.replace({
							routeName = p5,
							params = p6,
							action = p7,
							key = p3.key,
							newKey = p8
						})
					end
					invariantModule(type(p5) == "table", "replaceWith must be a table or string")
					invariantModule(p6 == nil, "params must not be provided to .replace() when specifying a table")
					invariantModule(p7 == nil, "Child action must not be provided to .replace() when specifying a table")
					invariantModule(p8 == nil, "newKey must not be provided to .replace() when specifying a table")
					
					return stackActionsModule.replace(p5)
				end,
				reset = function(value, p5)
					-- upvalues: stackActionsModule (copy), p4 (ref)
					return stackActionsModule.reset({
						actions = value,
						index = if p5 == nil then #value else p5,
						key = p4
					})
				end,
				dismiss = function()
					-- upvalues: navigationActionsModule (copy), p4 (ref)
					return navigationActionsModule.back({ key = p4 })
				end
			})
		end,
		getStateForAction = function(p3, p4)
			-- upvalues: var3 (ref), stackActionsModule (copy), navigationActionsModule (copy), t (ref), unknownModule (copy), stateUtilsModule (copy), object (copy), invariantModule (copy), array (copy), getParamsForRouteAndAction (ref), keyGeneratorModule (copy)
			if not p4 then
				return var3(p3)
			end
			local var6, stateForAction
			local index = p4.routes[p4.index]
			
			if not (p3.type == stackActionsModule.Reset and p3.key == nil) and p3.type ~= navigationActionsModule.Navigate then
				local routeName = t[index.routeName]
				
				if routeName ~= nil and routeName ~= unknownModule then
					local stateForAction = routeName.getStateForAction(p3, index)
					
					if stateForAction ~= nil and stateForAction ~= index then
						return stateUtilsModule.replaceAt(p4, index.key, stateForAction, p3.type == navigationActionsModule.SetParams)
					end
				end
			elseif p3.type == navigationActionsModule.Navigate then
				for i = #p4.routes, 1, -1 do
					var6 = p4.routes[i]
					local routeName = t[var6.routeName]
					local var7 = if p3.routeName == var6.routeName and p3.action then p3.action else p3
					
					if routeName ~= nil and routeName ~= unknownModule then
						stateForAction = routeName.getStateForAction(var7, var6)
						
						if stateForAction ~= nil and stateForAction == var6 then
							continue
						end
						local var8 = stateUtilsModule.replaceAndPrune(p4, if stateForAction then stateForAction.key else var6.key, stateForAction or var6)
						
						return object.assign(table.clone(var8), {
							isTransitioning = if p4.index ~= var8.index then p3.immediate ~= true else p4.isTransitioning
						})
					end
				end
			end
			local var9 = if p3.type ~= navigationActionsModule.Navigate then p3.type == stackActionsModule.Push else true
			
			if var9 and t[p3.routeName] ~= nil then
				var9 = t[p3.routeName]
				invariantModule(if p3.type == stackActionsModule.Push then p3.key == nil else true, "StackRouter does not support key on the push action")
				local var10 = array.findIndex(p4.routes, if p3.key then function(p5)
					-- upvalues: p3 (ref)
					return p5.key == p3.key
				end else function(p5)
					-- upvalues: p3 (ref)
					return p5.routeName == p3.routeName
				end)
				
				if p3.type == stackActionsModule.Push or var10 <= 0 then
					return object.assign(stateUtilsModule.push(p4, if var9 ~= unknownModule then {
						params = getParamsForRouteAndAction(p3.routeName, p3),
						routeName = p3.routeName,
						key = p3.key or keyGeneratorModule.generateKey()
					} else object.assign({ params = getParamsForRouteAndAction(p3.routeName, p3) }, var9.getStateForAction(p3.action or navigationActionsModule.init({ params = getParamsForRouteAndAction(p3.routeName, p3) })), {
						routeName = p3.routeName,
						key = p3.key or keyGeneratorModule.generateKey()
					})), { isTransitioning = p3.immediate ~= true })
				elseif p4.index == var10 and not p3.params then
					return nil
				end
				var6 = array.slice(p4.routes, 1, var10 + 1)
				
				if p3.params then
					local var11 = p4.routes[var10]
					var6[var10] = object.assign(table.clone(var11), {
						params = if p3.params == object.None then object.None elseif not var11.params then table.clone(p3.params) else object.assign(table.clone(var11.params), p3.params)
					})
				end
				return object.assign(table.clone(p4), {
					isTransitioning = if p4.index ~= var10 then p3.immediate ~= true else p4.isTransitioning,
					index = var10,
					routes = var6
				})
			elseif p3.type == stackActionsModule.Push and t[p3.routeName] == nil then
				return p4
			elseif if p3.type ~= navigationActionsModule.Navigate then p3.type == stackActionsModule.Push else true then
				for var6 in t do
					local var12 = t[var6]
					
					if var12 ~= nil and var12 ~= unknownModule then
						stateForAction = var12.getStateForAction(navigationActionsModule.init())
						local stateForAction_1 = var12.getStateForAction(p3, stateForAction)
						local var13 = nil
						
						if stateForAction_1 == nil then
							var13 = stateForAction
						elseif stateForAction_1 ~= stateForAction then
							var13 = stateForAction_1
						end
						if var13 then
							return object.assign(stateUtilsModule.push(p4, object.assign(table.clone(var13), {
								routeName = var6,
								key = p3.key or keyGeneratorModule.generateKey()
							})), { isTransitioning = p3.immediate ~= true })
						end
					end
				end
			end
			if p3.type == stackActionsModule.PopToTop then
				return if p3.key and p4.key ~= p3.key then p4 elseif p4.index > 1 then object.assign(table.clone(p4), {
					index = 1,
					isTransitioning = p3.immediate ~= true,
					routes = { p4.routes[1] }
				}) else p4
			elseif p3.type == stackActionsModule.Replace then
				local var14
				local _ = nil
				local var15 = if p3.key == nil and #p4.routes > 0 then #p4.routes else array.findIndex(p4.routes, function(p5)
					-- upvalues: p3 (ref)
					return p5.key == p3.key
				end)
				
				if var15 > 0 then
					local routeName = t[p3.routeName]
					local t_1 = {}
					
					if routeName ~= nil and routeName ~= unknownModule then
						var6 = p3.action or navigationActionsModule.init({ params = getParamsForRouteAndAction(p3.routeName, p3) })
						t_1 = routeName.getStateForAction(var6)
					end
					var6 = table.clone(p4.routes)
					var6[var15] = object.assign({ params = getParamsForRouteAndAction(p3.routeName, p3) }, t_1, {
						routeName = p3.routeName,
						key = p3.newKey or keyGeneratorModule.generateKey()
					})
					
					return object.assign(table.clone(p4), { routes = var6 })
				elseif p3.type == stackActionsModule.CompleteTransition and (p3.key == nil or p3.key == p4.key) and (p3.toChildKey == p4.routes[p4.index].key and p4.isTransitioning) then
					return object.assign(table.clone(p4), { isTransitioning = false })
				elseif p3.type == navigationActionsModule.SetParams then
					local key = p3.key
					local var16 = array.findIndex(p4.routes, function(p5)
						-- upvalues: key (ref)
						return p5.key == key
					end)
					
					if var16 > 0 then
						var14 = p4.routes[var16]
						var6 = object.None
						
						if p3.params ~= object.None then
							var6 = if var14.params and p3.params then object.assign(table.clone(var14.params), p3.params) elseif var14.params then table.clone(var14.params) elseif p3.params then table.clone(p3.params) else {}
						end
						local cloned = table.clone(p4.routes)
						cloned[var16] = object.assign(table.clone(var14), { params = var6 })
						
						return object.assign(table.clone(p4), { routes = cloned })
					elseif p3.type == stackActionsModule.Reset then
						return if p3.key == nil or p3.key == p4.key then object.assign(table.clone(p4), {
							routes = if p3.actions then array.map(p3.actions, function(p5)
								-- upvalues: t (copy), unknownModule (copy), navigationActionsModule (copy), getParamsForRouteAndAction (copy), object (copy), keyGeneratorModule (copy)
								local routeName = t[p5.routeName]
								local t_1 = {}
								
								if routeName ~= nil and routeName ~= unknownModule then
									t_1 = routeName.getStateForAction(p5.action or navigationActionsModule.init({ params = getParamsForRouteAndAction(p5.routeName, p5) }))
								end
								return object.assign({ params = getParamsForRouteAndAction(p5.routeName, p5) }, t_1, {
									routeName = p5.routeName,
									key = p5.key or keyGeneratorModule.generateKey()
								})
							end) else {},
							index = p3.index
						}) else p4
					elseif p3.type == navigationActionsModule.Back or p3.type == stackActionsModule.Pop then
						local key = p3.key
						local n = p3.n
						var14 = p3.immediate
						var6 = p3.prune
						
						if p3.type == stackActionsModule.Pop and var6 == false and key then
							local var17 = array.findIndex(p4.routes, function(p5)
								-- upvalues: key (ref)
								return p5.key == key
							end)
							
							if var17 > 0 then
								stateForAction = array.concat(array.slice(p4.routes, 1, math.max(var17 - (n or 1), 1) + 1), array.slice(p4.routes, var17 + 1))
								
								if #stateForAction > 0 then
									return object.assign(table.clone(p4), {
										routes = stateForAction,
										index = #stateForAction,
										isTransitioning = var14 ~= true
									})
								end
							end
						else
							local index_1 = p4.index
							
							if p3.type == stackActionsModule.Pop and n ~= nil then
								index_1 = math.max(2, p4.index - n + 1)
							elseif key then
								index_1 = array.findIndex(p4.routes, function(p5)
									-- upvalues: key (ref)
									return p5.key == key
								end)
							end
							if index_1 > 1 then
								return object.assign(table.clone(p4), {
									routes = array.slice(p4.routes, 1, index_1),
									index = index_1 - 1,
									isTransitioning = var14 ~= true
								})
							end
						end
					end
					local var18 = if p3.key then stateUtilsModule.indexOf(p4, p3.key) else nil
					
					for var6 = #p4.routes, 1, -1 do
						local var19 = p4.routes[var6]
						
						if var19.key ~= index.key and (var18 == 1 or var19.key == p3.key) then
							local routeName = t[var19.routeName]
							
							if routeName ~= nil and routeName ~= unknownModule then
								stateForAction = routeName.getStateForAction(p3, var19)
								
								if stateForAction ~= nil then
									if stateForAction == var19 then
										continue
									end
									return stateUtilsModule.replaceAt(p4, var19.key, stateForAction, p3.preserveFocus)
								end
								return p4
							end
						end
					end
					return p4
				end
			end
		end,
		getPathAndParamsForState = function(p5)
			-- upvalues: getPathAndParamsForRoute (ref)
			return getPathAndParamsForRoute(p5.routes[p5.index])
		end,
		getActionForPathAndParams = function(p5, p6)
			-- upvalues: getActionForPathAndParams (ref)
			return getActionForPathAndParams(p5, p6)
		end,
		getScreenOptions = createConfigGetterModule(var2, p2.defaultNavigationOptions)
	}
end