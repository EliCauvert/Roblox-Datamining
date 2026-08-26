local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = require(parent.Navigation).useNavigation
local API = require(parent.AppChatNetworking).rodux.GetConversationDetails.API
local removedConversationModule = require(appChat.Conversations.Actions.RemovedConversation)
local enumScreensModule = require(appChat.EnumScreens)
local groupOSADialogModule = require(script.Parent.GroupOSADialog)
local appChatGroupOsaDisablePortal = game:DefineFastFlag("AppChatGroupOsaDisablePortal", false)

return function()
	-- upvalues: useNavigation (ref), useDispatch (ref), reactModule (ref), API (ref), enumScreensModule (ref), removedConversationModule (ref), groupOSADialogModule (ref), appChatGroupOsaDisablePortal (ref)
	local var1 = useNavigation()
	local var2 = useDispatch()
	local conversationId = var1.getParam("conversationId", nil)
	
	return reactModule.createElement(groupOSADialogModule, {
		conversationId = conversationId,
		onClose = reactModule.useCallback(function()
			-- upvalues: var1 (ref)
			if var1.isFocused() then
				var1.goBack()
			end
		end, { var1 }),
		onJoin = reactModule.useCallback(function()
			-- upvalues: conversationId (ref), var2 (ref), API (copy), var1 (ref), enumScreensModule (copy)
			if conversationId then
				var2(API(conversationId))
			end
			var1.navigate(enumScreensModule.ChatConversation, {
				isNavigatedFromGroupOSAJoin = true,
				conversationId = conversationId
			})
		end, { var1, conversationId, var2 }),
		onDecline = reactModule.useCallback(function()
			-- upvalues: conversationId (ref), var2 (ref), removedConversationModule (copy), var1 (ref)
			if conversationId then
				var2(removedConversationModule(conversationId))
			end
			if var1.isFocused() then
				var1.goBack()
			end
		end, { var1, var2, conversationId }),
		disablePortal = appChatGroupOsaDisablePortal,
		impressionId = var1.getParam("impressionId", nil),
		modalVariant = var1.getParam("modalVariant", nil)
	})
end