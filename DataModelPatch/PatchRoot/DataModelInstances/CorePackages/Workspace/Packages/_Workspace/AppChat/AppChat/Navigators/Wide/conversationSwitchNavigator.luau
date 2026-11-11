local AppChat = script:FindFirstAncestor("AppChat")

return (require(AppChat.Parent.RoactNavigation).createRobloxSwitchNavigator({
	{
		[require(AppChat.EnumScreens).EmptyConversation] = {
			screen = require(AppChat.Components.ChatConversation.EmptyConversationScreen),
			navigationOptions = {
				backButtonEnabled = false,
				isRoot = true,
				tabBarVisible = true,
				headerText = { raw = "testing", shouldLocalize = false }
			}
		}
	},
	{
		ConversationStackNavigator = require(script.Parent.ConversationStackNavigatorConnector)
	}
}))