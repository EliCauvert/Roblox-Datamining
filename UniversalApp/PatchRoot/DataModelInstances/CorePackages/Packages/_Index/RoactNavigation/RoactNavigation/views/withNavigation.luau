local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Object = require(Parent2.LuauPolyfill).Object
local ReactModule = require(Parent2.React)
local NavigationContextModule = require(Parent.NavigationContext)
local InvariantModule = require(Parent1.utils.invariant)

local function _(p1): boolean --[[ Line: 11 | Named "isComponent" ]]
	local ValueType = type(p1)
	
	return ValueType == "function" or ValueType == "table"
end

return function(p1, p2) --[[ Line: 35 ]]
	-- upvalues: Object (copy), ReactModule (copy), NavigationContextModule (copy), InvariantModule (copy)
	local ValueType = type(p1)
	assert(ValueType == "function" or ValueType == "table", "withNavigation must be called with a Roact component (stateful or functional)")
	local AssignResult = Object.assign({ forwardRef = true }, p2)
	
	return function(Tbl) --[[ Line: 39 ]]
		-- upvalues: ReactModule (upval), NavigationContextModule (upval), InvariantModule (upval), p1 (copy), Object (upval), AssignResult (copy)
		local Navigation = Tbl.navigation
		
		return ReactModule.createElement(NavigationContextModule.Consumer, {
			render = function(p3) --[[ Line: 42 ]]
				-- upvalues: Navigation (copy), InvariantModule (upval), ReactModule (upval), p1 (upval), Object (upval), Tbl (copy), AssignResult (upval)
				local Navigation1 = Navigation or p3
				InvariantModule(Navigation1, "withNavigation and withNavigationFocus can only be used on a view hierarchy of a navigator. The wrapped component is unable to get access to navigation from props or context.")
				
				return ReactModule.createElement(p1, Object.assign(table.clone(Tbl), {
					navigation = Navigation1,
					ref = if AssignResult.forwardRef then Tbl.onRef else Object.None
				}))
			end
		})
	end
end