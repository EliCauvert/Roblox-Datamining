local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local NewResult = require(AppChat.Logger):new(script.Name)
local EnumScreensModule = require(AppChat.EnumScreens)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local TrustedFriendsUpsellContainerModule = require(script.Parent.TrustedFriendsUpsellContainer)

return function(_) --[[ Line: 17 ]]
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), EnumScreensModule (copy), NewResult (copy), TrustedFriendsUpsellContainerModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UserIdParam = UseNavigationResult and UseNavigationResult.getParam("userId", nil)
	local ConversationIdParam = UseNavigationResult and UseNavigationResult.getParam("conversationId", nil)
	local ModalVariantParam = UseNavigationResult and UseNavigationResult.getParam("modalVariant", nil)
	local SourceParam = UseNavigationResult and UseNavigationResult.getParam("source", nil)
	local ModalVariantOverrideParam = UseNavigationResult and UseNavigationResult.getParam("modalVariantOverride", nil)
	local OnRequestSentParam = UseNavigationResult and UseNavigationResult.getParam("onRequestSent", nil)
	local OnRequestAcceptedParam = UseNavigationResult and UseNavigationResult.getParam("onRequestAccepted", nil)
	local OnAcknowledgedParam = UseNavigationResult and UseNavigationResult.getParam("onAcknowledged", nil)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 28 ]]
		-- upvalues: UseNavigationResult (copy), EnumScreensModule (upval)
		if UseNavigationResult and UseNavigationResult.state.routeName == EnumScreensModule.TrustedConnectionsUpsell then
			UseNavigationResult.goBack(UseNavigationResult.state.key)
		end
	end, { UseNavigationResult })
	
	if UserIdParam then
		return ReactModule.createElement(TrustedFriendsUpsellContainerModule, {
			userId = UserIdParam,
			dismissModal = UseResult,
			source = SourceParam,
			conversationId = ConversationIdParam,
			analyticsModalVariant = ModalVariantParam,
			modalVariantOverride = ModalVariantOverrideParam,
			onRequestSent = OnRequestSentParam,
			onRequestAccepted = OnRequestAcceptedParam,
			onAcknowledged = OnAcknowledgedParam
		})
	end
	NewResult:error("TrustedFriendsUpsellScreen: Missing required userId param", {
		conversationId = ConversationIdParam,
		modalVariant = ModalVariantParam
	})
	
	if UseNavigationResult then
		UseNavigationResult.goBack()
	end
	return nil
end