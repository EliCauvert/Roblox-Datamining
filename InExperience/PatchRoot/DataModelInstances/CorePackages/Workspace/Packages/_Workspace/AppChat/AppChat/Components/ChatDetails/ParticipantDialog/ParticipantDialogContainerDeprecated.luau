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

function ParticipantDialogContainerDeprecated(p1)
	-- upvalues: cryoModule (ref), t (ref), useAppPolicyModule (ref), fFlagEnableChatDetailsOpenChatModule (ref), useSelector (ref), conversationModule (ref), useDispatch (ref), fFlagAppChatMigrateFriendshipStatusesModule (ref), useGetFriendshipStatus (ref), t_1 (ref), reactModule (ref), networkingFriendsModule (ref), useLocalization (ref), useIsExternalNavigationAvailableModule (ref), enumScreensModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), playerContextualMenuWrapperModule (ref), focusNavigableSurfaceWrapper (ref), participantDialogDeprecatedModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useAppPolicyModule(function(p2)
		return p2.getChatViewProfileOption()
	end)
	local _ = nil
	local _ = nil
	local _ = nil
	local var3 = false
	
	if fFlagEnableChatDetailsOpenChatModule then
		local var4
		local var5 = useSelector(function(p2)
			-- upvalues: var1 (ref), conversationModule (copy)
			local conversations = p2.ChatAppReducer and p2.ChatAppReducer.Conversations
			local conversationId = conversations and conversations[var1.conversationId]
			
			return conversationId and conversationId.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
		end)
		local var6 = useDispatch()
		
		if fFlagAppChatMigrateFriendshipStatusesModule then
			local _ = useGetFriendshipStatus(var1.participantId, if var5 then nil else t_1) == Enum.FriendStatus.Friend
		else
			var4 = useSelector(function(p2)
				-- upvalues: var1 (ref)
				local friends = p2.ChatAppReducer and p2.ChatAppReducer.Friends
				local friendshipStatus = friends and friends.friendshipStatus
				
				return friendshipStatus and friendshipStatus[var1.participantId] == Enum.FriendStatus.Friend
			end)
			reactModule.useEffect(function()
				-- upvalues: var5 (write), var6 (write), networkingFriendsModule (copy), var1 (ref)
				if var5 then
					var6(networkingFriendsModule.GetExtendedFriendshipStatus.API({ targetUserId = var1.participantId }))
				end
			end, { var1.participantId, var6, var5 })
		end
		var3 = if var5 and var4 then true else false
	end
	local var7 = useLocalization({
		viewProfileText = var1.viewProfileText,
		chatText = if fFlagEnableChatDetailsOpenChatModule then var1.chatText else nil,
		reportUserText = var1.reportUserText,
		removeFromGroupText = var1.removeFromGroupText,
		cancelText = var1.cancelText
	})
	local var8 = reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var1 (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p2)
					-- upvalues: var1 (copy)
					var1.onDismiss()
					p2:cancel()
				end)
			}
		}
	end, { var1.onDismiss })
	
	return if useIsExternalNavigationAvailableModule({ enumScreensModule.ViewUserProfile })[enumScreensModule.ViewUserProfile] then reactModule.createElement(focusNavigableSurfaceWrapper, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		customEventHandlers = var8,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(participantDialogDeprecatedModule, cryoModule.Dictionary.join(var1, var7, {
			showViewProfileButton = var2,
			showChatButton = var3,
			isWideMode = var1.isWideMode
		}))
	}) else reactModule.createElement(appFocusRoot, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		shouldRestoreFocus = false,
		customEventHandlers = var8,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		reactModule.createElement(playerContextualMenuWrapperModule, {
			conversationId = var1.conversationId,
			participantId = var1.participantId,
			onDismiss = var1.onDismiss,
			openRemoveUserDialog = var1.openRemoveUserDialog,
			removeFromGroupText = var7.removeFromGroupText,
			openReportUser = var1.openReportUser,
			showRemoveUserButton = var1.showRemoveUserButton,
			openBlockingModal = var1.openBlockingModal
		})
	})
end

return memo(ParticipantDialogContainerDeprecated)