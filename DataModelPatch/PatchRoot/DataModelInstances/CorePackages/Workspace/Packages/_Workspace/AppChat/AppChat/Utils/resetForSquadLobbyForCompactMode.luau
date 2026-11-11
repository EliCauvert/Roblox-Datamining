local AppChat = script:FindFirstAncestor("AppChat")
local RoactNavigationModule = require(AppChat.Parent.RoactNavigation)
local EnumScreensModule = require(AppChat.EnumScreens)

return function(p1, ConversationId, ExtraParams)
	-- upvalues: RoactNavigationModule (copy), EnumScreensModule (copy)
	p1.reset({
		RoactNavigationModule.Actions.navigate({ routeName = EnumScreensModule.ChatLanding }),
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
	}, 3)
end