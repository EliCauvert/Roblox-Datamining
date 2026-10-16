local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local EnumScreensModule = require(AppChat.EnumScreens)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local ConversationOverlayContainerModule = require(script.Parent.ConversationOverlayContainer)

return function(_) --[[ Line: 17 ]]
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), EnumScreensModule (copy), ConversationOverlayContainerModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	
	return ReactModule.createElement(ConversationOverlayContainerModule, {
		conversationId = UseNavigationResult and UseNavigationResult.getParam("conversationId", nil),
		dismissModal = ReactModule.useCallback(function() --[[ Line: 20 ]]
			-- upvalues: UseNavigationResult (copy), EnumScreensModule (upval)
			if UseNavigationResult and UseNavigationResult.state.routeName == EnumScreensModule.ConversationOverlay then
				UseNavigationResult.goBack(UseNavigationResult.state.key)
			end
		end, { UseNavigationResult })
	})
end