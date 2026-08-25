local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local populateUserWithStateModule = require(appChat.Users.populateUserWithState)
local _ = require(appChat.types)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local useCallback = reactModule.useCallback
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useState = reactModule.useState
local removeUserDialogLayoutModule = require(script.Parent.RemoveUserDialogLayout)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local t = {
	participantId = nil,
	titleKey = "Feature.Chat.Action.RemoveUser",
	cancelTitleKey = "Feature.Chat.Action.Cancel",
	confirmationTitleKey = "Feature.Chat.Action.Remove",
	failureTitleKey = "Feature.Chat.Heading.FailedToRemoveUser",
	failureButtonKey = "Feature.Chat.Action.Confirm",
	onModalClose = function() end,
	messageKey = if getFFlagIsSquadEnabled() then "Feature.Chat.Message.RemoveUser.V2" else "Feature.Chat.Message.RemoveUser",
	failureBodyKey = if getFFlagIsSquadEnabled() then "Feature.Chat.Message.FailedToRemoveUser.V2" else "Feature.Chat.Message.FailedToRemoveUser"
}

function RemoveUserDialogContainer(p0)
	-- upvalues: cryoModule (ref), t (ref), useState (ref), useDispatch (ref), useCallback (ref), appChatNetworkingModule (ref), useSelector (ref), populateUserWithStateModule (ref), useLocalization (ref), reactModule (ref), removeUserDialogLayoutModule (ref)
	local var7 = cryoModule.Dictionary.join(t, p0)
	local var8, var9 = useState(true)
	local var10, var11 = useState(false)
	local var12, var13 = useState(false)
	local var14 = useDispatch()
	local var15 = useCallback(function(p1, p2)
		-- upvalues: var14 (ref), appChatNetworkingModule (copy)
		return var14(appChatNetworkingModule.rodux.RemoveUserFromConversation.API(p2, p1))
	end, { var14 })
	local var16 = useSelector(function(p3)
		-- upvalues: var7 (ref), populateUserWithStateModule (copy)
		return {
			conversationTitle = (p3.ChatAppReducer.Conversations[var7.conversationId] or { title = nil }).title,
			targetUser = populateUserWithStateModule(p3, p3.Users[var7.participantId])
		}
	end)
	
	return reactModule.createElement(removeUserDialogLayoutModule, cryoModule.Dictionary.join(var7, useLocalization({
		failureTitleText = "Feature.Chat.Heading.FailedToRemoveUser",
		failureButtonText = "Feature.Chat.Action.Confirm",
		titleText = var7.titleKey,
		bodyText = { var7.messageKey, USERNAME = var16.targetUser.displayName },
		cancelText = var7.cancelTitleKey,
		confirmText = var7.confirmationTitleKey,
		failureBodyText = {
			var7.failureBodyKey,
			USERNAME = var16.targetUser.displayName,
			CONVERSATION_TITLE = var16.conversationTitle
		}
	}), var16, {
		onActivated = useCallback(function()
			-- upvalues: var11 (ref), var9 (ref), var7 (ref), var15 (ref), var13 (ref)
			var11(true)
			var9(false)
			local conversationId = var7.conversationId
			
			if conversationId then
				var15(var7.participantId, conversationId):andThen(function()
					-- upvalues: var7 (copy)
					var7.onModalClose()
				end):catch(function()
					-- upvalues: var11 (copy), var9 (copy), var13 (copy)
					var11(false)
					var9(true)
					var13(true)
				end)
			end
			return true
		end, { var7.participantId, var7.conversationId }),
		displayFailed = var12,
		isModalVisible = var8,
		isLoading = var10
	}))
end

return memo(RemoveUserDialogContainer)