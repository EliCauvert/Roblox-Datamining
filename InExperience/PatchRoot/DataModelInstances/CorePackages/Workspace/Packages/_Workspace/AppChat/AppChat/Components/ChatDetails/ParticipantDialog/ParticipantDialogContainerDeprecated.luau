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
local fFlagAppChatMigrateFriendshipStatusesModule = require(appChat.Flags.FFlagAppChatMigrateFriendshipStatuses)
local useGetFriendshipStatus = require(parent.FriendsHydrationReact).useGetFriendshipStatus
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
	onDismiss = function() end
}
local t_1 = { skipFetch = true }

function ParticipantDialogContainerDeprecated(p0)
	-- upvalues: cryoModule (ref), t (ref), useAppPolicyModule (ref), fFlagEnableChatDetailsOpenChatModule (ref), useSelector (ref), conversationModule (ref), useDispatch (ref), fFlagAppChatMigrateFriendshipStatusesModule (ref), useGetFriendshipStatus (ref), t_1 (ref), reactModule (ref), networkingFriendsModule (ref), useLocalization (ref), useIsExternalNavigationAvailableModule (ref), enumScreensModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), playerContextualMenuWrapperModule (ref), focusNavigableSurfaceWrapper (ref), participantDialogDeprecatedModule (ref)
	local var16 = cryoModule.Dictionary.join(t, p0)
	local var17 = useAppPolicyModule(function(p1)
		return p1.getChatViewProfileOption()
	end)
	local _ = nil
	local _ = nil
	local _ = nil
	local var18 = false
	
	if fFlagEnableChatDetailsOpenChatModule then
		local var21
		local var19 = useSelector(function(p2)
			-- upvalues: var16 (ref), conversationModule (copy)
			local conversations = p2.ChatAppReducer and p2.ChatAppReducer.Conversations
			local conversationId = conversations and conversations[var16.conversationId]
			
			return conversationId and conversationId.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
		end)
		local var20 = useDispatch()
		
		if fFlagAppChatMigrateFriendshipStatusesModule then
			local _ = useGetFriendshipStatus(var16.participantId, if var19 then nil else t_1) == Enum.FriendStatus.Friend
		else
			var21 = useSelector(function(p3)
				-- upvalues: var16 (ref)
				local friends = p3.ChatAppReducer and p3.ChatAppReducer.Friends
				local friendshipStatus = friends and friends.friendshipStatus
				
				return friendshipStatus and friendshipStatus[var16.participantId] == Enum.FriendStatus.Friend
			end)
			reactModule.useEffect(function()
				-- upvalues: var19 (write), var20 (write), networkingFriendsModule (copy), var16 (ref)
				if var19 then
					var20(networkingFriendsModule.GetExtendedFriendshipStatus.API({ targetUserId = var16.participantId }))
				end
			end, { var16.participantId, var20, var19 })
		end
		var18 = if var19 and var21 then true else false
	end
	local var22 = useLocalization({
		viewProfileText = var16.viewProfileText,
		chatText = if fFlagEnableChatDetailsOpenChatModule then var16.chatText else nil,
		reportUserText = var16.reportUserText,
		removeFromGroupText = var16.removeFromGroupText,
		cancelText = var16.cancelText
	})
	local var23 = reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var16 (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p4)
					-- upvalues: var16 (copy)
					var16.onDismiss()
					p4:cancel()
				end)
			}
		}
	end, { var16.onDismiss })
	
	return if useIsExternalNavigationAvailableModule({ enumScreensModule.ViewUserProfile })[enumScreensModule.ViewUserProfile] then reactModule.createElement(focusNavigableSurfaceWrapper, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		customEventHandlers = var23,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(participantDialogDeprecatedModule, cryoModule.Dictionary.join(var16, var22, {
			showViewProfileButton = var17,
			showChatButton = var18,
			isWideMode = var16.isWideMode
		}))
	}) else reactModule.createElement(appFocusRoot, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		shouldRestoreFocus = false,
		customEventHandlers = var23,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(playerContextualMenuWrapperModule, {
			conversationId = var16.conversationId,
			participantId = var16.participantId,
			onDismiss = var16.onDismiss,
			openRemoveUserDialog = var16.openRemoveUserDialog,
			removeFromGroupText = var22.removeFromGroupText,
			openReportUser = var16.openReportUser,
			showRemoveUserButton = var16.showRemoveUserButton,
			openBlockingModal = var16.openBlockingModal
		})
	})
end

return memo(ParticipantDialogContainerDeprecated)