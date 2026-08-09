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
local fFlagEnableAEGIS2AppChatConversationBanner = require(parent.SharedFlags).FFlagEnableAEGIS2AppChatConversationBanner
local fFlagAppChatShowOSAOnPageEntry = require(parent.SharedFlags).FFlagAppChatShowOSAOnPageEntry
local appChatGetAllMessagesDepth = game:DefineFastInt("AppChatGetAllMessagesDepth", 100)
local fFlagAppChatNavigateBackIfOSAUnacknowledged = require(parent.SharedFlags).FFlagAppChatNavigateBackIfOSAUnacknowledged
local shouldShowOSAForConversationModule = require(appChat.Utils.shouldShowOSAForConversation)
local fFlagAppChatSignalsMessageStoreModule = require(appChat.Flags.FFlagAppChatSignalsMessageStore)
local useMessageItemList = require(appChat.Hooks.useMessageItemList).useMessageItemList
local shouldShowU13ChatOptInForConversationModule = require(appChat.Utils.shouldShowU13ChatOptInForConversation)
local navigateWithOsaGate = require(appChat.Utils).navigateWithOsaGate
local fFlagAppChatReactToFaeForOsaModule = require(appChat.Flags.FFlagAppChatReactToFaeForOsa)
local fFlagAppChatNudgeToChatUpsellEnabledModule = require(appChat.Flags.FFlagAppChatNudgeToChatUpsellEnabled)
local fFlagAppChatConversationLoadingSkeletonModule = require(appChat.Flags.FFlagAppChatConversationLoadingSkeleton)
local isSyntheticSystemMessageIdModule = require(script.Parent.Utils.isSyntheticSystemMessageId)
local appChatConversationPageSyntheticSystemMessageIxpEnabled = game:DefineFastFlag("AppChatConversationPageSyntheticSystemMessageIxpEnabled", false)
local appChatConversationPageSyntheticSystemMessageIxpLayer = game:DefineFastString("AppChatConversationPageSyntheticSystemMessageIxpLayer", "Party.ConversationPage")

local function _(p0) --[[ line: 107 | named "isOverlayNavigation" ]]
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
	chatUnavailableWithUserKey = if getFFlagIsSquadEnabled() then "Feature.Chat.Message.PartyUnavailableWithUser" else "Feature.Chat.Message.ChatUnavailableWithUser",
	getReadingMessagesIsEnabled = function() --[[ line: 134 ]] end,
	updateConversationTitle = function(_) --[[ line: 135 ]] end,
	navigateToScreen = function() --[[ line: 136 ]] end,
	navigateToChatLanding = function() --[[ line: 138 ]] end,
	releaseInputBarFocus = function() --[[ line: 139 ]] end,
	navigateToSquadLobby = function() --[[ line: 140 ]] end,
	navigateToConversationOverlay = function() --[[ line: 141 ]] end
}

local function getOsaState(p1, p2, p3) --[[ line: 146 ]]
	-- upvalues: conversationModule (ref), fFlagAppChatConversationLoadingSkeletonModule (ref), getOtherParticipantsModule (ref), userProfilesModule (ref)
	local fetchedOldestMessage = p1 and p1.fetchedOldestMessage
	local var68 = not p1 or p1.conversationType ~= conversationModule.Type.MULTI_USER_CONVERSATION
	local var69 = p1 and (var68 and (if p1.source ~= "friends" then if p1.osaAcknowledgementStatus ~= conversationModule.OsaAcknowledgementStatus.Unacknowledged then p1.osaAcknowledgementStatus == conversationModule.OsaAcknowledgementStatus.Acknowledged else true else true))
	local var70 = p1 and p1.source == "friends"
	local var71 = var69 and (p1 and p1.osaAcknowledgementStatus == conversationModule.OsaAcknowledgementStatus.Unacknowledged and not var70)
	local var72 = var69 and (fetchedOldestMessage or var70)
	local var71_1 = nil
	local var74 = nil
	local _ = nil
	
	if fFlagAppChatConversationLoadingSkeletonModule then
		var71_1 = var71 or var72
		local var75 = if var71_1 then getOtherParticipantsModule(p1, p2)[1] else nil
		local var76 = true
		
		if var75 ~= nil then
			if p3 ~= nil then
				var76 = true
				
				if p3.error == nil then
					var76 = p3 ~= nil and (p3.data ~= nil and userProfilesModule.Selectors.getCombinedNameFromId(p3.data, var75) ~= nil)
				end
			end
		end
		var74 = var76
	end
	return {
		shouldShowOsaCardInConversation = var69,
		fetchedOldestMessage = fetchedOldestMessage,
		shouldShowOsaCardOnInitialLoad = var71,
		shouldShowOsaCardNow = var72,
		isFriendsConversation = var70,
		willShowOsaCard = var71_1,
		isOsaCardReady = var74
	}
end

function ChatConversationContainer(p4) --[[ line: 192 ]]
	-- upvalues: cryoModule (ref), t (ref), useAnalyticsModule (ref), reactModule (ref), roactChatAnalyticsModule (ref), useMapDispatchModule (ref), mapDispatchToPropsModule (ref), useGetConversationFromIdModule (ref), useRecipientIdsModule (ref), httpService (ref), useLocalUserId (ref), useChatIsVisibleModule (ref), useIsChatUserMessagesEnabledModule (ref), useIsChatEnabledModule (ref), useDispatch (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), useEffect (ref), fFlagAppChatNavigateBackIfOSAUnacknowledged (ref), fFlagAppChatShowOSAOnPageEntry (ref), roactNavigationModule (ref), navigateWithOsaGate (ref), shouldShowOSAForConversationModule (ref), fFlagAppChatReactToFaeForOsaModule (ref), shouldShowU13ChatOptInForConversationModule (ref), useSignal (ref), interventionTreatmentShownSignal (ref), constants (ref), userProfilesModule (ref), getOtherParticipantsModule (ref), getConversationTitleModule (ref), useGetUsersModule (ref), useGetUsersTypingModule (ref), fFlagAppChatSignalsMessageStoreModule (ref), useMessageItemList (ref), selectMessagesPureModule (ref), getOsaState (ref), enumMessageTypesModule (ref), enumCustomEntryTypesModule (ref), fFlagAppChatConversationLoadingSkeletonModule (ref), useSelector (ref), appChatNetworkingModule (ref), roduxNetworkingModule (ref), getFFlagEnableAppChatInExperience (ref), useIsInExperienceModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), getReplyingToStoreModule (ref), getConversationMessageViewModelStoreModule (ref), useSignalState (ref), useReplyingToMessageModule (ref), useReplyingToMessageDispatchModule (ref), useLocalization (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), chatConversationTelemetryStateModule (ref), useIsUserPendingModule (ref), fFlagAppChatEnableDoubleOptIn (ref), useCallbackWithDynamicConversationIdModule (ref), loggerModule (ref), fFlagDebugEnableTCDoubleOptInDEV (ref), useKeybindModule (ref), fFlagTCUpsellModalEnabledDEV (ref), fFlagEnableAEGIS2AppChatConversationBanner (ref), fFlagAppChatNudgeToChatUpsellEnabledModule (ref), useShouldShowConversationOverlayModule (ref), useChatTimeoutDetailsModule (ref), chatConversationTelemetryEventsModule (ref), appChatConversationPageSyntheticSystemMessageIxpEnabled (ref), isSyntheticSystemMessageIdModule (ref), IXPService (ref), appChatConversationPageSyntheticSystemMessageIxpLayer (ref), conversationChannelsModule (ref), useIsExternalNavigationAvailableModule (ref), enumScreensModule (ref), conversationModule (ref), genericDialogTypeModule (ref), chatInputBoxDisabledPressedSignal (ref), fFlagRenderChatConversationOnlyWhenVisibleModule (ref), getAllRemainingOlderMessagesModule (ref), getOlderMessagesModule (ref), appChatGetAllMessagesDepth (ref), pendingStateConversationPageModule (ref), chatConversationModule (ref)
	local var77 = cryoModule.Dictionary.join(t, p4)
	local var78 = useAnalyticsModule()
	local var79 = reactModule.useCallback(function(p5) --[[ line: 195 ]]
		-- upvalues: var78 (ref), roactChatAnalyticsModule (copy), var77 (ref)
		var78:navigate(roactChatAnalyticsModule.NavigationEvents.ChatConversationProfile)
		var77.openViewProfile(p5)
	end, { var77.openViewProfile, var78 })
	local var80 = useMapDispatchModule(mapDispatchToPropsModule)
	local var81 = useGetConversationFromIdModule(var77.conversationId)
	local _ = nil
	local var82 = useRecipientIdsModule(var81)
	local ok, status = pcall(function() --[[ line: 203 ]]
		-- upvalues: httpService (copy), var82 (ref)
		return httpService:JSONEncode(var82)
	end)
	local var83 = if ok then status else "[]"
	local _ = nil
	local _ = nil
	local var84 = useLocalUserId()
	local var85 = useChatIsVisibleModule()
	local var86 = useIsChatUserMessagesEnabledModule()
	local var87 = useIsChatEnabledModule()
	local var88 = useDispatch()
	
	if fFlagAppChatPerfTrackingModule and fFlagAppChatMessageTTIMilestonesModule and appChatPerfTrackerModule.Hooks then
		appChatPerfTrackerModule.Hooks.useTTIRenderAndMountedTracking(appChatPerfTrackerModule.getEventName(appChatPerfTrackerModule.Events.ChatConversationTTI) or "")
	end
	useEffect(function() --[[ line: 224 ]]
		-- upvalues: var87 (ref), var77 (ref)
		if not var87 then
			var77.navigateToChatLanding()
		end
	end, { var87, var77.navigateToChatLanding })
	
	if fFlagAppChatNavigateBackIfOSAUnacknowledged then
		local var89 = if var77.navigation and var77.navigation.getParam then var77.navigation.getParam("isNavigatedFromGroupOSAJoin", false) else false
		
		if fFlagAppChatShowOSAOnPageEntry then
			useEffect(function() --[[ line: 237 ]]
				-- upvalues: var77 (ref), roactNavigationModule (copy), navigateWithOsaGate (copy), var88 (ref)
				if var77.navigation and var77.navigation.addListener then
					local var150 = var77.navigation.addListener(roactNavigationModule.Events.WillFocus, function() --[[ line: 241 ]]
						-- upvalues: navigateWithOsaGate (copy), var77 (copy), var88 (copy)
						navigateWithOsaGate({
							conversationId = var77.conversationId,
							dispatch = var88,
							onAccepted = function() --[[ line: 245 ]] end,
							onDeclined = function() --[[ line: 246 ]]
								-- upvalues: var77 (copy)
								var77.navigateToChatLanding()
							end
						})
					end)
					
					return function() --[[ line: 251 ]]
						-- upvalues: var150 (ref)
						if var150 then
							var150:remove()
						end
					end
				end
			end, { var77.navigation, var77.conversationId, var88 })
		else
			useEffect(function() --[[ line: 258 ]]
				-- upvalues: var89 (ref), shouldShowOSAForConversationModule (copy), var81 (write), var77 (ref)
				if not var89 and shouldShowOSAForConversationModule(var81) then
					var77.navigateToChatLanding()
				end
			end, { var81, var77.navigateToChatLanding, var89 })
		end
	end
	if fFlagAppChatReactToFaeForOsaModule then
		useEffect(function() --[[ line: 268 ]]
			-- upvalues: var81 (write), shouldShowOSAForConversationModule (copy), shouldShowU13ChatOptInForConversationModule (copy), navigateWithOsaGate (copy), var77 (ref), var88 (ref)
			if not var81 then return end
			if shouldShowOSAForConversationModule(var81) or shouldShowU13ChatOptInForConversationModule(var81) then
				navigateWithOsaGate({
					conversationId = var77.conversationId,
					dispatch = var88,
					onAccepted = function() --[[ line: 278 ]] end,
					onDeclined = function() --[[ line: 279 ]]
						-- upvalues: var77 (copy)
						var77.navigateToChatLanding()
					end
				})
			end
		end, { var81, var77.conversationId, var88 })
	end
	useSignal(interventionTreatmentShownSignal, reactModule.useCallback(function(p6) --[[ line: 295 ]]
		-- upvalues: constants (copy), var77 (ref)
		if p6 == constants.TreatmentType.PartyChatNudgeDialog or p6 == constants.TreatmentType.PartyChatTimeoutDialog then
			var77.releaseInputBarFocus()
		end
	end, { var77.releaseInputBarFocus }))
	local var90 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = getOtherParticipantsModule(var81, var84),
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local var91 = getConversationTitleModule(var81)
	local var92 = useGetUsersModule()
	local var93 = useGetUsersTypingModule(var77.conversationId)
	local var94 = reactModule.useRef({
		itemList = {},
		previousMessagesState = {},
		previousSendingMessagesState = {},
		previousMessagesResult = {}
	})
	local var95 = if fFlagAppChatSignalsMessageStoreModule then useMessageItemList(var77.conversationId, var92, var84, var81) else nil
	local var96 = reactModule.useMemo(function() --[[ line: 326 ]]
		-- upvalues: fFlagAppChatSignalsMessageStoreModule (copy), var95 (write), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy), var77 (ref), var94 (ref), selectMessagesPureModule (copy), var81 (write), var92 (ref), var84 (ref)
		if fFlagAppChatSignalsMessageStoreModule then
			return var95
		end
		local chatConversationTTI = fFlagAppChatPerfTrackingModule and (fFlagAppChatMessageTTIMilestonesModule and appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = var77.conversationId }))
		
		if chatConversationTTI then
			local t = { conversationId = var77.conversationId }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, t)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Subphase.DataUpdate, t)
		end
		var94.current = selectMessagesPureModule({
			conversation = var81,
			conversationId = var77.conversationId,
			Users = var92,
			localUserId = var84
		}, var94.current)
		
		if chatConversationTTI then
			local t = { conversationId = var77.conversationId }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, t)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Subphase.DataUpdate, t)
		end
		return var94.current.itemList
	end, {
		var81,
		var77.conversationId,
		var92,
		var84,
		var95
	})
	local var97 = getOsaState(var81, var84, var90)
	local var98 = reactModule.useMemo(function() --[[ line: 378 ]]
		-- upvalues: var97 (ref), var96 (ref), enumMessageTypesModule (copy), enumCustomEntryTypesModule (copy)
		local t = {}
		
		if var97.shouldShowOsaCardOnInitialLoad and not var97.fetchedOldestMessage then
			return t
		end
		local cloned = table.clone(var96)
		
		if var97.shouldShowOsaCardNow then
			table.insert(cloned, {
				messageType = enumMessageTypesModule.Custom,
				customEntryType = enumCustomEntryTypesModule.OsaContextCardOneToOne,
				stable_key = enumCustomEntryTypesModule.OsaContextCardOneToOne
			})
		end
		return cloned
	end, {
		var96, var81, var97.shouldShowOsaCardOnInitialLoad,
		var97.shouldShowOsaCardInConversation, var97.shouldShowOsaCardNow,
		var97.fetchedOldestMessage
	})
	local var99 = false
	
	if fFlagAppChatConversationLoadingSkeletonModule then
		local isOsaCardReady, willShowOsaCard
		local var100 = useSelector(function(p7) --[[ line: 407 ]]
			-- upvalues: appChatNetworkingModule (copy), var77 (ref)
			return appChatNetworkingModule.rodux.GetOlderMessages.getStatus(p7, var77.conversationId)
		end)
		local _ = nil
		local _ = nil
		
		if var97.isFriendsConversation then
			isOsaCardReady = var97.isOsaCardReady
			willShowOsaCard = var97.willShowOsaCard
		elseif var97.shouldShowOsaCardOnInitialLoad then
			isOsaCardReady = var97.fetchedOldestMessage == true and var97.isOsaCardReady
			willShowOsaCard = true
		else
			isOsaCardReady = if var100 ~= roduxNetworkingModule.Enum.NetworkStatus.Done then var97.fetchedOldestMessage == true else true
			willShowOsaCard = if var100 ~= roduxNetworkingModule.Enum.NetworkStatus.NotStarted then var100 == roduxNetworkingModule.Enum.NetworkStatus.Fetching else true
		end
		local var101 = reactModule.useRef({ conversationId = nil, hasLoadedFirstPage = false })
		
		if var101.current.conversationId ~= var77.conversationId then
			var101.current = {
				hasLoadedFirstPage = false,
				conversationId = var77.conversationId
			}
		end
		var101.current.hasLoadedFirstPage = var101.current.hasLoadedFirstPage or isOsaCardReady
		var99 = var81 and (not var101.current.hasLoadedFirstPage and willShowOsaCard)
	end
	local var102 = if var93[1] and var90.data then userProfilesModule.Selectors.getCombinedNameFromId(var90.data, var93[1].id) else nil
	local var103 = if var93[2] and var90.data then userProfilesModule.Selectors.getCombinedNameFromId(var90.data, var93[2].id) else nil
	local var104 = true
	
	if #var93 == 1 and not var102 then
		var104 = false
	elseif #var93 == 2 and (not var102 or not var103) then
		var104 = false
	end
	local var113, var114
	local var105 = getFFlagEnableAppChatInExperience() and useIsInExperienceModule()
	local var106 = if fFlagAppChatSignalsReplyStoreModule then getReplyingToStoreModule(false) else nil
	local var107 = if fFlagAppChatSignalsReplyStoreModule then getConversationMessageViewModelStoreModule(false).conversationMessageStore else nil
	local var108 = nil
	local var109 = nil
	local var110 = nil
	local var111 = nil
	local var112 = nil
	
	if fFlagAppChatSignalsReplyStoreModule then
		var110 = useSignalState(var106.getMessageId)
		
		if var110 then
			var113 = var107.messages(false)[var110]
			var114 = if var113 and var113.sender_user_id then tostring(var113.sender_user_id) else nil
			var112 = var114 == var84
			var111 = if var112 or not var114 or not var90.data then nil else userProfilesModule.Selectors.getCombinedNameFromId(var90.data, var114)
		end
	else
		var108 = useReplyingToMessageModule()
		var109 = useReplyingToMessageDispatchModule()
		
		if var108 then
			var112 = var108.senderTargetId == var84
			var111 = if var112 or not var90.data then nil else userProfilesModule.Selectors.getCombinedNameFromId(var90.data, var108.senderTargetId)
		end
	end
	var113 = useLocalization({
		chatInputPlaceholder = var77.chatInputPlaceholderKey,
		replyChatInputPlaceholder = {
			var77.replyChatInputPlaceholderKey,
			DISPLAY_NAME = var111
		},
		replyToYourselfChatInputPlaceholder = var77.replyToYourselfChatInputPlaceholderKey,
		invalidMessageTypeText = var77.notImplementedMessageTypeKey,
		messageDefaultNoticeText = var77.messageDefaultNoticeKey,
		messageModeratedNoticeText = var77.messageModeratedNoticeKey,
		messageHiddenNoticeText = var77.messageHiddenNoticeKey,
		networkErrorText = var77.networkErrorTextKey,
		newText = var77.newTextKey,
		schedulePartyText = var77.schedulePartyTextKey,
		unknownUserText = var77.unknownUserTextKey,
		oneUserTyping = {
			"Feature.Chat.Message.OneUserTyping",
			DISPLAY_NAME = var102
		},
		twoUsersTyping = {
			"Feature.Chat.Message.TwoUsersTyping",
			DISPLAY_NAME_1 = var102,
			DISPLAY_NAME_2 = var103
		},
		severalUsersTyping = var77.severalUsersTyping,
		bottomModalText = var77.chatUnavailableWithUserKey,
		inputBarDisabledText = var77.inputBarDisabledKey
	})
	var114 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var115 = chatConversationTelemetryStateModule.useMergeState()
	local var116 = chatConversationTelemetryStateModule.useClearState()
	local var117 = if var81 then var81.moderationType else cryoModule.None
	local var118 = if var81 then var81.userPendingStatus else cryoModule.None
	useEffect(function() --[[ line: 521 ]]
		-- upvalues: var115 (ref), var77 (ref), var117 (ref), var118 (ref)
		var115({
			conversationId = var77.conversationId,
			moderationType = var117,
			userPendingStatus = var118
		})
	end, { var115, var77.conversationId, var117, var118 })
	local var119 = useIsUserPendingModule(var81 or {})
	local source = var81 and var81.source
	
	if fFlagAppChatEnableDoubleOptIn then
		local var121, var122 = useCallbackWithDynamicConversationIdModule(appChatNetworkingModule.rodux.GetModalSequence.API, var77.conversationId)
		useEffect(function() --[[ line: 537 ]]
			-- upvalues: var122 (ref), var119 (ref), source (ref), var88 (ref), appChatNetworkingModule (copy), var77 (ref), var105 (ref), loggerModule (copy), var121 (ref)
			if not var122 then return end
			if var119 and source == "channels" then
				var88(appChatNetworkingModule.rodux.GetPendingStateModal.API(var77.conversationId, var105)):catch(function(p8) --[[ line: 543 ]]
					-- upvalues: loggerModule (copy)
					loggerModule:warning(`GetPendingStateModal error in ChatConversationContainer {tostring(p8)}`)
				end)
			end
			if not var119 then
				var88(var121({
					modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationTopModal,
					isInExperience = var105
				})):catch(function(p9) --[[ line: 552 ]]
					-- upvalues: loggerModule (copy)
					loggerModule:warning(`GetModalSequence for ConversationTopModal error in ChatConversationContainer {tostring(p9)}`)
				end)
			end
		end, {
			var77.conversationId,
			var122,
			var105,
			var119,
			source
		})
	else
		useEffect(function() --[[ line: 560 ]]
			-- upvalues: source (ref), var119 (ref), var88 (ref), appChatNetworkingModule (copy), var77 (ref), var105 (ref)
			if source ~= "channels" then return end
			if var119 then
				var88(appChatNetworkingModule.rodux.GetPendingStateModal.API(var77.conversationId, var105)):catch(function(p10) --[[ line: 566 ]]
					warn("GetPendingStateModal error in ChatConversationContainer " .. tostring(p10))
				end)
				
				return
			end
			var88(appChatNetworkingModule.rodux.GetConversationTopModal.API(var77.conversationId, var105)):catch(function(p11) --[[ line: 572 ]]
				warn("GetConversationTopModal error in ChatConversationContainer " .. tostring(p11))
			end)
		end, { var77.conversationId, var88, source })
	end
	local var127
	local var123, var124 = useCallbackWithDynamicConversationIdModule(appChatNetworkingModule.rodux.GetModalSequence.API, var77.conversationId)
	useEffect(function() --[[ line: 583 ]]
		-- upvalues: var119 (ref), var124 (write), var88 (ref), var123 (ref), appChatNetworkingModule (copy), var105 (ref), loggerModule (copy)
		if not var119 and var124 then
			var88(var123({
				modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationOverlay,
				isInExperience = var105
			})):catch(function(p12) --[[ line: 588 ]]
				-- upvalues: loggerModule (copy)
				loggerModule:warning(`GetModalSequence error in ChatConversationContainer {tostring(p12)}`)
			end)
		end
	end, {
		var124,
		var77.conversationId,
		var119,
		var105,
		var117
	})
	
	if fFlagDebugEnableTCDoubleOptInDEV then
		useKeybindModule({
			keyCode = Enum.KeyCode.O,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function() --[[ line: 595 ]]
			-- upvalues: loggerModule (copy), var88 (ref), var77 (ref), appChatNetworkingModule (copy)
			loggerModule:debug("Ctrl + O pressed, showing new TC double opt in banner")
			var88({
				type = "DEBUG_ShowNewTopModal",
				conversationId = var77.conversationId,
				modalVariant = appChatNetworkingModule.Constants.ConversationTopModal.AddTrustedConnection
			})
		end, { var88, var77.conversationId })
		useKeybindModule({
			keyCode = Enum.KeyCode.P,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function() --[[ line: 604 ]]
			-- upvalues: loggerModule (copy), var88 (ref), var77 (ref), appChatNetworkingModule (copy)
			loggerModule:debug("Ctrl + P pressed, showing new TC double opt in request banner")
			var88({
				type = "DEBUG_ShowNewTopModal",
				conversationId = var77.conversationId,
				modalVariant = appChatNetworkingModule.Constants.ConversationTopModal.TrustedConnectionRequest
			})
		end, { var88, var77.conversationId })
	end
	if fFlagTCUpsellModalEnabledDEV then
		useKeybindModule({
			keyCode = Enum.KeyCode.L,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function() --[[ line: 615 ]]
			-- upvalues: loggerModule (copy), var88 (ref), var77 (ref), appChatNetworkingModule (copy)
			loggerModule:debug("Ctrl + L pressed, showing new TC created overlay")
			var88({
				type = "DEBUG_ShowNewTCOverlay",
				conversationId = var77.conversationId,
				modalVariant = appChatNetworkingModule.Constants.ConversationOverlay.TrustedConnectionCreated
			})
		end, { var88, var77.conversationId })
	end
	if fFlagEnableAEGIS2AppChatConversationBanner or fFlagAppChatNudgeToChatUpsellEnabledModule then
		local _ = nil
		local var125, var126 = useCallbackWithDynamicConversationIdModule(appChatNetworkingModule.rodux.GetModalSequence.API, var77.conversationId)
		var127 = var125
		var124 = var126
		useEffect(function() --[[ line: 631 ]]
			-- upvalues: var124 (write), var88 (ref), var127 (write), appChatNetworkingModule (copy), var105 (ref), loggerModule (copy)
			if var124 then
				var88(var127({
					modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationBottomModal,
					isInExperience = var105
				})):catch(function(p13) --[[ line: 639 ]]
					-- upvalues: loggerModule (copy)
					loggerModule:warning(`GetModalSequence for ConversationBottomModal error in ChatConversationContainer {tostring(p13)}`)
				end)
				
				return
			end
		end, { var77.conversationId, var124, var105 })
	end
	var127 = useShouldShowConversationOverlayModule(var77.conversationId)
	useEffect(function() --[[ line: 647 ]]
		-- upvalues: var127 (ref), var77 (ref)
		if var127 then
			var77.navigateToConversationOverlay()
		end
	end, { var127, var77.conversationId })
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local isNotChannels = source ~= "channels"
	local var129 = useSelector(function(p14) --[[ line: 658 ]]
		-- upvalues: isNotChannels (ref), appChatNetworkingModule (copy), var77 (ref), roduxNetworkingModule (copy)
		return (if isNotChannels then appChatNetworkingModule.rodux.GetChatModerationStatuses.getStatus(p14) else appChatNetworkingModule.rodux.GetChatModerationStatuses.getStatus(p14, var77.conversationId)) == roduxNetworkingModule.Enum.NetworkStatus.NotStarted
	end)
	useEffect(function() --[[ line: 665 ]]
		-- upvalues: var129 (ref), var88 (ref), appChatNetworkingModule (copy), isNotChannels (ref), var77 (ref)
		if var129 then
			var88(appChatNetworkingModule.rodux.GetChatModerationStatuses.API(if isNotChannels then nil else { var77.conversationId })):catch(function(p15) --[[ line: 671 ]]
				warn("GetChatModerationStatuses error in ChatConversationContainer " .. tostring(p15))
			end)
		end
	end, { var77.conversationId, isNotChannels, var88, var129 })
	local var130 = useChatTimeoutDetailsModule({
		conversationId = var77.conversationId,
		conversationModerationType = var117
	})
	local isTimedOut = var130.isTimedOut
	local timeoutEndTimestamp = var130.timeoutEndTimestamp
	local decisionEventId = var130.decisionEventId
	local duration = var130.duration
	local _ = nil
	useEffect(function() --[[ line: 687 ]]
		-- upvalues: var114 (ref), chatConversationTelemetryEventsModule (copy), var96 (ref)
		var114.emit(chatConversationTelemetryEventsModule.ScreenRendered, { loadedMessageCount = #var96 })
	end, { var77.conversationId })
	
	if appChatConversationPageSyntheticSystemMessageIxpEnabled then
		local var131 = var96[1]
		local var132 = if var131 then var131.id else nil
		useEffect(function() --[[ line: 701 ]]
			-- upvalues: isSyntheticSystemMessageIdModule (copy), var132 (ref), IXPService (copy), appChatConversationPageSyntheticSystemMessageIxpLayer (copy)
			if isSyntheticSystemMessageIdModule(var132) then
				IXPService:LogFlagLinkedUserLayerExposure(appChatConversationPageSyntheticSystemMessageIxpLayer)
			end
		end, { var77.conversationId, var132 })
	end
	local var133 = reactModule.useCallback(function(p16) --[[ line: 708 ]]
		-- upvalues: var114 (ref), chatConversationTelemetryEventsModule (copy), var116 (ref)
		var114.emit(chatConversationTelemetryEventsModule.ScreenExit, { conversationExitType = p16 })
		var116()
	end, { var114, var116 })
	var81 = var81 or {}
	local var134 = var81.participantPendingStatus ~= conversationChannelsModule.UserPendingStatus.Pending and var86
	local var86_1 = not var134 and var86
	local var136 = useIsExternalNavigationAvailableModule({ enumScreensModule.ViewUserProfile })
	local var137 = var81.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
	local var138 = useSelector(function(p17) --[[ line: 728 ]]
		-- upvalues: var137 (ref), var81 (write)
		return var137 and var81.initiator == p17.LocalUserId
	end)
	
	local var139 = function(p18) --[[ line: 733 ]]
		-- upvalues: var136 (ref), enumScreensModule (copy), var79 (ref), var77 (ref), genericDialogTypeModule (copy), var119 (ref), var137 (ref), var138 (ref)
		if var136[enumScreensModule.ViewUserProfile] then
			var79(p18)
			
			return
		end
		var77.navigateToScreen(genericDialogTypeModule.ParticipantDialog, {
			conversationId = var77.conversationId,
			participantId = p18,
			showRemoveUserButton = not var119 and (var137 and var138)
		}, true)
	end
	
	local var140 = if if fFlagAppChatSignalsReplyStoreModule then var110 else var108 then if var112 then var113.replyToYourselfChatInputPlaceholder else var113.replyChatInputPlaceholder else var113.chatInputPlaceholder
	useEffect(function() --[[ line: 751 ]]
		-- upvalues: var77 (ref), var91 (write)
		var77.updateConversationTitle(var91)
	end, { var91, var77.updateConversationTitle })
	local var141 = reactModule.useCallback(function() --[[ line: 755 ]]
		-- upvalues: chatInputBoxDisabledPressedSignal (copy), timeoutEndTimestamp (write), decisionEventId (write), duration (write)
		chatInputBoxDisabledPressedSignal:fire({
			endTimestamp = timeoutEndTimestamp,
			decisionEventId = decisionEventId,
			duration = duration
		})
	end, { timeoutEndTimestamp, decisionEventId, duration })
	local var142, var143 = reactModule.useState(var77.navigation and (var77.navigation.isFocused and var77.navigation.isFocused()))
	local var144 = nil
	local var145 = nil
	
	if fFlagAppChatPerfTrackingModule then
		var144 = if fFlagRenderChatConversationOnlyWhenVisibleModule and var77.isFocused and not var77.isFocused() then false else var142
		var145 = var144 and not var119
	end
	local var146 = nil
	
	if fFlagAppChatPerfTrackingModule then
		local var147 = reactModule.useRef(false)
		reactModule.useEffect(function() --[[ line: 784 ]]
			-- upvalues: var147 (ref), var134 (ref)
			var147.current = not var134
		end, { var77.conversationId, var134 })
		local var148 = reactModule.useCallback(function(p19) --[[ line: 788 ]]
			-- upvalues: appChatPerfTrackerModule (copy), var77 (ref), var145 (write), var147 (ref), loggerModule (copy), var96 (ref)
			if not appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = var77.conversationId }) or not var145 then return end
			if var147.current then
				appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.ChatConversationTTI, {
					conversationId = var77.conversationId,
					numElementsRendered = #var96
				})
				
				return
			end
			loggerModule:debug("TTI: Messages ready but waiting for input bar (chatInputBarReady={}, reason={})", var147.current, p19)
		end, { var77.conversationId, var142, var119, #var96 })
		reactModule.useEffect(function() --[[ line: 812 ]]
			-- upvalues: var148 (ref)
			var148("messages_ready")
		end, { var148, #var96, var77.conversationId })
		var146 = reactModule.useCallback(function() --[[ line: 816 ]]
			-- upvalues: var147 (ref), var148 (ref)
			var147.current = true
			var148("input_bar_ready")
		end, { var148 })
	end
	if fFlagAppChatPerfTrackingModule then
		local var149 = reactModule.useRef(nil)
		reactModule.useEffect(function() --[[ line: 830 ]]
			-- upvalues: loggerModule (copy), var77 (ref), var149 (ref), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy)
			loggerModule:debug("Perf: Resetting message perf tracking for conversation {}", var77.conversationId)
			var149.current = nil
			local t = { conversationId = var77.conversationId }
			
			if fFlagAppChatMessageTTIMilestonesModule then
				appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageSendTTI, t)
				appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageReceiveTTI, t)
				
				return
			end
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageSendToPendingRender, t)
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageSendResponseToFinalRender, t)
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageSendToFinalRender, t)
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageReceiveToRender, t)
		end, { var77.conversationId })
		reactModule.useEffect(function() --[[ line: 848 ]]
			-- upvalues: var96 (ref), var77 (ref), var84 (ref), var149 (ref), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy)
			local var157 = var96[1]
			
			if not var157 or not var157.id then return end
			local t = { conversationId = var77.conversationId }
			local var159 = var157.senderTargetId == var84
			
			if not var157.isSending and (if var157.senderType ~= "system" then not var159 else true) then
				if var157.id ~= var149.current then
					var149.current = var157.id
					
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
			if not var159 then return end
			if fFlagAppChatMessageTTIMilestonesModule then
				if var157.isSending then
					appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.FunctionallyReady, t)
					
					return
				end
				appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageSendTTI, t)
				
				return
			elseif var157.isSending then
				appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageSendToPendingRender, t)
				
				return
			end
			appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageSendResponseToFinalRender, t)
			appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageSendToFinalRender, t)
		end, { var96, var84, var77.conversationId })
	end
	useEffect(function() --[[ line: 912 ]]
		-- upvalues: var77 (ref), roactNavigationModule (copy), fFlagAppChatPerfTrackingModule (copy), var143 (ref), appChatPerfTrackerModule (copy)
		local willBlur = var77.navigation and (var77.navigation.addListener and var77.navigation.addListener(roactNavigationModule.Events.WillBlur, function(p20) --[[ line: 915 ]]
			-- upvalues: fFlagAppChatPerfTrackingModule (copy), var143 (copy), appChatPerfTrackerModule (copy), var77 (copy)
			if fFlagAppChatPerfTrackingModule then
				local isOverlay = p20 and (p20.action and (p20.action.params and (p20.action.params.isOverlay or false)))
				var143(isOverlay)
				
				if isOverlay then return end
				if appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = var77.conversationId }) then
					appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = var77.conversationId })
					
					return
				end
			elseif p20 and p20.action and (p20.action.params and p20.action.params.isOverlay) then
				var143(true)
				
				return
			end
			var143(false)
		end))
		local willFocus = var77.navigation and (var77.navigation.addListener and var77.navigation.addListener(roactNavigationModule.Events.WillFocus, function(_) --[[ line: 946 ]]
			-- upvalues: var143 (copy)
			var143(true)
		end))
		
		return function() --[[ line: 950 ]]
			-- upvalues: willBlur (ref), willFocus (ref)
			if willBlur then
				willBlur.remove()
			end
			if willFocus then
				willFocus.remove()
			end
		end
	end, { var77.navigation, var77.conversationId })
	useEffect(function() --[[ line: 961 ]]
		-- upvalues: var97 (ref), var88 (ref), getAllRemainingOlderMessagesModule (copy), getOlderMessagesModule (copy), var77 (ref), appChatGetAllMessagesDepth (copy), var113 (ref)
		if var97.shouldShowOsaCardOnInitialLoad then
			var88(getAllRemainingOlderMessagesModule(getOlderMessagesModule, var77.conversationId, appChatGetAllMessagesDepth)):catch(function() --[[ line: 965 ]]
				-- upvalues: var77 (copy), var113 (copy)
				var77.navigateToToast({
					toastProps = { toastContent = { toastTitle = var113.networkErrorText } }
				})
			end)
		end
	end, { var97.shouldShowOsaCardOnInitialLoad })
	local getCanAccessParty = var77.getCanAccessParty
	
	return if fFlagAppChatPerfTrackingModule then if var144 then if var119 then reactModule.createElement(pendingStateConversationPageModule, {
		conversationId = var77.conversationId,
		topBarHeight = var77.topBarHeight,
		networkErrorText = var113.networkErrorText,
		navigateToToast = var77.navigateToToast,
		wideMode = var77.wideMode,
		onConversationUnmount = var133,
		navigateBack = var77.navigateBack
	}) else reactModule.createElement(chatConversationModule, cryoModule.Dictionary.join(var77, var80, var113, {
		moreMenuEnabled = getCanAccessParty,
		conversation = var81,
		conversationTitle = var91,
		itemList = var98,
		localUserId = var84,
		openGameDetailsPage = var77.openGameDetailsPage,
		openViewProfile = var139,
		readingMessagesIsEnabled = var77.getReadingMessagesIsEnabled(),
		Users = var92,
		usersTyping = var93,
		displayNamesAvailable = var104,
		onConversationUnmount = var133,
		recipientIdsSerialized = var83,
		chatIsVisible = var85,
		chatInputPlaceholder = var140,
		replyingToMessageId = if fFlagAppChatSignalsReplyStoreModule then var110 else nil,
		replyingToMessage = if not fFlagAppChatSignalsReplyStoreModule then var108 else nil,
		replyingToMessageDispatch = if not fFlagAppChatSignalsReplyStoreModule then var109 else nil,
		shouldShowChatInputBar = var134,
		shouldShowLegacyBottomModal = var86_1,
		shouldDisableChatInputBar = isTimedOut,
		onChatInputBarReady = if fFlagAppChatPerfTrackingModule then var146 else nil,
		inputBarDisabledEndTimestampDisplay = timeoutEndTimestamp,
		onDisabledInputBarActivated = var141,
		scrollToTopOnInitialOsaLoad = var97.shouldShowOsaCardOnInitialLoad and var97.fetchedOldestMessage,
		navigateToSquadLobby = if getCanAccessParty then var77.navigateToSquadLobby else nil,
		shouldHideMoreMenuButton = if getCanAccessParty then not var134 else nil,
		isInitialMessageLoading = if fFlagAppChatConversationLoadingSkeletonModule then var99 else nil
	})) else nil elseif var142 then if fFlagRenderChatConversationOnlyWhenVisibleModule and var77.isFocused and not var77.isFocused() then nil elseif var119 then reactModule.createElement(pendingStateConversationPageModule, {
		conversationId = var77.conversationId,
		topBarHeight = var77.topBarHeight,
		networkErrorText = var113.networkErrorText,
		navigateToToast = var77.navigateToToast,
		wideMode = var77.wideMode,
		onConversationUnmount = var133,
		navigateBack = var77.navigateBack,
		style = var77.style
	}) else reactModule.createElement(chatConversationModule, cryoModule.Dictionary.join(var77, var80, var113, {
		moreMenuEnabled = getCanAccessParty,
		conversation = var81,
		conversationTitle = var91,
		itemList = var98,
		localUserId = var84,
		openGameDetailsPage = var77.openGameDetailsPage,
		openViewProfile = var139,
		readingMessagesIsEnabled = var77.getReadingMessagesIsEnabled(),
		Users = var92,
		usersTyping = var93,
		displayNamesAvailable = var104,
		onConversationUnmount = var133,
		recipientIdsSerialized = var83,
		chatIsVisible = var85,
		chatInputPlaceholder = var140,
		replyingToMessageId = if fFlagAppChatSignalsReplyStoreModule then var110 else nil,
		replyingToMessage = if not fFlagAppChatSignalsReplyStoreModule then var108 else nil,
		replyingToMessageDispatch = if not fFlagAppChatSignalsReplyStoreModule then var109 else nil,
		shouldShowChatInputBar = var134,
		shouldShowLegacyBottomModal = var86_1,
		shouldDisableChatInputBar = isTimedOut,
		onChatInputBarReady = if fFlagAppChatPerfTrackingModule then var146 else nil,
		inputBarDisabledEndTimestampDisplay = timeoutEndTimestamp,
		onDisabledInputBarActivated = var141,
		scrollToTopOnInitialOsaLoad = var97.shouldShowOsaCardOnInitialLoad and var97.fetchedOldestMessage,
		navigateToSquadLobby = if getCanAccessParty then var77.navigateToSquadLobby else nil,
		shouldHideMoreMenuButton = if getCanAccessParty then not var134 else nil,
		isInitialMessageLoading = if fFlagAppChatConversationLoadingSkeletonModule then var99 else nil
	})) else nil
end

return universalAppPolicy.connect(function(p21) --[[ line: 1090 ]]
	return {
		viewProfileOnAvatarPressed = p21.getChatTapConversationThumbnail(),
		getCanAccessParty = p21.getCanAccessParty()
	}
end)(ChatConversationContainer)