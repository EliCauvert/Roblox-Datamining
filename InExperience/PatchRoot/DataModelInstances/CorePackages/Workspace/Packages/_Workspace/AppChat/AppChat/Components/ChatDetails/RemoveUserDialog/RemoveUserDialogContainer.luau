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

function RemoveUserDialogContainer(p1)
	-- upvalues: cryoModule (ref), t (ref), useState (ref), useDispatch (ref), useCallback (ref), appChatNetworkingModule (ref), useSelector (ref), populateUserWithStateModule (ref), useLocalization (ref), reactModule (ref), removeUserDialogLayoutModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2, var3 = useState(true)
	local var4, var5 = useState(false)
	local var6, var7 = useState(false)
	local var8 = useDispatch()
	local var9 = useCallback(function(p2, p3)
		-- upvalues: var8 (ref), appChatNetworkingModule (copy)
		return var8(appChatNetworkingModule.rodux.RemoveUserFromConversation.API(p3, p2))
	end, { var8 })
	local var10 = useSelector(function(p2)
		-- upvalues: var1 (ref), populateUserWithStateModule (copy)
		return {
			conversationTitle = (p2.ChatAppReducer.Conversations[var1.conversationId] or { title = nil }).title,
			targetUser = populateUserWithStateModule(p2, p2.Users[var1.participantId])
		}
	end)
	
	return reactModule.createElement(removeUserDialogLayoutModule, cryoModule.Dictionary.join(var1, useLocalization({
		failureTitleText = "Feature.Chat.Heading.FailedToRemoveUser",
		failureButtonText = "Feature.Chat.Action.Confirm",
		titleText = var1.titleKey,
		bodyText = { var1.messageKey, USERNAME = var10.targetUser.displayName },
		cancelText = var1.cancelTitleKey,
		confirmText = var1.confirmationTitleKey,
		failureBodyText = {
			var1.failureBodyKey,
			USERNAME = var10.targetUser.displayName,
			CONVERSATION_TITLE = var10.conversationTitle
		}
	}), var10, {
		onActivated = useCallback(function()
			-- upvalues: var5 (ref), var3 (ref), var1 (ref), var9 (ref), var7 (ref)
			var5(true)
			var3(false)
			local conversationId = var1.conversationId
			
			if conversationId then
				var9(var1.participantId, conversationId):andThen(function()
					-- upvalues: var1 (copy)
					var1.onModalClose()
				end):catch(function()
					-- upvalues: var5 (copy), var3 (copy), var7 (copy)
					var5(false)
					var3(true)
					var7(true)
				end)
			end
			return true
		end, { var1.participantId, var1.conversationId }),
		displayFailed = var6,
		isModalVisible = var2,
		isLoading = var4
	}))
end

return memo(RemoveUserDialogContainer)