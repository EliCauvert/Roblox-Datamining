local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local PopulateUserWithStateModule = require(AppChat.Users.populateUserWithState)
local _ = require(AppChat.types)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local MemoFunction = ReactModule.memo
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseStateFunction = ReactModule.useState
local RemoveUserDialogLayoutModule = require(script.Parent.RemoveUserDialogLayout)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local config = {
	participantId = nil,
	titleKey = "Feature.Chat.Action.RemoveUser",
	cancelTitleKey = "Feature.Chat.Action.Cancel",
	confirmationTitleKey = "Feature.Chat.Action.Remove",
	failureTitleKey = "Feature.Chat.Heading.FailedToRemoveUser",
	failureButtonKey = "Feature.Chat.Action.Confirm",
	onModalClose = function() --[[ Line: 40 ]] end,
	messageKey = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Message.RemoveUser.V2" else "Feature.Chat.Message.RemoveUser",
	failureBodyKey = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Message.FailedToRemoveUser.V2" else "Feature.Chat.Message.FailedToRemoveUser"
}

function RemoveUserDialogContainer(p1) --[[ Line: 57 ]]
	-- upvalues: CryoModule (copy), config (copy), UseStateFunction (copy), UseDispatchFunction (copy), UseCallbackFunction (copy), AppChatNetworkingModule (copy), UseSelectorFunction (copy), PopulateUserWithStateModule (copy), UseLocalizationFunction (copy), ReactModule (copy), RemoveUserDialogLayoutModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStateResult, UseStateResult2 = UseStateFunction(true)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(false)
	local UseDispatchResult = UseDispatchFunction()
	local UseCallbackResult = UseCallbackFunction(function(p2, p3) --[[ Line: 64 ]]
		-- upvalues: UseDispatchResult (copy), AppChatNetworkingModule (upval)
		return UseDispatchResult(AppChatNetworkingModule.rodux.RemoveUserFromConversation.API(p3, p2))
	end, { UseDispatchResult })
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 68 ]]
		-- upvalues: JoinResult (copy), PopulateUserWithStateModule (upval)
		return {
			conversationTitle = (p2.ChatAppReducer.Conversations[JoinResult.conversationId] or { title = nil }).title,
			targetUser = PopulateUserWithStateModule(p2, p2.Users[JoinResult.participantId])
		}
	end)
	
	return ReactModule.createElement(RemoveUserDialogLayoutModule, CryoModule.Dictionary.join(JoinResult, UseLocalizationFunction({
		failureTitleText = "Feature.Chat.Heading.FailedToRemoveUser",
		failureButtonText = "Feature.Chat.Action.Confirm",
		titleText = JoinResult.titleKey,
		bodyText = {
			JoinResult.messageKey,
			USERNAME = UseSelectorResult.targetUser.displayName
		},
		cancelText = JoinResult.cancelTitleKey,
		confirmText = JoinResult.confirmationTitleKey,
		failureBodyText = {
			JoinResult.failureBodyKey,
			USERNAME = UseSelectorResult.targetUser.displayName,
			CONVERSATION_TITLE = UseSelectorResult.conversationTitle
		}
	}), UseSelectorResult, {
		onActivated = UseCallbackFunction(function(): boolean --[[ Line: 80 ]]
			-- upvalues: UseStateResult2_1 (copy), UseStateResult2 (copy), JoinResult (copy), UseCallbackResult (copy), UseStateResult2_2 (copy)
			UseStateResult2_1(true)
			UseStateResult2(false)
			local ConversationId = JoinResult.conversationId
			
			if ConversationId then
				UseCallbackResult(JoinResult.participantId, ConversationId):andThen(function() --[[ Line: 87 ]]
					-- upvalues: JoinResult (upval)
					JoinResult.onModalClose()
				end):catch(function() --[[ Line: 90 ]]
					-- upvalues: UseStateResult2_1 (upval), UseStateResult2 (upval), UseStateResult2_2 (upval)
					UseStateResult2_1(false)
					UseStateResult2(true)
					UseStateResult2_2(true)
				end)
			end
			return true
		end, { JoinResult.participantId, JoinResult.conversationId }),
		displayFailed = UseStateResult3,
		isModalVisible = UseStateResult,
		isLoading = UseStateResult1
	}))
end

return MemoFunction(RemoveUserDialogContainer)