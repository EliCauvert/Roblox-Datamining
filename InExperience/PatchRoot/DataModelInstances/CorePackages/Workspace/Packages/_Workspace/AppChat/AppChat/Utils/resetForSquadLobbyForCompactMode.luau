local appChat = script:FindFirstAncestor("AppChat")
local roactNavigationModule = require(appChat.Parent.RoactNavigation)
local enumScreensModule = require(appChat.EnumScreens)

return function(p0, p1, p2)
	-- upvalues: roactNavigationModule (ref), enumScreensModule (ref)
	p0.reset({
		roactNavigationModule.Actions.navigate({ routeName = enumScreensModule.ChatLanding }),
		roactNavigationModule.Actions.navigate({
			routeName = enumScreensModule.ChatConversation,
			params = { conversationId = p1 }
		}),
		roactNavigationModule.Actions.navigate({
			routeName = enumScreensModule.SquadLobby,
			params = { conversationId = p1, extraParams = p2 }
		})
	}, 3)
end