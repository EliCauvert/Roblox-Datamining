local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Object = require(Parent2.LuauPolyfill).Object
local ReactModule = require(Parent2.React)
local EventsModule = require(Parent1.Events)
local WithNavigationModule = require(Parent.withNavigation)

local function _(p1): boolean
	local ValueType = type(p1)
	
	return ValueType == "function" or ValueType == "table"
end

return function(p1)
	-- upvalues: ReactModule (copy), EventsModule (copy), Object (copy), WithNavigationModule (copy)
	local ValueType = type(p1)
	assert(ValueType == "function" or ValueType == "table", "withNavigationFocus must be called with a Roact component (stateful or functional)")
	local NavigationFocusComponent = ReactModule.Component:extend("NavigationFocusComponent")
	
	function NavigationFocusComponent.init(p2)
		p2.state = { isFocused = p2.props.navigation.isFocused() }
	end
	
	function NavigationFocusComponent.didMount(p2)
		-- upvalues: EventsModule (upval)
		local Navigation = p2.props.navigation
		p2.subscriptions = {
			Navigation.addListener(EventsModule.WillFocus, function()
				-- upvalues: p2 (copy)
				p2:setState({ isFocused = true })
			end),
			Navigation.addListener(EventsModule.WillBlur, function()
				-- upvalues: p2 (copy)
				p2:setState({ isFocused = false })
			end)
		}
	end
	
	function NavigationFocusComponent.willUnmount(p2)
		for _, subscription in p2.subscriptions do
			subscription.remove()
		end
	end
	
	function NavigationFocusComponent.render(p3)
		-- upvalues: ReactModule (upval), p1 (copy), Object (upval)
		return ReactModule.createElement(p1, Object.assign(table.clone(p3.props), { isFocused = p3.state.isFocused }))
	end
	
	return WithNavigationModule(NavigationFocusComponent, { forwardRef = false })
end