local AppChat = script:FindFirstAncestor("AppChat")
local RoactNavigationModule = require(AppChat.Parent.RoactNavigation)
local EnumScreensModule = require(AppChat.EnumScreens)

return function(p1, ConversationId, ExtraParams)
	-- upvalues: EnumScreensModule (copy), RoactNavigationModule (copy)
	p1.navigate(EnumScreensModule.ChatLanding, nil, RoactNavigationModule.StackActions.reset({
		index = 2,
		actions = {
			RoactNavigationModule.Actions.navigate({
				routeName = EnumScreensModule.ChatConversation,
				params = { conversationId = ConversationId }
			}),
			RoactNavigationModule.Actions.navigate({
				routeName = EnumScreensModule.SquadLobby,
				params = {
					conversationId = ConversationId,
					extraParams = ExtraParams
				}
			})
		}
	}))
end