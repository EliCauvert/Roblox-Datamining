local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local HttpService = game:GetService("HttpService")
local IXPService = game:GetService("IXPService")
local LoggerModule = require(script.Parent.Logger)
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UniversalAppPolicy = require(Parent.UniversalAppPolicy).UniversalAppPolicy
local ChatConversationModule = require(script.Parent.ChatConversation)
local PendingStateConversationPageModule = require(script.Parent.PendingState.PendingStateConversationPage)
local RoactChatAnalyticsModule = require(AppChat.LegacyAnalytics.RoactChatAnalytics)
local UseAnalyticsModule = require(AppChat.LegacyAnalytics.useAnalytics)
local SelectMessagesPureModule = require(AppChat.Components.ChatConversation.Messages.Selectors.selectMessagesPure)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local ConversationModule = require(AppChat.Models.Conversation)
local GenericDialogTypeModule = require(AppChat.Components.ChatDetails.Dialogs.GenericDialogType)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local MapDispatchToPropsModule = require(script.Parent.mapDispatchToProps)
local UseGetConversationFromIdModule = require(AppChat.Hooks.useGetConversationFromId)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseEffectFunction = ReactModule.useEffect
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseMapDispatchModule = require(AppChat.Hooks.useMapDispatch)
local UseGetUsersModule = require(AppChat.Hooks.useGetUsers)
local UseGetUsersTypingModule = require(AppChat.Hooks.useGetUsersTyping)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetReplyingToStoreModule = require(AppChat.Stores.GetReplyingToStore)
local GetConversationMessageViewModelStoreModule = require(AppChat.Stores.GetConversationMessageViewModelStore)
local UseReplyingToMessageModule = require(script.Parent.MessageInteraction.ReplyingContext.useReplyingToMessage)
local UseReplyingToMessageDispatchModule = require(script.Parent.MessageInteraction.ReplyingContext.useReplyingToMessageDispatch)
local FFlagAppChatSignalsReplyStoreModule = require(AppChat.Flags.FFlagAppChatSignalsReplyStore)
local UserProfilesModule = require(Parent.UserProfiles)
local GetConversationTitleModule = require(AppChat.Conversations.getConversationTitle)
local GetOtherParticipantsModule = require(AppChat.Conversations.getOtherParticipants)
local UseRecipientIdsModule = require(AppChat.Hooks.useRecipientIds)
local UseIsUserPendingModule = require(AppChat.Hooks.useIsUserPending)
local UseChatIsVisibleModule = require(AppChat.Hooks.useChatIsVisible)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseIsExternalNavigationAvailableModule = require(AppChat.Hooks.useIsExternalNavigationAvailable)
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local UseIsChatUserMessagesEnabledModule = require(AppChat.Hooks.useIsChatUserMessagesEnabled)
local ChatInputBoxDisabledPressedSignal = require(Parent.InterventionShared).Signals.chatInputBoxDisabledPressedSignal
local RoduxNetworkingModule = require(AppChat.Http.RoduxNetworking)
local UseChatTimeoutDetailsModule = require(AppChat.Hooks.useChatTimeoutDetails)
local ChatConversationTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local ChatConversationTelemetryStateModule = require(AppChat.Contexts.TelemetryState.ChatConversationTelemetryState)
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local ChatConversationTelemetryEventsModule = require(script.Parent.ChatConversationTelemetryEvents)
local UseIsChatEnabledModule = require(AppChat.Hooks.useIsChatEnabled)
local InterventionTreatmentShownSignal = require(Parent.InterventionShared).Signals.interventionTreatmentShownSignal
local UseSignalFunction = require(Parent.RoactUtils).Hooks.useSignal
local Constants = require(Parent.InterventionShared).Utils.Constants
local GetAllRemainingOlderMessagesModule = require(script.Parent.Messages.Thunks.getAllRemainingOlderMessages)
local GetOlderMessagesModule = require(script.Parent.Messages.NetworkRequests.getOlderMessages)
local UseCallbackWithDynamicConversationIdModule = require(AppChat.Hooks.useCallbackWithDynamicConversationId)
local UseShouldShowConversationOverlayModule = require(AppChat.Hooks.useShouldShowConversationOverlay)
local UseKeybindModule = require(AppChat.App.Hooks.useKeybind)
local EnumScreensModule = require(AppChat.EnumScreens)
local EnumMessageTypesModule = require(script.Parent.EnumMessageTypes)
local EnumCustomEntryTypesModule = require(script.Parent.EnumCustomEntryTypes)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagAppChatMessageTTIMilestonesModule = require(AppChat.Flags.FFlagAppChatMessageTTIMilestones)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local GetFFlagEnableAppChatInExperienceFunction = require(Parent.SharedFlags).GetFFlagEnableAppChatInExperience
local FFlagTCUpsellModalEnabledDEV = require(Parent.SharedFlags).FFlagTCUpsellModalEnabled_DEV
local FFlagDebugEnableTCDoubleOptInDEV = require(Parent.SharedFlags).FFlagDebugEnableTCDoubleOptIn_DEV
local FFlagAppChatEnableDoubleOptIn = require(Parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local FFlagAppChatShowOSAOnPageEntry = require(Parent.SharedFlags).FFlagAppChatShowOSAOnPageEntry
local FFlagAppChatReactiveFeatureRestrictions = require(Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local FFlagAppChatUniversalFeatureRestriction = require(Parent.SharedFlags).FFlagAppChatUniversalFeatureRestriction
local AppChatGetAllMessagesDepth = game:DefineFastInt("AppChatGetAllMessagesDepth", 100)
local FFlagAppChatNavigateBackIfOSAUnacknowledged = require(Parent.SharedFlags).FFlagAppChatNavigateBackIfOSAUnacknowledged
local ShouldShowOSAForConversationModule = require(AppChat.Utils.shouldShowOSAForConversation)
local SignalsMigrationConfigModule = require(AppChat.Flags.SignalsMigrationConfig)
local UseMessageItemListFunction = require(AppChat.Hooks.useMessageItemList).useMessageItemList
local ShouldShowU13ChatOptInForConversationModule = require(AppChat.Utils.shouldShowU13ChatOptInForConversation)
local NavigateWithOsaGateFunction = require(AppChat.Utils).navigateWithOsaGate
local FFlagAppChatReactToFaeForOsaModule = require(AppChat.Flags.FFlagAppChatReactToFaeForOsa)
local FFlagAppChatConversationLoadingSkeletonModule = require(AppChat.Flags.FFlagAppChatConversationLoadingSkeleton)
local FFlagAppChatBlueSentBubblesIxpEnabledModule = require(AppChat.Flags.FFlagAppChatBlueSentBubblesIxpEnabled)
local FStringAppChatBlueSentBubblesIxpLayerModule = require(AppChat.Flags.FStringAppChatBlueSentBubblesIxpLayer)
local IsSyntheticSystemMessageIdModule = require(script.Parent.Utils.isSyntheticSystemMessageId)
local FFlagAppChatConversationTrustedFriendUpsellBanner = require(Parent.SharedFlags).FFlagAppChatConversationTrustedFriendUpsellBanner
local SeedConversationTopModalFromRequestModule = if FFlagAppChatConversationTrustedFriendUpsellBanner then require(AppChat.Sdui.seedConversationTopModalFromRequest) else nil
local AppChatConversationPageSyntheticSystemMessageIxpEnabled = game:DefineFastFlag("AppChatConversationPageSyntheticSystemMessageIxpEnabled", false)
local AppChatConversationPageSyntheticSystemMessageIxpLayer = game:DefineFastString("AppChatConversationPageSyntheticSystemMessageIxpLayer", "Party.ConversationPage")

local function _(p1)
	return p1 and p1.action and p1.action.params and p1.action.params.isOverlay or false
end

local config = {
	topBarHeight = 0,
	wideMode = false,
	chatInputPlaceholderKey = "Feature.Chat.Label.ChatInputPlaceholder",
	replyChatInputPlaceholderKey = "Feature.Chat.Label.ReplyChatInputPlaceholder",
	replyToYourselfChatInputPlaceholderKey = "Feature.Chat.Label.ReplyToYourselfChatInputPlaceholder",
	messageDefaultNoticeKey = "Feature.Chat.Message.Default",
	messageModeratedNoticeKey = "Feature.Chat.Message.MessageContentModerated",
	newTextKey = "Feature.Chat.Label.New",
	schedulePartyTextKey = "Feature.Squads.Action.ScheduleParty",
	messageHiddenNoticeKey = "Feature.Chat.Label.MessageNotAvailable",
	networkErrorTextKey = "Feature.Toast.NetworkingError.SomethingIsWrong",
	notImplementedMessageTypeKey = "Feature.Chat.Label.NotImplementedMessageType",
	viewProfileOnAvatarPressed = true,
	unknownUserTextKey = "Feature.Chat.Label.UnknownUser",
	severalUsersTyping = "Feature.Chat.Message.SeveralUsersTyping",
	pendingStateBodyKey = "Feature.Chat.Message.ChatIsUnfiltered",
	connectUnavailableWithUserKey = "Feature.Chat.RobloxConnectUnavailableWithUser",
	chatUnavailableWithUserKey = "Feature.Chat.Message.ChatUnavailableWithUser",
	inputBarDisabledKey = "Feature.Chat.Label.ChatDisabled",
	getCanAccessParty = true,
	oneUserTyping = { "Feature.Chat.Message.OneUserTyping", DISPLAY_NAME = "" },
	twoUsersTyping = {
		"Feature.Chat.Message.TwoUsersTyping",
		DISPLAY_NAME_1 = "",
		DISPLAY_NAME_2 = ""
	},
	getReadingMessagesIsEnabled = function() end,
	updateConversationTitle = function(_) end,
	navigateToScreen = function() end,
	navigateToChatLanding = function() end,
	releaseInputBarFocus = function() end,
	navigateToSquadLobby = function() end,
	navigateToConversationOverlay = function() end
}

local function getOsaState(Conversation, LocalUserId, UseUserProfilesFetchResult)
	-- upvalues: ConversationModule (copy), FFlagAppChatConversationLoadingSkeletonModule (copy), GetOtherParticipantsModule (copy), UserProfilesModule (copy)
	local FetchedOldestMessage = Conversation and Conversation.fetchedOldestMessage
	local NoConversation: boolean = not Conversation or Conversation.conversationType ~= ConversationModule.Type.MULTI_USER_CONVERSATION
	local IsFriends: boolean = Conversation and (NoConversation and (Conversation.source == "friends" or (Conversation.osaAcknowledgementStatus == ConversationModule.OsaAcknowledgementStatus.Unacknowledged or Conversation.osaAcknowledgementStatus == ConversationModule.OsaAcknowledgementStatus.Acknowledged)))
	local IsOsaAcknowledgementStatusMatch: boolean = Conversation and Conversation.osaAcknowledgementStatus == ConversationModule.OsaAcknowledgementStatus.Unacknowledged
	local IsFriends1: boolean = Conversation and Conversation.source == "friends"
	local NoIsFriends1: boolean = IsFriends and (IsOsaAcknowledgementStatusMatch and not IsFriends1)
	local FetchedOldestMessage1 = IsFriends and (FetchedOldestMessage or IsFriends1)
	local WillShowOsaCard = nil
	local IsOsaCardReady: boolean? = nil
	
	if FFlagAppChatConversationLoadingSkeletonModule then
		WillShowOsaCard = NoIsFriends1 or FetchedOldestMessage1
		local OtherParticipantsModuleEntry = if WillShowOsaCard then GetOtherParticipantsModule(Conversation, LocalUserId)[1] else nil
		IsOsaCardReady = OtherParticipantsModuleEntry == nil or (if UseUserProfilesFetchResult == nil then UseUserProfilesFetchResult ~= nil and (UseUserProfilesFetchResult.data ~= nil and UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, OtherParticipantsModuleEntry) ~= nil) else UseUserProfilesFetchResult.error ~= nil or UseUserProfilesFetchResult ~= nil and (UseUserProfilesFetchResult.data ~= nil and UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, OtherParticipantsModuleEntry) ~= nil))
	end
	return {
		shouldShowOsaCardInConversation = IsFriends,
		fetchedOldestMessage = FetchedOldestMessage,
		shouldShowOsaCardOnInitialLoad = NoIsFriends1,
		shouldShowOsaCardNow = FetchedOldestMessage1,
		isFriendsConversation = IsFriends1,
		willShowOsaCard = WillShowOsaCard,
		isOsaCardReady = IsOsaCardReady
	}
end

function ChatConversationContainer(p1)
	-- upvalues: CryoModule (copy), config (copy), UseAnalyticsModule (copy), ReactModule (copy), RoactChatAnalyticsModule (copy), UseMapDispatchModule (copy), MapDispatchToPropsModule (copy), UseGetConversationFromIdModule (copy), UseRecipientIdsModule (copy), HttpService (copy), UseLocalUserIdFunction (copy), UseChatIsVisibleModule (copy), UseIsChatUserMessagesEnabledModule (copy), UseIsChatEnabledModule (copy), UseDispatchFunction (copy), FFlagAppChatPerfTrackingModule (copy), FFlagAppChatMessageTTIMilestonesModule (copy), AppChatPerfTrackerModule (copy), UseEffectFunction (copy), FFlagAppChatNavigateBackIfOSAUnacknowledged (copy), FFlagAppChatShowOSAOnPageEntry (copy), RoactNavigationModule (copy), NavigateWithOsaGateFunction (copy), ShouldShowOSAForConversationModule (copy), FFlagAppChatReactToFaeForOsaModule (copy), ShouldShowU13ChatOptInForConversationModule (copy), UseSignalFunction (copy), InterventionTreatmentShownSignal (copy), Constants (copy), UserProfilesModule (copy), GetOtherParticipantsModule (copy), GetConversationTitleModule (copy), UseGetUsersModule (copy), UseGetUsersTypingModule (copy), SignalsMigrationConfigModule (copy), UseMessageItemListFunction (copy), SelectMessagesPureModule (copy), getOsaState (copy), EnumMessageTypesModule (copy), EnumCustomEntryTypesModule (copy), FFlagAppChatConversationLoadingSkeletonModule (copy), UseSelectorFunction (copy), AppChatNetworkingModule (copy), RoduxNetworkingModule (copy), GetFFlagEnableAppChatInExperienceFunction (copy), UseIsInExperienceModule (copy), FFlagAppChatSignalsReplyStoreModule (copy), GetReplyingToStoreModule (copy), GetConversationMessageViewModelStoreModule (copy), UseSignalStateFunction (copy), UseReplyingToMessageModule (copy), UseReplyingToMessageDispatchModule (copy), UseLocalizationFunction (copy), UseTelemetryModule (copy), ChatConversationTelemetryLayerModule (copy), ChatConversationTelemetryStateModule (copy), UseIsUserPendingModule (copy), FFlagAppChatEnableDoubleOptIn (copy), UseCallbackWithDynamicConversationIdModule (copy), LoggerModule (copy), FFlagAppChatConversationTrustedFriendUpsellBanner (copy), SeedConversationTopModalFromRequestModule (copy), FFlagDebugEnableTCDoubleOptInDEV (copy), UseKeybindModule (copy), FFlagTCUpsellModalEnabledDEV (copy), UseShouldShowConversationOverlayModule (copy), UseChatTimeoutDetailsModule (copy), ChatConversationTelemetryEventsModule (copy), AppChatConversationPageSyntheticSystemMessageIxpEnabled (copy), IsSyntheticSystemMessageIdModule (copy), IXPService (copy), AppChatConversationPageSyntheticSystemMessageIxpLayer (copy), FFlagAppChatBlueSentBubblesIxpEnabledModule (copy), FStringAppChatBlueSentBubblesIxpLayerModule (copy), ConversationChannelsModule (copy), UseIsExternalNavigationAvailableModule (copy), EnumScreensModule (copy), ConversationModule (copy), GenericDialogTypeModule (copy), FFlagAppChatUniversalFeatureRestriction (copy), Parent (copy), FFlagAppChatReactiveFeatureRestrictions (copy), ChatInputBoxDisabledPressedSignal (copy), GetAllRemainingOlderMessagesModule (copy), GetOlderMessagesModule (copy), AppChatGetAllMessagesDepth (copy), PendingStateConversationPageModule (copy), ChatConversationModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseAnalyticsModuleResult (copy), RoactChatAnalyticsModule (upval), JoinResult (copy)
		UseAnalyticsModuleResult:navigate(RoactChatAnalyticsModule.NavigationEvents.ChatConversationProfile)
		JoinResult.openViewProfile(p2)
	end, { JoinResult.openViewProfile, UseAnalyticsModuleResult })
	local UseMapDispatchModuleResult = UseMapDispatchModule(MapDispatchToPropsModule)
	local UseGetConversationFromIdModuleResult = UseGetConversationFromIdModule(JoinResult.conversationId)
	local UseRecipientIdsModuleResult = UseRecipientIdsModule(UseGetConversationFromIdModuleResult)
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), UseRecipientIdsModuleResult (copy)
		return HttpService:JSONEncode(UseRecipientIdsModuleResult)
	end)
	local Result1 = if Success then Result else "[]"
	local ConversationTitleModule = nil
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseChatIsVisibleModuleResult = UseChatIsVisibleModule()
	local UseIsChatUserMessagesEnabledModuleResult = UseIsChatUserMessagesEnabledModule()
	local UseIsChatEnabledModuleResult = UseIsChatEnabledModule()
	local UseDispatchResult = UseDispatchFunction()
	
	if FFlagAppChatPerfTrackingModule and FFlagAppChatMessageTTIMilestonesModule and AppChatPerfTrackerModule.Hooks then
		AppChatPerfTrackerModule.Hooks.useTTIRenderAndMountedTracking(AppChatPerfTrackerModule.getEventName(AppChatPerfTrackerModule.Events.ChatConversationTTI) or "")
	end
	UseEffectFunction(function()
		-- upvalues: UseIsChatEnabledModuleResult (copy), JoinResult (copy)
		if not UseIsChatEnabledModuleResult then
			JoinResult.navigateToChatLanding()
		end
	end, {
		UseIsChatEnabledModuleResult,
		JoinResult.navigateToChatLanding
	})
	
	if FFlagAppChatNavigateBackIfOSAUnacknowledged then
		local IsNavigatedFromGroupOSAJoinParam = if JoinResult.navigation and JoinResult.navigation.getParam then JoinResult.navigation.getParam("isNavigatedFromGroupOSAJoin", false) else false
		
		if FFlagAppChatShowOSAOnPageEntry then
			UseEffectFunction(function()
				-- upvalues: JoinResult (copy), RoactNavigationModule (upval), NavigateWithOsaGateFunction (upval), UseDispatchResult (copy)
				if not JoinResult.navigation or not JoinResult.navigation.addListener then return end
				local AddListenerResult = JoinResult.navigation.addListener(RoactNavigationModule.Events.WillFocus, function()
					-- upvalues: NavigateWithOsaGateFunction (upval), JoinResult (upval), UseDispatchResult (upval)
					NavigateWithOsaGateFunction({
						conversationId = JoinResult.conversationId,
						dispatch = UseDispatchResult,
						onAccepted = function() end,
						onDeclined = function()
							-- upvalues: JoinResult (upval)
							JoinResult.navigateToChatLanding()
						end
					})
				end)
				
				return function()
					-- upvalues: AddListenerResult (copy)
					if AddListenerResult then
						AddListenerResult:remove()
					end
				end
			end, {
				JoinResult.navigation,
				JoinResult.conversationId,
				UseDispatchResult
			})
		else
			UseEffectFunction(function()
				-- upvalues: IsNavigatedFromGroupOSAJoinParam (copy), ShouldShowOSAForConversationModule (upval), UseGetConversationFromIdModuleResult (ref), JoinResult (copy)
				if not IsNavigatedFromGroupOSAJoinParam and ShouldShowOSAForConversationModule(UseGetConversationFromIdModuleResult) then
					JoinResult.navigateToChatLanding()
				end
			end, {
				UseGetConversationFromIdModuleResult,
				JoinResult.navigateToChatLanding,
				IsNavigatedFromGroupOSAJoinParam
			})
		end
	end
	if FFlagAppChatReactToFaeForOsaModule then
		UseEffectFunction(function()
			-- upvalues: UseGetConversationFromIdModuleResult (ref), ShouldShowOSAForConversationModule (upval), ShouldShowU13ChatOptInForConversationModule (upval), NavigateWithOsaGateFunction (upval), JoinResult (copy), UseDispatchResult (copy)
			if not UseGetConversationFromIdModuleResult then return end
			local ShouldShowOSAForConversationModule1 = ShouldShowOSAForConversationModule(UseGetConversationFromIdModuleResult)
			local ShouldShowU13ChatOptInForConversationModule1 = ShouldShowU13ChatOptInForConversationModule(UseGetConversationFromIdModuleResult)
			
			if ShouldShowOSAForConversationModule1 or ShouldShowU13ChatOptInForConversationModule1 then
				NavigateWithOsaGateFunction({
					conversationId = JoinResult.conversationId,
					dispatch = UseDispatchResult,
					onAccepted = function() end,
					onDeclined = function()
						-- upvalues: JoinResult (upval)
						JoinResult.navigateToChatLanding()
					end
				})
			end
		end, {
			UseGetConversationFromIdModuleResult,
			JoinResult.conversationId,
			UseDispatchResult
		})
	end
	UseSignalFunction(InterventionTreatmentShownSignal, ReactModule.useCallback(function(PartyChatNudgeDialog)
		-- upvalues: Constants (upval), JoinResult (copy)
		if PartyChatNudgeDialog == Constants.TreatmentType.PartyChatNudgeDialog or PartyChatNudgeDialog == Constants.TreatmentType.PartyChatTimeoutDialog then
			JoinResult.releaseInputBarFocus()
		end
	end, { JoinResult.releaseInputBarFocus }))
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = GetOtherParticipantsModule(UseGetConversationFromIdModuleResult, UseLocalUserIdResult),
		query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	ConversationTitleModule = GetConversationTitleModule(UseGetConversationFromIdModuleResult)
	local UseGetUsersModuleResult = UseGetUsersModule()
	local UseGetUsersTypingModuleResult = UseGetUsersTypingModule(JoinResult.conversationId)
	local UseRefResult = ReactModule.useRef({
		itemList = {},
		previousMessagesState = {},
		previousSendingMessagesState = {},
		previousMessagesResult = {}
	})
	local UseMessageItemListResult = if SignalsMigrationConfigModule.shouldReadMessageListFromSignalsStore then UseMessageItemListFunction(JoinResult.conversationId, UseGetUsersModuleResult, UseLocalUserIdResult, UseGetConversationFromIdModuleResult) else nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsMigrationConfigModule (upval), UseMessageItemListResult (ref), FFlagAppChatPerfTrackingModule (upval), FFlagAppChatMessageTTIMilestonesModule (upval), AppChatPerfTrackerModule (upval), JoinResult (copy), UseRefResult (copy), SelectMessagesPureModule (upval), UseGetConversationFromIdModuleResult (ref), UseGetUsersModuleResult (copy), UseLocalUserIdResult (copy)
		if SignalsMigrationConfigModule.shouldReadMessageListFromSignalsStore then
			return UseMessageItemListResult
		end
		local IsActive = FFlagAppChatPerfTrackingModule and (FFlagAppChatMessageTTIMilestonesModule and AppChatPerfTrackerModule.isActive(AppChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = JoinResult.conversationId }))
		
		if IsActive then
			local config = { conversationId = JoinResult.conversationId }
			AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, config)
			AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, AppChatPerfTrackerModule.Milestone.DataProcessingStarted.Subphase.DataUpdate, config)
		end
		UseRefResult.current = SelectMessagesPureModule({
			conversation = UseGetConversationFromIdModuleResult,
			conversationId = JoinResult.conversationId,
			Users = UseGetUsersModuleResult,
			localUserId = UseLocalUserIdResult
		}, UseRefResult.current)
		
		if IsActive then
			local config = { conversationId = JoinResult.conversationId }
			AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, config)
			AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, AppChatPerfTrackerModule.Milestone.DataProcessingCompleted.Subphase.DataUpdate, config)
		end
		return UseRefResult.current.itemList
	end, {
		UseGetConversationFromIdModuleResult,
		JoinResult.conversationId,
		UseGetUsersModuleResult,
		UseLocalUserIdResult,
		UseMessageItemListResult
	})
	local OsaState = getOsaState(UseGetConversationFromIdModuleResult, UseLocalUserIdResult, UseUserProfilesFetchResult)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: OsaState (copy), UseMemoResult (copy), EnumMessageTypesModule (upval), EnumCustomEntryTypesModule (upval)
		local t = {}
		
		if OsaState.shouldShowOsaCardOnInitialLoad and not OsaState.fetchedOldestMessage then
			return t
		end
		local Copy = table.clone(UseMemoResult)
		
		if OsaState.shouldShowOsaCardNow then
			table.insert(Copy, {
				messageType = EnumMessageTypesModule.Custom,
				customEntryType = EnumCustomEntryTypesModule.OsaContextCardOneToOne,
				stable_key = EnumCustomEntryTypesModule.OsaContextCardOneToOne
			})
		end
		return Copy
	end, {
		UseMemoResult, UseGetConversationFromIdModuleResult,
		OsaState.shouldShowOsaCardOnInitialLoad,
		OsaState.shouldShowOsaCardInConversation, OsaState.shouldShowOsaCardNow,
		OsaState.fetchedOldestMessage
	})
	local v1 = false
	
	if FFlagAppChatConversationLoadingSkeletonModule then
		local UseSelectorResult = UseSelectorFunction(function(p2)
			-- upvalues: AppChatNetworkingModule (upval), JoinResult (copy)
			return AppChatNetworkingModule.rodux.GetOlderMessages.getStatus(p2, JoinResult.conversationId)
		end)
		local WillShowOsaCard = nil
		local IsOsaCardReady = nil
		
		if OsaState.isFriendsConversation then
			IsOsaCardReady = OsaState.isOsaCardReady
			WillShowOsaCard = OsaState.willShowOsaCard
		elseif OsaState.shouldShowOsaCardOnInitialLoad then
			IsOsaCardReady = OsaState.fetchedOldestMessage == true and OsaState.isOsaCardReady
			WillShowOsaCard = true
		else
			IsOsaCardReady = UseSelectorResult == RoduxNetworkingModule.Enum.NetworkStatus.Done or OsaState.fetchedOldestMessage == true
			WillShowOsaCard = UseSelectorResult == RoduxNetworkingModule.Enum.NetworkStatus.NotStarted or UseSelectorResult == RoduxNetworkingModule.Enum.NetworkStatus.Fetching
		end
		local UseRefResult1 = ReactModule.useRef({ conversationId = nil, hasLoadedFirstPage = false })
		
		if UseRefResult1.current.conversationId ~= JoinResult.conversationId then
			UseRefResult1.current = {
				hasLoadedFirstPage = false,
				conversationId = JoinResult.conversationId
			}
		end
		UseRefResult1.current.hasLoadedFirstPage = UseRefResult1.current.hasLoadedFirstPage or IsOsaCardReady
		v1 = UseGetConversationFromIdModuleResult and (not UseRefResult1.current.hasLoadedFirstPage and WillShowOsaCard)
	end
	local CombinedNameFromId = if UseGetUsersTypingModuleResult[1] and UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, UseGetUsersTypingModuleResult[1].id) else nil
	local CombinedNameFromId1 = if UseGetUsersTypingModuleResult[2] and UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, UseGetUsersTypingModuleResult[2].id) else nil
	local DisplayNamesAvailable = (#UseGetUsersTypingModuleResult ~= 1 or CombinedNameFromId) and (#UseGetUsersTypingModuleResult ~= 2 or CombinedNameFromId and CombinedNameFromId1)
	local UseIsInExperienceModuleResult = GetFFlagEnableAppChatInExperienceFunction() and UseIsInExperienceModule()
	local ReplyingToStoreModule = if FFlagAppChatSignalsReplyStoreModule then GetReplyingToStoreModule(false) else nil
	local ConversationMessageStore = if FFlagAppChatSignalsReplyStoreModule then GetConversationMessageViewModelStoreModule(false).conversationMessageStore else nil
	local v2 = nil
	local v3 = nil
	local v4 = nil
	local CombinedNameFromId2 = nil
	local IsSenderTargetIdMatch: boolean? = nil
	
	if FFlagAppChatSignalsReplyStoreModule then
		v4 = UseSignalStateFunction(ReplyingToStoreModule.getMessageId)
		
		if v4 then
			local MessagesResultEntry = ConversationMessageStore.messages(false)[v4]
			local Text = if MessagesResultEntry and MessagesResultEntry.sender_user_id then tostring(MessagesResultEntry.sender_user_id) else nil
			IsSenderTargetIdMatch = Text == UseLocalUserIdResult
			CombinedNameFromId2 = if IsSenderTargetIdMatch or not Text or not UseUserProfilesFetchResult.data then nil else UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, Text)
		end
	else
		v2 = UseReplyingToMessageModule()
		v3 = UseReplyingToMessageDispatchModule()
		
		if v2 then
			IsSenderTargetIdMatch = v2.senderTargetId == UseLocalUserIdResult
			CombinedNameFromId2 = if IsSenderTargetIdMatch or not UseUserProfilesFetchResult.data then nil else UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, v2.senderTargetId)
		end
	end
	local UseLocalizationResult = UseLocalizationFunction({
		chatInputPlaceholder = JoinResult.chatInputPlaceholderKey,
		replyChatInputPlaceholder = {
			JoinResult.replyChatInputPlaceholderKey,
			DISPLAY_NAME = CombinedNameFromId2
		},
		replyToYourselfChatInputPlaceholder = JoinResult.replyToYourselfChatInputPlaceholderKey,
		invalidMessageTypeText = JoinResult.notImplementedMessageTypeKey,
		messageDefaultNoticeText = JoinResult.messageDefaultNoticeKey,
		messageModeratedNoticeText = JoinResult.messageModeratedNoticeKey,
		messageHiddenNoticeText = JoinResult.messageHiddenNoticeKey,
		networkErrorText = JoinResult.networkErrorTextKey,
		newText = JoinResult.newTextKey,
		schedulePartyText = JoinResult.schedulePartyTextKey,
		unknownUserText = JoinResult.unknownUserTextKey,
		oneUserTyping = {
			"Feature.Chat.Message.OneUserTyping",
			DISPLAY_NAME = CombinedNameFromId
		},
		twoUsersTyping = {
			"Feature.Chat.Message.TwoUsersTyping",
			DISPLAY_NAME_1 = CombinedNameFromId,
			DISPLAY_NAME_2 = CombinedNameFromId1
		},
		severalUsersTyping = JoinResult.severalUsersTyping,
		bottomModalText = JoinResult.chatUnavailableWithUserKey,
		inputBarDisabledText = JoinResult.inputBarDisabledKey
	})
	local UseTelemetryModuleResult = UseTelemetryModule(ChatConversationTelemetryLayerModule.Context)
	local UseMergeStateResult = ChatConversationTelemetryStateModule.useMergeState()
	local UseClearStateResult = ChatConversationTelemetryStateModule.useClearState()
	local ModerationType = UseGetConversationFromIdModuleResult and UseGetConversationFromIdModuleResult.moderationType or CryoModule.None
	local UserPendingStatus = UseGetConversationFromIdModuleResult and UseGetConversationFromIdModuleResult.userPendingStatus or CryoModule.None
	UseEffectFunction(function()
		-- upvalues: UseMergeStateResult (copy), JoinResult (copy), ModerationType (copy), UserPendingStatus (copy)
		UseMergeStateResult({
			conversationId = JoinResult.conversationId,
			moderationType = ModerationType,
			userPendingStatus = UserPendingStatus
		})
	end, {
		UseMergeStateResult,
		JoinResult.conversationId,
		ModerationType,
		UserPendingStatus
	})
	local UseIsUserPendingModuleResult = UseIsUserPendingModule(UseGetConversationFromIdModuleResult or {})
	local Source = UseGetConversationFromIdModuleResult and UseGetConversationFromIdModuleResult.source
	
	if FFlagAppChatEnableDoubleOptIn then
		local UseCallbackWithDynamicConversationIdModuleResult, UseCallbackWithDynamicConversationIdModuleResult2 = UseCallbackWithDynamicConversationIdModule(AppChatNetworkingModule.rodux.GetModalSequence.API, JoinResult.conversationId)
		UseEffectFunction(function()
			-- upvalues: UseCallbackWithDynamicConversationIdModuleResult2 (copy), UseIsUserPendingModuleResult (copy), Source (copy), UseDispatchResult (copy), AppChatNetworkingModule (upval), JoinResult (copy), UseIsInExperienceModuleResult (copy), LoggerModule (upval), UseCallbackWithDynamicConversationIdModuleResult (copy), FFlagAppChatConversationTrustedFriendUpsellBanner (upval), SeedConversationTopModalFromRequestModule (upval)
			if not UseCallbackWithDynamicConversationIdModuleResult2 then return end
			if UseIsUserPendingModuleResult and Source == "channels" then
				UseDispatchResult(AppChatNetworkingModule.rodux.GetPendingStateModal.API(JoinResult.conversationId, UseIsInExperienceModuleResult)):catch(function(Err)
					-- upvalues: LoggerModule (upval)
					LoggerModule:warning(`GetPendingStateModal error in ChatConversationContainer {tostring(Err)}`)
				end)
			end
			if not UseIsUserPendingModuleResult then
				local UseDispatchResultResult = UseDispatchResult(UseCallbackWithDynamicConversationIdModuleResult({
					modalSequence = AppChatNetworkingModule.Constants.ModalSequence.ConversationTopModal,
					isInExperience = UseIsInExperienceModuleResult
				}))
				
				if FFlagAppChatConversationTrustedFriendUpsellBanner then
					UseDispatchResultResult = SeedConversationTopModalFromRequestModule(UseDispatchResultResult, JoinResult.conversationId)
				end
				UseDispatchResultResult:catch(function(Err)
					-- upvalues: LoggerModule (upval)
					LoggerModule:warning(`GetModalSequence for ConversationTopModal error in ChatConversationContainer {tostring(Err)}`)
				end)
			end
		end, {
			JoinResult.conversationId,
			UseCallbackWithDynamicConversationIdModuleResult2,
			UseIsInExperienceModuleResult,
			UseIsUserPendingModuleResult,
			Source
		})
	else
		UseEffectFunction(function()
			-- upvalues: Source (copy), UseIsUserPendingModuleResult (copy), UseDispatchResult (copy), AppChatNetworkingModule (upval), JoinResult (copy), UseIsInExperienceModuleResult (copy)
			if Source ~= "channels" then return end
			if UseIsUserPendingModuleResult then
				UseDispatchResult(AppChatNetworkingModule.rodux.GetPendingStateModal.API(JoinResult.conversationId, UseIsInExperienceModuleResult)):catch(function(Err)
					warn("GetPendingStateModal error in ChatConversationContainer " .. tostring(Err))
				end)
				
				return
			else
				UseDispatchResult(AppChatNetworkingModule.rodux.GetConversationTopModal.API(JoinResult.conversationId, UseIsInExperienceModuleResult)):catch(function(Err)
					warn("GetConversationTopModal error in ChatConversationContainer " .. tostring(Err))
				end)
			end
		end, { JoinResult.conversationId, UseDispatchResult, Source })
	end
	local UseCallbackWithDynamicConversationIdModuleResult1, UseCallbackWithDynamicConversationIdModuleResult2_1 = UseCallbackWithDynamicConversationIdModule(AppChatNetworkingModule.rodux.GetModalSequence.API, JoinResult.conversationId)
	UseEffectFunction(function()
		-- upvalues: UseIsUserPendingModuleResult (copy), UseCallbackWithDynamicConversationIdModuleResult2_1 (copy), UseDispatchResult (copy), UseCallbackWithDynamicConversationIdModuleResult1 (copy), AppChatNetworkingModule (upval), UseIsInExperienceModuleResult (copy), LoggerModule (upval)
		if not UseIsUserPendingModuleResult and UseCallbackWithDynamicConversationIdModuleResult2_1 then
			UseDispatchResult(UseCallbackWithDynamicConversationIdModuleResult1({
				modalSequence = AppChatNetworkingModule.Constants.ModalSequence.ConversationOverlay,
				isInExperience = UseIsInExperienceModuleResult
			})):catch(function(Err)
				-- upvalues: LoggerModule (upval)
				LoggerModule:warning(`GetModalSequence error in ChatConversationContainer {tostring(Err)}`)
			end)
		end
	end, {
		UseCallbackWithDynamicConversationIdModuleResult2_1,
		JoinResult.conversationId,
		UseIsUserPendingModuleResult,
		UseIsInExperienceModuleResult,
		ModerationType
	})
	
	if FFlagDebugEnableTCDoubleOptInDEV then
		UseKeybindModule({
			keyCode = Enum.KeyCode.O,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function()
			-- upvalues: LoggerModule (upval), UseDispatchResult (copy), JoinResult (copy), AppChatNetworkingModule (upval)
			LoggerModule:debug("Ctrl + O pressed, showing new TC double opt in banner")
			UseDispatchResult({
				type = "DEBUG_ShowNewTopModal",
				conversationId = JoinResult.conversationId,
				modalVariant = AppChatNetworkingModule.Constants.ConversationTopModal.AddTrustedConnection
			})
		end, { UseDispatchResult, JoinResult.conversationId })
		UseKeybindModule({
			keyCode = Enum.KeyCode.P,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function()
			-- upvalues: LoggerModule (upval), UseDispatchResult (copy), JoinResult (copy), AppChatNetworkingModule (upval)
			LoggerModule:debug("Ctrl + P pressed, showing new TC double opt in request banner")
			UseDispatchResult({
				type = "DEBUG_ShowNewTopModal",
				conversationId = JoinResult.conversationId,
				modalVariant = AppChatNetworkingModule.Constants.ConversationTopModal.TrustedConnectionRequest
			})
		end, { UseDispatchResult, JoinResult.conversationId })
	end
	if FFlagTCUpsellModalEnabledDEV then
		UseKeybindModule({
			keyCode = Enum.KeyCode.L,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function()
			-- upvalues: LoggerModule (upval), UseDispatchResult (copy), JoinResult (copy), AppChatNetworkingModule (upval)
			LoggerModule:debug("Ctrl + L pressed, showing new TC created overlay")
			UseDispatchResult({
				type = "DEBUG_ShowNewTCOverlay",
				conversationId = JoinResult.conversationId,
				modalVariant = AppChatNetworkingModule.Constants.ConversationOverlay.TrustedConnectionCreated
			})
		end, { UseDispatchResult, JoinResult.conversationId })
	end
	local UseCallbackWithDynamicConversationIdModuleResult3, UseCallbackWithDynamicConversationIdModuleResult2_2 = UseCallbackWithDynamicConversationIdModule(AppChatNetworkingModule.rodux.GetModalSequence.API, JoinResult.conversationId)
	UseEffectFunction(function()
		-- upvalues: UseCallbackWithDynamicConversationIdModuleResult2_2 (copy), UseDispatchResult (copy), UseCallbackWithDynamicConversationIdModuleResult3 (copy), AppChatNetworkingModule (upval), UseIsInExperienceModuleResult (copy), LoggerModule (upval)
		if UseCallbackWithDynamicConversationIdModuleResult2_2 then
			UseDispatchResult(UseCallbackWithDynamicConversationIdModuleResult3({
				modalSequence = AppChatNetworkingModule.Constants.ModalSequence.ConversationBottomModal,
				isInExperience = UseIsInExperienceModuleResult
			})):catch(function(Err)
				-- upvalues: LoggerModule (upval)
				LoggerModule:warning(`GetModalSequence for ConversationBottomModal error in ChatConversationContainer {tostring(Err)}`)
			end)
			
			return
		end
	end, {
		JoinResult.conversationId,
		UseCallbackWithDynamicConversationIdModuleResult2_2,
		UseIsInExperienceModuleResult,
		UseDispatchResult,
		UseCallbackWithDynamicConversationIdModuleResult3
	})
	local UseShouldShowConversationOverlayModuleResult = UseShouldShowConversationOverlayModule(JoinResult.conversationId)
	UseEffectFunction(function()
		-- upvalues: UseShouldShowConversationOverlayModuleResult (copy), JoinResult (copy)
		if UseShouldShowConversationOverlayModuleResult then
			JoinResult.navigateToConversationOverlay()
		end
	end, {
		UseShouldShowConversationOverlayModuleResult,
		JoinResult.conversationId
	})
	local TimeoutEndTimestamp = nil
	local DecisionEventId = nil
	local Duration = nil
	local IsNotChannels = Source ~= "channels"
	local UseSelectorResult = UseSelectorFunction(function(p2): boolean
		-- upvalues: IsNotChannels (copy), AppChatNetworkingModule (upval), JoinResult (copy), RoduxNetworkingModule (upval)
		return (if IsNotChannels then AppChatNetworkingModule.rodux.GetChatModerationStatuses.getStatus(p2) else AppChatNetworkingModule.rodux.GetChatModerationStatuses.getStatus(p2, JoinResult.conversationId)) == RoduxNetworkingModule.Enum.NetworkStatus.NotStarted
	end)
	UseEffectFunction(function()
		-- upvalues: UseSelectorResult (copy), UseDispatchResult (copy), AppChatNetworkingModule (upval), IsNotChannels (copy), JoinResult (copy)
		if UseSelectorResult then
			UseDispatchResult(AppChatNetworkingModule.rodux.GetChatModerationStatuses.API(if IsNotChannels then nil else { JoinResult.conversationId })):catch(function(Err)
				warn("GetChatModerationStatuses error in ChatConversationContainer " .. tostring(Err))
			end)
		end
	end, {
		JoinResult.conversationId,
		IsNotChannels,
		UseDispatchResult,
		UseSelectorResult
	})
	local UseChatTimeoutDetailsModuleResult = UseChatTimeoutDetailsModule({
		conversationId = JoinResult.conversationId,
		conversationModerationType = ModerationType
	})
	local IsTimedOut = UseChatTimeoutDetailsModuleResult.isTimedOut
	TimeoutEndTimestamp = UseChatTimeoutDetailsModuleResult.timeoutEndTimestamp
	DecisionEventId = UseChatTimeoutDetailsModuleResult.decisionEventId
	Duration = UseChatTimeoutDetailsModuleResult.duration
	UseEffectFunction(function()
		-- upvalues: UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), UseMemoResult (copy)
		UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ScreenRendered, { loadedMessageCount = #UseMemoResult })
	end, { JoinResult.conversationId })
	
	if AppChatConversationPageSyntheticSystemMessageIxpEnabled then
		local UseMemoResultEntry = UseMemoResult[1]
		local Id = if UseMemoResultEntry then UseMemoResultEntry.id else nil
		UseEffectFunction(function()
			-- upvalues: IsSyntheticSystemMessageIdModule (upval), Id (copy), IXPService (upval), AppChatConversationPageSyntheticSystemMessageIxpLayer (upval)
			if IsSyntheticSystemMessageIdModule(Id) then
				IXPService:LogFlagLinkedUserLayerExposure(AppChatConversationPageSyntheticSystemMessageIxpLayer)
			end
		end, { JoinResult.conversationId, Id })
	end
	if FFlagAppChatBlueSentBubblesIxpEnabledModule then
		local UseMemoResult2 = ReactModule.useMemo(function(): boolean
			-- upvalues: UseMemoResult (copy), EnumMessageTypesModule (upval)
			for _, value in UseMemoResult do
				if not value.isIncoming and value.messageType == EnumMessageTypesModule.PlainText then
					return true
				end
			end
			return false
		end, { UseMemoResult })
		UseEffectFunction(function()
			-- upvalues: UseMemoResult2 (copy), IXPService (upval), FStringAppChatBlueSentBubblesIxpLayerModule (upval)
			if UseMemoResult2 then
				IXPService:LogFlagLinkedUserLayerExposure(FStringAppChatBlueSentBubblesIxpLayerModule)
			end
		end, { JoinResult.conversationId, UseMemoResult2 })
	end
	local UseResult3 = ReactModule.useCallback(function(ConversationExitType)
		-- upvalues: UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), UseClearStateResult (copy)
		UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ScreenExit, { conversationExitType = ConversationExitType })
		UseClearStateResult()
	end, { UseTelemetryModuleResult, UseClearStateResult })
	UseGetConversationFromIdModuleResult = UseGetConversationFromIdModuleResult or {}
	local UseIsChatUserMessagesEnabledModuleResult1 = UseGetConversationFromIdModuleResult.participantPendingStatus ~= ConversationChannelsModule.UserPendingStatus.Pending and UseIsChatUserMessagesEnabledModuleResult
	local UseIsChatUserMessagesEnabledModuleResult2 = not UseIsChatUserMessagesEnabledModuleResult1 and UseIsChatUserMessagesEnabledModuleResult
	local UseIsExternalNavigationAvailableModuleResult = UseIsExternalNavigationAvailableModule({ EnumScreensModule.ViewUserProfile })
	local IsConversationTypeMatch = UseGetConversationFromIdModuleResult.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION
	local UseSelectorResult1 = UseSelectorFunction(function(p2): boolean
		-- upvalues: IsConversationTypeMatch (copy), UseGetConversationFromIdModuleResult (ref)
		return IsConversationTypeMatch and UseGetConversationFromIdModuleResult.initiator == p2.LocalUserId
	end)
	
	local function OpenViewProfile(ParticipantId)
		-- upvalues: UseIsExternalNavigationAvailableModuleResult (copy), EnumScreensModule (upval), UseResult (copy), JoinResult (copy), GenericDialogTypeModule (upval), UseIsUserPendingModuleResult (copy), IsConversationTypeMatch (copy), UseSelectorResult1 (copy)
		if UseIsExternalNavigationAvailableModuleResult[EnumScreensModule.ViewUserProfile] then
			UseResult(ParticipantId)
			
			return
		else
			JoinResult.navigateToScreen(GenericDialogTypeModule.ParticipantDialog, {
				conversationId = JoinResult.conversationId,
				participantId = ParticipantId,
				showRemoveUserButton = not UseIsUserPendingModuleResult and (IsConversationTypeMatch and UseSelectorResult1)
			}, true)
		end
	end
	
	local v5 = if FFlagAppChatSignalsReplyStoreModule then v4 else v2
	local ReplyToYourselfChatInputPlaceholder = if v5 then if IsSenderTargetIdMatch then UseLocalizationResult.replyToYourselfChatInputPlaceholder else UseLocalizationResult.replyChatInputPlaceholder else UseLocalizationResult.chatInputPlaceholder
	UseEffectFunction(function()
		-- upvalues: JoinResult (copy), ConversationTitleModule (ref)
		JoinResult.updateConversationTitle(ConversationTitleModule)
	end, {
		ConversationTitleModule,
		JoinResult.updateConversationTitle
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: FFlagAppChatUniversalFeatureRestriction (upval), Parent (upval), JoinResult (copy), FFlagAppChatReactiveFeatureRestrictions (upval), ChatInputBoxDisabledPressedSignal (upval), TimeoutEndTimestamp (ref), DecisionEventId (ref), Duration (ref)
		if not FFlagAppChatUniversalFeatureRestriction then
			ChatInputBoxDisabledPressedSignal:fire({
				endTimestamp = TimeoutEndTimestamp,
				decisionEventId = DecisionEventId,
				duration = Duration
			})
			
			return
		end
		local AbuseVectorModule = require(Parent.UniversalFeatureRestrictions.AbuseVector)
		local ShowFeatureRestrictionModule: (any, any) -> () = require(Parent.UniversalFeatureRestrictions.showFeatureRestriction)
		local config = {
			onShown = JoinResult.releaseInputBarFocus,
			onAppeal = function() end
		}
		
		if FFlagAppChatReactiveFeatureRestrictions then
			local PartyChatTimeoutReceivedSignal = require(Parent.InterventionShared).Signals.partyChatTimeoutReceivedSignal
			
			function config.onAcknowledgementSuccess()
				-- upvalues: PartyChatTimeoutReceivedSignal (copy)
				PartyChatTimeoutReceivedSignal:fire(nil)
			end
		end
		ShowFeatureRestrictionModule(AbuseVectorModule.PartyChat, config)
	end, {
		JoinResult.releaseInputBarFocus,
		TimeoutEndTimestamp,
		DecisionEventId,
		Duration
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(JoinResult.navigation and (JoinResult.navigation.isFocused and JoinResult.navigation.isFocused()))
	local v6 = nil
	local Inverted: boolean? = nil
	
	if FFlagAppChatPerfTrackingModule then
		v6 = (not JoinResult.isFocused or JoinResult.isFocused()) and UseStateResult
		Inverted = v6 and not UseIsUserPendingModuleResult
	end
	local UseResult1 = nil
	
	if FFlagAppChatPerfTrackingModule then
		local UseRefResult2 = ReactModule.useRef(false)
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult2 (copy), UseIsChatUserMessagesEnabledModuleResult1 (copy)
			UseRefResult2.current = not UseIsChatUserMessagesEnabledModuleResult1
		end, {
			JoinResult.conversationId,
			UseIsChatUserMessagesEnabledModuleResult1
		})
		local UseResult2 = ReactModule.useCallback(function(p2)
			-- upvalues: AppChatPerfTrackerModule (upval), JoinResult (copy), Inverted (ref), UseRefResult2 (copy), LoggerModule (upval), UseMemoResult (copy)
			if not AppChatPerfTrackerModule.isActive(AppChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = JoinResult.conversationId }) or not Inverted then return end
			if UseRefResult2.current then
				AppChatPerfTrackerModule.finish(AppChatPerfTrackerModule.Events.ChatConversationTTI, {
					conversationId = JoinResult.conversationId,
					numElementsRendered = #UseMemoResult
				})
				
				return
			else
				LoggerModule:debug("TTI: Messages ready but waiting for input bar (chatInputBarReady={}, reason={})", UseRefResult2.current, p2)
			end
		end, {
			JoinResult.conversationId,
			UseStateResult,
			UseIsUserPendingModuleResult,
			#UseMemoResult
		})
		ReactModule.useEffect(function()
			-- upvalues: UseResult2 (copy)
			UseResult2("messages_ready")
		end, { UseResult2, #UseMemoResult, JoinResult.conversationId })
		UseResult1 = ReactModule.useCallback(function()
			-- upvalues: UseRefResult2 (copy), UseResult2 (copy)
			UseRefResult2.current = true
			UseResult2("input_bar_ready")
		end, { UseResult2 })
	end
	if FFlagAppChatPerfTrackingModule then
		local UseRefResult3 = ReactModule.useRef(nil)
		ReactModule.useEffect(function()
			-- upvalues: LoggerModule (upval), JoinResult (copy), UseRefResult3 (copy), FFlagAppChatMessageTTIMilestonesModule (upval), AppChatPerfTrackerModule (upval)
			LoggerModule:debug("Perf: Resetting message perf tracking for conversation {}", JoinResult.conversationId)
			UseRefResult3.current = nil
			local config = { conversationId = JoinResult.conversationId }
			
			if FFlagAppChatMessageTTIMilestonesModule then
				AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.MessageSendTTI, config)
				AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.MessageReceiveTTI, config)
				
				return
			else
				AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.MessageSendToPendingRender, config)
				AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.MessageSendResponseToFinalRender, config)
				AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.MessageSendToFinalRender, config)
				AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.MessageReceiveToRender, config)
			end
		end, { JoinResult.conversationId })
		ReactModule.useEffect(function()
			-- upvalues: UseMemoResult (copy), JoinResult (copy), UseLocalUserIdResult (copy), UseRefResult3 (copy), FFlagAppChatMessageTTIMilestonesModule (upval), AppChatPerfTrackerModule (upval)
			local UseMemoResultEntry = UseMemoResult[1]
			
			if not UseMemoResultEntry or not UseMemoResultEntry.id then return end
			local config = { conversationId = JoinResult.conversationId }
			local IsSenderTargetIdMatch = UseMemoResultEntry.senderTargetId == UseLocalUserIdResult
			
			if not UseMemoResultEntry.isSending and (UseMemoResultEntry.senderType == "system" or not IsSenderTargetIdMatch) then
				if UseMemoResultEntry.id ~= UseRefResult3.current then
					UseRefResult3.current = UseMemoResultEntry.id
					
					if FFlagAppChatMessageTTIMilestonesModule then
						AppChatPerfTrackerModule.finish(AppChatPerfTrackerModule.Events.MessageReceiveTTI, config)
					else
						AppChatPerfTrackerModule.finish(AppChatPerfTrackerModule.Events.MessageReceiveToRender, config)
					end
				end
			elseif FFlagAppChatMessageTTIMilestonesModule then
				if AppChatPerfTrackerModule.isActive(AppChatPerfTrackerModule.Events.MessageReceiveTTI, config) then
					AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.MessageReceiveTTI, config)
				end
			elseif AppChatPerfTrackerModule.isActive(AppChatPerfTrackerModule.Events.MessageReceiveToRender, config) then
				AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.MessageReceiveToRender, config)
			end
			if not IsSenderTargetIdMatch then return end
			if FFlagAppChatMessageTTIMilestonesModule then
				if UseMemoResultEntry.isSending then
					AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.MessageSendTTI, AppChatPerfTrackerModule.Milestone.FunctionallyReady, config)
					
					return
				else
					AppChatPerfTrackerModule.finish(AppChatPerfTrackerModule.Events.MessageSendTTI, config)
					
					return
				end
			elseif UseMemoResultEntry.isSending then
				AppChatPerfTrackerModule.finish(AppChatPerfTrackerModule.Events.MessageSendToPendingRender, config)
				
				return
			else
				AppChatPerfTrackerModule.finish(AppChatPerfTrackerModule.Events.MessageSendResponseToFinalRender, config)
				AppChatPerfTrackerModule.finish(AppChatPerfTrackerModule.Events.MessageSendToFinalRender, config)
			end
		end, {
			UseMemoResult,
			UseLocalUserIdResult,
			JoinResult.conversationId
		})
	end
	UseEffectFunction(function()
		-- upvalues: JoinResult (copy), RoactNavigationModule (upval), FFlagAppChatPerfTrackingModule (upval), UseStateResult2 (copy), AppChatPerfTrackerModule (upval)
		local AddListenerResult = JoinResult.navigation and (JoinResult.navigation.addListener and JoinResult.navigation.addListener(RoactNavigationModule.Events.WillBlur, function(p2)
			-- upvalues: FFlagAppChatPerfTrackingModule (upval), UseStateResult2 (upval), AppChatPerfTrackerModule (upval), JoinResult (upval)
			if FFlagAppChatPerfTrackingModule then
				local IsOverlay = p2 and p2.action and p2.action.params and p2.action.params.isOverlay or false
				UseStateResult2(IsOverlay)
				
				if IsOverlay then return end
				if AppChatPerfTrackerModule.isActive(AppChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = JoinResult.conversationId }) then
					AppChatPerfTrackerModule.cancel(AppChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = JoinResult.conversationId })
					
					return
				end
			elseif p2 and p2.action and p2.action.params and p2.action.params.isOverlay then
				UseStateResult2(true)
				
				return
			else
				UseStateResult2(false)
			end
		end))
		local AddListenerResult1 = JoinResult.navigation and (JoinResult.navigation.addListener and JoinResult.navigation.addListener(RoactNavigationModule.Events.WillFocus, function(_)
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(true)
		end))
		
		return function()
			-- upvalues: AddListenerResult (copy), AddListenerResult1 (copy)
			if AddListenerResult then
				AddListenerResult.remove()
			end
			if AddListenerResult1 then
				AddListenerResult1.remove()
			end
		end
	end, { JoinResult.navigation, JoinResult.conversationId })
	UseEffectFunction(function()
		-- upvalues: OsaState (copy), UseDispatchResult (copy), GetAllRemainingOlderMessagesModule (upval), GetOlderMessagesModule (upval), JoinResult (copy), AppChatGetAllMessagesDepth (upval), UseLocalizationResult (copy)
		if OsaState.shouldShowOsaCardOnInitialLoad then
			UseDispatchResult(GetAllRemainingOlderMessagesModule(GetOlderMessagesModule, JoinResult.conversationId, AppChatGetAllMessagesDepth)):catch(function()
				-- upvalues: JoinResult (upval), UseLocalizationResult (upval)
				JoinResult.navigateToToast({
					toastProps = {
						toastContent = { toastTitle = UseLocalizationResult.networkErrorText }
					}
				})
			end)
		end
	end, { OsaState.shouldShowOsaCardOnInitialLoad })
	local GetCanAccessParty = JoinResult.getCanAccessParty
	
	return if FFlagAppChatPerfTrackingModule then if v6 then if UseIsUserPendingModuleResult then ReactModule.createElement(PendingStateConversationPageModule, {
		conversationId = JoinResult.conversationId,
		topBarHeight = JoinResult.topBarHeight,
		networkErrorText = UseLocalizationResult.networkErrorText,
		navigateToToast = JoinResult.navigateToToast,
		wideMode = JoinResult.wideMode,
		onConversationUnmount = UseResult3,
		navigateBack = JoinResult.navigateBack
	}) else ReactModule.createElement(ChatConversationModule, CryoModule.Dictionary.join(JoinResult, UseMapDispatchModuleResult, UseLocalizationResult, {
		moreMenuEnabled = GetCanAccessParty,
		conversation = UseGetConversationFromIdModuleResult,
		conversationTitle = ConversationTitleModule,
		itemList = UseMemoResult1,
		localUserId = UseLocalUserIdResult,
		openGameDetailsPage = JoinResult.openGameDetailsPage,
		openViewProfile = OpenViewProfile,
		readingMessagesIsEnabled = JoinResult.getReadingMessagesIsEnabled(),
		Users = UseGetUsersModuleResult,
		usersTyping = UseGetUsersTypingModuleResult,
		displayNamesAvailable = DisplayNamesAvailable,
		onConversationUnmount = UseResult3,
		recipientIdsSerialized = Result1,
		chatIsVisible = UseChatIsVisibleModuleResult,
		chatInputPlaceholder = ReplyToYourselfChatInputPlaceholder,
		replyingToMessageId = if FFlagAppChatSignalsReplyStoreModule then v4 else nil,
		replyingToMessage = if FFlagAppChatSignalsReplyStoreModule then nil else v2,
		replyingToMessageDispatch = if FFlagAppChatSignalsReplyStoreModule then nil else v3,
		shouldShowChatInputBar = UseIsChatUserMessagesEnabledModuleResult1,
		shouldShowLegacyBottomModal = UseIsChatUserMessagesEnabledModuleResult2,
		shouldDisableChatInputBar = IsTimedOut,
		onChatInputBarReady = if FFlagAppChatPerfTrackingModule then UseResult1 else nil,
		inputBarDisabledEndTimestampDisplay = TimeoutEndTimestamp,
		onDisabledInputBarActivated = UseResult4,
		scrollToTopOnInitialOsaLoad = OsaState.shouldShowOsaCardOnInitialLoad and OsaState.fetchedOldestMessage,
		openMessageListAtStart = OsaState.shouldShowOsaCardOnInitialLoad,
		navigateToSquadLobby = if GetCanAccessParty then JoinResult.navigateToSquadLobby else nil,
		shouldHideMoreMenuButton = if GetCanAccessParty then not UseIsChatUserMessagesEnabledModuleResult1 else nil,
		isInitialMessageLoading = if FFlagAppChatConversationLoadingSkeletonModule then v1 else nil
	})) else nil elseif UseStateResult then if JoinResult.isFocused and not JoinResult.isFocused() then nil elseif UseIsUserPendingModuleResult then ReactModule.createElement(PendingStateConversationPageModule, {
		conversationId = JoinResult.conversationId,
		topBarHeight = JoinResult.topBarHeight,
		networkErrorText = UseLocalizationResult.networkErrorText,
		navigateToToast = JoinResult.navigateToToast,
		wideMode = JoinResult.wideMode,
		onConversationUnmount = UseResult3,
		navigateBack = JoinResult.navigateBack,
		style = JoinResult.style
	}) else ReactModule.createElement(ChatConversationModule, CryoModule.Dictionary.join(JoinResult, UseMapDispatchModuleResult, UseLocalizationResult, {
		moreMenuEnabled = GetCanAccessParty,
		conversation = UseGetConversationFromIdModuleResult,
		conversationTitle = ConversationTitleModule,
		itemList = UseMemoResult1,
		localUserId = UseLocalUserIdResult,
		openGameDetailsPage = JoinResult.openGameDetailsPage,
		openViewProfile = OpenViewProfile,
		readingMessagesIsEnabled = JoinResult.getReadingMessagesIsEnabled(),
		Users = UseGetUsersModuleResult,
		usersTyping = UseGetUsersTypingModuleResult,
		displayNamesAvailable = DisplayNamesAvailable,
		onConversationUnmount = UseResult3,
		recipientIdsSerialized = Result1,
		chatIsVisible = UseChatIsVisibleModuleResult,
		chatInputPlaceholder = ReplyToYourselfChatInputPlaceholder,
		replyingToMessageId = if FFlagAppChatSignalsReplyStoreModule then v4 else nil,
		replyingToMessage = if FFlagAppChatSignalsReplyStoreModule then nil else v2,
		replyingToMessageDispatch = if FFlagAppChatSignalsReplyStoreModule then nil else v3,
		shouldShowChatInputBar = UseIsChatUserMessagesEnabledModuleResult1,
		shouldShowLegacyBottomModal = UseIsChatUserMessagesEnabledModuleResult2,
		shouldDisableChatInputBar = IsTimedOut,
		onChatInputBarReady = if FFlagAppChatPerfTrackingModule then UseResult1 else nil,
		inputBarDisabledEndTimestampDisplay = TimeoutEndTimestamp,
		onDisabledInputBarActivated = UseResult4,
		scrollToTopOnInitialOsaLoad = OsaState.shouldShowOsaCardOnInitialLoad and OsaState.fetchedOldestMessage,
		openMessageListAtStart = OsaState.shouldShowOsaCardOnInitialLoad,
		navigateToSquadLobby = if GetCanAccessParty then JoinResult.navigateToSquadLobby else nil,
		shouldHideMoreMenuButton = if GetCanAccessParty then not UseIsChatUserMessagesEnabledModuleResult1 else nil,
		isInitialMessageLoading = if FFlagAppChatConversationLoadingSkeletonModule then v1 else nil
	})) else nil
end

return UniversalAppPolicy.connect(function(p2)
	return {
		viewProfileOnAvatarPressed = p2.getChatTapConversationThumbnail(),
		getCanAccessParty = p2.getCanAccessParty()
	}
end)(ChatConversationContainer)