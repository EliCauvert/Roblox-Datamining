local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local enumScreensModule = require(appChat.EnumScreens)
local useNavigation = require(parent.Navigation).useNavigation
local conversationOverlayContainerModule = require(script.Parent.ConversationOverlayContainer)

return function(_)
	-- upvalues: useNavigation (ref), reactModule (ref), enumScreensModule (ref), conversationOverlayContainerModule (ref)
	local var1 = useNavigation()
	
	return reactModule.createElement(conversationOverlayContainerModule, {
		conversationId = var1 and var1.getParam("conversationId", nil),
		dismissModal = reactModule.useCallback(function()
			-- upvalues: var1 (ref), enumScreensModule (copy)
			if var1 and var1.state.routeName == enumScreensModule.ConversationOverlay then
				var1.goBack(var1.state.key)
			end
		end, { var1 })
	})
end