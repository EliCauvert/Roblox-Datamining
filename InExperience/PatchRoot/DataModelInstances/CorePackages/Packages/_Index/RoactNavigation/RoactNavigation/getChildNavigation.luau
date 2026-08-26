local luauPolyfillModule = require(script.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local getEventManagerModule = require(script.Parent.getEventManager)
local getChildRouterModule = require(script.Parent.getChildRouter)
local getNavigationActionCreatorsModule = require(script.Parent.routers.getNavigationActionCreators)
local getChildrenNavigationCacheModule = require(script.Parent.getChildrenNavigationCache)

local function _(p1)
	return function(p2, p3)
		-- upvalues: p1 (ref)
		local params = p1.params
		
		return if params and params[p2] ~= nil then params[p2] else p3
	end
end

local function getChildNavigation(p1, p2, p3)
	-- upvalues: getChildrenNavigationCacheModule (ref), array (ref), getChildRouterModule (ref), object (ref), getNavigationActionCreatorsModule (ref), getChildNavigation (ref), getEventManagerModule (ref)
	local var1 = getChildrenNavigationCacheModule(p1)
	local var2 = array.findIndex(p1.state.routes, function(p4)
		-- upvalues: p2 (ref)
		return p4.key == p2
	end)
	
	if var2 < 1 then
		return nil
	end
	local var3 = p1.state.routes[var2]
	local var4 = var1[p2]
	
	if var4 and var4.state == var3 then
		return var4
	end
	local var5 = getChildRouterModule(p1.router, var3.routeName)
	local var6 = object.assign(if p1.actions then table.clone(p1.actions) else {}, p1.router.getActionCreators(var3, p1.state.key) or {}, var5 and var5.getActionCreators(if var3.routes and type(var3.index) == "number" then var3.routes[var3.index] else nil, var3.key) or {} or {}, getNavigationActionCreatorsModule(var3) or {})
	local t = {}
	
	for i, v in var6 do
		t[i] = function(...)
			-- upvalues: v (ref), p1 (ref)
			return p1.dispatch(v(...))
		end
	end
	local var7
	local var8 = true
	local var9 = p3()
	
	if var9 then
		var8 = array.indexOf(var9.state.routes, var3) == 1
	end
	if var4 and var4.isFirstRouteInParent() == var8 then
		var7 = nil
		var7 = object.assign(table.clone(var4), t, {
			state = var3,
			router = var5,
			actions = var6,
			getParam = function(p4, p5)
				-- upvalues: var3 (ref)
				local params = var3.params
				
				return if params and params[p4] ~= nil then params[p4] else p5
			end,
			getChildNavigation = function(p4)
				-- upvalues: getChildNavigation (copy), var7 (write), p3 (ref), p2 (ref)
				return getChildNavigation(var7, p4, function()
					-- upvalues: p3 (copy), p2 (copy)
					local var10 = p3()
					
					return if var10 then var10.getChildNavigation(p2) else nil
				end)
			end
		})
		var1[p2] = var7
		
		return var7
	end
	var7 = getEventManagerModule(p2)
	local var10 = nil
	var10 = object.assign(table.clone(t), {
		state = var3,
		router = var5,
		actions = var6,
		getParam = function(p4, p5)
			-- upvalues: var3 (ref)
			local params = var3.params
			
			return if params and params[p4] ~= nil then params[p4] else p5
		end,
		getChildNavigation = function(p4)
			-- upvalues: getChildNavigation (copy), var10 (write), p3 (ref), p2 (ref)
			return getChildNavigation(var10, p4, function()
				-- upvalues: p3 (copy), p2 (copy)
				local var11 = p3()
				
				return if var11 then var11.getChildNavigation(p2) else nil
			end)
		end,
		isFocused = function()
			-- upvalues: p3 (ref), p2 (ref)
			local var11 = p3()
			
			if not var11 then
				return false
			elseif not var11.isFocused() then
				return false
			end
			local state = var11.state
			
			return state.routes[state.index].key == p2
		end,
		isFirstRouteInParent = function()
			-- upvalues: var8 (write)
			return var8
		end,
		dispatch = p1.dispatch,
		getScreenProps = p1.getScreenProps,
		_dangerouslyGetParent = p3,
		addListener = var7.addListener,
		emit = var7.emit
	})
	var1[p2] = var10
	
	return var10
end

return getChildNavigation