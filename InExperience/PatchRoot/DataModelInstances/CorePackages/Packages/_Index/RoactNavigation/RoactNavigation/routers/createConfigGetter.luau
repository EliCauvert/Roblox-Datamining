local parent = script.Parent
local parent_1 = parent.Parent
local object = require(parent_1.Parent.LuauPolyfill).Object
local getScreenForRouteNameModule = require(parent.getScreenForRouteName)
local validateScreenOptionsModule = require(parent.validateScreenOptions)
local invariantModule = require(parent_1.utils.invariant)

local function applyConfig(p1, p2, p3)
	-- upvalues: object (ref)
	p2 = p2 or {}
	local var1 = type(p1)
	
	return if var1 == "function" then object.assign({}, p2, p1(object.assign(table.clone(p3), { navigationOptions = p2 }))) elseif var1 == "table" then object.assign(table.clone(p2), p1) else p2
end

return function(p1, p2)
	-- upvalues: invariantModule (ref), getScreenForRouteNameModule (ref), applyConfig (ref), validateScreenOptionsModule (ref)
	return function(p3, p4)
		-- upvalues: invariantModule (copy), getScreenForRouteNameModule (copy), p1 (ref), applyConfig (copy), p2 (ref), validateScreenOptionsModule (copy)
		p4 = p4 or {}
		local state = p3.state
		invariantModule(type(state.routeName) == "string", "Cannot get config because the route does not have a routeName.")
		local var1 = getScreenForRouteNameModule(p1, state.routeName)
		local routeName = p1[state.routeName]
		local t = { navigation = p3, screenProps = p4 }
		local var2 = applyConfig(if routeName ~= var1 then routeName.navigationOptions else nil, applyConfig(if type(var1) == "table" then var1.navigationOptions else {}, applyConfig(p2, {}, t), t), t)
		validateScreenOptionsModule(var2, state)
		
		return var2
	end
end