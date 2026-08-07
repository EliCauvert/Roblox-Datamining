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

return function() --[[ line: 17 | named "GroupOSADialogScreen" ]]
	-- upvalues: useNavigation (ref), useDispatch (ref), reactModule (ref), API (ref), enumScreensModule (ref), removedConversationModule (ref), groupOSADialogModule (ref), appChatGroupOsaDisablePortal (ref)
	local var6 = useNavigation()
	local var7 = useDispatch()
	local conversationId = var6.getParam("conversationId", nil)
	
	return reactModule.createElement(groupOSADialogModule, {
		conversationId = conversationId,
		onClose = reactModule.useCallback(function() --[[ line: 24 ]]
			-- upvalues: var6 (ref)
			if var6.isFocused() then
				var6.goBack()
			end
		end, { var6 }),
		onJoin = reactModule.useCallback(function() --[[ line: 30 ]]
			-- upvalues: conversationId (ref), var7 (ref), API (copy), var6 (ref), enumScreensModule (copy)
			if conversationId then
				var7(API(conversationId))
			end
			var6.navigate(enumScreensModule.ChatConversation, {
				isNavigatedFromGroupOSAJoin = true,
				conversationId = conversationId
			})
		end, { var6, conversationId, var7 }),
		onDecline = reactModule.useCallback(function() --[[ line: 41 ]]
			-- upvalues: conversationId (ref), var7 (ref), removedConversationModule (copy), var6 (ref)
			if conversationId then
				var7(removedConversationModule(conversationId))
			end
			if var6.isFocused() then
				var6.goBack()
			end
		end, { var6, var7, conversationId }),
		disablePortal = appChatGroupOsaDisablePortal,
		impressionId = var6.getParam("impressionId", nil),
		modalVariant = var6.getParam("modalVariant", nil)
	})
end