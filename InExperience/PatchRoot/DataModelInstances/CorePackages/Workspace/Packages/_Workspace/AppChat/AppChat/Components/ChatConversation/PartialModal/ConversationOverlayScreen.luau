local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local enumScreensModule = require(appChat.EnumScreens)
local useNavigation = require(parent.Navigation).useNavigation
local conversationOverlayContainerModule = require(script.Parent.ConversationOverlayContainer)

return function(_)
	-- upvalues: useNavigation (ref), reactModule (ref), enumScreensModule (ref), conversationOverlayContainerModule (ref)
	local var4 = useNavigation()
	
	return reactModule.createElement(conversationOverlayContainerModule, {
		conversationId = var4 and var4.getParam("conversationId", nil),
		dismissModal = reactModule.useCallback(function()
			-- upvalues: var4 (ref), enumScreensModule (copy)
			if var4 and var4.state.routeName == enumScreensModule.ConversationOverlay then
				var4.goBack(var4.state.key)
			end
		end, { var4 })
	})
end