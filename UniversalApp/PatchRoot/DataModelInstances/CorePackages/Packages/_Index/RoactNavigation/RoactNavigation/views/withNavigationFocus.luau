local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local object = require(parent_2.LuauPolyfill).Object
local reactModule = require(parent_2.React)
local eventsModule = require(parent_1.Events)
local withNavigationModule = require(parent.withNavigation)

local function _(p0)
	local var3 = type(p0)
	
	return if var3 ~= "function" then var3 == "table" else true
end

return function(p1)
	-- upvalues: reactModule (ref), eventsModule (ref), object (ref), withNavigationModule (ref)
	local var4 = type(p1)
	assert(if var4 ~= "function" then var4 == "table" else true, "withNavigationFocus must be called with a Roact component (stateful or functional)")
	local navigationFocusComponent = reactModule.Component:extend("NavigationFocusComponent")
	
	function navigationFocusComponent.init(p2)
		p2.state = { isFocused = p2.props.navigation.isFocused() }
	end
	
	function navigationFocusComponent.didMount(p3)
		-- upvalues: eventsModule (copy)
		local navigation = p3.props.navigation
		p3.subscriptions = {
			navigation.addListener(eventsModule.WillFocus, function()
				-- upvalues: p3 (ref)
				p3:setState({ isFocused = true })
			end),
			navigation.addListener(eventsModule.WillBlur, function()
				-- upvalues: p3 (ref)
				p3:setState({ isFocused = false })
			end)
		}
	end
	
	function navigationFocusComponent.willUnmount(p4)
		for i, v in p4.subscriptions do
			v.remove()
		end
	end
	
	function navigationFocusComponent.render(p5)
		-- upvalues: reactModule (copy), p1 (ref), object (copy)
		return reactModule.createElement(p1, object.assign(table.clone(p5.props), { isFocused = p5.state.isFocused }))
	end
	
	return withNavigationModule(navigationFocusComponent, { forwardRef = false })
end