local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local name = require(appChat.Logger):new(script.Name)
local enumScreensModule = require(appChat.EnumScreens)
local useNavigation = require(parent.Navigation).useNavigation
local trustedConnectionsUpsellContainerModule = require(script.Parent.TrustedConnectionsUpsellContainer)

return function(_) --[[ line: 13 ]]
	-- upvalues: useNavigation (ref), reactModule (ref), enumScreensModule (ref), name (ref), trustedConnectionsUpsellContainerModule (ref)
	local var5 = useNavigation()
	local conversationId = var5 and var5.getParam("conversationId", nil)
	local modalVariant = var5 and var5.getParam("modalVariant", nil)
	local var8 = reactModule.useCallback(function() --[[ line: 17 ]]
		-- upvalues: var5 (ref), enumScreensModule (copy)
		if var5 and var5.state.routeName == enumScreensModule.TrustedConnectionsUpsell then
			var5.goBack(var5.state.key)
		end
	end, { var5 })
	
	if modalVariant and conversationId then
		return reactModule.createElement(trustedConnectionsUpsellContainerModule, {
			conversationId = conversationId,
			dismissModal = var8,
			modalVariant = modalVariant
		})
	end
	name:error("TrustedConnectionsUpsellScreen: Missing required parameters", {
		conversationId = conversationId,
		modalVariant = modalVariant
	})
	var5.goBack()
	
	return nil
end