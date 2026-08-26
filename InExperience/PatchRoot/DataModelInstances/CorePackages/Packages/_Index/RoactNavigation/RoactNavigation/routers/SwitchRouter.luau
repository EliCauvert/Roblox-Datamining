local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local navigationActionsModule = require(parent.NavigationActions)
local backBehaviorModule = require(parent.BackBehavior)
local getScreenForRouteNameModule = require(script.Parent.getScreenForRouteName)
local createConfigGetterModule = require(script.Parent.createConfigGetter)
local validateRouteConfigMapModule = require(script.Parent.validateRouteConfigMap)
local validateRouteConfigArrayModule = require(script.Parent.validateRouteConfigArray)
local invariantModule = require(parent.utils.invariant)
local stackActionsModule = require(parent.routers.StackActions)
local switchActionsModule = require(script.Parent.SwitchActions)
local createPathParser = require(script.Parent.pathUtils).createPathParser

local function defaultActionCreators()
	return {}
end

local function mapToRouteName(p1)
	return next(p1)
end

local function foldToRoutes(p1, p2)
	local var1, var2 = next(p2)
	p1[var1] = var2
	
	return p1
end

return function(p1, p2)
	-- upvalues: validateRouteConfigArrayModule (ref), validateRouteConfigMapModule (ref), array (ref), foldToRoutes (ref), mapToRouteName (ref), defaultActionCreators (ref), backBehaviorModule (ref), getScreenForRouteNameModule (ref), object (ref), createPathParser (ref), navigationActionsModule (ref), createConfigGetterModule (ref), switchActionsModule (ref), stackActionsModule (ref), invariantModule (ref)
	validateRouteConfigArrayModule(p1)
	p2 = p2 or {}
	local var1 = validateRouteConfigMapModule(array.reduce(p1, foldToRoutes, {}))
	local order = p2.order or array.map(p1, mapToRouteName)
	local getCustomActionCreators = p2.getCustomActionCreators or defaultActionCreators
	local initialRouteParams = p2.initialRouteParams
	local initialRouteName = p2.initialRouteName or order[1]
	local backBehavior = p2.backBehavior or backBehaviorModule.None
	local var2 = if p2.resetOnBlur ~= nil then p2.resetOnBlur else true
	local var3 = array.indexOf(order, initialRouteName)
	
	if var3 < 1 then
		error(("Invalid initialRouteName '%s'. Should be one of %s"):format(initialRouteName, table.concat(array.map(order, function(p3)
			return ("\"%s\""):format(p3)
		end), ", ")), 2)
	end
	local t = {}
	
	for i, v in order do
		local getNextState = getScreenForRouteNameModule(var1, v)
		
		if type(getNextState) == "table" and getNextState.router then
			t[v] = getNextState.router
		else
			t[v] = false
		end
	end
	local function _(p3, p4)
		-- upvalues: var1 (ref), object (copy)
		local var4 = var1[p3]
		
		return if not (type(var4) ~= "table" or not var4.params) then if p4 then object.assign(table.clone(var4.params), p4) else table.clone(var4.params) else p4
	end
	
	local var4 = createPathParser(t, var1, p2)
	local getPathAndParamsForRoute = var4.getPathAndParamsForRoute
	local getActionForPathAndParams = var4.getActionForPathAndParams
	
	local function resetChildRoute(value)
		-- upvalues: initialRouteName (ref), initialRouteParams (ref), var1 (ref), object (copy), t (ref), navigationActionsModule (copy)
		local var5 = if value == initialRouteName then initialRouteParams else nil
		local var6 = var1[value]
		local var7 = if type(var6) == "table" and var6.params then if var5 then object.assign(table.clone(var6.params), var5) else table.clone(var6.params) else var5
		var6 = t[value]
		
		return if var6 then object.assign(table.clone(var6.getStateForAction(navigationActionsModule.init())), { key = value, routeName = value, params = var7 }) else { key = value, routeName = value, params = var7 }
	end
	
	local function getNextState(p3, p4, p5)
		-- upvalues: var2 (write), resetChildRoute (ref), object (copy), backBehavior (ref), backBehaviorModule (copy), navigationActionsModule (copy), array (copy)
		local var5 = p5
		
		if p4 and p5 and (p4.index ~= p5.index and var2) then
			local cloned = table.clone(p5.routes)
			cloned[p4.index] = resetChildRoute(p4.routes[p4.index].routeName)
			var5 = object.assign(table.clone(p5), { routes = cloned })
		end
		if backBehavior ~= backBehaviorModule.History or p4 and var5 and var5.index == p4.index then
			return var5
		end
		local var6 = if p4 then p4.routeKeyHistory else {}
		
		if p3.type == navigationActionsModule.Navigate then
			local key = var5.routes[var5.index].key
			var6 = array.filter(var6, function(p6)
				-- upvalues: key (ref)
				return p6 ~= key
			end)
			table.insert(var6, key)
		elseif p3.type == navigationActionsModule.Back then
			var6 = table.clone(var6)
			table.remove(var6, #var6)
		end
		return object.assign(table.clone(var5), { routeKeyHistory = var6 })
	end
	
	local function getInitialState()
		-- upvalues: array (copy), order (ref), resetChildRoute (ref), var3 (ref), backBehavior (ref), backBehaviorModule (copy)
		local var5 = array.map(order, resetChildRoute)
		local t = { routes = var5, index = var3 }
		
		if backBehavior == backBehaviorModule.History then
			t.routeKeyHistory = { var5[var3].key }
		end
		return t
	end
	
	return {
		childRouters = t,
		getActionCreators = function(p3, p4)
			-- upvalues: getCustomActionCreators (ref)
			return getCustomActionCreators(p3, p4)
		end,
		getScreenOptions = createConfigGetterModule(var1, p2.defaultNavigationOptions),
		getStateForAction = function(p3, p4)
			-- upvalues: getInitialState (ref), navigationActionsModule (copy), array (copy), initialRouteName (ref), initialRouteParams (ref), object (copy), switchActionsModule (copy), getNextState (ref), t (ref), order (ref), backBehavior (ref), backBehaviorModule (copy), var3 (ref), stackActionsModule (copy)
			local var5 = if p4 then table.clone(p4) else nil
			p4 = p4 or getInitialState()
			local index = p4.index
			
			if p3.type == navigationActionsModule.Init then
				local params = p3.params
				
				if params then
					p4.routes = array.map(p4.routes, function(p5)
						-- upvalues: initialRouteName (copy), initialRouteParams (copy), object (copy), params (ref)
						local var6 = if p5.routeName == initialRouteName then initialRouteParams else {}
						
						return object.assign(table.clone(p5), {
							params = if p5.params then object.assign(table.clone(p5.params), params, var6) else object.assign(table.clone(params), var6)
						})
					end)
				end
			end
			if p3.type == switchActionsModule.JumpTo and (p3.key == nil or p3.key == p4.key) then
				local params = p3.params
				local var6 = array.findIndex(p4.routes, function(p5)
					-- upvalues: p3 (ref)
					return p5.routeName == p3.routeName
				end)
				
				if var6 < 1 then
					error(("There is no route named '%s' in the navigator with the key '%s'.\n"):format(p3.routeName, p3.key) .. "Must be one of: " .. table.concat(array.map(p4.routes, function(p5)
						return p5.routeName
					end), ","))
				end
				return if params then p4.routes.map(function(p5, p6)
					-- upvalues: var6 (ref), object (copy), params (ref)
					return if p6 == var6 then object.assign(table.clone(p5), { params = object.assign(table.clone(p5.params), params) }) else p5
				end) else getNextState(p3, var5, object.assign(table.clone(p4), { routes = p4.routes, index = var6 }))
			else
				local index_1 = p4.routes[p4.index]
				local index_2 = t[order[p4.index]]
				
				if index_2 then
					local stateForAction = index_2.getStateForAction(p3, index_1)
					
					if not stateForAction and p4 then
						return nil
					elseif stateForAction and stateForAction ~= index_1 then
						local cloned = table.clone(p4.routes)
						cloned[p4.index] = stateForAction
						
						return getNextState(p3, var5, object.assign(table.clone(p4), { routes = cloned }))
					end
				end
				local var7 = if p3.key ~= nil then p3.key == index_1.key else true
				
				if p3.type == navigationActionsModule.Back then
					if var7 and backBehavior == backBehaviorModule.InitialRoute then
						index = var3
					elseif var7 and backBehavior == backBehaviorModule.Order then
						index = math.max(1, index - 1)
					elseif var7 and backBehavior == backBehaviorModule.History and #p4.routeKeyHistory > 1 then
						index = array.indexOf(order, p4.routeKeyHistory[#p4.routeKeyHistory - 1])
					end
				end
				local var8 = false
				
				if p3.type == navigationActionsModule.Navigate then
					var8 = array.find(order, function(p5, p6)
						-- upvalues: p3 (ref), index (write)
						if p5 == p3.routeName then
							index = p6
							
							return true
						end
						return false
					end) ~= nil
					
					if var8 then
						local var9 = p4.routes[index]
						local routeName = t[p3.routeName]
						local var10 = var9
						
						if p3.action and routeName then
							local var11
							local stateForAction = routeName.getStateForAction(p3.action, var9)
							
							if stateForAction then
								var10 = stateForAction
							end
						end
						if p3.params then
							var10 = object.assign(table.clone(var10), {
								params = if p3.params == object.None then object.None elseif var10.params then object.assign(table.clone(var10.params), p3.params) else table.clone(p3.params)
							})
						end
						if var10 ~= var9 then
							local cloned = table.clone(p4.routes)
							cloned[index] = var10
							
							return getNextState(p3, var5, object.assign(table.clone(p4), { routes = cloned, index = index }))
						elseif var10 == var9 and p4.index == index and var5 then
							return nil
						elseif p3.type == navigationActionsModule.SetParams then
							local key = p3.key
							local var12 = array.findIndex(p4.routes, function(p5)
								-- upvalues: key (ref)
								return p5.key == key
							end)
							
							if var12 > 0 then
								var11 = p4.routes[var12]
								local none = object.None
								
								if p3.params ~= object.None then
									none = if var11.params and p3.params then object.assign(table.clone(var11.params), p3.params) elseif var11.params then table.clone(var11.params) elseif p3.params then table.clone(p3.params) else {}
								end
								local cloned = table.clone(p4.routes)
								cloned[var12] = object.assign(table.clone(var11), { params = none })
								
								return getNextState(p3, var5, object.assign(table.clone(p4), { routes = cloned }))
							elseif index ~= p4.index then
								return getNextState(p3, var5, object.assign(table.clone(p4), { index = index }))
							elseif var8 and not p4 then
								return p4
							elseif var8 then
								return table.clone(p4)
							elseif not (if p3.type ~= navigationActionsModule.Back then if p3.type ~= stackActionsModule.Pop then p3.type == stackActionsModule.PopToTop else true else true) or (p3.type == navigationActionsModule.Back and p3.key ~= nil) then
								var11 = p4.index
								local routes = p4.routes
								array.find(order, function(p5, p6)
									-- upvalues: t (copy), var11 (write), routes (write), p3 (ref)
									local var13 = t[p5]
									
									if p6 == var11 then
										return false
									end
									local var14 = routes[p6]
									
									if var13 then
										var14 = var13.getStateForAction(p3, var14)
									end
									if not var14 then
										var11 = p6
										
										return true
									elseif var14 == routes[p6] then
										return false
									end
									routes = table.clone(routes)
									routes[p6] = var14
									var11 = p6
									
									return true
								end)
								
								if p3.preserveFocus then
									var11 = p4.index
								end
								return if var11 == p4.index and routes == p4.routes then p4 else getNextState(p3, var5, object.assign(table.clone(p4), { index = var11, routes = routes }))
							end
						end
					end
				end
			end
		end,
		getComponentForState = function(p3)
			-- upvalues: invariantModule (copy), t (ref), getScreenForRouteNameModule (copy), var1 (ref)
			local routeName = (p3.routes[p3.index] or {}).routeName
			invariantModule(routeName, "There is no route defined for index '%d'. Check that you passed in a navigation state with a valid tab/screen index.", p3.index)
			local var5 = t[routeName]
			
			return if var5 then var5.getComponentForState(p3.routes[p3.index]) else getScreenForRouteNameModule(var1, routeName)
		end,
		getComponentForRouteName = function(p3)
			-- upvalues: getScreenForRouteNameModule (copy), var1 (ref)
			return getScreenForRouteNameModule(var1, p3)
		end,
		getPathAndParamsForState = function(p3)
			-- upvalues: getPathAndParamsForRoute (ref)
			return getPathAndParamsForRoute(p3.routes[p3.index])
		end,
		getActionForPathAndParams = function(p3, p4)
			-- upvalues: getActionForPathAndParams (ref)
			return getActionForPathAndParams(p3, p4)
		end
	}
end