local Parent = script.Parent
local Parent1 = Parent.Parent
local Object = require(Parent1.Parent.LuauPolyfill).Object
local GetScreenForRouteNameModule = require(Parent.getScreenForRouteName)
local ValidateScreenOptionsModule = require(Parent.validateScreenOptions)
local InvariantModule = require(Parent1.utils.invariant)

local function applyConfig(Callback, p1, Tbl)
	-- upvalues: Object (copy)
	local Tbl1 = p1 or {}
	local ValueType = type(Callback)
	
	return if ValueType == "function" then Object.assign({}, Tbl1, Callback(Object.assign(table.clone(Tbl), { navigationOptions = Tbl1 }))) elseif ValueType == "table" then Object.assign(table.clone(Tbl1), Callback) else Tbl1
end

return function(p1, p2)
	-- upvalues: InvariantModule (copy), GetScreenForRouteNameModule (copy), applyConfig (copy), ValidateScreenOptionsModule (copy)
	return function(Navigation, p3)
		-- upvalues: InvariantModule (upval), GetScreenForRouteNameModule (upval), p1 (copy), applyConfig (upval), p2 (copy), ValidateScreenOptionsModule (upval)
		local P4 = p3 or {}
		local State = Navigation.state
		InvariantModule(type(State.routeName) == "string", "Cannot get config because the route does not have a routeName.")
		local ScreenForRouteNameModule = GetScreenForRouteNameModule(p1, State.routeName)
		local v1 = p1[State.routeName]
		local config = { navigation = Navigation, screenProps = P4 }
		local ApplyConfigResult = applyConfig(if v1 == ScreenForRouteNameModule then nil else v1.navigationOptions, applyConfig(if type(ScreenForRouteNameModule) == "table" then ScreenForRouteNameModule.navigationOptions else {}, applyConfig(p2, {}, config), config), config)
		ValidateScreenOptionsModule(ApplyConfigResult, State)
		
		return ApplyConfigResult
	end
end