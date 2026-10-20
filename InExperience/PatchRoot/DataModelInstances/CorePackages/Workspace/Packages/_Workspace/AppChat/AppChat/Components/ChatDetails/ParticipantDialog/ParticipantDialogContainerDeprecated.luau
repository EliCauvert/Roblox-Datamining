local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local EnumScreensModule = require(AppChat.EnumScreens)
local NetworkingFriendsModule = require(AppChat.Http.NetworkingFriends)
local _ = require(AppChat.types)
local UseAppPolicyModule = require(AppChat.Hooks.useAppPolicy)
local UseIsExternalNavigationAvailableModule = require(AppChat.Hooks.useIsExternalNavigationAvailable)
local ConversationModule = require(AppChat.Models.Conversation)
local CryoModule = require(Parent.Cryo)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactFocusNavigation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local AppFocusRoot = FocusNavigationUtilsModule.AppFocusRoot
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local FFlagEnableChatDetailsOpenChatModule = require(AppChat.Flags.FFlagEnableChatDetailsOpenChat)
local FFlagAppChatMigrateFriendshipStatusesModule = require(AppChat.Flags.FFlagAppChatMigrateFriendshipStatuses)
local UseGetFriendshipStatusFunction = require(Parent.FriendsHydrationReact).useGetFriendshipStatus
local MemoFunction = ReactModule.memo
local ParticipantDialogDeprecatedModule = require(script.Parent.ParticipantDialogDeprecated)
local PlayerContextualMenuWrapperModule = require(script.Parent.PlayerContextualMenuWrapper)
local config = {
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
local config1 = { skipFetch = true }

function ParticipantDialogContainerDeprecated(p1)
	-- upvalues: CryoModule (copy), config (copy), UseAppPolicyModule (copy), FFlagEnableChatDetailsOpenChatModule (copy), UseSelectorFunction (copy), ConversationModule (copy), UseDispatchFunction (copy), FFlagAppChatMigrateFriendshipStatusesModule (copy), UseGetFriendshipStatusFunction (copy), config1 (copy), ReactModule (copy), NetworkingFriendsModule (copy), UseLocalizationFunction (copy), UseIsExternalNavigationAvailableModule (copy), EnumScreensModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), AppFocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), PlayerContextualMenuWrapperModule (copy), FocusNavigableSurfaceWrapper (copy), ParticipantDialogDeprecatedModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p2)
		return p2.getChatViewProfileOption()
	end)
	local UseSelectorResult = nil
	local UseDispatchResult = nil
	local ShowChatButton = false
	
	if FFlagEnableChatDetailsOpenChatModule then
		UseSelectorResult = UseSelectorFunction(function(p2): boolean
			-- upvalues: JoinResult (copy), ConversationModule (upval)
			local Conversations = p2.ChatAppReducer and p2.ChatAppReducer.Conversations
			local Conversation = Conversations and Conversations[JoinResult.conversationId]
			
			return Conversation and Conversation.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION
		end)
		UseDispatchResult = UseDispatchFunction()
		local IsUseGetFriendshipStatusResultMatch = nil
		
		if FFlagAppChatMigrateFriendshipStatusesModule then
			IsUseGetFriendshipStatusResultMatch = UseGetFriendshipStatusFunction(JoinResult.participantId, if UseSelectorResult then nil else config1) == Enum.FriendStatus.Friend
		else
			IsUseGetFriendshipStatusResultMatch = UseSelectorFunction(function(p2): boolean
				-- upvalues: JoinResult (copy)
				local Friends = p2.ChatAppReducer and p2.ChatAppReducer.Friends
				local FriendshipStatus = Friends and Friends.friendshipStatus
				
				return FriendshipStatus and FriendshipStatus[JoinResult.participantId] == Enum.FriendStatus.Friend
			end)
			ReactModule.useEffect(function()
				-- upvalues: UseSelectorResult (ref), UseDispatchResult (ref), NetworkingFriendsModule (upval), JoinResult (copy)
				if UseSelectorResult then
					UseDispatchResult(NetworkingFriendsModule.GetExtendedFriendshipStatus.API({ targetUserId = JoinResult.participantId }))
				end
			end, {
				JoinResult.participantId,
				UseDispatchResult,
				UseSelectorResult
			})
		end
		ShowChatButton = if UseSelectorResult and IsUseGetFriendshipStatusResultMatch then true else false
	end
	local UseLocalizationResult = UseLocalizationFunction({
		viewProfileText = JoinResult.viewProfileText,
		chatText = if FFlagEnableChatDetailsOpenChatModule then JoinResult.chatText else nil,
		reportUserText = JoinResult.reportUserText,
		removeFromGroupText = JoinResult.removeFromGroupText,
		cancelText = JoinResult.cancelText
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), JoinResult (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: JoinResult (upval)
					JoinResult.onDismiss()
					p2:cancel()
				end)
			}
		}
	end, { JoinResult.onDismiss })
	local JoinResult1 = CryoModule.Dictionary.join(JoinResult, UseLocalizationResult, {
		showViewProfileButton = UseAppPolicyModuleResult,
		showChatButton = ShowChatButton,
		isWideMode = JoinResult.isWideMode
	})
	
	return if UseIsExternalNavigationAvailableModule({ EnumScreensModule.ViewUserProfile })[EnumScreensModule.ViewUserProfile] then ReactModule.createElement(FocusNavigableSurfaceWrapper, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		customEventHandlers = UseMemoResult,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		ReactModule.createElement(ParticipantDialogDeprecatedModule, JoinResult1)
	}) else ReactModule.createElement(AppFocusRoot, {
		isAutoFocusRoot = true,
		isFocusable = true,
		isIsolated = true,
		shouldRestoreFocus = false,
		customEventHandlers = UseMemoResult,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		ReactModule.createElement(PlayerContextualMenuWrapperModule, {
			conversationId = JoinResult.conversationId,
			participantId = JoinResult.participantId,
			onDismiss = JoinResult.onDismiss,
			openRemoveUserDialog = JoinResult.openRemoveUserDialog,
			removeFromGroupText = UseLocalizationResult.removeFromGroupText,
			openReportUser = JoinResult.openReportUser,
			showRemoveUserButton = JoinResult.showRemoveUserButton,
			openBlockingModal = JoinResult.openBlockingModal
		})
	})
end

return MemoFunction(ParticipantDialogContainerDeprecated)