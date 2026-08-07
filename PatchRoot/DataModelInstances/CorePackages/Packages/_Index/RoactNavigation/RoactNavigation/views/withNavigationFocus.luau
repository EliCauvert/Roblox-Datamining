-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:03 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local object = require(parent_2.LuauPolyfill).Object
local reactModule = require(parent_2.React)
local eventsModule = require(parent_1.Events)
local withNavigationModule = require(parent.withNavigation)

local function _(p0) --[[ line: 12 | named "isComponent" ]]
	local var3 = type(p0)
	
	return if var3 ~= "function" then var3 == "table" else true
end

return function(p1) --[[ line: 17 ]]
	-- upvalues: reactModule (ref), eventsModule (ref), object (ref), withNavigationModule (ref)
	local var4 = type(p1)
	assert(if var4 ~= "function" then var4 == "table" else true, "withNavigationFocus must be called with a Roact component (stateful or functional)")
	local navigationFocusComponent = reactModule.Component:extend("NavigationFocusComponent")
	
	function navigationFocusComponent.init(p2) --[[ line: 21 ]]
		p2.state = { isFocused = p2.props.navigation.isFocused() }
	end
	
	function navigationFocusComponent.didMount(p3) --[[ line: 27 ]]
		-- upvalues: eventsModule (copy)
		local navigation = p3.props.navigation
		p3.subscriptions = {
			navigation.addListener(eventsModule.WillFocus, function() --[[ line: 31 ]]
				-- upvalues: p3 (ref)
				p3:setState({ isFocused = true })
			end),
			navigation.addListener(eventsModule.WillBlur, function() --[[ line: 37 ]]
				-- upvalues: p3 (ref)
				p3:setState({ isFocused = false })
			end)
		}
	end
	
	function navigationFocusComponent.willUnmount(p4) --[[ line: 46 ]]
		for i, v in p4.subscriptions do
			v.remove()
		end
	end
	
	function navigationFocusComponent.render(p5) --[[ line: 52 ]]
		-- upvalues: reactModule (copy), p1 (ref), object (copy)
		return reactModule.createElement(p1, object.assign(table.clone(p5.props), { isFocused = p5.state.isFocused }))
	end
	
	return withNavigationModule(navigationFocusComponent, { forwardRef = false })
end