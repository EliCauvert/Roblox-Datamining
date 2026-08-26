local appChat = script:FindFirstAncestor("AppChat")
local roactNavigationModule = require(appChat.Parent.RoactNavigation)
local enumScreensModule = require(appChat.EnumScreens)

return function(p1, p2, p3)
	-- upvalues: enumScreensModule (ref), roactNavigationModule (ref)
	p1.navigate(enumScreensModule.ChatLanding, nil, roactNavigationModule.StackActions.reset({
		index = 2,
		actions = {
			roactNavigationModule.Actions.navigate({
				routeName = enumScreensModule.ChatConversation,
				params = { conversationId = p2 }
			}),
			roactNavigationModule.Actions.navigate({
				routeName = enumScreensModule.SquadLobby,
				params = { conversationId = p2, extraParams = p3 }
			})
		}
	}))
end