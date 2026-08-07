-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:00 2026 Pacific Standard Time.

local luauPolyfillModule = require(script.Parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local getEventManagerModule = require(script.Parent.getEventManager)
local getChildRouterModule = require(script.Parent.getChildRouter)
local getNavigationActionCreatorsModule = require(script.Parent.routers.getNavigationActionCreators)
local getChildrenNavigationCacheModule = require(script.Parent.getChildrenNavigationCache)

local function _(p0) --[[ line: 12 | named "createParamGetter" ]]
	return function(p1, p2) --[[ line: 13 ]]
		-- upvalues: p0 (ref)
		local params = p0.params
		
		return if params and params[p1] ~= nil then params[p1] else p2
	end
end

local function getChildNavigation(p3, p4, p5) --[[ line: 24 ]]
	-- upvalues: getChildrenNavigationCacheModule (ref), array (ref), getChildRouterModule (ref), object (ref), getNavigationActionCreatorsModule (ref), getChildNavigation (ref), getEventManagerModule (ref)
	local var6 = getChildrenNavigationCacheModule(p3)
	local var7 = array.findIndex(p3.state.routes, function(p6) --[[ line: 27 ]]
		-- upvalues: p4 (ref)
		return p6.key == p4
	end)
	
	if var7 < 1 then
		return nil
	end
	local var8 = p3.state.routes[var7]
	local var9 = var6[p4]
	
	if var9 and var9.state == var8 then
		return var9
	end
	local var10 = getChildRouterModule(p3.router, var8.routeName)
	local var11 = object.assign(if p3.actions then table.clone(p3.actions) else {}, p3.router.getActionCreators(var8, p3.state.key) or {}, var10 and var10.getActionCreators(if var8.routes and type(var8.index) == "number" then var8.routes[var8.index] else nil, var8.key) or {} or {}, getNavigationActionCreatorsModule(var8) or {})
	local t = {}
	
	for i, v in var11 do
		t[i] = function(...) --[[ line: 66 ]]
			-- upvalues: v (ref), p3 (ref)
			return p3.dispatch(v(...))
		end
	end
	local var15
	local var13 = true
	local var14 = p5()
	
	if var14 then
		var13 = array.indexOf(var14.state.routes, var8) == 1
	end
	if var9 and var9.isFirstRouteInParent() == var13 then
		var15 = nil
		var15 = object.assign(table.clone(var9), t, {
			state = var8,
			router = var10,
			actions = var11,
			getParam = function(p7, p8) --[[ line: 13 ]]
				-- upvalues: var8 (ref)
				local params = var8.params
				
				return if params and params[p7] ~= nil then params[p7] else p8
			end,
			getChildNavigation = function(p9) --[[ line: 88 ]]
				-- upvalues: getChildNavigation (copy), var15 (write), p5 (ref), p4 (ref)
				return getChildNavigation(var15, p9, function() --[[ line: 89 ]]
					-- upvalues: p5 (copy), p4 (copy)
					local var17 = p5()
					
					return if var17 then var17.getChildNavigation(p4) else nil
				end)
			end
		})
		var6[p4] = var15
		
		return var15
	end
	var15 = getEventManagerModule(p4)
	local var16 = nil
	var16 = object.assign(table.clone(t), {
		state = var8,
		router = var10,
		actions = var11,
		getParam = function(p10, p11) --[[ line: 13 ]]
			-- upvalues: var8 (ref)
			local params = var8.params
			
			return if params and params[p10] ~= nil then params[p10] else p11
		end,
		getChildNavigation = function(p12) --[[ line: 109 ]]
			-- upvalues: getChildNavigation (copy), var16 (write), p5 (ref), p4 (ref)
			return getChildNavigation(var16, p12, function() --[[ line: 110 ]]
				-- upvalues: p5 (copy), p4 (copy)
				local var18 = p5()
				
				return if var18 then var18.getChildNavigation(p4) else nil
			end)
		end,
		isFocused = function() --[[ line: 115 ]]
			-- upvalues: p5 (ref), p4 (ref)
			local var19 = p5()
			
			if not var19 then
				return false
			elseif not var19.isFocused() then
				return false
			end
			local state = var19.state
			
			return state.routes[state.index].key == p4
		end,
		isFirstRouteInParent = function() --[[ line: 135 ]]
			-- upvalues: var13 (write)
			return var13
		end,
		dispatch = p3.dispatch,
		getScreenProps = p3.getScreenProps,
		_dangerouslyGetParent = p5,
		addListener = var15.addListener,
		emit = var15.emit
	})
	var6[p4] = var16
	
	return var16
end

return getChildNavigation