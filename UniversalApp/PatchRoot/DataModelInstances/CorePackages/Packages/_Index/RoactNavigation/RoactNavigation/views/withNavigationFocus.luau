local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local object = require(parent_2.LuauPolyfill).Object
local reactModule = require(parent_2.React)
local eventsModule = require(parent_1.Events)
local withNavigationModule = require(parent.withNavigation)

local function _(p1)
	local var1 = type(p1)
	
	return if var1 ~= "function" then var1 == "table" else true
end

return function(p1)
	-- upvalues: reactModule (ref), eventsModule (ref), object (ref), withNavigationModule (ref)
	local var1 = type(p1)
	assert(if var1 ~= "function" then var1 == "table" else true, "withNavigationFocus must be called with a Roact component (stateful or functional)")
	local navigationFocusComponent = reactModule.Component:extend("NavigationFocusComponent")
	
	function navigationFocusComponent.init(p2)
		p2.state = { isFocused = p2.props.navigation.isFocused() }
	end
	
	function navigationFocusComponent.didMount(p2)
		-- upvalues: eventsModule (copy)
		local navigation = p2.props.navigation
		p2.subscriptions = {
			navigation.addListener(eventsModule.WillFocus, function()
				-- upvalues: p2 (ref)
				p2:setState({ isFocused = true })
			end),
			navigation.addListener(eventsModule.WillBlur, function()
				-- upvalues: p2 (ref)
				p2:setState({ isFocused = false })
			end)
		}
	end
	
	function navigationFocusComponent.willUnmount(p2)
		for i, v in p2.subscriptions do
			v.remove()
		end
	end
	
	function navigationFocusComponent.render(p3)
		-- upvalues: reactModule (copy), p1 (ref), object (copy)
		return reactModule.createElement(p1, object.assign(table.clone(p3.props), { isFocused = p3.state.isFocused }))
	end
	
	return withNavigationModule(navigationFocusComponent, { forwardRef = false })
end