local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local NewResult = require(AppChat.Logger):new(script.Name)
local EnumScreensModule = require(AppChat.EnumScreens)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local TrustedConnectionsUpsellContainerModule = require(script.Parent.TrustedConnectionsUpsellContainer)

return function(_) --[[ Line: 15 ]]
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), EnumScreensModule (copy), NewResult (copy), TrustedConnectionsUpsellContainerModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local ConversationIdParam = UseNavigationResult and UseNavigationResult.getParam("conversationId", nil)
	local ModalVariantParam = UseNavigationResult and UseNavigationResult.getParam("modalVariant", nil)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 19 ]]
		-- upvalues: UseNavigationResult (copy), EnumScreensModule (upval)
		if UseNavigationResult and UseNavigationResult.state.routeName == EnumScreensModule.TrustedConnectionsUpsell then
			UseNavigationResult.goBack(UseNavigationResult.state.key)
		end
	end, { UseNavigationResult })
	
	if ModalVariantParam and ConversationIdParam then
		return ReactModule.createElement(TrustedConnectionsUpsellContainerModule, {
			conversationId = ConversationIdParam,
			dismissModal = UseResult,
			modalVariant = ModalVariantParam
		})
	else
		NewResult:error("TrustedConnectionsUpsellScreen: Missing required parameters", {
			conversationId = ConversationIdParam,
			modalVariant = ModalVariantParam
		})
		UseNavigationResult.goBack()
		
		return nil
	end
end