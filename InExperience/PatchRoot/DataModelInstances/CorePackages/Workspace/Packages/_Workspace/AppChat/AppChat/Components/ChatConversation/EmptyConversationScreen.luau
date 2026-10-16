local RoactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local EmptyConversationPageModule = require(script.Parent.EmptyConversationPage)
local EmptyConversationScreen = RoactModule.PureComponent:extend("EmptyConversationScreen")
EmptyConversationScreen.defaultProps = { navigation = nil }

function EmptyConversationScreen.render(p1) --[[ Line: 13 ]]
	-- upvalues: RoactModule (copy), EmptyConversationPageModule (copy)
	local Navigation = p1.props.navigation
	assert(type(Navigation) ~= "nil", "ChatConversationScreen should be wrapped with Roact Navigation")
	
	return RoactModule.createElement(EmptyConversationPageModule, {
		topBarHeight = Navigation.getScreenProps("topBarHeight", 0)
	})
end

return EmptyConversationScreen