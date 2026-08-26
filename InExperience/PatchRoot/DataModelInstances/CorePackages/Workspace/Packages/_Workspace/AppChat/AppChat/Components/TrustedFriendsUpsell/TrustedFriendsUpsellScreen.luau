local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local name = require(appChat.Logger):new(script.Name)
local enumScreensModule = require(appChat.EnumScreens)
local useNavigation = require(parent.Navigation).useNavigation
local trustedFriendsUpsellContainerModule = require(script.Parent.TrustedFriendsUpsellContainer)

return function(_)
	-- upvalues: useNavigation (ref), reactModule (ref), enumScreensModule (ref), name (ref), trustedFriendsUpsellContainerModule (ref)
	local var1 = useNavigation()
	local userId = var1 and var1.getParam("userId", nil)
	local conversationId = var1 and var1.getParam("conversationId", nil)
	local modalVariant = var1 and var1.getParam("modalVariant", nil)
	local source = var1 and var1.getParam("source", nil)
	local modalVariantOverride = var1 and var1.getParam("modalVariantOverride", nil)
	local onRequestSent = var1 and var1.getParam("onRequestSent", nil)
	local onRequestAccepted = var1 and var1.getParam("onRequestAccepted", nil)
	local onAcknowledged = var1 and var1.getParam("onAcknowledged", nil)
	local var2 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), enumScreensModule (copy)
		if var1 and var1.state.routeName == enumScreensModule.TrustedConnectionsUpsell then
			var1.goBack(var1.state.key)
		end
	end, { var1 })
	
	if userId then
		return reactModule.createElement(trustedFriendsUpsellContainerModule, {
			userId = userId,
			dismissModal = var2,
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
	
	if var1 then
		var1.goBack()
	end
	return nil
end