local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local object = require(parent_2.LuauPolyfill).Object
local reactModule = require(parent_2.React)
local navigationContextModule = require(parent.NavigationContext)
local invariantModule = require(parent_1.utils.invariant)

local function _(p1)
	local var1 = type(p1)
	
	return if var1 ~= "function" then var1 == "table" else true
end

return function(p1, p2)
	-- upvalues: object (ref), reactModule (ref), navigationContextModule (ref), invariantModule (ref)
	local var1 = type(p1)
	assert(if var1 ~= "function" then var1 == "table" else true, "withNavigation must be called with a Roact component (stateful or functional)")
	local var2 = object.assign({ forwardRef = true }, p2)
	
	return function(p3)
		-- upvalues: reactModule (copy), navigationContextModule (copy), invariantModule (copy), p1 (ref), object (copy), var2 (ref)
		local navigation = p3.navigation
		
		return reactModule.createElement(navigationContextModule.Consumer, {
			render = function(p4)
				-- upvalues: navigation (ref), invariantModule (copy), reactModule (copy), p1 (copy), object (copy), p3 (ref), var2 (copy)
				local navigation_1 = navigation or p4
				invariantModule(navigation_1, "withNavigation and withNavigationFocus can only be used on a view hierarchy of a navigator. The wrapped component is unable to get access to navigation from props or context.")
				
				return reactModule.createElement(p1, object.assign(table.clone(p3), {
					navigation = navigation_1,
					ref = if var2.forwardRef then p3.onRef else object.None
				}))
			end
		})
	end
end