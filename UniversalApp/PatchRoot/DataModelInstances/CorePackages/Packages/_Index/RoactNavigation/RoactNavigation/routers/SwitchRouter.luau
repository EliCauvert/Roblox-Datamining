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

local function defaultActionCreators() --[[ line: 20 ]]
	return {}
end

local function mapToRouteName(p0) --[[ line: 24 ]]
	return next(p0)
end

local function foldToRoutes(p1, p2) --[[ line: 29 ]]
	local var13, var14 = next(p2)
	p1[var13] = var14
	
	return p1
end

return function(p3, p4) --[[ line: 35 ]]
	-- upvalues: validateRouteConfigArrayModule (ref), validateRouteConfigMapModule (ref), array (ref), foldToRoutes (ref), mapToRouteName (ref), defaultActionCreators (ref), backBehaviorModule (ref), getScreenForRouteNameModule (ref), object (ref), createPathParser (ref), navigationActionsModule (ref), createConfigGetterModule (ref), switchActionsModule (ref), stackActionsModule (ref), invariantModule (ref)
	validateRouteConfigArrayModule(p3)
	p4 = p4 or {}
	local var16 = validateRouteConfigMapModule(array.reduce(p3, foldToRoutes, {}))
	local order = p4.order or array.map(p3, mapToRouteName)
	local getCustomActionCreators = p4.getCustomActionCreators or defaultActionCreators
	local initialRouteParams = p4.initialRouteParams
	local initialRouteName = p4.initialRouteName or order[1]
	local backBehavior = p4.backBehavior or backBehaviorModule.None
	local var21 = if p4.resetOnBlur ~= nil then p4.resetOnBlur else true
	local var22 = array.indexOf(order, initialRouteName)
	
	if var22 < 1 then
		error(("Invalid initialRouteName '%s'. Should be one of %s"):format(initialRouteName, table.concat(array.map(order, function(p5) --[[ line: 61 ]]
			return ("\"%s\""):format(p5)
		end), ", ")), 2)
	end
	local t = {}
	
	for i, v in order do
		local getNextState = getScreenForRouteNameModule(var16, v)
		
		if type(getNextState) == "table" and getNextState.router then
			t[v] = getNextState.router
		else
			t[v] = false
		end
	end
	local function _(p6, p7) --[[ line: 80 | named "getParamsForRoute" ]]
		-- upvalues: var16 (ref), object (copy)
		local var28 = var16[p6]
		
		return if not (type(var28) ~= "table" or not var28.params) then if p7 then object.assign(table.clone(var28.params), p7) else table.clone(var28.params) else p7
	end
	
	local var24 = createPathParser(t, var16, p4)
	local getPathAndParamsForRoute = var24.getPathAndParamsForRoute
	local getActionForPathAndParams = var24.getActionForPathAndParams
	
	local function resetChildRoute(value) --[[ line: 95 ]]
		-- upvalues: initialRouteName (ref), initialRouteParams (ref), var16 (ref), object (copy), t (ref), navigationActionsModule (copy)
		local var29 = if value == initialRouteName then initialRouteParams else nil
		local var30 = var16[value]
		local var31 = if type(var30) == "table" and var30.params then if var29 then object.assign(table.clone(var30.params), var29) else table.clone(var30.params) else var29
		var30 = t[value]
		
		return if var30 then object.assign(table.clone(var30.getStateForAction(navigationActionsModule.init())), { key = value, routeName = value, params = var31 }) else { key = value, routeName = value, params = var31 }
	end
	
	local function getNextState(p8, p9, p10) --[[ line: 118 ]]
		-- upvalues: var21 (write), resetChildRoute (ref), object (copy), backBehavior (ref), backBehaviorModule (copy), navigationActionsModule (copy), array (copy)
		local var32 = p10
		
		if p9 and p10 and (p9.index ~= p10.index and var21) then
			local cloned = table.clone(p10.routes)
			cloned[p9.index] = resetChildRoute(p9.routes[p9.index].routeName)
			var32 = object.assign(table.clone(p10), { routes = cloned })
		end
		if backBehavior ~= backBehaviorModule.History or p9 and var32 and var32.index == p9.index then
			return var32
		end
		local var34 = if p9 then p9.routeKeyHistory else {}
		
		if p8.type == navigationActionsModule.Navigate then
			local key = var32.routes[var32.index].key
			var34 = array.filter(var34, function(p11) --[[ line: 136 ]]
				-- upvalues: key (ref)
				return p11 ~= key
			end)
			table.insert(var34, key)
		elseif p8.type == navigationActionsModule.Back then
			var34 = table.clone(var34)
			table.remove(var34, #var34)
		end
		return object.assign(table.clone(var32), { routeKeyHistory = var34 })
	end
	
	local function getInitialState() --[[ line: 148 ]]
		-- upvalues: array (copy), order (ref), resetChildRoute (ref), var22 (ref), backBehavior (ref), backBehaviorModule (copy)
		local var35 = array.map(order, resetChildRoute)
		local t = { routes = var35, index = var22 }
		
		if backBehavior == backBehaviorModule.History then
			t.routeKeyHistory = { var35[var22].key }
		end
		return t
	end
	
	return {
		childRouters = t,
		getActionCreators = function(p12, p13) --[[ line: 165 ]]
			-- upvalues: getCustomActionCreators (ref)
			return getCustomActionCreators(p12, p13)
		end,
		getScreenOptions = createConfigGetterModule(var16, p4.defaultNavigationOptions),
		getStateForAction = function(p14, p15) --[[ line: 171 ]]
			-- upvalues: getInitialState (ref), navigationActionsModule (copy), array (copy), initialRouteName (ref), initialRouteParams (ref), object (copy), switchActionsModule (copy), getNextState (ref), t (ref), order (ref), backBehavior (ref), backBehaviorModule (copy), var22 (ref), stackActionsModule (copy)
			local var37 = if p15 then table.clone(p15) else nil
			p15 = p15 or getInitialState()
			local index = p15.index
			
			if p14.type == navigationActionsModule.Init then
				local params = p14.params
				
				if params then
					p15.routes = array.map(p15.routes, function(p16) --[[ line: 181 ]]
						-- upvalues: initialRouteName (copy), initialRouteParams (copy), object (copy), params (ref)
						local var51 = if p16.routeName == initialRouteName then initialRouteParams else {}
						
						return object.assign(table.clone(p16), {
							params = if p16.params then object.assign(table.clone(p16.params), params, var51) else object.assign(table.clone(params), var51)
						})
					end)
				end
			end
			if p14.type == switchActionsModule.JumpTo and (p14.key == nil or p14.key == p15.key) then
				local params = p14.params
				local var50 = array.findIndex(p15.routes, function(p17) --[[ line: 194 ]]
					-- upvalues: p14 (ref)
					return p17.routeName == p14.routeName
				end)
				
				if var50 < 1 then
					error(("There is no route named '%s' in the navigator with the key '%s'.\n"):format(p14.routeName, p14.key) .. "Must be one of: " .. table.concat(array.map(p15.routes, function(p18) --[[ line: 206 ]]
						return p18.routeName
					end), ","))
				end
				return if params then p15.routes.map(function(p19, p20) --[[ line: 216 ]]
					-- upvalues: var50 (ref), object (copy), params (ref)
					return if p20 == var50 then object.assign(table.clone(p19), { params = object.assign(table.clone(p19.params), params) }) else p19
				end) else getNextState(p14, var37, object.assign(table.clone(p15), { routes = p15.routes, index = var50 }))
			else
				local index_1 = p15.routes[p15.index]
				local index_2 = t[order[p15.index]]
				
				if index_2 then
					local stateForAction = index_2.getStateForAction(p14, index_1)
					
					if not stateForAction and p15 then
						return nil
					elseif stateForAction and stateForAction ~= index_1 then
						local cloned = table.clone(p15.routes)
						cloned[p15.index] = stateForAction
						
						return getNextState(p14, var37, object.assign(table.clone(p15), { routes = cloned }))
					end
				end
				local var41 = if p14.key ~= nil then p14.key == index_1.key else true
				
				if p14.type == navigationActionsModule.Back then
					if var41 and backBehavior == backBehaviorModule.InitialRoute then
						index = var22
					elseif var41 and backBehavior == backBehaviorModule.Order then
						index = math.max(1, index - 1)
					elseif var41 and backBehavior == backBehaviorModule.History and #p15.routeKeyHistory > 1 then
						index = array.indexOf(order, p15.routeKeyHistory[#p15.routeKeyHistory - 1])
					end
				end
				local var42 = false
				
				if p14.type == navigationActionsModule.Navigate then
					var42 = array.find(order, function(p21, p22) --[[ line: 274 ]]
						-- upvalues: p14 (ref), index (write)
						if p21 == p14.routeName then
							index = p22
							
							return true
						end
						return false
					end) ~= nil
					
					if var42 then
						local var43 = p15.routes[index]
						local routeName = t[p14.routeName]
						local var44 = var43
						
						if p14.action and routeName then
							local var48
							local stateForAction = routeName.getStateForAction(p14.action, var43)
							
							if stateForAction then
								var44 = stateForAction
							end
						end
						if p14.params then
							var44 = object.assign(table.clone(var44), {
								params = if p14.params == object.None then object.None elseif var44.params then object.assign(table.clone(var44.params), p14.params) else table.clone(p14.params)
							})
						end
						if var44 ~= var43 then
							local cloned = table.clone(p15.routes)
							cloned[index] = var44
							
							return getNextState(p14, var37, object.assign(table.clone(p15), { routes = cloned, index = index }))
						elseif var44 == var43 and p15.index == index and var37 then
							return nil
						elseif p14.type == navigationActionsModule.SetParams then
							local key = p14.key
							local var47 = array.findIndex(p15.routes, function(p23) --[[ line: 320 ]]
								-- upvalues: key (ref)
								return p23.key == key
							end)
							
							if var47 > 0 then
								var48 = p15.routes[var47]
								local none = object.None
								
								if p14.params ~= object.None then
									none = if var48.params and p14.params then object.assign(table.clone(var48.params), p14.params) elseif var48.params then table.clone(var48.params) elseif p14.params then table.clone(p14.params) else {}
								end
								local cloned = table.clone(p15.routes)
								cloned[var47] = object.assign(table.clone(var48), { params = none })
								
								return getNextState(p14, var37, object.assign(table.clone(p15), { routes = cloned }))
							elseif index ~= p15.index then
								return getNextState(p14, var37, object.assign(table.clone(p15), { index = index }))
							elseif var42 and not p15 then
								return p15
							elseif var42 then
								return table.clone(p15)
							elseif not (if p14.type ~= navigationActionsModule.Back then if p14.type ~= stackActionsModule.Pop then p14.type == stackActionsModule.PopToTop else true else true) or (p14.type == navigationActionsModule.Back and p14.key ~= nil) then
								var48 = p15.index
								local routes = p15.routes
								array.find(order, function(p24, p25) --[[ line: 363 ]]
									-- upvalues: t (copy), var48 (write), routes (write), p14 (ref)
									local var52 = t[p24]
									
									if p25 == var48 then
										return false
									end
									local var53 = routes[p25]
									
									if var52 then
										var53 = var52.getStateForAction(p14, var53)
									end
									if not var53 then
										var48 = p25
										
										return true
									elseif var53 == routes[p25] then
										return false
									end
									routes = table.clone(routes)
									routes[p25] = var53
									var48 = p25
									
									return true
								end)
								
								if p14.preserveFocus then
									var48 = p15.index
								end
								return if var48 == p15.index and routes == p15.routes then p15 else getNextState(p14, var37, object.assign(table.clone(p15), { index = var48, routes = routes }))
							end
						end
					end
				end
			end
		end,
		getComponentForState = function(p26) --[[ line: 410 ]]
			-- upvalues: invariantModule (copy), t (ref), getScreenForRouteNameModule (copy), var16 (ref)
			local routeName = (p26.routes[p26.index] or {}).routeName
			invariantModule(routeName, "There is no route defined for index '%d'. Check that you passed in a navigation state with a valid tab/screen index.", p26.index)
			local var54 = t[routeName]
			
			return if var54 then var54.getComponentForState(p26.routes[p26.index]) else getScreenForRouteNameModule(var16, routeName)
		end,
		getComponentForRouteName = function(p27) --[[ line: 430 ]]
			-- upvalues: getScreenForRouteNameModule (copy), var16 (ref)
			return getScreenForRouteNameModule(var16, p27)
		end,
		getPathAndParamsForState = function(p28) --[[ line: 434 ]]
			-- upvalues: getPathAndParamsForRoute (ref)
			return getPathAndParamsForRoute(p28.routes[p28.index])
		end,
		getActionForPathAndParams = function(p29, p30) --[[ line: 439 ]]
			-- upvalues: getActionForPathAndParams (ref)
			return getActionForPathAndParams(p29, p30)
		end
	}
end