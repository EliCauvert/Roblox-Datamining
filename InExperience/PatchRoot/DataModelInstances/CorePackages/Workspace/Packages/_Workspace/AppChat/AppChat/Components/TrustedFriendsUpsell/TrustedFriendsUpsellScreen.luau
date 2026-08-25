local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local name = require(appChat.Logger):new(script.Name)
local enumScreensModule = require(appChat.EnumScreens)
local useNavigation = require(parent.Navigation).useNavigation
local trustedFriendsUpsellContainerModule = require(script.Parent.TrustedFriendsUpsellContainer)

return function(_)
	-- upvalues: useNavigation (ref), reactModule (ref), enumScreensModule (ref), name (ref), trustedFriendsUpsellContainerModule (ref)
	local var5 = useNavigation()
	local userId = var5 and var5.getParam("userId", nil)
	local conversationId = var5 and var5.getParam("conversationId", nil)
	local modalVariant = var5 and var5.getParam("modalVariant", nil)
	local source = var5 and var5.getParam("source", nil)
	local modalVariantOverride = var5 and var5.getParam("modalVariantOverride", nil)
	local onRequestSent = var5 and var5.getParam("onRequestSent", nil)
	local onRequestAccepted = var5 and var5.getParam("onRequestAccepted", nil)
	local onAcknowledged = var5 and var5.getParam("onAcknowledged", nil)
	local var14 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), enumScreensModule (copy)
		if var5 and var5.state.routeName == enumScreensModule.TrustedConnectionsUpsell then
			var5.goBack(var5.state.key)
		end
	end, { var5 })
	
	if userId then
		return reactModule.createElement(trustedFriendsUpsellContainerModule, {
			userId = userId,
			dismissModal = var14,
			source = source,
			conversationId = conversationId,
			analyticsModalVariant = modalVariant,
			modalVariantOverride = modalVariantOverride,
			onRequestSent = onRequestSent,
			onRequestAccepted = onRequestAccepted,
			onAcknowledged = onAcknowledged
		})
	end
	name:error("TrustedFriendsUpsellScreen: Missing required userId param", {
		conversationId = conversationId,
		modalVariant = modalVariant
	})
	
	if var5 then
		var5.goBack()
	end
	return nil
end