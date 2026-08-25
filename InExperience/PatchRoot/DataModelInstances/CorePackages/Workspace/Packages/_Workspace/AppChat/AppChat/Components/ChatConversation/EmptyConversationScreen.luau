local roactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local emptyConversationPageModule = require(script.Parent.EmptyConversationPage)
local emptyConversationScreen = roactModule.PureComponent:extend("EmptyConversationScreen")
emptyConversationScreen.defaultProps = { navigation = nil }

function emptyConversationScreen.render(p0)
	-- upvalues: roactModule (ref), emptyConversationPageModule (ref)
	local navigation = p0.props.navigation
	assert(type(navigation) ~= "nil", "ChatConversationScreen should be wrapped with Roact Navigation")
	
	return roactModule.createElement(emptyConversationPageModule, {
		topBarHeight = navigation.getScreenProps("topBarHeight", 0)
	})
end

return emptyConversationScreen