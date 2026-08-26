local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local name = require(appChat.Logger):new(script.Name)
local enumScreensModule = require(appChat.EnumScreens)
local useNavigation = require(parent.Navigation).useNavigation
local trustedConnectionsUpsellContainerModule = require(script.Parent.TrustedConnectionsUpsellContainer)

return function(_)
	-- upvalues: useNavigation (ref), reactModule (ref), enumScreensModule (ref), name (ref), trustedConnectionsUpsellContainerModule (ref)
	local var1 = useNavigation()
	local conversationId = var1 and var1.getParam("conversationId", nil)
	local modalVariant = var1 and var1.getParam("modalVariant", nil)
	local var2 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), enumScreensModule (copy)
		if var1 and var1.state.routeName == enumScreensModule.TrustedConnectionsUpsell then
			var1.goBack(var1.state.key)
		end
	end, { var1 })
	
	if modalVariant and conversationId then
		return reactModule.createElement(trustedConnectionsUpsellContainerModule, {
			conversationId = conversationId,
			dismissModal = var2,
			modalVariant = modalVariant
		})
	end
	name:error("TrustedConnectionsUpsellScreen: Missing required parameters", {
		conversationId = conversationId,
		modalVariant = modalVariant
	})
	var1.goBack()
	
	return nil
end