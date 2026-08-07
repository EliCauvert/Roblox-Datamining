-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:03 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local object = require(parent_2.LuauPolyfill).Object
local reactModule = require(parent_2.React)
local navigationContextModule = require(parent.NavigationContext)
local invariantModule = require(parent_1.utils.invariant)

local function _(p0) --[[ line: 11 | named "isComponent" ]]
	local var3 = type(p0)
	
	return if var3 ~= "function" then var3 == "table" else true
end

return function(p1, p2) --[[ line: 35 ]]
	-- upvalues: object (ref), reactModule (ref), navigationContextModule (ref), invariantModule (ref)
	local var4 = type(p1)
	assert(if var4 ~= "function" then var4 == "table" else true, "withNavigation must be called with a Roact component (stateful or functional)")
	local var5 = object.assign({ forwardRef = true }, p2)
	
	return function(p3) --[[ line: 39 ]]
		-- upvalues: reactModule (copy), navigationContextModule (copy), invariantModule (copy), p1 (ref), object (copy), var5 (ref)
		local navigation = p3.navigation
		
		return reactModule.createElement(navigationContextModule.Consumer, {
			render = function(p4) --[[ line: 42 ]]
				-- upvalues: navigation (ref), invariantModule (copy), reactModule (copy), p1 (copy), object (copy), p3 (ref), var5 (copy)
				local navigation_1 = navigation or p4
				invariantModule(navigation_1, "withNavigation and withNavigationFocus can only be used on a view hierarchy of a navigator. The wrapped component is unable to get access to navigation from props or context.")
				
				return reactModule.createElement(p1, object.assign(table.clone(p3), {
					navigation = navigation_1,
					ref = if var5.forwardRef then p3.onRef else object.None
				}))
			end
		})
	end
end