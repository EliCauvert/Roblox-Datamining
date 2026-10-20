local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local APIFunction = require(Parent.AppChatNetworking).rodux.GetConversationDetails.API
local RemovedConversationModule = require(AppChat.Conversations.Actions.RemovedConversation)
local EnumScreensModule = require(AppChat.EnumScreens)
local GroupOSADialogModule = require(script.Parent.GroupOSADialog)

return function()
	-- upvalues: UseNavigationFunction (copy), UseDispatchFunction (copy), ReactModule (copy), APIFunction (copy), EnumScreensModule (copy), RemovedConversationModule (copy), GroupOSADialogModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local ConversationIdParam = UseNavigationResult.getParam("conversationId", nil)
	
	return ReactModule.createElement(GroupOSADialogModule, {
		conversationId = ConversationIdParam,
		onClose = ReactModule.useCallback(function()
			-- upvalues: UseNavigationResult (copy)
			if UseNavigationResult.isFocused() then
				UseNavigationResult.goBack()
			end
		end, { UseNavigationResult }),
		onJoin = ReactModule.useCallback(function()
			-- upvalues: ConversationIdParam (copy), UseDispatchResult (copy), APIFunction (upval), UseNavigationResult (copy), EnumScreensModule (upval)
			if ConversationIdParam then
				UseDispatchResult(APIFunction(ConversationIdParam))
			end
			UseNavigationResult.navigate(EnumScreensModule.ChatConversation, {
				isNavigatedFromGroupOSAJoin = true,
				conversationId = ConversationIdParam
			})
		end, {
			UseNavigationResult,
			ConversationIdParam,
			UseDispatchResult
		}),
		onDecline = ReactModule.useCallback(function()
			-- upvalues: ConversationIdParam (copy), UseDispatchResult (copy), RemovedConversationModule (upval), UseNavigationResult (copy)
			if ConversationIdParam then
				UseDispatchResult(RemovedConversationModule(ConversationIdParam))
			end
			if UseNavigationResult.isFocused() then
				UseNavigationResult.goBack()
			end
		end, {
			UseNavigationResult,
			UseDispatchResult,
			ConversationIdParam
		}),
		impressionId = UseNavigationResult.getParam("impressionId", nil),
		modalVariant = UseNavigationResult.getParam("modalVariant", nil)
	})
end