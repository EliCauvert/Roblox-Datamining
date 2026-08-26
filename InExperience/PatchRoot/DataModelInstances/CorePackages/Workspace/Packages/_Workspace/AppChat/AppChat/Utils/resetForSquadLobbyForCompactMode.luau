local appChat = script:FindFirstAncestor("AppChat")
local roactNavigationModule = require(appChat.Parent.RoactNavigation)
local enumScreensModule = require(appChat.EnumScreens)

return function(p1, p2, p3)
	-- upvalues: roactNavigationModule (ref), enumScreensModule (ref)
	p1.reset({
		roactNavigationModule.Actions.navigate({ routeName = enumScreensModule.ChatLanding }),
		roactNavigationModule.Actions.navigate({
			routeName = enumScreensModule.ChatConversation,
			params = { conversationId = p2 }
		}),
		roactNavigationModule.Actions.navigate({
			routeName = enumScreensModule.SquadLobby,
			params = { conversationId = p2, extraParams = p3 }
		})
	}, 3)
end