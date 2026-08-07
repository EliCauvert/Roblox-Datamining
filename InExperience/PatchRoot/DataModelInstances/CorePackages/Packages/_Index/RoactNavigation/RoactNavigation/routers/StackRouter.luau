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

local var11 = function() --[[ line: 28 ]]
	return {}
end

local function _(p0) --[[ line: 32 | named "behavesLikePushAction" ]]
	-- upvalues: navigationActionsModule (ref), stackActionsModule (ref)
	return if p0.type ~= navigationActionsModule.Navigate then p0.type == stackActionsModule.Push else true
end

local _ = function(value) --[[ line: 36 | named "isResetToRootStack" ]]
	-- upvalues: stackActionsModule (ref)
	return value.type == stackActionsModule.Reset and value.key == nil
end

local function mapToRouteName(p1) --[[ line: 40 ]]
	return next(p1)
end

local function foldToRoutes(p2, p3, _) --[[ line: 45 ]]
	local var14, var15 = next(p3)
	p2[var14] = var15
	
	return p2
end

return function(p4, p5) --[[ line: 51 ]]
	-- upvalues: validateRouteConfigArrayModule (ref), validateRouteConfigMapModule (ref), array (ref), foldToRoutes (ref), mapToRouteName (ref), unknownModule (ref), var11 (ref), navigationActionsModule (ref), stackActionsModule (ref), object (ref), keyGeneratorModule (ref), createPathParser (ref), invariantModule (ref), getScreenForRouteNameModule (ref), stateUtilsModule (ref), createConfigGetterModule (ref)
	validateRouteConfigArrayModule(p4)
	p5 = p5 or {}
	local var16 = validateRouteConfigMapModule(array.reduce(p4, foldToRoutes, {}))
	local order = p5.order or array.map(p4, mapToRouteName)
	local t = {}
	
	for i, v in order do
		local var22 = var16[v]
		local getParamsForRouteAndAction = if type(var22) == "table" and var22.screen then var22.screen else var22
		
		if type(getParamsForRouteAndAction) == "table" and getParamsForRouteAndAction.router then
			t[v] = getParamsForRouteAndAction.router
		else
			t[v] = unknownModule
		end
	end
	local initialRouteParams = p5.initialRouteParams
	local getCustomActionCreators = p5.getCustomActionCreators or var11
	local initialRouteName = p5.initialRouteName or order[1]
	local var21 = t[initialRouteName]
	
	if array.indexOf(order, initialRouteName) < 1 then
		local var22 = ""
		
		for i_1, v_1 in order do
			var22 ..= v_1 .. ","
		end
		error(string.format("Invalid initialRouteName '%s'. Must be one of [%s]", initialRouteName, var22), 2)
	end
	local function var22(p6) --[[ line: 97 | named "getInitialState" ]]
		-- upvalues: t (ref), navigationActionsModule (copy), stackActionsModule (copy), unknownModule (copy), object (copy), keyGeneratorModule (copy), var21 (ref), initialRouteName (ref), initialRouteParams (ref), var16 (ref), p5 (write)
		local t_1 = {}
		local routeName = t[p6.routeName]
		local var27 = if p6.type ~= navigationActionsModule.Navigate then p6.type == stackActionsModule.Push else true
		
		if var27 and routeName ~= nil then
			var27 = {}
			
			if routeName ~= unknownModule then
				var27 = routeName.getStateForAction(p6.action or navigationActionsModule.init({ params = p6.params }))
			end
			return {
				key = "StackRouterRoot",
				isTransitioning = false,
				index = 1,
				routes = {
					object.assign({ params = p6.params }, var27, {
						key = p6.key or keyGeneratorModule.generateKey(),
						routeName = p6.routeName
					})
				}
			}
		elseif var21 ~= nil and var21 ~= unknownModule then
			t_1 = var21.getStateForAction(navigationActionsModule.navigate({
				routeName = initialRouteName,
				params = initialRouteParams
			}))
		end
		local var30
		local var28 = var16[initialRouteName]
		local var29 = type(var28) == "table" and var28.params
		
		if not var29 and not t_1.params and not p6.params then
			var30 = initialRouteParams
			
			if var30 then
				var30 = object.assign
				var30 = var30(if var29 then table.clone(var29) else {}, t_1.params or {}, p6.params or {}, initialRouteParams or {})
			end
			return {
				key = "StackRouterRoot",
				isTransitioning = false,
				index = 1,
				routes = {
					object.assign(table.clone(t_1), {
						params = var30,
						routeName = initialRouteName,
						key = p6.key or (p5.initialRouteKey or keyGeneratorModule.generateKey())
					})
				}
			}
		end
	end
	
	local function getParamsForRouteAndAction(p7, p8) --[[ line: 162 ]]
		-- upvalues: object (copy), var16 (ref)
		if p8.params == object.None then
			return nil
		end
		local var31 = var16[p7]
		
		return if type(var31) == "table" and var31.params then object.assign(table.clone(var31.params), p8.params) elseif p8.params then object.assign({}, p8.params) else nil
	end
	
	local var24 = createPathParser(t, var16, p5)
	local getPathAndParamsForRoute = var24.getPathAndParamsForRoute
	local getActionForPathAndParams = var24.getActionForPathAndParams
	local t_1 = {}
	
	for i_1, v_1 in t do
		if v_1 ~= unknownModule then
			t_1[i_1] = v_1
		end
	end
	return {
		childRouters = t_1,
		_CHILD_IS_SCREEN = unknownModule,
		getComponentForState = function(p9) --[[ line: 199 ]]
			-- upvalues: invariantModule (copy), t (ref), unknownModule (copy), getScreenForRouteNameModule (copy), var16 (ref)
			local index = p9.routes[p9.index] or {}
			local routeName = index.routeName
			invariantModule(routeName, "There is no route defined for index '%d'. Make sure that you passed in a navigation state with a valid stack index.", p9.index)
			local var33 = t[routeName]
			
			return if var33 == nil or var33 == unknownModule then getScreenForRouteNameModule(var16, routeName) else t[routeName].getComponentForState(index)
		end,
		getComponentForRouteName = function(p10) --[[ line: 220 ]]
			-- upvalues: getScreenForRouteNameModule (copy), var16 (ref)
			return getScreenForRouteNameModule(var16, p10)
		end,
		getActionCreators = function(p11, p12) --[[ line: 224 ]]
			-- upvalues: object (copy), getCustomActionCreators (ref), stackActionsModule (copy), invariantModule (copy), navigationActionsModule (copy)
			return object.assign(table.clone(getCustomActionCreators(p11, p12)), {
				pop = function(p13, p14) --[[ line: 226 ]]
					-- upvalues: stackActionsModule (copy), object (copy)
					return stackActionsModule.pop(object.assign({ n = p13 }, p14 or {}))
				end,
				popToTop = function(p15) --[[ line: 229 ]]
					-- upvalues: stackActionsModule (copy)
					return stackActionsModule.popToTop(p15)
				end,
				push = function(p16, p17, p18) --[[ line: 232 ]]
					-- upvalues: stackActionsModule (copy)
					return stackActionsModule.push({ routeName = p16, params = p17, action = p18 })
				end,
				replace = function(p19, p20, p21, p22) --[[ line: 239 ]]
					-- upvalues: stackActionsModule (copy), p11 (ref), invariantModule (copy)
					if type(p19) == "string" then
						return stackActionsModule.replace({
							routeName = p19,
							params = p20,
							action = p21,
							key = p11.key,
							newKey = p22
						})
					end
					invariantModule(type(p19) == "table", "replaceWith must be a table or string")
					invariantModule(p20 == nil, "params must not be provided to .replace() when specifying a table")
					invariantModule(p21 == nil, "Child action must not be provided to .replace() when specifying a table")
					invariantModule(p22 == nil, "newKey must not be provided to .replace() when specifying a table")
					
					return stackActionsModule.replace(p19)
				end,
				reset = function(value, p23) --[[ line: 257 ]]
					-- upvalues: stackActionsModule (copy), p12 (ref)
					return stackActionsModule.reset({
						actions = value,
						index = if p23 == nil then #value else p23,
						key = p12
					})
				end,
				dismiss = function() --[[ line: 269 ]]
					-- upvalues: navigationActionsModule (copy), p12 (ref)
					return navigationActionsModule.back({ key = p12 })
				end
			})
		end,
		getStateForAction = function(p24, p25) --[[ line: 277 ]]
			-- upvalues: var22 (ref), stackActionsModule (copy), navigationActionsModule (copy), t (ref), unknownModule (copy), stateUtilsModule (copy), object (copy), invariantModule (copy), array (copy), getParamsForRouteAndAction (ref), keyGeneratorModule (copy)
			if not p25 then
				return var22(p24)
			end
			local var35, stateForAction
			local index = p25.routes[p25.index]
			
			if not (p24.type == stackActionsModule.Reset and p24.key == nil) and p24.type ~= navigationActionsModule.Navigate then
				local routeName = t[index.routeName]
				
				if routeName ~= nil and routeName ~= unknownModule then
					local stateForAction = routeName.getStateForAction(p24, index)
					
					if stateForAction ~= nil and stateForAction ~= index then
						return stateUtilsModule.replaceAt(p25, index.key, stateForAction, p24.type == navigationActionsModule.SetParams)
					end
				end
			elseif p24.type == navigationActionsModule.Navigate then
				for i = #p25.routes, 1, -1 do
					var35 = p25.routes[i]
					local routeName = t[var35.routeName]
					local var36 = if p24.routeName == var35.routeName and p24.action then p24.action else p24
					
					if routeName ~= nil and routeName ~= unknownModule then
						stateForAction = routeName.getStateForAction(var36, var35)
						
						if stateForAction ~= nil and stateForAction == var35 then
							continue
						end
						local var38 = stateUtilsModule.replaceAndPrune(p25, if stateForAction then stateForAction.key else var35.key, stateForAction or var35)
						
						return object.assign(table.clone(var38), {
							isTransitioning = if p25.index ~= var38.index then p24.immediate ~= true else p25.isTransitioning
						})
					end
				end
			end
			local var39 = if p24.type ~= navigationActionsModule.Navigate then p24.type == stackActionsModule.Push else true
			
			if var39 and t[p24.routeName] ~= nil then
				var39 = t[p24.routeName]
				invariantModule(if p24.type == stackActionsModule.Push then p24.key == nil else true, "StackRouter does not support key on the push action")
				local var40 = array.findIndex(p25.routes, if p24.key then function(p27) --[[ line: 353 ]]
					-- upvalues: p24 (ref)
					return p27.key == p24.key
				end else function(p26) --[[ line: 349 ]]
					-- upvalues: p24 (ref)
					return p26.routeName == p24.routeName
				end)
				
				if p24.type == stackActionsModule.Push or var40 <= 0 then
					return object.assign(stateUtilsModule.push(p25, if var39 ~= unknownModule then {
						params = getParamsForRouteAndAction(p24.routeName, p24),
						routeName = p24.routeName,
						key = p24.key or keyGeneratorModule.generateKey()
					} else object.assign({ params = getParamsForRouteAndAction(p24.routeName, p24) }, var39.getStateForAction(p24.action or navigationActionsModule.init({ params = getParamsForRouteAndAction(p24.routeName, p24) })), {
						routeName = p24.routeName,
						key = p24.key or keyGeneratorModule.generateKey()
					})), { isTransitioning = p24.immediate ~= true })
				elseif p25.index == var40 and not p24.params then
					return nil
				end
				var35 = array.slice(p25.routes, 1, var40 + 1)
				
				if p24.params then
					local var41 = p25.routes[var40]
					var35[var40] = object.assign(table.clone(var41), {
						params = if p24.params == object.None then object.None elseif not var41.params then table.clone(p24.params) else object.assign(table.clone(var41.params), p24.params)
					})
				end
				return object.assign(table.clone(p25), {
					isTransitioning = if p25.index ~= var40 then p24.immediate ~= true else p25.isTransitioning,
					index = var40,
					routes = var35
				})
			elseif p24.type == stackActionsModule.Push and t[p24.routeName] == nil then
				return p25
			elseif if p24.type ~= navigationActionsModule.Navigate then p24.type == stackActionsModule.Push else true then
				for var35 in t do
					local var42 = t[var35]
					
					if var42 ~= nil and var42 ~= unknownModule then
						stateForAction = var42.getStateForAction(navigationActionsModule.init())
						local stateForAction_1 = var42.getStateForAction(p24, stateForAction)
						local var44 = nil
						
						if stateForAction_1 == nil then
							var44 = stateForAction
						elseif stateForAction_1 ~= stateForAction then
							var44 = stateForAction_1
						end
						if var44 then
							return object.assign(stateUtilsModule.push(p25, object.assign(table.clone(var44), {
								routeName = var35,
								key = p24.key or keyGeneratorModule.generateKey()
							})), { isTransitioning = p24.immediate ~= true })
						end
					end
				end
			end
			if p24.type == stackActionsModule.PopToTop then
				return if p24.key and p25.key ~= p24.key then p25 elseif p25.index > 1 then object.assign(table.clone(p25), {
					index = 1,
					isTransitioning = p24.immediate ~= true,
					routes = { p25.routes[1] }
				}) else p25
			elseif p24.type == stackActionsModule.Replace then
				local var48
				local _ = nil
				local var45 = if p24.key == nil and #p25.routes > 0 then #p25.routes else array.findIndex(p25.routes, function(p28) --[[ line: 496 ]]
					-- upvalues: p24 (ref)
					return p28.key == p24.key
				end)
				
				if var45 > 0 then
					local routeName = t[p24.routeName]
					local t_1 = {}
					
					if routeName ~= nil and routeName ~= unknownModule then
						var35 = p24.action or navigationActionsModule.init({ params = getParamsForRouteAndAction(p24.routeName, p24) })
						t_1 = routeName.getStateForAction(var35)
					end
					var35 = table.clone(p25.routes)
					var35[var45] = object.assign({ params = getParamsForRouteAndAction(p24.routeName, p24) }, t_1, {
						routeName = p24.routeName,
						key = p24.newKey or keyGeneratorModule.generateKey()
					})
					
					return object.assign(table.clone(p25), { routes = var35 })
				elseif p24.type == stackActionsModule.CompleteTransition and (p24.key == nil or p24.key == p25.key) and (p24.toChildKey == p25.routes[p25.index].key and p25.isTransitioning) then
					return object.assign(table.clone(p25), { isTransitioning = false })
				elseif p24.type == navigationActionsModule.SetParams then
					local key = p24.key
					local var47 = array.findIndex(p25.routes, function(p29) --[[ line: 545 ]]
						-- upvalues: key (ref)
						return p29.key == key
					end)
					
					if var47 > 0 then
						var48 = p25.routes[var47]
						var35 = object.None
						
						if p24.params ~= object.None then
							var35 = if var48.params and p24.params then object.assign(table.clone(var48.params), p24.params) elseif var48.params then table.clone(var48.params) elseif p24.params then table.clone(p24.params) else {}
						end
						local cloned = table.clone(p25.routes)
						cloned[var47] = object.assign(table.clone(var48), { params = var35 })
						
						return object.assign(table.clone(p25), { routes = cloned })
					elseif p24.type == stackActionsModule.Reset then
						return if p24.key == nil or p24.key == p25.key then object.assign(table.clone(p25), {
							routes = if p24.actions then array.map(p24.actions, function(p30) --[[ line: 576 ]]
								-- upvalues: t (copy), unknownModule (copy), navigationActionsModule (copy), getParamsForRouteAndAction (copy), object (copy), keyGeneratorModule (copy)
								local routeName = t[p30.routeName]
								local t_1 = {}
								
								if routeName ~= nil and routeName ~= unknownModule then
									t_1 = routeName.getStateForAction(p30.action or navigationActionsModule.init({ params = getParamsForRouteAndAction(p30.routeName, p30) }))
								end
								return object.assign({ params = getParamsForRouteAndAction(p30.routeName, p30) }, t_1, {
									routeName = p30.routeName,
									key = p30.key or keyGeneratorModule.generateKey()
								})
							end) else {},
							index = p24.index
						}) else p25
					elseif p24.type == navigationActionsModule.Back or p24.type == stackActionsModule.Pop then
						local key = p24.key
						local n = p24.n
						var48 = p24.immediate
						var35 = p24.prune
						
						if p24.type == stackActionsModule.Pop and var35 == false and key then
							local var50 = array.findIndex(p25.routes, function(p31) --[[ line: 617 ]]
								-- upvalues: key (ref)
								return p31.key == key
							end)
							
							if var50 > 0 then
								stateForAction = array.concat(array.slice(p25.routes, 1, math.max(var50 - (n or 1), 1) + 1), array.slice(p25.routes, var50 + 1))
								
								if #stateForAction > 0 then
									return object.assign(table.clone(p25), {
										routes = stateForAction,
										index = #stateForAction,
										isTransitioning = var48 ~= true
									})
								end
							end
						else
							local index_1 = p25.index
							
							if p24.type == stackActionsModule.Pop and n ~= nil then
								index_1 = math.max(2, p25.index - n + 1)
							elseif key then
								index_1 = array.findIndex(p25.routes, function(p32) --[[ line: 642 ]]
									-- upvalues: key (ref)
									return p32.key == key
								end)
							end
							if index_1 > 1 then
								return object.assign(table.clone(p25), {
									routes = array.slice(p25.routes, 1, index_1),
									index = index_1 - 1,
									isTransitioning = var48 ~= true
								})
							end
						end
					end
					local var51 = if p24.key then stateUtilsModule.indexOf(p25, p24.key) else nil
					
					for var35 = #p25.routes, 1, -1 do
						local var52 = p25.routes[var35]
						
						if var52.key ~= index.key and (var51 == 1 or var52.key == p24.key) then
							local routeName = t[var52.routeName]
							
							if routeName ~= nil and routeName ~= unknownModule then
								stateForAction = routeName.getStateForAction(p24, var52)
								
								if stateForAction ~= nil then
									if stateForAction == var52 then
										continue
									end
									return stateUtilsModule.replaceAt(p25, var52.key, stateForAction, p24.preserveFocus)
								end
								return p25
							end
						end
					end
					return p25
				end
			end
		end,
		getPathAndParamsForState = function(p33) --[[ line: 696 ]]
			-- upvalues: getPathAndParamsForRoute (ref)
			return getPathAndParamsForRoute(p33.routes[p33.index])
		end,
		getActionForPathAndParams = function(p34, p35) --[[ line: 701 ]]
			-- upvalues: getActionForPathAndParams (ref)
			return getActionForPathAndParams(p34, p35)
		end,
		getScreenOptions = createConfigGetterModule(var16, p5.defaultNavigationOptions)
	}
end