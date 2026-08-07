local appChat = script:FindFirstAncestor("AppChat")
local roactNavigationModule = require(appChat.Parent.RoactNavigation)
local enumScreensModule = require(appChat.EnumScreens)

return function(p0, p1, p2) --[[ line: 9 ]]
	-- upvalues: enumScreensModule (ref), roactNavigationModule (ref)
	p0.navigate(enumScreensModule.ChatLanding, nil, roactNavigationModule.StackActions.reset({
		index = 2,
		actions = {
			roactNavigationModule.Actions.navigate({
				routeName = enumScreensModule.ChatConversation,
				params = { conversationId = p1 }
			}),
			roactNavigationModule.Actions.navigate({
				routeName = enumScreensModule.SquadLobby,
				params = { conversationId = p1, extraParams = p2 }
			})
		}
	}))
end