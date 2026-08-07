local appChat = script:FindFirstAncestor("AppChat")

return require(appChat.Parent.RoactNavigation).createRobloxSwitchNavigator({
	{
		[require(appChat.EnumScreens).EmptyConversation] = {
			screen = require(appChat.Components.ChatConversation.EmptyConversationScreen),
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
})