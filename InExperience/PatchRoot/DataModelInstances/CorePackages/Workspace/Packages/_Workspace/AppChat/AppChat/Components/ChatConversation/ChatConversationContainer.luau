local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local httpService = game:GetService("HttpService")
local IXPService = game:GetService("IXPService")
local loggerModule = require(script.Parent.Logger)
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local roactNavigationModule = require(parent.RoactNavigation)
local universalAppPolicy = require(parent.UniversalAppPolicy).UniversalAppPolicy
local chatConversationModule = require(script.Parent.ChatConversation)
local pendingStateConversationPageModule = require(script.Parent.PendingState.PendingStateConversationPage)
local roactChatAnalyticsModule = require(appChat.LegacyAnalytics.RoactChatAnalytics)
local useAnalyticsModule = require(appChat.LegacyAnalytics.useAnalytics)
local selectMessagesPureModule = require(appChat.Components.ChatConversation.Messages.Selectors.selectMessagesPure)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local conversationModule = require(appChat.Models.Conversation)
local genericDialogTypeModule = require(appChat.Components.ChatDetails.Dialogs.GenericDialogType)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local mapDispatchToPropsModule = require(script.Parent.mapDispatchToProps)
local useGetConversationFromIdModule = require(appChat.Hooks.useGetConversationFromId)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useEffect = reactModule.useEffect
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useMapDispatchModule = require(appChat.Hooks.useMapDispatch)
local useGetUsersModule = require(appChat.Hooks.useGetUsers)
local useGetUsersTypingModule = require(appChat.Hooks.useGetUsersTyping)
local useSignalState = require(parent.SignalsReact).useSignalState
local getReplyingToStoreModule = require(appChat.Stores.GetReplyingToStore)
local getConversationMessageViewModelStoreModule = require(appChat.Stores.GetConversationMessageViewModelStore)
local useReplyingToMessageModule = require(script.Parent.MessageInteraction.ReplyingContext.useReplyingToMessage)
local useReplyingToMessageDispatchModule = require(script.Parent.MessageInteraction.ReplyingContext.useReplyingToMessageDispatch)
local fFlagAppChatSignalsReplyStoreModule = require(appChat.Flags.FFlagAppChatSignalsReplyStore)
local userProfilesModule = require(parent.UserProfiles)
local getConversationTitleModule = require(appChat.Conversations.getConversationTitle)
local getOtherParticipantsModule = require(appChat.Conversations.getOtherParticipants)
local useRecipientIdsModule = require(appChat.Hooks.useRecipientIds)
local useIsUserPendingModule = require(appChat.Hooks.useIsUserPending)
local useChatIsVisibleModule = require(appChat.Hooks.useChatIsVisible)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useIsExternalNavigationAvailableModule = require(appChat.Hooks.useIsExternalNavigationAvailable)
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local useIsChatUserMessagesEnabledModule = require(appChat.Hooks.useIsChatUserMessagesEnabled)
local chatInputBoxDisabledPressedSignal = require(parent.InterventionShared).Signals.chatInputBoxDisabledPressedSignal
local roduxNetworkingModule = require(appChat.Http.RoduxNetworking)
local useChatTimeoutDetailsModule = require(appChat.Hooks.useChatTimeoutDetails)
local chatConversationTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local chatConversationTelemetryStateModule = require(appChat.Contexts.TelemetryState.ChatConversationTelemetryState)
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local chatConversationTelemetryEventsModule = require(script.Parent.ChatConversationTelemetryEvents)
local useIsChatEnabledModule = require(appChat.Hooks.useIsChatEnabled)
local interventionTreatmentShownSignal = require(parent.InterventionShared).Signals.interventionTreatmentShownSignal
local useSignal = require(parent.RoactUtils).Hooks.useSignal
local constants = require(parent.InterventionShared).Utils.Constants
local getAllRemainingOlderMessagesModule = require(script.Parent.Messages.Thunks.getAllRemainingOlderMessages)
local getOlderMessagesModule = require(script.Parent.Messages.NetworkRequests.getOlderMessages)
local useCallbackWithDynamicConversationIdModule = require(appChat.Hooks.useCallbackWithDynamicConversationId)
local useShouldShowConversationOverlayModule = require(appChat.Hooks.useShouldShowConversationOverlay)
local useKeybindModule = require(appChat.App.Hooks.useKeybind)
local enumScreensModule = require(appChat.EnumScreens)
local enumMessageTypesModule = require(script.Parent.EnumMessageTypes)
local enumCustomEntryTypesModule = require(script.Parent.EnumCustomEntryTypes)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local fFlagAppChatMessageTTIMilestonesModule = require(appChat.Flags.FFlagAppChatMessageTTIMilestones)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local getFFlagEnableAppChatInExperience = require(parent.SharedFlags).GetFFlagEnableAppChatInExperience
local fFlagRenderChatConversationOnlyWhenVisibleModule = require(appChat.Flags.FFlagRenderChatConversationOnlyWhenVisible)
local fFlagTCUpsellModalEnabledDEV = require(parent.SharedFlags).FFlagTCUpsellModalEnabled_DEV
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagDebugEnableTCDoubleOptInDEV = require(parent.SharedFlags).FFlagDebugEnableTCDoubleOptIn_DEV
local fFlagAppChatEnableDoubleOptIn = require(parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local fFlagAppChatShowOSAOnPageEntry = require(parent.SharedFlags).FFlagAppChatShowOSAOnPageEntry
local fFlagFriendsChatPlaceholderRenameFix = require(parent.SharedFlags).FFlagFriendsChatPlaceholderRenameFix
local appChatGetAllMessagesDepth = game:DefineFastInt("AppChatGetAllMessagesDepth", 100)
local fFlagAppChatNavigateBackIfOSAUnacknowledged = require(parent.SharedFlags).FFlagAppChatNavigateBackIfOSAUnacknowledged
local shouldShowOSAForConversationModule = require(appChat.Utils.shouldShowOSAForConversation)
local fFlagAppChatSignalsMessageStoreModule = require(appChat.Flags.FFlagAppChatSignalsMessageStore)
local useMessageItemList = require(appChat.Hooks.useMessageItemList).useMessageItemList
local shouldShowU13ChatOptInForConversationModule = require(appChat.Utils.shouldShowU13ChatOptInForConversation)
local navigateWithOsaGate = require(appChat.Utils).navigateWithOsaGate
local fFlagAppChatReactToFaeForOsaModule = require(appChat.Flags.FFlagAppChatReactToFaeForOsa)
local fFlagAppChatConversationLoadingSkeletonModule = require(appChat.Flags.FFlagAppChatConversationLoadingSkeleton)
local isSyntheticSystemMessageIdModule = require(script.Parent.Utils.isSyntheticSystemMessageId)
local appChatConversationPageSyntheticSystemMessageIxpEnabled = game:DefineFastFlag("AppChatConversationPageSyntheticSystemMessageIxpEnabled", false)
local appChatConversationPageSyntheticSystemMessageIxpLayer = game:DefineFastString("AppChatConversationPageSyntheticSystemMessageIxpLayer", "Party.ConversationPage")

local function _(p0) --[[ line: 105 | named "isOverlayNavigation" ]]
	local isOverlay
	if p0 then
		isOverlay = p0.action and (p0.action.params and (p0.action.params.isOverlay or false))
	end
	return isOverlay
end

local t = {
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
	inputBarDisabledKey = "Feature.Chat.Label.ChatDisabled",
	getCanAccessParty = true,
	oneUserTyping = { "Feature.Chat.Message.OneUserTyping", DISPLAY_NAME = "" },
	twoUsersTyping = {
		"Feature.Chat.Message.TwoUsersTyping",
		DISPLAY_NAME_1 = "",
		DISPLAY_NAME_2 = ""
	},
	chatUnavailableWithUserKey = if getFFlagIsSquadEnabled() and not fFlagFriendsChatPlaceholderRenameFix then "Feature.Chat.Message.PartyUnavailableWithUser" else "Feature.Chat.Message.ChatUnavailableWithUser",
	getReadingMessagesIsEnabled = function() --[[ line: 132 ]] end,
	updateConversationTitle = function(_) --[[ line: 133 ]] end,
	navigateToScreen = function() --[[ line: 134 ]] end,
	navigateToChatLanding = function() --[[ line: 136 ]] end,
	releaseInputBarFocus = function() --[[ line: 137 ]] end,
	navigateToSquadLobby = function() --[[ line: 138 ]] end,
	navigateToConversationOverlay = function() --[[ line: 139 ]] end
}

local function getOsaState(p1, p2, p3) --[[ line: 144 ]]
	-- upvalues: conversationModule (ref), fFlagAppChatConversationLoadingSkeletonModule (ref), getOtherParticipantsModule (ref), userProfilesModule (ref)
	local fetchedOldestMessage = p1 and p1.fetchedOldestMessage
	local var67 = not p1 or p1.conversationType ~= conversationModule.Type.MULTI_USER_CONVERSATION
	local var68 = p1 and (var67 and (if p1.source ~= "friends" then if p1.osaAcknowledgementStatus ~= conversationModule.OsaAcknowledgementStatus.Unacknowledged then p1.osaAcknowledgementStatus == conversationModule.OsaAcknowledgementStatus.Acknowledged else true else true))
	local var69 = p1 and p1.source == "friends"
	local var70 = var68 and (p1 and p1.osaAcknowledgementStatus == conversationModule.OsaAcknowledgementStatus.Unacknowledged and not var69)
	local var71 = var68 and (fetchedOldestMessage or var69)
	local var70_1 = nil
	local var73 = nil
	local _ = nil
	
	if fFlagAppChatConversationLoadingSkeletonModule then
		var70_1 = var70 or var71
		local var74 = if var70_1 then getOtherParticipantsModule(p1, p2)[1] else nil
		local var75 = true
		
		if var74 ~= nil then
			if p3 ~= nil then
				var75 = true
				
				if p3.error == nil then
					var75 = p3 ~= nil and (p3.data ~= nil and userProfilesModule.Selectors.getCombinedNameFromId(p3.data, var74) ~= nil)
				end
			end
		end
		var73 = var75
	end
	return {
		shouldShowOsaCardInConversation = var68,
		fetchedOldestMessage = fetchedOldestMessage,
		shouldShowOsaCardOnInitialLoad = var70,
		shouldShowOsaCardNow = var71,
		isFriendsConversation = var69,
		willShowOsaCard = var70_1,
		isOsaCardReady = var73
	}
end

function ChatConversationContainer(p4) --[[ line: 190 ]]
	-- upvalues: cryoModule (ref), t (ref), useAnalyticsModule (ref), reactModule (ref), roactChatAnalyticsModule (ref), useMapDispatchModule (ref), mapDispatchToPropsModule (ref), useGetConversationFromIdModule (ref), useRecipientIdsModule (ref), httpService (ref), useLocalUserId (ref), useChatIsVisibleModule (ref), useIsChatUserMessagesEnabledModule (ref), useIsChatEnabledModule (ref), useDispatch (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), useEffect (ref), fFlagAppChatNavigateBackIfOSAUnacknowledged (ref), fFlagAppChatShowOSAOnPageEntry (ref), roactNavigationModule (ref), navigateWithOsaGate (ref), shouldShowOSAForConversationModule (ref), fFlagAppChatReactToFaeForOsaModule (ref), shouldShowU13ChatOptInForConversationModule (ref), useSignal (ref), interventionTreatmentShownSignal (ref), constants (ref), userProfilesModule (ref), getOtherParticipantsModule (ref), getConversationTitleModule (ref), useGetUsersModule (ref), useGetUsersTypingModule (ref), fFlagAppChatSignalsMessageStoreModule (ref), useMessageItemList (ref), selectMessagesPureModule (ref), getOsaState (ref), enumMessageTypesModule (ref), enumCustomEntryTypesModule (ref), fFlagAppChatConversationLoadingSkeletonModule (ref), useSelector (ref), appChatNetworkingModule (ref), roduxNetworkingModule (ref), getFFlagEnableAppChatInExperience (ref), useIsInExperienceModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), getReplyingToStoreModule (ref), getConversationMessageViewModelStoreModule (ref), useSignalState (ref), useReplyingToMessageModule (ref), useReplyingToMessageDispatchModule (ref), useLocalization (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), chatConversationTelemetryStateModule (ref), useIsUserPendingModule (ref), fFlagAppChatEnableDoubleOptIn (ref), useCallbackWithDynamicConversationIdModule (ref), loggerModule (ref), fFlagDebugEnableTCDoubleOptInDEV (ref), useKeybindModule (ref), fFlagTCUpsellModalEnabledDEV (ref), useShouldShowConversationOverlayModule (ref), useChatTimeoutDetailsModule (ref), chatConversationTelemetryEventsModule (ref), appChatConversationPageSyntheticSystemMessageIxpEnabled (ref), isSyntheticSystemMessageIdModule (ref), IXPService (ref), appChatConversationPageSyntheticSystemMessageIxpLayer (ref), conversationChannelsModule (ref), useIsExternalNavigationAvailableModule (ref), enumScreensModule (ref), conversationModule (ref), genericDialogTypeModule (ref), chatInputBoxDisabledPressedSignal (ref), fFlagRenderChatConversationOnlyWhenVisibleModule (ref), getAllRemainingOlderMessagesModule (ref), getOlderMessagesModule (ref), appChatGetAllMessagesDepth (ref), pendingStateConversationPageModule (ref), chatConversationModule (ref)
	local var76 = cryoModule.Dictionary.join(t, p4)
	local var77 = useAnalyticsModule()
	local var78 = reactModule.useCallback(function(p5) --[[ line: 193 ]]
		-- upvalues: var77 (ref), roactChatAnalyticsModule (copy), var76 (ref)
		var77:navigate(roactChatAnalyticsModule.NavigationEvents.ChatConversationProfile)
		var76.openViewProfile(p5)
	end, { var76.openViewProfile, var77 })
	local var79 = useMapDispatchModule(mapDispatchToPropsModule)
	local var80 = useGetConversationFromIdModule(var76.conversationId)
	local _ = nil
	local var81 = useRecipientIdsModule(var80)
	local ok, status = pcall(function() --[[ line: 201 ]]
		-- upvalues: httpService (copy), var81 (ref)
		return httpService:JSONEncode(var81)
	end)
	local var82 = if ok then status else "[]"
	local _ = nil
	local _ = nil
	local var83 = useLocalUserId()
	local var84 = useChatIsVisibleModule()
	local var85 = useIsChatUserMessagesEnabledModule()
	local var86 = useIsChatEnabledModule()
	local var87 = useDispatch()
	
	if fFlagAppChatPerfTrackingModule and fFlagAppChatMessageTTIMilestonesModule and appChatPerfTrackerModule.Hooks then
		appChatPerfTrackerModule.Hooks.useTTIRenderAndMountedTracking(appChatPerfTrackerModule.getEventName(appChatPerfTrackerModule.Events.ChatConversationTTI) or "")
	end
	useEffect(function() --[[ line: 222 ]]
		-- upvalues: var86 (ref), var76 (ref)
		if not var86 then
			var76.navigateToChatLanding()
		end
	end, { var86, var76.navigateToChatLanding })
	
	if fFlagAppChatNavigateBackIfOSAUnacknowledged then
		local var88 = if var76.navigation and var76.navigation.getParam then var76.navigation.getParam("isNavigatedFromGroupOSAJoin", false) else false
		
		if fFlagAppChatShowOSAOnPageEntry then
			useEffect(function() --[[ line: 235 ]]
				-- upvalues: var76 (ref), roactNavigationModule (copy), navigateWithOsaGate (copy), var87 (ref)
				if var76.navigation and var76.navigation.addListener then
					local var149 = var76.navigation.addListener(roactNavigationModule.Events.WillFocus, function() --[[ line: 239 ]]
						-- upvalues: navigateWithOsaGate (copy), var76 (copy), var87 (copy)
						navigateWithOsaGate({
							conversationId = var76.conversationId,
							dispatch = var87,
							onAccepted = function() --[[ line: 243 ]] end,
							onDeclined = function() --[[ line: 244 ]]
								-- upvalues: var76 (copy)
								var76.navigateToChatLanding()
							end
						})
					end)
					
					return function() --[[ line: 249 ]]
						-- upvalues: var149 (ref)
						if var149 then
							var149:remove()
						end
					end
				end
			end, { var76.navigation, var76.conversationId, var87 })
		else
			useEffect(function() --[[ line: 256 ]]
				-- upvalues: var88 (ref), shouldShowOSAForConversationModule (copy), var80 (write), var76 (ref)
				if not var88 and shouldShowOSAForConversationModule(var80) then
					var76.navigateToChatLanding()
				end
			end, { var80, var76.navigateToChatLanding, var88 })
		end
	end
	if fFlagAppChatReactToFaeForOsaModule then
		useEffect(function() --[[ line: 266 ]]
			-- upvalues: var80 (write), shouldShowOSAForConversationModule (copy), shouldShowU13ChatOptInForConversationModule (copy), navigateWithOsaGate (copy), var76 (ref), var87 (ref)
			if not var80 then return end
			if shouldShowOSAForConversationModule(var80) or shouldShowU13ChatOptInForConversationModule(var80) then
				navigateWithOsaGate({
					conversationId = var76.conversationId,
					dispatch = var87,
					onAccepted = function() --[[ line: 276 ]] end,
					onDeclined = function() --[[ line: 277 ]]
						-- upvalues: var76 (copy)
						var76.navigateToChatLanding()
					end
				})
			end
		end, { var80, var76.conversationId, var87 })
	end
	useSignal(interventionTreatmentShownSignal, reactModule.useCallback(function(p6) --[[ line: 293 ]]
		-- upvalues: constants (copy), var76 (ref)
		if p6 == constants.TreatmentType.PartyChatNudgeDialog or p6 == constants.TreatmentType.PartyChatTimeoutDialog then
			var76.releaseInputBarFocus()
		end
	end, { var76.releaseInputBarFocus }))
	local var89 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = getOtherParticipantsModule(var80, var83),
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local var90 = getConversationTitleModule(var80)
	local var91 = useGetUsersModule()
	local var92 = useGetUsersTypingModule(var76.conversationId)
	local var93 = reactModule.useRef({
		itemList = {},
		previousMessagesState = {},
		previousSendingMessagesState = {},
		previousMessagesResult = {}
	})
	local var94 = if fFlagAppChatSignalsMessageStoreModule then useMessageItemList(var76.conversationId, var91, var83, var80) else nil
	local var95 = reactModule.useMemo(function() --[[ line: 324 ]]
		-- upvalues: fFlagAppChatSignalsMessageStoreModule (copy), var94 (write), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy), var76 (ref), var93 (ref), selectMessagesPureModule (copy), var80 (write), var91 (ref), var83 (ref)
		if fFlagAppChatSignalsMessageStoreModule then
			return var94
		end
		local chatConversationTTI = fFlagAppChatPerfTrackingModule and (fFlagAppChatMessageTTIMilestonesModule and appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = var76.conversationId }))
		
		if chatConversationTTI then
			local t = { conversationId = var76.conversationId }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, t)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Subphase.DataUpdate, t)
		end
		var93.current = selectMessagesPureModule({
			conversation = var80,
			conversationId = var76.conversationId,
			Users = var91,
			localUserId = var83
		}, var93.current)
		
		if chatConversationTTI then
			local t = { conversationId = var76.conversationId }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, t)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Subphase.DataUpdate, t)
		end
		return var93.current.itemList
	end, {
		var80,
		var76.conversationId,
		var91,
		var83,
		var94
	})
	local var96 = getOsaState(var80, var83, var89)
	local var97 = reactModule.useMemo(function() --[[ line: 376 ]]
		-- upvalues: var96 (ref), var95 (ref), enumMessageTypesModule (copy), enumCustomEntryTypesModule (copy)
		local t = {}
		
		if var96.shouldShowOsaCardOnInitialLoad and not var96.fetchedOldestMessage then
			return t
		end
		local cloned = table.clone(var95)
		
		if var96.shouldShowOsaCardNow then
			table.insert(cloned, {
				messageType = enumMessageTypesModule.Custom,
				customEntryType = enumCustomEntryTypesModule.OsaContextCardOneToOne,
				stable_key = enumCustomEntryTypesModule.OsaContextCardOneToOne
			})
		end
		return cloned
	end, {
		var95, var80, var96.shouldShowOsaCardOnInitialLoad,
		var96.shouldShowOsaCardInConversation, var96.shouldShowOsaCardNow,
		var96.fetchedOldestMessage
	})
	local var98 = false
	
	if fFlagAppChatConversationLoadingSkeletonModule then
		local isOsaCardReady, willShowOsaCard
		local var99 = useSelector(function(p7) --[[ line: 405 ]]
			-- upvalues: appChatNetworkingModule (copy), var76 (ref)
			return appChatNetworkingModule.rodux.GetOlderMessages.getStatus(p7, var76.conversationId)
		end)
		local _ = nil
		local _ = nil
		
		if var96.isFriendsConversation then
			isOsaCardReady = var96.isOsaCardReady
			willShowOsaCard = var96.willShowOsaCard
		elseif var96.shouldShowOsaCardOnInitialLoad then
			isOsaCardReady = var96.fetchedOldestMessage == true and var96.isOsaCardReady
			willShowOsaCard = true
		else
			isOsaCardReady = if var99 ~= roduxNetworkingModule.Enum.NetworkStatus.Done then var96.fetchedOldestMessage == true else true
			willShowOsaCard = if var99 ~= roduxNetworkingModule.Enum.NetworkStatus.NotStarted then var99 == roduxNetworkingModule.Enum.NetworkStatus.Fetching else true
		end
		local var100 = reactModule.useRef({ conversationId = nil, hasLoadedFirstPage = false })
		
		if var100.current.conversationId ~= var76.conversationId then
			var100.current = {
				hasLoadedFirstPage = false,
				conversationId = var76.conversationId
			}
		end
		var100.current.hasLoadedFirstPage = var100.current.hasLoadedFirstPage or isOsaCardReady
		var98 = var80 and (not var100.current.hasLoadedFirstPage and willShowOsaCard)
	end
	local var101 = if var92[1] and var89.data then userProfilesModule.Selectors.getCombinedNameFromId(var89.data, var92[1].id) else nil
	local var102 = if var92[2] and var89.data then userProfilesModule.Selectors.getCombinedNameFromId(var89.data, var92[2].id) else nil
	local var103 = true
	
	if #var92 == 1 and not var101 then
		var103 = false
	elseif #var92 == 2 and (not var101 or not var102) then
		var103 = false
	end
	local var112, var113
	local var104 = getFFlagEnableAppChatInExperience() and useIsInExperienceModule()
	local var105 = if fFlagAppChatSignalsReplyStoreModule then getReplyingToStoreModule(false) else nil
	local var106 = if fFlagAppChatSignalsReplyStoreModule then getConversationMessageViewModelStoreModule(false).conversationMessageStore else nil
	local var107 = nil
	local var108 = nil
	local var109 = nil
	local var110 = nil
	local var111 = nil
	
	if fFlagAppChatSignalsReplyStoreModule then
		var109 = useSignalState(var105.getMessageId)
		
		if var109 then
			var112 = var106.messages(false)[var109]
			var113 = if var112 and var112.sender_user_id then tostring(var112.sender_user_id) else nil
			var111 = var113 == var83
			var110 = if var111 or not var113 or not var89.data then nil else userProfilesModule.Selectors.getCombinedNameFromId(var89.data, var113)
		end
	else
		var107 = useReplyingToMessageModule()
		var108 = useReplyingToMessageDispatchModule()
		
		if var107 then
			var111 = var107.senderTargetId == var83
			var110 = if var111 or not var89.data then nil else userProfilesModule.Selectors.getCombinedNameFromId(var89.data, var107.senderTargetId)
		end
	end
	var112 = useLocalization({
		chatInputPlaceholder = var76.chatInputPlaceholderKey,
		replyChatInputPlaceholder = {
			var76.replyChatInputPlaceholderKey,
			DISPLAY_NAME = var110
		},
		replyToYourselfChatInputPlaceholder = var76.replyToYourselfChatInputPlaceholderKey,
		invalidMessageTypeText = var76.notImplementedMessageTypeKey,
		messageDefaultNoticeText = var76.messageDefaultNoticeKey,
		messageModeratedNoticeText = var76.messageModeratedNoticeKey,
		messageHiddenNoticeText = var76.messageHiddenNoticeKey,
		networkErrorText = var76.networkErrorTextKey,
		newText = var76.newTextKey,
		schedulePartyText = var76.schedulePartyTextKey,
		unknownUserText = var76.unknownUserTextKey,
		oneUserTyping = {
			"Feature.Chat.Message.OneUserTyping",
			DISPLAY_NAME = var101
		},
		twoUsersTyping = {
			"Feature.Chat.Message.TwoUsersTyping",
			DISPLAY_NAME_1 = var101,
			DISPLAY_NAME_2 = var102
		},
		severalUsersTyping = var76.severalUsersTyping,
		bottomModalText = var76.chatUnavailableWithUserKey,
		inputBarDisabledText = var76.inputBarDisabledKey
	})
	var113 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var114 = chatConversationTelemetryStateModule.useMergeState()
	local var115 = chatConversationTelemetryStateModule.useClearState()
	local var116 = if var80 then var80.moderationType else cryoModule.None
	local var117 = if var80 then var80.userPendingStatus else cryoModule.None
	useEffect(function() --[[ line: 519 ]]
		-- upvalues: var114 (ref), var76 (ref), var116 (ref), var117 (ref)
		var114({
			conversationId = var76.conversationId,
			moderationType = var116,
			userPendingStatus = var117
		})
	end, { var114, var76.conversationId, var116, var117 })
	local var118 = useIsUserPendingModule(var80 or {})
	local source = var80 and var80.source
	
	if fFlagAppChatEnableDoubleOptIn then
		local var120, var121 = useCallbackWithDynamicConversationIdModule(appChatNetworkingModule.rodux.GetModalSequence.API, var76.conversationId)
		useEffect(function() --[[ line: 535 ]]
			-- upvalues: var121 (ref), var118 (ref), source (ref), var87 (ref), appChatNetworkingModule (copy), var76 (ref), var104 (ref), loggerModule (copy), var120 (ref)
			if not var121 then return end
			if var118 and source == "channels" then
				var87(appChatNetworkingModule.rodux.GetPendingStateModal.API(var76.conversationId, var104)):catch(function(p8) --[[ line: 541 ]]
					-- upvalues: loggerModule (copy)
					loggerModule:warning(`GetPendingStateModal error in ChatConversationContainer {tostring(p8)}`)
				end)
			end
			if not var118 then
				var87(var120({
					modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationTopModal,
					isInExperience = var104
				})):catch(function(p9) --[[ line: 550 ]]
					-- upvalues: loggerModule (copy)
					loggerModule:warning(`GetModalSequence for ConversationTopModal error in ChatConversationContainer {tostring(p9)}`)
				end)
			end
		end, {
			var76.conversationId,
			var121,
			var104,
			var118,
			source
		})
	else
		useEffect(function() --[[ line: 558 ]]
			-- upvalues: source (ref), var118 (ref), var87 (ref), appChatNetworkingModule (copy), var76 (ref), var104 (ref)
			if source ~= "channels" then return end
			if var118 then
				var87(appChatNetworkingModule.rodux.GetPendingStateModal.API(var76.conversationId, var104)):catch(function(p10) --[[ line: 564 ]]
					warn("GetPendingStateModal error in ChatConversationContainer " .. tostring(p10))
				end)
				
				return
			end
			var87(appChatNetworkingModule.rodux.GetConversationTopModal.API(var76.conversationId, var104)):catch(function(p11) --[[ line: 570 ]]
				warn("GetConversationTopModal error in ChatConversationContainer " .. tostring(p11))
			end)
		end, { var76.conversationId, var87, source })
	end
	local var122, var123 = useCallbackWithDynamicConversationIdModule(appChatNetworkingModule.rodux.GetModalSequence.API, var76.conversationId)
	useEffect(function() --[[ line: 581 ]]
		-- upvalues: var118 (ref), var123 (ref), var87 (ref), var122 (ref), appChatNetworkingModule (copy), var104 (ref), loggerModule (copy)
		if not var118 and var123 then
			var87(var122({
				modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationOverlay,
				isInExperience = var104
			})):catch(function(p12) --[[ line: 586 ]]
				-- upvalues: loggerModule (copy)
				loggerModule:warning(`GetModalSequence error in ChatConversationContainer {tostring(p12)}`)
			end)
		end
	end, {
		var123,
		var76.conversationId,
		var118,
		var104,
		var116
	})
	
	if fFlagDebugEnableTCDoubleOptInDEV then
		useKeybindModule({
			keyCode = Enum.KeyCode.O,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function() --[[ line: 593 ]]
			-- upvalues: loggerModule (copy), var87 (ref), var76 (ref), appChatNetworkingModule (copy)
			loggerModule:debug("Ctrl + O pressed, showing new TC double opt in banner")
			var87({
				type = "DEBUG_ShowNewTopModal",
				conversationId = var76.conversationId,
				modalVariant = appChatNetworkingModule.Constants.ConversationTopModal.AddTrustedConnection
			})
		end, { var87, var76.conversationId })
		useKeybindModule({
			keyCode = Enum.KeyCode.P,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function() --[[ line: 602 ]]
			-- upvalues: loggerModule (copy), var87 (ref), var76 (ref), appChatNetworkingModule (copy)
			loggerModule:debug("Ctrl + P pressed, showing new TC double opt in request banner")
			var87({
				type = "DEBUG_ShowNewTopModal",
				conversationId = var76.conversationId,
				modalVariant = appChatNetworkingModule.Constants.ConversationTopModal.TrustedConnectionRequest
			})
		end, { var87, var76.conversationId })
	end
	if fFlagTCUpsellModalEnabledDEV then
		useKeybindModule({
			keyCode = Enum.KeyCode.L,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function() --[[ line: 613 ]]
			-- upvalues: loggerModule (copy), var87 (ref), var76 (ref), appChatNetworkingModule (copy)
			loggerModule:debug("Ctrl + L pressed, showing new TC created overlay")
			var87({
				type = "DEBUG_ShowNewTCOverlay",
				conversationId = var76.conversationId,
				modalVariant = appChatNetworkingModule.Constants.ConversationOverlay.TrustedConnectionCreated
			})
		end, { var87, var76.conversationId })
	end
	local var124, var125 = useCallbackWithDynamicConversationIdModule(appChatNetworkingModule.rodux.GetModalSequence.API, var76.conversationId)
	useEffect(function() --[[ line: 627 ]]
		-- upvalues: var125 (ref), var87 (ref), var124 (ref), appChatNetworkingModule (copy), var104 (ref), loggerModule (copy)
		if var125 then
			var87(var124({
				modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationBottomModal,
				isInExperience = var104
			})):catch(function(p13) --[[ line: 635 ]]
				-- upvalues: loggerModule (copy)
				loggerModule:warning(`GetModalSequence for ConversationBottomModal error in ChatConversationContainer {tostring(p13)}`)
			end)
			
			return
		end
	end, {
		var76.conversationId,
		var125,
		var104,
		var87,
		var124
	})
	local var126 = useShouldShowConversationOverlayModule(var76.conversationId)
	useEffect(function() --[[ line: 644 ]]
		-- upvalues: var126 (ref), var76 (ref)
		if var126 then
			var76.navigateToConversationOverlay()
		end
	end, { var126, var76.conversationId })
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local isNotChannels = source ~= "channels"
	local var128 = useSelector(function(p14) --[[ line: 655 ]]
		-- upvalues: isNotChannels (ref), appChatNetworkingModule (copy), var76 (ref), roduxNetworkingModule (copy)
		return (if isNotChannels then appChatNetworkingModule.rodux.GetChatModerationStatuses.getStatus(p14) else appChatNetworkingModule.rodux.GetChatModerationStatuses.getStatus(p14, var76.conversationId)) == roduxNetworkingModule.Enum.NetworkStatus.NotStarted
	end)
	useEffect(function() --[[ line: 662 ]]
		-- upvalues: var128 (ref), var87 (ref), appChatNetworkingModule (copy), isNotChannels (ref), var76 (ref)
		if var128 then
			var87(appChatNetworkingModule.rodux.GetChatModerationStatuses.API(if isNotChannels then nil else { var76.conversationId })):catch(function(p15) --[[ line: 668 ]]
				warn("GetChatModerationStatuses error in ChatConversationContainer " .. tostring(p15))
			end)
		end
	end, { var76.conversationId, isNotChannels, var87, var128 })
	local var129 = useChatTimeoutDetailsModule({
		conversationId = var76.conversationId,
		conversationModerationType = var116
	})
	local isTimedOut = var129.isTimedOut
	local timeoutEndTimestamp = var129.timeoutEndTimestamp
	local decisionEventId = var129.decisionEventId
	local duration = var129.duration
	local _ = nil
	useEffect(function() --[[ line: 684 ]]
		-- upvalues: var113 (ref), chatConversationTelemetryEventsModule (copy), var95 (ref)
		var113.emit(chatConversationTelemetryEventsModule.ScreenRendered, { loadedMessageCount = #var95 })
	end, { var76.conversationId })
	
	if appChatConversationPageSyntheticSystemMessageIxpEnabled then
		local var130 = var95[1]
		local var131 = if var130 then var130.id else nil
		useEffect(function() --[[ line: 698 ]]
			-- upvalues: isSyntheticSystemMessageIdModule (copy), var131 (ref), IXPService (copy), appChatConversationPageSyntheticSystemMessageIxpLayer (copy)
			if isSyntheticSystemMessageIdModule(var131) then
				IXPService:LogFlagLinkedUserLayerExposure(appChatConversationPageSyntheticSystemMessageIxpLayer)
			end
		end, { var76.conversationId, var131 })
	end
	local var132 = reactModule.useCallback(function(p16) --[[ line: 705 ]]
		-- upvalues: var113 (ref), chatConversationTelemetryEventsModule (copy), var115 (ref)
		var113.emit(chatConversationTelemetryEventsModule.ScreenExit, { conversationExitType = p16 })
		var115()
	end, { var113, var115 })
	var80 = var80 or {}
	local var133 = var80.participantPendingStatus ~= conversationChannelsModule.UserPendingStatus.Pending and var85
	local var85_1 = not var133 and var85
	local var135 = useIsExternalNavigationAvailableModule({ enumScreensModule.ViewUserProfile })
	local var136 = var80.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
	local var137 = useSelector(function(p17) --[[ line: 725 ]]
		-- upvalues: var136 (ref), var80 (write)
		return var136 and var80.initiator == p17.LocalUserId
	end)
	
	local var138 = function(p18) --[[ line: 730 ]]
		-- upvalues: var135 (ref), enumScreensModule (copy), var78 (ref), var76 (ref), genericDialogTypeModule (copy), var118 (ref), var136 (ref), var137 (ref)
		if var135[enumScreensModule.ViewUserProfile] then
			var78(p18)
			
			return
		end
		var76.navigateToScreen(genericDialogTypeModule.ParticipantDialog, {
			conversationId = var76.conversationId,
			participantId = p18,
			showRemoveUserButton = not var118 and (var136 and var137)
		}, true)
	end
	
	local var139 = if if fFlagAppChatSignalsReplyStoreModule then var109 else var107 then if var111 then var112.replyToYourselfChatInputPlaceholder else var112.replyChatInputPlaceholder else var112.chatInputPlaceholder
	useEffect(function() --[[ line: 748 ]]
		-- upvalues: var76 (ref), var90 (write)
		var76.updateConversationTitle(var90)
	end, { var90, var76.updateConversationTitle })
	local var140 = reactModule.useCallback(function() --[[ line: 752 ]]
		-- upvalues: chatInputBoxDisabledPressedSignal (copy), timeoutEndTimestamp (write), decisionEventId (write), duration (write)
		chatInputBoxDisabledPressedSignal:fire({
			endTimestamp = timeoutEndTimestamp,
			decisionEventId = decisionEventId,
			duration = duration
		})
	end, { timeoutEndTimestamp, decisionEventId, duration })
	local var141, var142 = reactModule.useState(var76.navigation and (var76.navigation.isFocused and var76.navigation.isFocused()))
	local var143 = nil
	local var144 = nil
	
	if fFlagAppChatPerfTrackingModule then
		var143 = if fFlagRenderChatConversationOnlyWhenVisibleModule and var76.isFocused and not var76.isFocused() then false else var141
		var144 = var143 and not var118
	end
	local var145 = nil
	
	if fFlagAppChatPerfTrackingModule then
		local var146 = reactModule.useRef(false)
		reactModule.useEffect(function() --[[ line: 781 ]]
			-- upvalues: var146 (ref), var133 (ref)
			var146.current = not var133
		end, { var76.conversationId, var133 })
		local var147 = reactModule.useCallback(function(p19) --[[ line: 785 ]]
			-- upvalues: appChatPerfTrackerModule (copy), var76 (ref), var144 (write), var146 (ref), loggerModule (copy), var95 (ref)
			if not appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = var76.conversationId }) or not var144 then return end
			if var146.current then
				appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.ChatConversationTTI, {
					conversationId = var76.conversationId,
					numElementsRendered = #var95
				})
				
				return
			end
			loggerModule:debug("TTI: Messages ready but waiting for input bar (chatInputBarReady={}, reason={})", var146.current, p19)
		end, { var76.conversationId, var141, var118, #var95 })
		reactModule.useEffect(function() --[[ line: 809 ]]
			-- upvalues: var147 (ref)
			var147("messages_ready")
		end, { var147, #var95, var76.conversationId })
		var145 = reactModule.useCallback(function() --[[ line: 813 ]]
			-- upvalues: var146 (ref), var147 (ref)
			var146.current = true
			var147("input_bar_ready")
		end, { var147 })
	end
	if fFlagAppChatPerfTrackingModule then
		local var148 = reactModule.useRef(nil)
		reactModule.useEffect(function() --[[ line: 827 ]]
			-- upvalues: loggerModule (copy), var76 (ref), var148 (ref), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy)
			loggerModule:debug("Perf: Resetting message perf tracking for conversation {}", var76.conversationId)
			var148.current = nil
			local t = { conversationId = var76.conversationId }
			
			if fFlagAppChatMessageTTIMilestonesModule then
				appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageSendTTI, t)
				appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageReceiveTTI, t)
				
				return
			end
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageSendToPendingRender, t)
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageSendResponseToFinalRender, t)
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageSendToFinalRender, t)
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageReceiveToRender, t)
		end, { var76.conversationId })
		reactModule.useEffect(function() --[[ line: 845 ]]
			-- upvalues: var95 (ref), var76 (ref), var83 (ref), var148 (ref), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy)
			local var156 = var95[1]
			
			if not var156 or not var156.id then return end
			local t = { conversationId = var76.conversationId }
			local var158 = var156.senderTargetId == var83
			
			if not var156.isSending and (if var156.senderType ~= "system" then not var158 else true) then
				if var156.id ~= var148.current then
					var148.current = var156.id
					
					if fFlagAppChatMessageTTIMilestonesModule then
						appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageReceiveTTI, t)
					else
						appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageReceiveToRender, t)
					end
				end
			elseif fFlagAppChatMessageTTIMilestonesModule then
				if appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.MessageReceiveTTI, t) then
					appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageReceiveTTI, t)
				end
			elseif appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.MessageReceiveToRender, t) then
				appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageReceiveToRender, t)
			end
			if not var158 then return end
			if fFlagAppChatMessageTTIMilestonesModule then
				if var156.isSending then
					appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.FunctionallyReady, t)
					
					return
				end
				appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageSendTTI, t)
				
				return
			elseif var156.isSending then
				appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageSendToPendingRender, t)
				
				return
			end
			appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageSendResponseToFinalRender, t)
			appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageSendToFinalRender, t)
		end, { var95, var83, var76.conversationId })
	end
	useEffect(function() --[[ line: 909 ]]
		-- upvalues: var76 (ref), roactNavigationModule (copy), fFlagAppChatPerfTrackingModule (copy), var142 (ref), appChatPerfTrackerModule (copy)
		local willBlur = var76.navigation and (var76.navigation.addListener and var76.navigation.addListener(roactNavigationModule.Events.WillBlur, function(p20) --[[ line: 912 ]]
			-- upvalues: fFlagAppChatPerfTrackingModule (copy), var142 (copy), appChatPerfTrackerModule (copy), var76 (copy)
			if fFlagAppChatPerfTrackingModule then
				local isOverlay = p20 and (p20.action and (p20.action.params and (p20.action.params.isOverlay or false)))
				var142(isOverlay)
				
				if isOverlay then return end
				if appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = var76.conversationId }) then
					appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = var76.conversationId })
					
					return
				end
			elseif p20 and p20.action and (p20.action.params and p20.action.params.isOverlay) then
				var142(true)
				
				return
			end
			var142(false)
		end))
		local willFocus = var76.navigation and (var76.navigation.addListener and var76.navigation.addListener(roactNavigationModule.Events.WillFocus, function(_) --[[ line: 943 ]]
			-- upvalues: var142 (copy)
			var142(true)
		end))
		
		return function() --[[ line: 947 ]]
			-- upvalues: willBlur (ref), willFocus (ref)
			if willBlur then
				willBlur.remove()
			end
			if willFocus then
				willFocus.remove()
			end
		end
	end, { var76.navigation, var76.conversationId })
	useEffect(function() --[[ line: 958 ]]
		-- upvalues: var96 (ref), var87 (ref), getAllRemainingOlderMessagesModule (copy), getOlderMessagesModule (copy), var76 (ref), appChatGetAllMessagesDepth (copy), var112 (ref)
		if var96.shouldShowOsaCardOnInitialLoad then
			var87(getAllRemainingOlderMessagesModule(getOlderMessagesModule, var76.conversationId, appChatGetAllMessagesDepth)):catch(function() --[[ line: 962 ]]
				-- upvalues: var76 (copy), var112 (copy)
				var76.navigateToToast({
					toastProps = { toastContent = { toastTitle = var112.networkErrorText } }
				})
			end)
		end
	end, { var96.shouldShowOsaCardOnInitialLoad })
	local getCanAccessParty = var76.getCanAccessParty
	
	return if fFlagAppChatPerfTrackingModule then if var143 then if var118 then reactModule.createElement(pendingStateConversationPageModule, {
		conversationId = var76.conversationId,
		topBarHeight = var76.topBarHeight,
		networkErrorText = var112.networkErrorText,
		navigateToToast = var76.navigateToToast,
		wideMode = var76.wideMode,
		onConversationUnmount = var132,
		navigateBack = var76.navigateBack
	}) else reactModule.createElement(chatConversationModule, cryoModule.Dictionary.join(var76, var79, var112, {
		moreMenuEnabled = getCanAccessParty,
		conversation = var80,
		conversationTitle = var90,
		itemList = var97,
		localUserId = var83,
		openGameDetailsPage = var76.openGameDetailsPage,
		openViewProfile = var138,
		readingMessagesIsEnabled = var76.getReadingMessagesIsEnabled(),
		Users = var91,
		usersTyping = var92,
		displayNamesAvailable = var103,
		onConversationUnmount = var132,
		recipientIdsSerialized = var82,
		chatIsVisible = var84,
		chatInputPlaceholder = var139,
		replyingToMessageId = if fFlagAppChatSignalsReplyStoreModule then var109 else nil,
		replyingToMessage = if not fFlagAppChatSignalsReplyStoreModule then var107 else nil,
		replyingToMessageDispatch = if not fFlagAppChatSignalsReplyStoreModule then var108 else nil,
		shouldShowChatInputBar = var133,
		shouldShowLegacyBottomModal = var85_1,
		shouldDisableChatInputBar = isTimedOut,
		onChatInputBarReady = if fFlagAppChatPerfTrackingModule then var145 else nil,
		inputBarDisabledEndTimestampDisplay = timeoutEndTimestamp,
		onDisabledInputBarActivated = var140,
		scrollToTopOnInitialOsaLoad = var96.shouldShowOsaCardOnInitialLoad and var96.fetchedOldestMessage,
		navigateToSquadLobby = if getCanAccessParty then var76.navigateToSquadLobby else nil,
		shouldHideMoreMenuButton = if getCanAccessParty then not var133 else nil,
		isInitialMessageLoading = if fFlagAppChatConversationLoadingSkeletonModule then var98 else nil
	})) else nil elseif var141 then if fFlagRenderChatConversationOnlyWhenVisibleModule and var76.isFocused and not var76.isFocused() then nil elseif var118 then reactModule.createElement(pendingStateConversationPageModule, {
		conversationId = var76.conversationId,
		topBarHeight = var76.topBarHeight,
		networkErrorText = var112.networkErrorText,
		navigateToToast = var76.navigateToToast,
		wideMode = var76.wideMode,
		onConversationUnmount = var132,
		navigateBack = var76.navigateBack,
		style = var76.style
	}) else reactModule.createElement(chatConversationModule, cryoModule.Dictionary.join(var76, var79, var112, {
		moreMenuEnabled = getCanAccessParty,
		conversation = var80,
		conversationTitle = var90,
		itemList = var97,
		localUserId = var83,
		openGameDetailsPage = var76.openGameDetailsPage,
		openViewProfile = var138,
		readingMessagesIsEnabled = var76.getReadingMessagesIsEnabled(),
		Users = var91,
		usersTyping = var92,
		displayNamesAvailable = var103,
		onConversationUnmount = var132,
		recipientIdsSerialized = var82,
		chatIsVisible = var84,
		chatInputPlaceholder = var139,
		replyingToMessageId = if fFlagAppChatSignalsReplyStoreModule then var109 else nil,
		replyingToMessage = if not fFlagAppChatSignalsReplyStoreModule then var107 else nil,
		replyingToMessageDispatch = if not fFlagAppChatSignalsReplyStoreModule then var108 else nil,
		shouldShowChatInputBar = var133,
		shouldShowLegacyBottomModal = var85_1,
		shouldDisableChatInputBar = isTimedOut,
		onChatInputBarReady = if fFlagAppChatPerfTrackingModule then var145 else nil,
		inputBarDisabledEndTimestampDisplay = timeoutEndTimestamp,
		onDisabledInputBarActivated = var140,
		scrollToTopOnInitialOsaLoad = var96.shouldShowOsaCardOnInitialLoad and var96.fetchedOldestMessage,
		navigateToSquadLobby = if getCanAccessParty then var76.navigateToSquadLobby else nil,
		shouldHideMoreMenuButton = if getCanAccessParty then not var133 else nil,
		isInitialMessageLoading = if fFlagAppChatConversationLoadingSkeletonModule then var98 else nil
	})) else nil
end

return universalAppPolicy.connect(function(p21) --[[ line: 1087 ]]
	return {
		viewProfileOnAvatarPressed = p21.getChatTapConversationThumbnail(),
		getCanAccessParty = p21.getCanAccessParty()
	}
end)(ChatConversationContainer)