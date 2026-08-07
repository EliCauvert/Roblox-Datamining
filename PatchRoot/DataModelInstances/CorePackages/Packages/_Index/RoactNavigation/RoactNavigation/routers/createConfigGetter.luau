-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:00 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = parent.Parent
local object = require(parent_1.Parent.LuauPolyfill).Object
local getScreenForRouteNameModule = require(parent.getScreenForRouteName)
local validateScreenOptionsModule = require(parent.validateScreenOptions)
local invariantModule = require(parent_1.utils.invariant)

local function applyConfig(p0, p1, p2) --[[ line: 13 ]]
	-- upvalues: object (ref)
	p1 = p1 or {}
	local var5 = type(p0)
	
	return if var5 == "function" then object.assign({}, p1, p0(object.assign(table.clone(p2), { navigationOptions = p1 }))) elseif var5 == "table" then object.assign(table.clone(p1), p0) else p1
end

return function(p3, p4) --[[ line: 32 ]]
	-- upvalues: invariantModule (ref), getScreenForRouteNameModule (ref), applyConfig (ref), validateScreenOptionsModule (ref)
	return function(p5, p6) --[[ line: 33 ]]
		-- upvalues: invariantModule (copy), getScreenForRouteNameModule (copy), p3 (ref), applyConfig (copy), p4 (ref), validateScreenOptionsModule (copy)
		p6 = p6 or {}
		local state = p5.state
		invariantModule(type(state.routeName) == "string", "Cannot get config because the route does not have a routeName.")
		local var7 = getScreenForRouteNameModule(p3, state.routeName)
		local routeName = p3[state.routeName]
		local t = { navigation = p5, screenProps = p6 }
		local var9 = applyConfig(if routeName ~= var7 then routeName.navigationOptions else nil, applyConfig(if type(var7) == "table" then var7.navigationOptions else {}, applyConfig(p4, {}, t), t), t)
		validateScreenOptionsModule(var9, state)
		
		return var9
	end
end