local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local enumScreensModule = require(appChat.EnumScreens)
local networkingFriendsModule = require(appChat.Http.NetworkingFriends)
local _ = require(appChat.types)
local useAppPolicyModule = require(appChat.Hooks.useAppPolicy)
local useIsExternalNavigationAvailableModule = require(appChat.Hooks.useIsExternalNavigationAvailable)
local conversationModule = require(appChat.Models.Conversation)
local cryoModule = require(parent.Cryo)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local _ = require(parent.ReactFocusNavigation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local appFocusRoot = focusNavigationUtilsModule.AppFocusRoot
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local fFlagEnableChatDetailsOpenChatModule = require(appChat.Flags.FFlagEnableChatDetailsOpenChat)
local memo = reactModule.memo
local participantDialogDeprecatedModule = require(script.Parent.ParticipantDialogDeprecated)
local playerContextualMenuWrapperModule = require(script.Parent.PlayerContextualMenuWrapper)
local t = {
	conversationId = nil,
	participantId = nil,
	showRemoveUserButton = false,
	isWideMode = false,
	viewProfileText = "Feature.Chat.Label.ViewProfile",
	chatText = "CommonUI.Features.Label.Chat",
	reportUserText = "Feature.Chat.Action.ReportUser",
	removeFromGroupText = "Feature.Chat.Action.RemoveFromGroup",
	cancelText = "Feature.Chat.Action.Cancel",
	openViewProfile = nil,
	openChat = nil,
	openReportUser = nil,
	openRemoveUserDialog = nil,
	onDismiss = function() --[[ line: 69 ]] end
}

function ParticipantDialogContainerDeprecated(p0) --[[ line: 73 ]]
	-- upvalues: cryoModule (ref), t (ref), useAppPolicyModule (ref), fFlagEnableChatDetailsOpenChatModule (ref), useSelector (ref), conversationModule (ref), useDispatch (ref), reactModule (ref), networkingFriendsModule (ref), useLocalization (ref), useIsExternalNavigationAvailableModule (ref), enumScreensModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), playerContextualMenuWrapperModule (ref), focusNavigableSurfaceWrapper (ref), participantDialogDeprecatedModule (ref)
	local var14 = cryoModule.Dictionary.join(t, p0)
	local var15 = useAppPolicyModule(function(p1) --[[ line: 75 ]]
		return p1.getChatViewProfileOption()
	end)
	local _ = nil
	local _ = nil
	local _ = nil
	local var16 = false
	
	if fFlagEnableChatDetailsOpenChatModule then
		local var17 = useSelector(function(p2) --[[ line: 85 ]]
			-- upvalues: var14 (ref), conversationModule (copy)
			local conversations = p2.ChatAppReducer and p2.ChatAppReducer.Conversations
			local conversationId = conversations and conversations[var14.conversationId]
			
			return conversationId and conversationId.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
		end)
		local var18 = useDispatch()
		local var19 = useSelector(function(p3) --[[ line: 93 ]]
			-- upvalues: var14 (ref)
			local friends = p3.ChatAppReducer and p3.ChatAppReducer.Friends
			local friendshipStatus = friends and friends.friendshipStatus
			
			return friendshipStatus and friendshipStatus[var14.participantId] == Enum.FriendStatus.Friend
		end)
		reactModule.useEffect(function() --[[ line: 99 ]]
			-- upvalues: var17 (write), var18 (write), networkingFriendsModule (copy), var14 (ref)
			if var17 then
				var18(networkingFriendsModule.GetExtendedFriendshipStatus.API({ targetUserId = var14.participantId }))
			end
		end, { var14.participantId, var18, var17 })
		var16 = if var17 and var19 then true else false
	end
	local var20 = useLocalization({
		viewProfileText = var14.viewProfileText,
		chatText = if fFlagEnableChatDetailsOpenChatModule then var14.chatText else nil,
		reportUserText = var14.reportUserText,
		removeFromGroupText = var14.removeFromGroupText,
		cancelText = var14.cancelText
	})
	local var21 = reactModule.useMemo(function() --[[ line: 122 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var14 (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p4) --[[ line: 125 ]]
					-- upvalues: var14 (copy)
					var14.onDismiss()
					p4:cancel()
				end)
			}
		}
	end, { var14.onDismiss })
	
	return if useIsExternalNavigationAvailableModule({ enumScreensModule.ViewUserProfile })[enumScreensModule.ViewUserProfile] then reactModule.createElement(focusNavigableSurfaceWrapper, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		customEventHandlers = var21,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(participantDialogDeprecatedModule, cryoModule.Dictionary.join(var14, var20, {
			showViewProfileButton = var15,
			showChatButton = var16,
			isWideMode = var14.isWideMode
		}))
	}) else reactModule.createElement(appFocusRoot, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		shouldRestoreFocus = false,
		customEventHandlers = var21,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(playerContextualMenuWrapperModule, {
			conversationId = var14.conversationId,
			participantId = var14.participantId,
			onDismiss = var14.onDismiss,
			openRemoveUserDialog = var14.openRemoveUserDialog,
			removeFromGroupText = var20.removeFromGroupText,
			openReportUser = var14.openReportUser,
			showRemoveUserButton = var14.showRemoveUserButton,
			openBlockingModal = var14.openBlockingModal
		})
	})
end

return memo(ParticipantDialogContainerDeprecated)