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
local fFlagAppChatReactiveFeatureRestrictions = require(parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local fFlagAppChatUniversalFeatureRestriction = require(parent.SharedFlags).FFlagAppChatUniversalFeatureRestriction
local appChatGetAllMessagesDepth = game:DefineFastInt("AppChatGetAllMessagesDepth", 100)
local fFlagAppChatNavigateBackIfOSAUnacknowledged = require(parent.SharedFlags).FFlagAppChatNavigateBackIfOSAUnacknowledged
local shouldShowOSAForConversationModule = require(appChat.Utils.shouldShowOSAForConversation)
local signalsMigrationConfigModule = require(appChat.Flags.SignalsMigrationConfig)
local useMessageItemList = require(appChat.Hooks.useMessageItemList).useMessageItemList
local shouldShowU13ChatOptInForConversationModule = require(appChat.Utils.shouldShowU13ChatOptInForConversation)
local navigateWithOsaGate = require(appChat.Utils).navigateWithOsaGate
local fFlagAppChatReactToFaeForOsaModule = require(appChat.Flags.FFlagAppChatReactToFaeForOsa)
local fFlagAppChatConversationLoadingSkeletonModule = require(appChat.Flags.FFlagAppChatConversationLoadingSkeleton)
local isSyntheticSystemMessageIdModule = require(script.Parent.Utils.isSyntheticSystemMessageId)
local fFlagAppChatConversationTrustedFriendUpsellBanner = require(parent.SharedFlags).FFlagAppChatConversationTrustedFriendUpsellBanner
local var1 = if fFlagAppChatConversationTrustedFriendUpsellBanner then require(appChat.Sdui.seedConversationTopModalFromRequest) else nil
local appChatConversationPageSyntheticSystemMessageIxpEnabled = game:DefineFastFlag("AppChatConversationPageSyntheticSystemMessageIxpEnabled", false)
local appChatConversationPageSyntheticSystemMessageIxpLayer = game:DefineFastString("AppChatConversationPageSyntheticSystemMessageIxpLayer", "Party.ConversationPage")

local function _(p1)
	local isOverlay
	if p1 then
		isOverlay = p1.action and (p1.action.params and (p1.action.params.isOverlay or false))
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
	getReadingMessagesIsEnabled = function() end,
	updateConversationTitle = function(_) end,
	navigateToScreen = function() end,
	navigateToChatLanding = function() end,
	releaseInputBarFocus = function() end,
	navigateToSquadLobby = function() end,
	navigateToConversationOverlay = function() end
}

local function getOsaState(p1, p2, p3)
	-- upvalues: conversationModule (ref), fFlagAppChatConversationLoadingSkeletonModule (ref), getOtherParticipantsModule (ref), userProfilesModule (ref)
	local fetchedOldestMessage = p1 and p1.fetchedOldestMessage
	local var2 = not p1 or p1.conversationType ~= conversationModule.Type.MULTI_USER_CONVERSATION
	local var3 = p1 and (var2 and (if p1.source ~= "friends" then if p1.osaAcknowledgementStatus ~= conversationModule.OsaAcknowledgementStatus.Unacknowledged then p1.osaAcknowledgementStatus == conversationModule.OsaAcknowledgementStatus.Acknowledged else true else true))
	local var4 = p1 and p1.source == "friends"
	local var5 = var3 and (p1 and p1.osaAcknowledgementStatus == conversationModule.OsaAcknowledgementStatus.Unacknowledged and not var4)
	local var6 = var3 and (fetchedOldestMessage or var4)
	local var7 = nil
	local var8 = nil
	local _ = nil
	
	if fFlagAppChatConversationLoadingSkeletonModule then
		var7 = var5 or var6
		local var9 = if var7 then getOtherParticipantsModule(p1, p2)[1] else nil
		local var10 = true
		
		if var9 ~= nil then
			if p3 ~= nil then
				var10 = true
				
				if p3.error == nil then
					var10 = p3 ~= nil and (p3.data ~= nil and userProfilesModule.Selectors.getCombinedNameFromId(p3.data, var9) ~= nil)
				end
			end
		end
		var8 = var10
	end
	return {
		shouldShowOsaCardInConversation = var3,
		fetchedOldestMessage = fetchedOldestMessage,
		shouldShowOsaCardOnInitialLoad = var5,
		shouldShowOsaCardNow = var6,
		isFriendsConversation = var4,
		willShowOsaCard = var7,
		isOsaCardReady = var8
	}
end

function ChatConversationContainer(p1)
	-- upvalues: cryoModule (ref), t (ref), useAnalyticsModule (ref), reactModule (ref), roactChatAnalyticsModule (ref), useMapDispatchModule (ref), mapDispatchToPropsModule (ref), useGetConversationFromIdModule (ref), useRecipientIdsModule (ref), httpService (ref), useLocalUserId (ref), useChatIsVisibleModule (ref), useIsChatUserMessagesEnabledModule (ref), useIsChatEnabledModule (ref), useDispatch (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), useEffect (ref), fFlagAppChatNavigateBackIfOSAUnacknowledged (ref), fFlagAppChatShowOSAOnPageEntry (ref), roactNavigationModule (ref), navigateWithOsaGate (ref), shouldShowOSAForConversationModule (ref), fFlagAppChatReactToFaeForOsaModule (ref), shouldShowU13ChatOptInForConversationModule (ref), useSignal (ref), interventionTreatmentShownSignal (ref), constants (ref), userProfilesModule (ref), getOtherParticipantsModule (ref), getConversationTitleModule (ref), useGetUsersModule (ref), useGetUsersTypingModule (ref), signalsMigrationConfigModule (ref), useMessageItemList (ref), selectMessagesPureModule (ref), getOsaState (ref), enumMessageTypesModule (ref), enumCustomEntryTypesModule (ref), fFlagAppChatConversationLoadingSkeletonModule (ref), useSelector (ref), appChatNetworkingModule (ref), roduxNetworkingModule (ref), getFFlagEnableAppChatInExperience (ref), useIsInExperienceModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), getReplyingToStoreModule (ref), getConversationMessageViewModelStoreModule (ref), useSignalState (ref), useReplyingToMessageModule (ref), useReplyingToMessageDispatchModule (ref), useLocalization (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), chatConversationTelemetryStateModule (ref), useIsUserPendingModule (ref), fFlagAppChatEnableDoubleOptIn (ref), useCallbackWithDynamicConversationIdModule (ref), loggerModule (ref), fFlagAppChatConversationTrustedFriendUpsellBanner (ref), var1 (ref), fFlagDebugEnableTCDoubleOptInDEV (ref), useKeybindModule (ref), fFlagTCUpsellModalEnabledDEV (ref), useShouldShowConversationOverlayModule (ref), useChatTimeoutDetailsModule (ref), chatConversationTelemetryEventsModule (ref), appChatConversationPageSyntheticSystemMessageIxpEnabled (ref), isSyntheticSystemMessageIdModule (ref), IXPService (ref), appChatConversationPageSyntheticSystemMessageIxpLayer (ref), conversationChannelsModule (ref), useIsExternalNavigationAvailableModule (ref), enumScreensModule (ref), conversationModule (ref), genericDialogTypeModule (ref), fFlagAppChatUniversalFeatureRestriction (ref), parent (ref), fFlagAppChatReactiveFeatureRestrictions (ref), chatInputBoxDisabledPressedSignal (ref), fFlagRenderChatConversationOnlyWhenVisibleModule (ref), getAllRemainingOlderMessagesModule (ref), getOlderMessagesModule (ref), appChatGetAllMessagesDepth (ref), pendingStateConversationPageModule (ref), chatConversationModule (ref)
	local var2 = cryoModule.Dictionary.join(t, p1)
	local var3 = useAnalyticsModule()
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), roactChatAnalyticsModule (copy), var2 (ref)
		var3:navigate(roactChatAnalyticsModule.NavigationEvents.ChatConversationProfile)
		var2.openViewProfile(p2)
	end, { var2.openViewProfile, var3 })
	local var5 = useMapDispatchModule(mapDispatchToPropsModule)
	local var6 = useGetConversationFromIdModule(var2.conversationId)
	local _ = nil
	local var7 = useRecipientIdsModule(var6)
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), var7 (ref)
		return httpService:JSONEncode(var7)
	end)
	local var8 = if ok then status else "[]"
	local _ = nil
	local _ = nil
	local var9 = useLocalUserId()
	local var10 = useChatIsVisibleModule()
	local var11 = useIsChatUserMessagesEnabledModule()
	local var12 = useIsChatEnabledModule()
	local var13 = useDispatch()
	
	if fFlagAppChatPerfTrackingModule and fFlagAppChatMessageTTIMilestonesModule and appChatPerfTrackerModule.Hooks then
		appChatPerfTrackerModule.Hooks.useTTIRenderAndMountedTracking(appChatPerfTrackerModule.getEventName(appChatPerfTrackerModule.Events.ChatConversationTTI) or "")
	end
	useEffect(function()
		-- upvalues: var12 (ref), var2 (ref)
		if not var12 then
			var2.navigateToChatLanding()
		end
	end, { var12, var2.navigateToChatLanding })
	
	if fFlagAppChatNavigateBackIfOSAUnacknowledged then
		local var14 = if var2.navigation and var2.navigation.getParam then var2.navigation.getParam("isNavigatedFromGroupOSAJoin", false) else false
		
		if fFlagAppChatShowOSAOnPageEntry then
			useEffect(function()
				-- upvalues: var2 (ref), roactNavigationModule (copy), navigateWithOsaGate (copy), var13 (ref)
				if var2.navigation and var2.navigation.addListener then
					local var15 = var2.navigation.addListener(roactNavigationModule.Events.WillFocus, function()
						-- upvalues: navigateWithOsaGate (copy), var2 (copy), var13 (copy)
						navigateWithOsaGate({
							conversationId = var2.conversationId,
							dispatch = var13,
							onAccepted = function() end,
							onDeclined = function()
								-- upvalues: var2 (copy)
								var2.navigateToChatLanding()
							end
						})
					end)
					
					return function()
						-- upvalues: var15 (ref)
						if var15 then
							var15:remove()
						end
					end
				end
			end, { var2.navigation, var2.conversationId, var13 })
		else
			useEffect(function()
				-- upvalues: var14 (ref), shouldShowOSAForConversationModule (copy), var6 (write), var2 (ref)
				if not var14 and shouldShowOSAForConversationModule(var6) then
					var2.navigateToChatLanding()
				end
			end, { var6, var2.navigateToChatLanding, var14 })
		end
	end
	if fFlagAppChatReactToFaeForOsaModule then
		useEffect(function()
			-- upvalues: var6 (write), shouldShowOSAForConversationModule (copy), shouldShowU13ChatOptInForConversationModule (copy), navigateWithOsaGate (copy), var2 (ref), var13 (ref)
			if not var6 then return end
			if shouldShowOSAForConversationModule(var6) or shouldShowU13ChatOptInForConversationModule(var6) then
				navigateWithOsaGate({
					conversationId = var2.conversationId,
					dispatch = var13,
					onAccepted = function() end,
					onDeclined = function()
						-- upvalues: var2 (copy)
						var2.navigateToChatLanding()
					end
				})
			end
		end, { var6, var2.conversationId, var13 })
	end
	useSignal(interventionTreatmentShownSignal, reactModule.useCallback(function(p2)
		-- upvalues: constants (copy), var2 (ref)
		if p2 == constants.TreatmentType.PartyChatNudgeDialog or p2 == constants.TreatmentType.PartyChatTimeoutDialog then
			var2.releaseInputBarFocus()
		end
	end, { var2.releaseInputBarFocus }))
	local var15 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = getOtherParticipantsModule(var6, var9),
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local var16 = getConversationTitleModule(var6)
	local var17 = useGetUsersModule()
	local var18 = useGetUsersTypingModule(var2.conversationId)
	local var19 = reactModule.useRef({
		itemList = {},
		previousMessagesState = {},
		previousSendingMessagesState = {},
		previousMessagesResult = {}
	})
	local var20 = if signalsMigrationConfigModule.shouldReadMessageListFromSignalsStore then useMessageItemList(var2.conversationId, var17, var9, var6) else nil
	local var21 = reactModule.useMemo(function()
		-- upvalues: signalsMigrationConfigModule (copy), var20 (write), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy), var2 (ref), var19 (ref), selectMessagesPureModule (copy), var6 (write), var17 (ref), var9 (ref)
		if signalsMigrationConfigModule.shouldReadMessageListFromSignalsStore then
			return var20
		end
		local chatConversationTTI = fFlagAppChatPerfTrackingModule and (fFlagAppChatMessageTTIMilestonesModule and appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = var2.conversationId }))
		
		if chatConversationTTI then
			local t = { conversationId = var2.conversationId }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, t)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Subphase.DataUpdate, t)
		end
		var19.current = selectMessagesPureModule({
			conversation = var6,
			conversationId = var2.conversationId,
			Users = var17,
			localUserId = var9
		}, var19.current)
		
		if chatConversationTTI then
			local t = { conversationId = var2.conversationId }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, t)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Subphase.DataUpdate, t)
		end
		return var19.current.itemList
	end, {
		var6,
		var2.conversationId,
		var17,
		var9,
		var20
	})
	local var22 = getOsaState(var6, var9, var15)
	local var23 = reactModule.useMemo(function()
		-- upvalues: var22 (ref), var21 (ref), enumMessageTypesModule (copy), enumCustomEntryTypesModule (copy)
		local t = {}
		
		if var22.shouldShowOsaCardOnInitialLoad and not var22.fetchedOldestMessage then
			return t
		end
		local cloned = table.clone(var21)
		
		if var22.shouldShowOsaCardNow then
			table.insert(cloned, {
				messageType = enumMessageTypesModule.Custom,
				customEntryType = enumCustomEntryTypesModule.OsaContextCardOneToOne,
				stable_key = enumCustomEntryTypesModule.OsaContextCardOneToOne
			})
		end
		return cloned
	end, {
		var21, var6, var22.shouldShowOsaCardOnInitialLoad,
		var22.shouldShowOsaCardInConversation, var22.shouldShowOsaCardNow,
		var22.fetchedOldestMessage
	})
	local var24 = false
	
	if fFlagAppChatConversationLoadingSkeletonModule then
		local isOsaCardReady, willShowOsaCard
		local var25 = useSelector(function(p2)
			-- upvalues: appChatNetworkingModule (copy), var2 (ref)
			return appChatNetworkingModule.rodux.GetOlderMessages.getStatus(p2, var2.conversationId)
		end)
		local _ = nil
		local _ = nil
		
		if var22.isFriendsConversation then
			isOsaCardReady = var22.isOsaCardReady
			willShowOsaCard = var22.willShowOsaCard
		elseif var22.shouldShowOsaCardOnInitialLoad then
			isOsaCardReady = var22.fetchedOldestMessage == true and var22.isOsaCardReady
			willShowOsaCard = true
		else
			isOsaCardReady = if var25 ~= roduxNetworkingModule.Enum.NetworkStatus.Done then var22.fetchedOldestMessage == true else true
			willShowOsaCard = if var25 ~= roduxNetworkingModule.Enum.NetworkStatus.NotStarted then var25 == roduxNetworkingModule.Enum.NetworkStatus.Fetching else true
		end
		local var26 = reactModule.useRef({ conversationId = nil, hasLoadedFirstPage = false })
		
		if var26.current.conversationId ~= var2.conversationId then
			var26.current = {
				hasLoadedFirstPage = false,
				conversationId = var2.conversationId
			}
		end
		var26.current.hasLoadedFirstPage = var26.current.hasLoadedFirstPage or isOsaCardReady
		var24 = var6 and (not var26.current.hasLoadedFirstPage and willShowOsaCard)
	end
	local var27 = if var18[1] and var15.data then userProfilesModule.Selectors.getCombinedNameFromId(var15.data, var18[1].id) else nil
	local var28 = if var18[2] and var15.data then userProfilesModule.Selectors.getCombinedNameFromId(var15.data, var18[2].id) else nil
	local var29 = true
	
	if #var18 == 1 and not var27 then
		var29 = false
	elseif #var18 == 2 and (not var27 or not var28) then
		var29 = false
	end
	local var30, var31
	local var32 = getFFlagEnableAppChatInExperience() and useIsInExperienceModule()
	local var33 = if fFlagAppChatSignalsReplyStoreModule then getReplyingToStoreModule(false) else nil
	local var34 = if fFlagAppChatSignalsReplyStoreModule then getConversationMessageViewModelStoreModule(false).conversationMessageStore else nil
	local var35 = nil
	local var36 = nil
	local var37 = nil
	local var38 = nil
	local var39 = nil
	
	if fFlagAppChatSignalsReplyStoreModule then
		var37 = useSignalState(var33.getMessageId)
		
		if var37 then
			var30 = var34.messages(false)[var37]
			var31 = if var30 and var30.sender_user_id then tostring(var30.sender_user_id) else nil
			var39 = var31 == var9
			var38 = if var39 or not var31 or not var15.data then nil else userProfilesModule.Selectors.getCombinedNameFromId(var15.data, var31)
		end
	else
		var35 = useReplyingToMessageModule()
		var36 = useReplyingToMessageDispatchModule()
		
		if var35 then
			var39 = var35.senderTargetId == var9
			var38 = if var39 or not var15.data then nil else userProfilesModule.Selectors.getCombinedNameFromId(var15.data, var35.senderTargetId)
		end
	end
	var30 = useLocalization({
		chatInputPlaceholder = var2.chatInputPlaceholderKey,
		replyChatInputPlaceholder = {
			var2.replyChatInputPlaceholderKey,
			DISPLAY_NAME = var38
		},
		replyToYourselfChatInputPlaceholder = var2.replyToYourselfChatInputPlaceholderKey,
		invalidMessageTypeText = var2.notImplementedMessageTypeKey,
		messageDefaultNoticeText = var2.messageDefaultNoticeKey,
		messageModeratedNoticeText = var2.messageModeratedNoticeKey,
		messageHiddenNoticeText = var2.messageHiddenNoticeKey,
		networkErrorText = var2.networkErrorTextKey,
		newText = var2.newTextKey,
		schedulePartyText = var2.schedulePartyTextKey,
		unknownUserText = var2.unknownUserTextKey,
		oneUserTyping = {
			"Feature.Chat.Message.OneUserTyping",
			DISPLAY_NAME = var27
		},
		twoUsersTyping = {
			"Feature.Chat.Message.TwoUsersTyping",
			DISPLAY_NAME_1 = var27,
			DISPLAY_NAME_2 = var28
		},
		severalUsersTyping = var2.severalUsersTyping,
		bottomModalText = var2.chatUnavailableWithUserKey,
		inputBarDisabledText = var2.inputBarDisabledKey
	})
	var31 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var40 = chatConversationTelemetryStateModule.useMergeState()
	local var41 = chatConversationTelemetryStateModule.useClearState()
	local var42 = if var6 then var6.moderationType else cryoModule.None
	local var43 = if var6 then var6.userPendingStatus else cryoModule.None
	useEffect(function()
		-- upvalues: var40 (ref), var2 (ref), var42 (ref), var43 (ref)
		var40({
			conversationId = var2.conversationId,
			moderationType = var42,
			userPendingStatus = var43
		})
	end, { var40, var2.conversationId, var42, var43 })
	local var44 = useIsUserPendingModule(var6 or {})
	local source = var6 and var6.source
	
	if fFlagAppChatEnableDoubleOptIn then
		local var45, var46 = useCallbackWithDynamicConversationIdModule(appChatNetworkingModule.rodux.GetModalSequence.API, var2.conversationId)
		useEffect(function()
			-- upvalues: var46 (ref), var44 (ref), source (ref), var13 (ref), appChatNetworkingModule (copy), var2 (ref), var32 (ref), loggerModule (copy), var45 (ref), fFlagAppChatConversationTrustedFriendUpsellBanner (copy), var1 (copy)
			if not var46 then return end
			if var44 and source == "channels" then
				var13(appChatNetworkingModule.rodux.GetPendingStateModal.API(var2.conversationId, var32)):catch(function(p2)
					-- upvalues: loggerModule (copy)
					loggerModule:warning(`GetPendingStateModal error in ChatConversationContainer {tostring(p2)}`)
				end)
			end
			if not var44 then
				local var47 = var13(var45({
					modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationTopModal,
					isInExperience = var32
				}))
				
				if fFlagAppChatConversationTrustedFriendUpsellBanner then
					var47 = var1(var47, var2.conversationId)
				end
				var47:catch(function(p2)
					-- upvalues: loggerModule (copy)
					loggerModule:warning(`GetModalSequence for ConversationTopModal error in ChatConversationContainer {tostring(p2)}`)
				end)
			end
		end, {
			var2.conversationId,
			var46,
			var32,
			var44,
			source
		})
	else
		useEffect(function()
			-- upvalues: source (ref), var44 (ref), var13 (ref), appChatNetworkingModule (copy), var2 (ref), var32 (ref)
			if source ~= "channels" then return end
			if var44 then
				var13(appChatNetworkingModule.rodux.GetPendingStateModal.API(var2.conversationId, var32)):catch(function(p2)
					warn("GetPendingStateModal error in ChatConversationContainer " .. tostring(p2))
				end)
				
				return
			end
			var13(appChatNetworkingModule.rodux.GetConversationTopModal.API(var2.conversationId, var32)):catch(function(p2)
				warn("GetConversationTopModal error in ChatConversationContainer " .. tostring(p2))
			end)
		end, { var2.conversationId, var13, source })
	end
	local var47, var48 = useCallbackWithDynamicConversationIdModule(appChatNetworkingModule.rodux.GetModalSequence.API, var2.conversationId)
	useEffect(function()
		-- upvalues: var44 (ref), var48 (ref), var13 (ref), var47 (ref), appChatNetworkingModule (copy), var32 (ref), loggerModule (copy)
		if not var44 and var48 then
			var13(var47({
				modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationOverlay,
				isInExperience = var32
			})):catch(function(p2)
				-- upvalues: loggerModule (copy)
				loggerModule:warning(`GetModalSequence error in ChatConversationContainer {tostring(p2)}`)
			end)
		end
	end, {
		var48,
		var2.conversationId,
		var44,
		var32,
		var42
	})
	
	if fFlagDebugEnableTCDoubleOptInDEV then
		useKeybindModule({
			keyCode = Enum.KeyCode.O,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function()
			-- upvalues: loggerModule (copy), var13 (ref), var2 (ref), appChatNetworkingModule (copy)
			loggerModule:debug("Ctrl + O pressed, showing new TC double opt in banner")
			var13({
				type = "DEBUG_ShowNewTopModal",
				conversationId = var2.conversationId,
				modalVariant = appChatNetworkingModule.Constants.ConversationTopModal.AddTrustedConnection
			})
		end, { var13, var2.conversationId })
		useKeybindModule({
			keyCode = Enum.KeyCode.P,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function()
			-- upvalues: loggerModule (copy), var13 (ref), var2 (ref), appChatNetworkingModule (copy)
			loggerModule:debug("Ctrl + P pressed, showing new TC double opt in request banner")
			var13({
				type = "DEBUG_ShowNewTopModal",
				conversationId = var2.conversationId,
				modalVariant = appChatNetworkingModule.Constants.ConversationTopModal.TrustedConnectionRequest
			})
		end, { var13, var2.conversationId })
	end
	if fFlagTCUpsellModalEnabledDEV then
		useKeybindModule({
			keyCode = Enum.KeyCode.L,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function()
			-- upvalues: loggerModule (copy), var13 (ref), var2 (ref), appChatNetworkingModule (copy)
			loggerModule:debug("Ctrl + L pressed, showing new TC created overlay")
			var13({
				type = "DEBUG_ShowNewTCOverlay",
				conversationId = var2.conversationId,
				modalVariant = appChatNetworkingModule.Constants.ConversationOverlay.TrustedConnectionCreated
			})
		end, { var13, var2.conversationId })
	end
	local var49, var50 = useCallbackWithDynamicConversationIdModule(appChatNetworkingModule.rodux.GetModalSequence.API, var2.conversationId)
	useEffect(function()
		-- upvalues: var50 (ref), var13 (ref), var49 (ref), appChatNetworkingModule (copy), var32 (ref), loggerModule (copy)
		if var50 then
			var13(var49({
				modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationBottomModal,
				isInExperience = var32
			})):catch(function(p2)
				-- upvalues: loggerModule (copy)
				loggerModule:warning(`GetModalSequence for ConversationBottomModal error in ChatConversationContainer {tostring(p2)}`)
			end)
			
			return
		end
	end, {
		var2.conversationId,
		var50,
		var32,
		var13,
		var49
	})
	local var51 = useShouldShowConversationOverlayModule(var2.conversationId)
	useEffect(function()
		-- upvalues: var51 (ref), var2 (ref)
		if var51 then
			var2.navigateToConversationOverlay()
		end
	end, { var51, var2.conversationId })
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local isNotChannels = source ~= "channels"
	local var52 = useSelector(function(p2)
		-- upvalues: isNotChannels (ref), appChatNetworkingModule (copy), var2 (ref), roduxNetworkingModule (copy)
		return (if isNotChannels then appChatNetworkingModule.rodux.GetChatModerationStatuses.getStatus(p2) else appChatNetworkingModule.rodux.GetChatModerationStatuses.getStatus(p2, var2.conversationId)) == roduxNetworkingModule.Enum.NetworkStatus.NotStarted
	end)
	useEffect(function()
		-- upvalues: var52 (ref), var13 (ref), appChatNetworkingModule (copy), isNotChannels (ref), var2 (ref)
		if var52 then
			var13(appChatNetworkingModule.rodux.GetChatModerationStatuses.API(if isNotChannels then nil else { var2.conversationId })):catch(function(p2)
				warn("GetChatModerationStatuses error in ChatConversationContainer " .. tostring(p2))
			end)
		end
	end, { var2.conversationId, isNotChannels, var13, var52 })
	local var53 = useChatTimeoutDetailsModule({
		conversationId = var2.conversationId,
		conversationModerationType = var42
	})
	local isTimedOut = var53.isTimedOut
	local timeoutEndTimestamp = var53.timeoutEndTimestamp
	local decisionEventId = var53.decisionEventId
	local duration = var53.duration
	local _ = nil
	useEffect(function()
		-- upvalues: var31 (ref), chatConversationTelemetryEventsModule (copy), var21 (ref)
		var31.emit(chatConversationTelemetryEventsModule.ScreenRendered, { loadedMessageCount = #var21 })
	end, { var2.conversationId })
	
	if appChatConversationPageSyntheticSystemMessageIxpEnabled then
		local var54 = var21[1]
		local var55 = if var54 then var54.id else nil
		useEffect(function()
			-- upvalues: isSyntheticSystemMessageIdModule (copy), var55 (ref), IXPService (copy), appChatConversationPageSyntheticSystemMessageIxpLayer (copy)
			if isSyntheticSystemMessageIdModule(var55) then
				IXPService:LogFlagLinkedUserLayerExposure(appChatConversationPageSyntheticSystemMessageIxpLayer)
			end
		end, { var2.conversationId, var55 })
	end
	local var56 = reactModule.useCallback(function(p2)
		-- upvalues: var31 (ref), chatConversationTelemetryEventsModule (copy), var41 (ref)
		var31.emit(chatConversationTelemetryEventsModule.ScreenExit, { conversationExitType = p2 })
		var41()
	end, { var31, var41 })
	var6 = var6 or {}
	local var57 = var6.participantPendingStatus ~= conversationChannelsModule.UserPendingStatus.Pending and var11
	local var58 = not var57 and var11
	local var59 = useIsExternalNavigationAvailableModule({ enumScreensModule.ViewUserProfile })
	local var60 = var6.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
	local var61 = useSelector(function(p2)
		-- upvalues: var60 (ref), var6 (write)
		return var60 and var6.initiator == p2.LocalUserId
	end)
	
	local var62 = function(p2)
		-- upvalues: var59 (ref), enumScreensModule (copy), var4 (ref), var2 (ref), genericDialogTypeModule (copy), var44 (ref), var60 (ref), var61 (ref)
		if var59[enumScreensModule.ViewUserProfile] then
			var4(p2)
			
			return
		end
		var2.navigateToScreen(genericDialogTypeModule.ParticipantDialog, {
			conversationId = var2.conversationId,
			participantId = p2,
			showRemoveUserButton = not var44 and (var60 and var61)
		}, true)
	end
	
	local var63 = if if fFlagAppChatSignalsReplyStoreModule then var37 else var35 then if var39 then var30.replyToYourselfChatInputPlaceholder else var30.replyChatInputPlaceholder else var30.chatInputPlaceholder
	useEffect(function()
		-- upvalues: var2 (ref), var16 (write)
		var2.updateConversationTitle(var16)
	end, { var16, var2.updateConversationTitle })
	local var64 = reactModule.useCallback(function()
		-- upvalues: fFlagAppChatUniversalFeatureRestriction (copy), parent (copy), var2 (ref), fFlagAppChatReactiveFeatureRestrictions (copy), chatInputBoxDisabledPressedSignal (copy), timeoutEndTimestamp (write), decisionEventId (write), duration (write)
		if not fFlagAppChatUniversalFeatureRestriction then
			chatInputBoxDisabledPressedSignal:fire({
				endTimestamp = timeoutEndTimestamp,
				decisionEventId = decisionEventId,
				duration = duration
			})
			
			return
		end
		local abuseVectorModule = require(parent.UniversalFeatureRestrictions.AbuseVector)
		local showFeatureRestrictionModule = require(parent.UniversalFeatureRestrictions.showFeatureRestriction)
		local t = {
			onShown = var2.releaseInputBarFocus,
			onAppeal = function() end
		}
		
		if fFlagAppChatReactiveFeatureRestrictions then
			local partyChatTimeoutReceivedSignal = require(parent.InterventionShared).Signals.partyChatTimeoutReceivedSignal
			
			function t.onAcknowledgementSuccess()
				-- upvalues: partyChatTimeoutReceivedSignal (ref)
				partyChatTimeoutReceivedSignal:fire(nil)
			end
		end
		showFeatureRestrictionModule(abuseVectorModule.PartyChat, t)
	end, {
		var2.releaseInputBarFocus,
		timeoutEndTimestamp,
		decisionEventId,
		duration
	})
	local var65, var66 = reactModule.useState(var2.navigation and (var2.navigation.isFocused and var2.navigation.isFocused()))
	local var67 = nil
	local var68 = nil
	
	if fFlagAppChatPerfTrackingModule then
		var67 = if fFlagRenderChatConversationOnlyWhenVisibleModule and var2.isFocused and not var2.isFocused() then false else var65
		var68 = var67 and not var44
	end
	local var69 = nil
	
	if fFlagAppChatPerfTrackingModule then
		local var70 = reactModule.useRef(false)
		reactModule.useEffect(function()
			-- upvalues: var70 (ref), var57 (ref)
			var70.current = not var57
		end, { var2.conversationId, var57 })
		local var71 = reactModule.useCallback(function(p2)
			-- upvalues: appChatPerfTrackerModule (copy), var2 (ref), var68 (write), var70 (ref), loggerModule (copy), var21 (ref)
			if not appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = var2.conversationId }) or not var68 then return end
			if var70.current then
				appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.ChatConversationTTI, {
					conversationId = var2.conversationId,
					numElementsRendered = #var21
				})
				
				return
			end
			loggerModule:debug("TTI: Messages ready but waiting for input bar (chatInputBarReady={}, reason={})", var70.current, p2)
		end, { var2.conversationId, var65, var44, #var21 })
		reactModule.useEffect(function()
			-- upvalues: var71 (ref)
			var71("messages_ready")
		end, { var71, #var21, var2.conversationId })
		var69 = reactModule.useCallback(function()
			-- upvalues: var70 (ref), var71 (ref)
			var70.current = true
			var71("input_bar_ready")
		end, { var71 })
	end
	if fFlagAppChatPerfTrackingModule then
		local var72 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: loggerModule (copy), var2 (ref), var72 (ref), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy)
			loggerModule:debug("Perf: Resetting message perf tracking for conversation {}", var2.conversationId)
			var72.current = nil
			local t = { conversationId = var2.conversationId }
			
			if fFlagAppChatMessageTTIMilestonesModule then
				appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageSendTTI, t)
				appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageReceiveTTI, t)
				
				return
			end
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageSendToPendingRender, t)
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageSendResponseToFinalRender, t)
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageSendToFinalRender, t)
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageReceiveToRender, t)
		end, { var2.conversationId })
		reactModule.useEffect(function()
			-- upvalues: var21 (ref), var2 (ref), var9 (ref), var72 (ref), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy)
			local var73 = var21[1]
			
			if not var73 or not var73.id then return end
			local t = { conversationId = var2.conversationId }
			local var74 = var73.senderTargetId == var9
			
			if not var73.isSending and (if var73.senderType ~= "system" then not var74 else true) then
				if var73.id ~= var72.current then
					var72.current = var73.id
					
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
			if not var74 then return end
			if fFlagAppChatMessageTTIMilestonesModule then
				if var73.isSending then
					appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.FunctionallyReady, t)
					
					return
				end
				appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageSendTTI, t)
				
				return
			elseif var73.isSending then
				appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageSendToPendingRender, t)
				
				return
			end
			appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageSendResponseToFinalRender, t)
			appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageSendToFinalRender, t)
		end, { var21, var9, var2.conversationId })
	end
	useEffect(function()
		-- upvalues: var2 (ref), roactNavigationModule (copy), fFlagAppChatPerfTrackingModule (copy), var66 (ref), appChatPerfTrackerModule (copy)
		local willBlur = var2.navigation and (var2.navigation.addListener and var2.navigation.addListener(roactNavigationModule.Events.WillBlur, function(p2)
			-- upvalues: fFlagAppChatPerfTrackingModule (copy), var66 (copy), appChatPerfTrackerModule (copy), var2 (copy)
			if fFlagAppChatPerfTrackingModule then
				local isOverlay = p2 and (p2.action and (p2.action.params and (p2.action.params.isOverlay or false)))
				var66(isOverlay)
				
				if isOverlay then return end
				if appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = var2.conversationId }) then
					appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = var2.conversationId })
					
					return
				end
			elseif p2 and p2.action and (p2.action.params and p2.action.params.isOverlay) then
				var66(true)
				
				return
			end
			var66(false)
		end))
		local willFocus = var2.navigation and (var2.navigation.addListener and var2.navigation.addListener(roactNavigationModule.Events.WillFocus, function(_)
			-- upvalues: var66 (copy)
			var66(true)
		end))
		
		return function()
			-- upvalues: willBlur (ref), willFocus (ref)
			if willBlur then
				willBlur.remove()
			end
			if willFocus then
				willFocus.remove()
			end
		end
	end, { var2.navigation, var2.conversationId })
	useEffect(function()
		-- upvalues: var22 (ref), var13 (ref), getAllRemainingOlderMessagesModule (copy), getOlderMessagesModule (copy), var2 (ref), appChatGetAllMessagesDepth (copy), var30 (ref)
		if var22.shouldShowOsaCardOnInitialLoad then
			var13(getAllRemainingOlderMessagesModule(getOlderMessagesModule, var2.conversationId, appChatGetAllMessagesDepth)):catch(function()
				-- upvalues: var2 (copy), var30 (copy)
				var2.navigateToToast({
					toastProps = { toastContent = { toastTitle = var30.networkErrorText } }
				})
			end)
		end
	end, { var22.shouldShowOsaCardOnInitialLoad })
	local getCanAccessParty = var2.getCanAccessParty
	
	return if fFlagAppChatPerfTrackingModule then if var67 then if var44 then reactModule.createElement(pendingStateConversationPageModule, {
		conversationId = var2.conversationId,
		topBarHeight = var2.topBarHeight,
		networkErrorText = var30.networkErrorText,
		navigateToToast = var2.navigateToToast,
		wideMode = var2.wideMode,
		onConversationUnmount = var56,
		navigateBack = var2.navigateBack
	}) else reactModule.createElement(chatConversationModule, cryoModule.Dictionary.join(var2, var5, var30, {
		moreMenuEnabled = getCanAccessParty,
		conversation = var6,
		conversationTitle = var16,
		itemList = var23,
		localUserId = var9,
		openGameDetailsPage = var2.openGameDetailsPage,
		openViewProfile = var62,
		readingMessagesIsEnabled = var2.getReadingMessagesIsEnabled(),
		Users = var17,
		usersTyping = var18,
		displayNamesAvailable = var29,
		onConversationUnmount = var56,
		recipientIdsSerialized = var8,
		chatIsVisible = var10,
		chatInputPlaceholder = var63,
		replyingToMessageId = if fFlagAppChatSignalsReplyStoreModule then var37 else nil,
		replyingToMessage = if not fFlagAppChatSignalsReplyStoreModule then var35 else nil,
		replyingToMessageDispatch = if not fFlagAppChatSignalsReplyStoreModule then var36 else nil,
		shouldShowChatInputBar = var57,
		shouldShowLegacyBottomModal = var58,
		shouldDisableChatInputBar = isTimedOut,
		onChatInputBarReady = if fFlagAppChatPerfTrackingModule then var69 else nil,
		inputBarDisabledEndTimestampDisplay = timeoutEndTimestamp,
		onDisabledInputBarActivated = var64,
		scrollToTopOnInitialOsaLoad = var22.shouldShowOsaCardOnInitialLoad and var22.fetchedOldestMessage,
		navigateToSquadLobby = if getCanAccessParty then var2.navigateToSquadLobby else nil,
		shouldHideMoreMenuButton = if getCanAccessParty then not var57 else nil,
		isInitialMessageLoading = if fFlagAppChatConversationLoadingSkeletonModule then var24 else nil
	})) else nil elseif var65 then if fFlagRenderChatConversationOnlyWhenVisibleModule and var2.isFocused and not var2.isFocused() then nil elseif var44 then reactModule.createElement(pendingStateConversationPageModule, {
		conversationId = var2.conversationId,
		topBarHeight = var2.topBarHeight,
		networkErrorText = var30.networkErrorText,
		navigateToToast = var2.navigateToToast,
		wideMode = var2.wideMode,
		onConversationUnmount = var56,
		navigateBack = var2.navigateBack,
		style = var2.style
	}) else reactModule.createElement(chatConversationModule, cryoModule.Dictionary.join(var2, var5, var30, {
		moreMenuEnabled = getCanAccessParty,
		conversation = var6,
		conversationTitle = var16,
		itemList = var23,
		localUserId = var9,
		openGameDetailsPage = var2.openGameDetailsPage,
		openViewProfile = var62,
		readingMessagesIsEnabled = var2.getReadingMessagesIsEnabled(),
		Users = var17,
		usersTyping = var18,
		displayNamesAvailable = var29,
		onConversationUnmount = var56,
		recipientIdsSerialized = var8,
		chatIsVisible = var10,
		chatInputPlaceholder = var63,
		replyingToMessageId = if fFlagAppChatSignalsReplyStoreModule then var37 else nil,
		replyingToMessage = if not fFlagAppChatSignalsReplyStoreModule then var35 else nil,
		replyingToMessageDispatch = if not fFlagAppChatSignalsReplyStoreModule then var36 else nil,
		shouldShowChatInputBar = var57,
		shouldShowLegacyBottomModal = var58,
		shouldDisableChatInputBar = isTimedOut,
		onChatInputBarReady = if fFlagAppChatPerfTrackingModule then var69 else nil,
		inputBarDisabledEndTimestampDisplay = timeoutEndTimestamp,
		onDisabledInputBarActivated = var64,
		scrollToTopOnInitialOsaLoad = var22.shouldShowOsaCardOnInitialLoad and var22.fetchedOldestMessage,
		navigateToSquadLobby = if getCanAccessParty then var2.navigateToSquadLobby else nil,
		shouldHideMoreMenuButton = if getCanAccessParty then not var57 else nil,
		isInitialMessageLoading = if fFlagAppChatConversationLoadingSkeletonModule then var24 else nil
	})) else nil
end

return universalAppPolicy.connect(function(p2)
	return {
		viewProfileOnAvatarPressed = p2.getChatTapConversationThumbnail(),
		getCanAccessParty = p2.getCanAccessParty()
	}
end)(ChatConversationContainer)