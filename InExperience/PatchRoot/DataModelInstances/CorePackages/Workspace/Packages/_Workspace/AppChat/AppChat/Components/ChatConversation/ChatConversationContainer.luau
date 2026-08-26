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
local fFlagAppChatUniversalFeatureRestriction = require(parent.SharedFlags).FFlagAppChatUniversalFeatureRestriction
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
	local var1 = not p1 or p1.conversationType ~= conversationModule.Type.MULTI_USER_CONVERSATION
	local var2 = p1 and (var1 and (if p1.source ~= "friends" then if p1.osaAcknowledgementStatus ~= conversationModule.OsaAcknowledgementStatus.Unacknowledged then p1.osaAcknowledgementStatus == conversationModule.OsaAcknowledgementStatus.Acknowledged else true else true))
	local var3 = p1 and p1.source == "friends"
	local var4 = var2 and (p1 and p1.osaAcknowledgementStatus == conversationModule.OsaAcknowledgementStatus.Unacknowledged and not var3)
	local var5 = var2 and (fetchedOldestMessage or var3)
	local var6 = nil
	local var7 = nil
	local _ = nil
	
	if fFlagAppChatConversationLoadingSkeletonModule then
		var6 = var4 or var5
		local var8 = if var6 then getOtherParticipantsModule(p1, p2)[1] else nil
		local var9 = true
		
		if var8 ~= nil then
			if p3 ~= nil then
				var9 = true
				
				if p3.error == nil then
					var9 = p3 ~= nil and (p3.data ~= nil and userProfilesModule.Selectors.getCombinedNameFromId(p3.data, var8) ~= nil)
				end
			end
		end
		var7 = var9
	end
	return {
		shouldShowOsaCardInConversation = var2,
		fetchedOldestMessage = fetchedOldestMessage,
		shouldShowOsaCardOnInitialLoad = var4,
		shouldShowOsaCardNow = var5,
		isFriendsConversation = var3,
		willShowOsaCard = var6,
		isOsaCardReady = var7
	}
end

function ChatConversationContainer(p1)
	-- upvalues: cryoModule (ref), t (ref), useAnalyticsModule (ref), reactModule (ref), roactChatAnalyticsModule (ref), useMapDispatchModule (ref), mapDispatchToPropsModule (ref), useGetConversationFromIdModule (ref), useRecipientIdsModule (ref), httpService (ref), useLocalUserId (ref), useChatIsVisibleModule (ref), useIsChatUserMessagesEnabledModule (ref), useIsChatEnabledModule (ref), useDispatch (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), useEffect (ref), fFlagAppChatNavigateBackIfOSAUnacknowledged (ref), fFlagAppChatShowOSAOnPageEntry (ref), roactNavigationModule (ref), navigateWithOsaGate (ref), shouldShowOSAForConversationModule (ref), fFlagAppChatReactToFaeForOsaModule (ref), shouldShowU13ChatOptInForConversationModule (ref), useSignal (ref), interventionTreatmentShownSignal (ref), constants (ref), userProfilesModule (ref), getOtherParticipantsModule (ref), getConversationTitleModule (ref), useGetUsersModule (ref), useGetUsersTypingModule (ref), fFlagAppChatSignalsMessageStoreModule (ref), useMessageItemList (ref), selectMessagesPureModule (ref), getOsaState (ref), enumMessageTypesModule (ref), enumCustomEntryTypesModule (ref), fFlagAppChatConversationLoadingSkeletonModule (ref), useSelector (ref), appChatNetworkingModule (ref), roduxNetworkingModule (ref), getFFlagEnableAppChatInExperience (ref), useIsInExperienceModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), getReplyingToStoreModule (ref), getConversationMessageViewModelStoreModule (ref), useSignalState (ref), useReplyingToMessageModule (ref), useReplyingToMessageDispatchModule (ref), useLocalization (ref), useTelemetryModule (ref), chatConversationTelemetryLayerModule (ref), chatConversationTelemetryStateModule (ref), useIsUserPendingModule (ref), fFlagAppChatEnableDoubleOptIn (ref), useCallbackWithDynamicConversationIdModule (ref), loggerModule (ref), fFlagDebugEnableTCDoubleOptInDEV (ref), useKeybindModule (ref), fFlagTCUpsellModalEnabledDEV (ref), useShouldShowConversationOverlayModule (ref), useChatTimeoutDetailsModule (ref), chatConversationTelemetryEventsModule (ref), appChatConversationPageSyntheticSystemMessageIxpEnabled (ref), isSyntheticSystemMessageIdModule (ref), IXPService (ref), appChatConversationPageSyntheticSystemMessageIxpLayer (ref), conversationChannelsModule (ref), useIsExternalNavigationAvailableModule (ref), enumScreensModule (ref), conversationModule (ref), genericDialogTypeModule (ref), fFlagAppChatUniversalFeatureRestriction (ref), parent (ref), chatInputBoxDisabledPressedSignal (ref), fFlagRenderChatConversationOnlyWhenVisibleModule (ref), getAllRemainingOlderMessagesModule (ref), getOlderMessagesModule (ref), appChatGetAllMessagesDepth (ref), pendingStateConversationPageModule (ref), chatConversationModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useAnalyticsModule()
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), roactChatAnalyticsModule (copy), var1 (ref)
		var2:navigate(roactChatAnalyticsModule.NavigationEvents.ChatConversationProfile)
		var1.openViewProfile(p2)
	end, { var1.openViewProfile, var2 })
	local var4 = useMapDispatchModule(mapDispatchToPropsModule)
	local var5 = useGetConversationFromIdModule(var1.conversationId)
	local _ = nil
	local var6 = useRecipientIdsModule(var5)
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), var6 (ref)
		return httpService:JSONEncode(var6)
	end)
	local var7 = if ok then status else "[]"
	local _ = nil
	local _ = nil
	local var8 = useLocalUserId()
	local var9 = useChatIsVisibleModule()
	local var10 = useIsChatUserMessagesEnabledModule()
	local var11 = useIsChatEnabledModule()
	local var12 = useDispatch()
	
	if fFlagAppChatPerfTrackingModule and fFlagAppChatMessageTTIMilestonesModule and appChatPerfTrackerModule.Hooks then
		appChatPerfTrackerModule.Hooks.useTTIRenderAndMountedTracking(appChatPerfTrackerModule.getEventName(appChatPerfTrackerModule.Events.ChatConversationTTI) or "")
	end
	useEffect(function()
		-- upvalues: var11 (ref), var1 (ref)
		if not var11 then
			var1.navigateToChatLanding()
		end
	end, { var11, var1.navigateToChatLanding })
	
	if fFlagAppChatNavigateBackIfOSAUnacknowledged then
		local var13 = if var1.navigation and var1.navigation.getParam then var1.navigation.getParam("isNavigatedFromGroupOSAJoin", false) else false
		
		if fFlagAppChatShowOSAOnPageEntry then
			useEffect(function()
				-- upvalues: var1 (ref), roactNavigationModule (copy), navigateWithOsaGate (copy), var12 (ref)
				if var1.navigation and var1.navigation.addListener then
					local var14 = var1.navigation.addListener(roactNavigationModule.Events.WillFocus, function()
						-- upvalues: navigateWithOsaGate (copy), var1 (copy), var12 (copy)
						navigateWithOsaGate({
							conversationId = var1.conversationId,
							dispatch = var12,
							onAccepted = function() end,
							onDeclined = function()
								-- upvalues: var1 (copy)
								var1.navigateToChatLanding()
							end
						})
					end)
					
					return function()
						-- upvalues: var14 (ref)
						if var14 then
							var14:remove()
						end
					end
				end
			end, { var1.navigation, var1.conversationId, var12 })
		else
			useEffect(function()
				-- upvalues: var13 (ref), shouldShowOSAForConversationModule (copy), var5 (write), var1 (ref)
				if not var13 and shouldShowOSAForConversationModule(var5) then
					var1.navigateToChatLanding()
				end
			end, { var5, var1.navigateToChatLanding, var13 })
		end
	end
	if fFlagAppChatReactToFaeForOsaModule then
		useEffect(function()
			-- upvalues: var5 (write), shouldShowOSAForConversationModule (copy), shouldShowU13ChatOptInForConversationModule (copy), navigateWithOsaGate (copy), var1 (ref), var12 (ref)
			if not var5 then return end
			if shouldShowOSAForConversationModule(var5) or shouldShowU13ChatOptInForConversationModule(var5) then
				navigateWithOsaGate({
					conversationId = var1.conversationId,
					dispatch = var12,
					onAccepted = function() end,
					onDeclined = function()
						-- upvalues: var1 (copy)
						var1.navigateToChatLanding()
					end
				})
			end
		end, { var5, var1.conversationId, var12 })
	end
	useSignal(interventionTreatmentShownSignal, reactModule.useCallback(function(p2)
		-- upvalues: constants (copy), var1 (ref)
		if p2 == constants.TreatmentType.PartyChatNudgeDialog or p2 == constants.TreatmentType.PartyChatTimeoutDialog then
			var1.releaseInputBarFocus()
		end
	end, { var1.releaseInputBarFocus }))
	local var14 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = getOtherParticipantsModule(var5, var8),
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local var15 = getConversationTitleModule(var5)
	local var16 = useGetUsersModule()
	local var17 = useGetUsersTypingModule(var1.conversationId)
	local var18 = reactModule.useRef({
		itemList = {},
		previousMessagesState = {},
		previousSendingMessagesState = {},
		previousMessagesResult = {}
	})
	local var19 = if fFlagAppChatSignalsMessageStoreModule then useMessageItemList(var1.conversationId, var16, var8, var5) else nil
	local var20 = reactModule.useMemo(function()
		-- upvalues: fFlagAppChatSignalsMessageStoreModule (copy), var19 (write), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy), var1 (ref), var18 (ref), selectMessagesPureModule (copy), var5 (write), var16 (ref), var8 (ref)
		if fFlagAppChatSignalsMessageStoreModule then
			return var19
		end
		local chatConversationTTI = fFlagAppChatPerfTrackingModule and (fFlagAppChatMessageTTIMilestonesModule and appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = var1.conversationId }))
		
		if chatConversationTTI then
			local t = { conversationId = var1.conversationId }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, t)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Subphase.DataUpdate, t)
		end
		var18.current = selectMessagesPureModule({
			conversation = var5,
			conversationId = var1.conversationId,
			Users = var16,
			localUserId = var8
		}, var18.current)
		
		if chatConversationTTI then
			local t = { conversationId = var1.conversationId }
			appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, t)
			appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Subphase.DataUpdate, t)
		end
		return var18.current.itemList
	end, {
		var5,
		var1.conversationId,
		var16,
		var8,
		var19
	})
	local var21 = getOsaState(var5, var8, var14)
	local var22 = reactModule.useMemo(function()
		-- upvalues: var21 (ref), var20 (ref), enumMessageTypesModule (copy), enumCustomEntryTypesModule (copy)
		local t = {}
		
		if var21.shouldShowOsaCardOnInitialLoad and not var21.fetchedOldestMessage then
			return t
		end
		local cloned = table.clone(var20)
		
		if var21.shouldShowOsaCardNow then
			table.insert(cloned, {
				messageType = enumMessageTypesModule.Custom,
				customEntryType = enumCustomEntryTypesModule.OsaContextCardOneToOne,
				stable_key = enumCustomEntryTypesModule.OsaContextCardOneToOne
			})
		end
		return cloned
	end, {
		var20, var5, var21.shouldShowOsaCardOnInitialLoad,
		var21.shouldShowOsaCardInConversation, var21.shouldShowOsaCardNow,
		var21.fetchedOldestMessage
	})
	local var23 = false
	
	if fFlagAppChatConversationLoadingSkeletonModule then
		local isOsaCardReady, willShowOsaCard
		local var24 = useSelector(function(p2)
			-- upvalues: appChatNetworkingModule (copy), var1 (ref)
			return appChatNetworkingModule.rodux.GetOlderMessages.getStatus(p2, var1.conversationId)
		end)
		local _ = nil
		local _ = nil
		
		if var21.isFriendsConversation then
			isOsaCardReady = var21.isOsaCardReady
			willShowOsaCard = var21.willShowOsaCard
		elseif var21.shouldShowOsaCardOnInitialLoad then
			isOsaCardReady = var21.fetchedOldestMessage == true and var21.isOsaCardReady
			willShowOsaCard = true
		else
			isOsaCardReady = if var24 ~= roduxNetworkingModule.Enum.NetworkStatus.Done then var21.fetchedOldestMessage == true else true
			willShowOsaCard = if var24 ~= roduxNetworkingModule.Enum.NetworkStatus.NotStarted then var24 == roduxNetworkingModule.Enum.NetworkStatus.Fetching else true
		end
		local var25 = reactModule.useRef({ conversationId = nil, hasLoadedFirstPage = false })
		
		if var25.current.conversationId ~= var1.conversationId then
			var25.current = {
				hasLoadedFirstPage = false,
				conversationId = var1.conversationId
			}
		end
		var25.current.hasLoadedFirstPage = var25.current.hasLoadedFirstPage or isOsaCardReady
		var23 = var5 and (not var25.current.hasLoadedFirstPage and willShowOsaCard)
	end
	local var26 = if var17[1] and var14.data then userProfilesModule.Selectors.getCombinedNameFromId(var14.data, var17[1].id) else nil
	local var27 = if var17[2] and var14.data then userProfilesModule.Selectors.getCombinedNameFromId(var14.data, var17[2].id) else nil
	local var28 = true
	
	if #var17 == 1 and not var26 then
		var28 = false
	elseif #var17 == 2 and (not var26 or not var27) then
		var28 = false
	end
	local var29, var30
	local var31 = getFFlagEnableAppChatInExperience() and useIsInExperienceModule()
	local var32 = if fFlagAppChatSignalsReplyStoreModule then getReplyingToStoreModule(false) else nil
	local var33 = if fFlagAppChatSignalsReplyStoreModule then getConversationMessageViewModelStoreModule(false).conversationMessageStore else nil
	local var34 = nil
	local var35 = nil
	local var36 = nil
	local var37 = nil
	local var38 = nil
	
	if fFlagAppChatSignalsReplyStoreModule then
		var36 = useSignalState(var32.getMessageId)
		
		if var36 then
			var29 = var33.messages(false)[var36]
			var30 = if var29 and var29.sender_user_id then tostring(var29.sender_user_id) else nil
			var38 = var30 == var8
			var37 = if var38 or not var30 or not var14.data then nil else userProfilesModule.Selectors.getCombinedNameFromId(var14.data, var30)
		end
	else
		var34 = useReplyingToMessageModule()
		var35 = useReplyingToMessageDispatchModule()
		
		if var34 then
			var38 = var34.senderTargetId == var8
			var37 = if var38 or not var14.data then nil else userProfilesModule.Selectors.getCombinedNameFromId(var14.data, var34.senderTargetId)
		end
	end
	var29 = useLocalization({
		chatInputPlaceholder = var1.chatInputPlaceholderKey,
		replyChatInputPlaceholder = {
			var1.replyChatInputPlaceholderKey,
			DISPLAY_NAME = var37
		},
		replyToYourselfChatInputPlaceholder = var1.replyToYourselfChatInputPlaceholderKey,
		invalidMessageTypeText = var1.notImplementedMessageTypeKey,
		messageDefaultNoticeText = var1.messageDefaultNoticeKey,
		messageModeratedNoticeText = var1.messageModeratedNoticeKey,
		messageHiddenNoticeText = var1.messageHiddenNoticeKey,
		networkErrorText = var1.networkErrorTextKey,
		newText = var1.newTextKey,
		schedulePartyText = var1.schedulePartyTextKey,
		unknownUserText = var1.unknownUserTextKey,
		oneUserTyping = {
			"Feature.Chat.Message.OneUserTyping",
			DISPLAY_NAME = var26
		},
		twoUsersTyping = {
			"Feature.Chat.Message.TwoUsersTyping",
			DISPLAY_NAME_1 = var26,
			DISPLAY_NAME_2 = var27
		},
		severalUsersTyping = var1.severalUsersTyping,
		bottomModalText = var1.chatUnavailableWithUserKey,
		inputBarDisabledText = var1.inputBarDisabledKey
	})
	var30 = useTelemetryModule(chatConversationTelemetryLayerModule.Context)
	local var39 = chatConversationTelemetryStateModule.useMergeState()
	local var40 = chatConversationTelemetryStateModule.useClearState()
	local var41 = if var5 then var5.moderationType else cryoModule.None
	local var42 = if var5 then var5.userPendingStatus else cryoModule.None
	useEffect(function()
		-- upvalues: var39 (ref), var1 (ref), var41 (ref), var42 (ref)
		var39({
			conversationId = var1.conversationId,
			moderationType = var41,
			userPendingStatus = var42
		})
	end, { var39, var1.conversationId, var41, var42 })
	local var43 = useIsUserPendingModule(var5 or {})
	local source = var5 and var5.source
	
	if fFlagAppChatEnableDoubleOptIn then
		local var44, var45 = useCallbackWithDynamicConversationIdModule(appChatNetworkingModule.rodux.GetModalSequence.API, var1.conversationId)
		useEffect(function()
			-- upvalues: var45 (ref), var43 (ref), source (ref), var12 (ref), appChatNetworkingModule (copy), var1 (ref), var31 (ref), loggerModule (copy), var44 (ref)
			if not var45 then return end
			if var43 and source == "channels" then
				var12(appChatNetworkingModule.rodux.GetPendingStateModal.API(var1.conversationId, var31)):catch(function(p2)
					-- upvalues: loggerModule (copy)
					loggerModule:warning(`GetPendingStateModal error in ChatConversationContainer {tostring(p2)}`)
				end)
			end
			if not var43 then
				var12(var44({
					modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationTopModal,
					isInExperience = var31
				})):catch(function(p2)
					-- upvalues: loggerModule (copy)
					loggerModule:warning(`GetModalSequence for ConversationTopModal error in ChatConversationContainer {tostring(p2)}`)
				end)
			end
		end, {
			var1.conversationId,
			var45,
			var31,
			var43,
			source
		})
	else
		useEffect(function()
			-- upvalues: source (ref), var43 (ref), var12 (ref), appChatNetworkingModule (copy), var1 (ref), var31 (ref)
			if source ~= "channels" then return end
			if var43 then
				var12(appChatNetworkingModule.rodux.GetPendingStateModal.API(var1.conversationId, var31)):catch(function(p2)
					warn("GetPendingStateModal error in ChatConversationContainer " .. tostring(p2))
				end)
				
				return
			end
			var12(appChatNetworkingModule.rodux.GetConversationTopModal.API(var1.conversationId, var31)):catch(function(p2)
				warn("GetConversationTopModal error in ChatConversationContainer " .. tostring(p2))
			end)
		end, { var1.conversationId, var12, source })
	end
	local var46, var47 = useCallbackWithDynamicConversationIdModule(appChatNetworkingModule.rodux.GetModalSequence.API, var1.conversationId)
	useEffect(function()
		-- upvalues: var43 (ref), var47 (ref), var12 (ref), var46 (ref), appChatNetworkingModule (copy), var31 (ref), loggerModule (copy)
		if not var43 and var47 then
			var12(var46({
				modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationOverlay,
				isInExperience = var31
			})):catch(function(p2)
				-- upvalues: loggerModule (copy)
				loggerModule:warning(`GetModalSequence error in ChatConversationContainer {tostring(p2)}`)
			end)
		end
	end, {
		var47,
		var1.conversationId,
		var43,
		var31,
		var41
	})
	
	if fFlagDebugEnableTCDoubleOptInDEV then
		useKeybindModule({
			keyCode = Enum.KeyCode.O,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function()
			-- upvalues: loggerModule (copy), var12 (ref), var1 (ref), appChatNetworkingModule (copy)
			loggerModule:debug("Ctrl + O pressed, showing new TC double opt in banner")
			var12({
				type = "DEBUG_ShowNewTopModal",
				conversationId = var1.conversationId,
				modalVariant = appChatNetworkingModule.Constants.ConversationTopModal.AddTrustedConnection
			})
		end, { var12, var1.conversationId })
		useKeybindModule({
			keyCode = Enum.KeyCode.P,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function()
			-- upvalues: loggerModule (copy), var12 (ref), var1 (ref), appChatNetworkingModule (copy)
			loggerModule:debug("Ctrl + P pressed, showing new TC double opt in request banner")
			var12({
				type = "DEBUG_ShowNewTopModal",
				conversationId = var1.conversationId,
				modalVariant = appChatNetworkingModule.Constants.ConversationTopModal.TrustedConnectionRequest
			})
		end, { var12, var1.conversationId })
	end
	if fFlagTCUpsellModalEnabledDEV then
		useKeybindModule({
			keyCode = Enum.KeyCode.L,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function()
			-- upvalues: loggerModule (copy), var12 (ref), var1 (ref), appChatNetworkingModule (copy)
			loggerModule:debug("Ctrl + L pressed, showing new TC created overlay")
			var12({
				type = "DEBUG_ShowNewTCOverlay",
				conversationId = var1.conversationId,
				modalVariant = appChatNetworkingModule.Constants.ConversationOverlay.TrustedConnectionCreated
			})
		end, { var12, var1.conversationId })
	end
	local var48, var49 = useCallbackWithDynamicConversationIdModule(appChatNetworkingModule.rodux.GetModalSequence.API, var1.conversationId)
	useEffect(function()
		-- upvalues: var49 (ref), var12 (ref), var48 (ref), appChatNetworkingModule (copy), var31 (ref), loggerModule (copy)
		if var49 then
			var12(var48({
				modalSequence = appChatNetworkingModule.Constants.ModalSequence.ConversationBottomModal,
				isInExperience = var31
			})):catch(function(p2)
				-- upvalues: loggerModule (copy)
				loggerModule:warning(`GetModalSequence for ConversationBottomModal error in ChatConversationContainer {tostring(p2)}`)
			end)
			
			return
		end
	end, {
		var1.conversationId,
		var49,
		var31,
		var12,
		var48
	})
	local var50 = useShouldShowConversationOverlayModule(var1.conversationId)
	useEffect(function()
		-- upvalues: var50 (ref), var1 (ref)
		if var50 then
			var1.navigateToConversationOverlay()
		end
	end, { var50, var1.conversationId })
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local isNotChannels = source ~= "channels"
	local var51 = useSelector(function(p2)
		-- upvalues: isNotChannels (ref), appChatNetworkingModule (copy), var1 (ref), roduxNetworkingModule (copy)
		return (if isNotChannels then appChatNetworkingModule.rodux.GetChatModerationStatuses.getStatus(p2) else appChatNetworkingModule.rodux.GetChatModerationStatuses.getStatus(p2, var1.conversationId)) == roduxNetworkingModule.Enum.NetworkStatus.NotStarted
	end)
	useEffect(function()
		-- upvalues: var51 (ref), var12 (ref), appChatNetworkingModule (copy), isNotChannels (ref), var1 (ref)
		if var51 then
			var12(appChatNetworkingModule.rodux.GetChatModerationStatuses.API(if isNotChannels then nil else { var1.conversationId })):catch(function(p2)
				warn("GetChatModerationStatuses error in ChatConversationContainer " .. tostring(p2))
			end)
		end
	end, { var1.conversationId, isNotChannels, var12, var51 })
	local var52 = useChatTimeoutDetailsModule({
		conversationId = var1.conversationId,
		conversationModerationType = var41
	})
	local isTimedOut = var52.isTimedOut
	local timeoutEndTimestamp = var52.timeoutEndTimestamp
	local decisionEventId = var52.decisionEventId
	local duration = var52.duration
	local _ = nil
	useEffect(function()
		-- upvalues: var30 (ref), chatConversationTelemetryEventsModule (copy), var20 (ref)
		var30.emit(chatConversationTelemetryEventsModule.ScreenRendered, { loadedMessageCount = #var20 })
	end, { var1.conversationId })
	
	if appChatConversationPageSyntheticSystemMessageIxpEnabled then
		local var53 = var20[1]
		local var54 = if var53 then var53.id else nil
		useEffect(function()
			-- upvalues: isSyntheticSystemMessageIdModule (copy), var54 (ref), IXPService (copy), appChatConversationPageSyntheticSystemMessageIxpLayer (copy)
			if isSyntheticSystemMessageIdModule(var54) then
				IXPService:LogFlagLinkedUserLayerExposure(appChatConversationPageSyntheticSystemMessageIxpLayer)
			end
		end, { var1.conversationId, var54 })
	end
	local var55 = reactModule.useCallback(function(p2)
		-- upvalues: var30 (ref), chatConversationTelemetryEventsModule (copy), var40 (ref)
		var30.emit(chatConversationTelemetryEventsModule.ScreenExit, { conversationExitType = p2 })
		var40()
	end, { var30, var40 })
	var5 = var5 or {}
	local var56 = var5.participantPendingStatus ~= conversationChannelsModule.UserPendingStatus.Pending and var10
	local var57 = not var56 and var10
	local var58 = useIsExternalNavigationAvailableModule({ enumScreensModule.ViewUserProfile })
	local var59 = var5.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
	local var60 = useSelector(function(p2)
		-- upvalues: var59 (ref), var5 (write)
		return var59 and var5.initiator == p2.LocalUserId
	end)
	
	local var61 = function(p2)
		-- upvalues: var58 (ref), enumScreensModule (copy), var3 (ref), var1 (ref), genericDialogTypeModule (copy), var43 (ref), var59 (ref), var60 (ref)
		if var58[enumScreensModule.ViewUserProfile] then
			var3(p2)
			
			return
		end
		var1.navigateToScreen(genericDialogTypeModule.ParticipantDialog, {
			conversationId = var1.conversationId,
			participantId = p2,
			showRemoveUserButton = not var43 and (var59 and var60)
		}, true)
	end
	
	local var62 = if if fFlagAppChatSignalsReplyStoreModule then var36 else var34 then if var38 then var29.replyToYourselfChatInputPlaceholder else var29.replyChatInputPlaceholder else var29.chatInputPlaceholder
	useEffect(function()
		-- upvalues: var1 (ref), var15 (write)
		var1.updateConversationTitle(var15)
	end, { var15, var1.updateConversationTitle })
	local var63 = reactModule.useCallback(function()
		-- upvalues: fFlagAppChatUniversalFeatureRestriction (copy), parent (copy), var1 (ref), chatInputBoxDisabledPressedSignal (copy), timeoutEndTimestamp (write), decisionEventId (write), duration (write)
		if fFlagAppChatUniversalFeatureRestriction then
			require(parent.UniversalFeatureRestrictions.showFeatureRestriction)(require(parent.UniversalFeatureRestrictions.AbuseVector).PartyChat, {
				onShown = var1.releaseInputBarFocus,
				onAppeal = function() end
			})
			
			return
		end
		chatInputBoxDisabledPressedSignal:fire({
			endTimestamp = timeoutEndTimestamp,
			decisionEventId = decisionEventId,
			duration = duration
		})
	end, {
		var1.releaseInputBarFocus,
		timeoutEndTimestamp,
		decisionEventId,
		duration
	})
	local var64, var65 = reactModule.useState(var1.navigation and (var1.navigation.isFocused and var1.navigation.isFocused()))
	local var66 = nil
	local var67 = nil
	
	if fFlagAppChatPerfTrackingModule then
		var66 = if fFlagRenderChatConversationOnlyWhenVisibleModule and var1.isFocused and not var1.isFocused() then false else var64
		var67 = var66 and not var43
	end
	local var68 = nil
	
	if fFlagAppChatPerfTrackingModule then
		local var69 = reactModule.useRef(false)
		reactModule.useEffect(function()
			-- upvalues: var69 (ref), var56 (ref)
			var69.current = not var56
		end, { var1.conversationId, var56 })
		local var70 = reactModule.useCallback(function(p2)
			-- upvalues: appChatPerfTrackerModule (copy), var1 (ref), var67 (write), var69 (ref), loggerModule (copy), var20 (ref)
			if not appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = var1.conversationId }) or not var67 then return end
			if var69.current then
				appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.ChatConversationTTI, {
					conversationId = var1.conversationId,
					numElementsRendered = #var20
				})
				
				return
			end
			loggerModule:debug("TTI: Messages ready but waiting for input bar (chatInputBarReady={}, reason={})", var69.current, p2)
		end, { var1.conversationId, var64, var43, #var20 })
		reactModule.useEffect(function()
			-- upvalues: var70 (ref)
			var70("messages_ready")
		end, { var70, #var20, var1.conversationId })
		var68 = reactModule.useCallback(function()
			-- upvalues: var69 (ref), var70 (ref)
			var69.current = true
			var70("input_bar_ready")
		end, { var70 })
	end
	if fFlagAppChatPerfTrackingModule then
		local var71 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: loggerModule (copy), var1 (ref), var71 (ref), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy)
			loggerModule:debug("Perf: Resetting message perf tracking for conversation {}", var1.conversationId)
			var71.current = nil
			local t = { conversationId = var1.conversationId }
			
			if fFlagAppChatMessageTTIMilestonesModule then
				appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageSendTTI, t)
				appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageReceiveTTI, t)
				
				return
			end
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageSendToPendingRender, t)
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageSendResponseToFinalRender, t)
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageSendToFinalRender, t)
			appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.MessageReceiveToRender, t)
		end, { var1.conversationId })
		reactModule.useEffect(function()
			-- upvalues: var20 (ref), var1 (ref), var8 (ref), var71 (ref), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy)
			local var72 = var20[1]
			
			if not var72 or not var72.id then return end
			local t = { conversationId = var1.conversationId }
			local var73 = var72.senderTargetId == var8
			
			if not var72.isSending and (if var72.senderType ~= "system" then not var73 else true) then
				if var72.id ~= var71.current then
					var71.current = var72.id
					
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
			if not var73 then return end
			if fFlagAppChatMessageTTIMilestonesModule then
				if var72.isSending then
					appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.MessageSendTTI, appChatPerfTrackerModule.Milestone.FunctionallyReady, t)
					
					return
				end
				appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageSendTTI, t)
				
				return
			elseif var72.isSending then
				appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageSendToPendingRender, t)
				
				return
			end
			appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageSendResponseToFinalRender, t)
			appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.MessageSendToFinalRender, t)
		end, { var20, var8, var1.conversationId })
	end
	useEffect(function()
		-- upvalues: var1 (ref), roactNavigationModule (copy), fFlagAppChatPerfTrackingModule (copy), var65 (ref), appChatPerfTrackerModule (copy)
		local willBlur = var1.navigation and (var1.navigation.addListener and var1.navigation.addListener(roactNavigationModule.Events.WillBlur, function(p2)
			-- upvalues: fFlagAppChatPerfTrackingModule (copy), var65 (copy), appChatPerfTrackerModule (copy), var1 (copy)
			if fFlagAppChatPerfTrackingModule then
				local isOverlay = p2 and (p2.action and (p2.action.params and (p2.action.params.isOverlay or false)))
				var65(isOverlay)
				
				if isOverlay then return end
				if appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = var1.conversationId }) then
					appChatPerfTrackerModule.cancel(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = var1.conversationId })
					
					return
				end
			elseif p2 and p2.action and (p2.action.params and p2.action.params.isOverlay) then
				var65(true)
				
				return
			end
			var65(false)
		end))
		local willFocus = var1.navigation and (var1.navigation.addListener and var1.navigation.addListener(roactNavigationModule.Events.WillFocus, function(_)
			-- upvalues: var65 (copy)
			var65(true)
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
	end, { var1.navigation, var1.conversationId })
	useEffect(function()
		-- upvalues: var21 (ref), var12 (ref), getAllRemainingOlderMessagesModule (copy), getOlderMessagesModule (copy), var1 (ref), appChatGetAllMessagesDepth (copy), var29 (ref)
		if var21.shouldShowOsaCardOnInitialLoad then
			var12(getAllRemainingOlderMessagesModule(getOlderMessagesModule, var1.conversationId, appChatGetAllMessagesDepth)):catch(function()
				-- upvalues: var1 (copy), var29 (copy)
				var1.navigateToToast({
					toastProps = { toastContent = { toastTitle = var29.networkErrorText } }
				})
			end)
		end
	end, { var21.shouldShowOsaCardOnInitialLoad })
	local getCanAccessParty = var1.getCanAccessParty
	
	return if fFlagAppChatPerfTrackingModule then if var66 then if var43 then reactModule.createElement(pendingStateConversationPageModule, {
		conversationId = var1.conversationId,
		topBarHeight = var1.topBarHeight,
		networkErrorText = var29.networkErrorText,
		navigateToToast = var1.navigateToToast,
		wideMode = var1.wideMode,
		onConversationUnmount = var55,
		navigateBack = var1.navigateBack
	}) else reactModule.createElement(chatConversationModule, cryoModule.Dictionary.join(var1, var4, var29, {
		moreMenuEnabled = getCanAccessParty,
		conversation = var5,
		conversationTitle = var15,
		itemList = var22,
		localUserId = var8,
		openGameDetailsPage = var1.openGameDetailsPage,
		openViewProfile = var61,
		readingMessagesIsEnabled = var1.getReadingMessagesIsEnabled(),
		Users = var16,
		usersTyping = var17,
		displayNamesAvailable = var28,
		onConversationUnmount = var55,
		recipientIdsSerialized = var7,
		chatIsVisible = var9,
		chatInputPlaceholder = var62,
		replyingToMessageId = if fFlagAppChatSignalsReplyStoreModule then var36 else nil,
		replyingToMessage = if not fFlagAppChatSignalsReplyStoreModule then var34 else nil,
		replyingToMessageDispatch = if not fFlagAppChatSignalsReplyStoreModule then var35 else nil,
		shouldShowChatInputBar = var56,
		shouldShowLegacyBottomModal = var57,
		shouldDisableChatInputBar = isTimedOut,
		onChatInputBarReady = if fFlagAppChatPerfTrackingModule then var68 else nil,
		inputBarDisabledEndTimestampDisplay = timeoutEndTimestamp,
		onDisabledInputBarActivated = var63,
		scrollToTopOnInitialOsaLoad = var21.shouldShowOsaCardOnInitialLoad and var21.fetchedOldestMessage,
		navigateToSquadLobby = if getCanAccessParty then var1.navigateToSquadLobby else nil,
		shouldHideMoreMenuButton = if getCanAccessParty then not var56 else nil,
		isInitialMessageLoading = if fFlagAppChatConversationLoadingSkeletonModule then var23 else nil
	})) else nil elseif var64 then if fFlagRenderChatConversationOnlyWhenVisibleModule and var1.isFocused and not var1.isFocused() then nil elseif var43 then reactModule.createElement(pendingStateConversationPageModule, {
		conversationId = var1.conversationId,
		topBarHeight = var1.topBarHeight,
		networkErrorText = var29.networkErrorText,
		navigateToToast = var1.navigateToToast,
		wideMode = var1.wideMode,
		onConversationUnmount = var55,
		navigateBack = var1.navigateBack,
		style = var1.style
	}) else reactModule.createElement(chatConversationModule, cryoModule.Dictionary.join(var1, var4, var29, {
		moreMenuEnabled = getCanAccessParty,
		conversation = var5,
		conversationTitle = var15,
		itemList = var22,
		localUserId = var8,
		openGameDetailsPage = var1.openGameDetailsPage,
		openViewProfile = var61,
		readingMessagesIsEnabled = var1.getReadingMessagesIsEnabled(),
		Users = var16,
		usersTyping = var17,
		displayNamesAvailable = var28,
		onConversationUnmount = var55,
		recipientIdsSerialized = var7,
		chatIsVisible = var9,
		chatInputPlaceholder = var62,
		replyingToMessageId = if fFlagAppChatSignalsReplyStoreModule then var36 else nil,
		replyingToMessage = if not fFlagAppChatSignalsReplyStoreModule then var34 else nil,
		replyingToMessageDispatch = if not fFlagAppChatSignalsReplyStoreModule then var35 else nil,
		shouldShowChatInputBar = var56,
		shouldShowLegacyBottomModal = var57,
		shouldDisableChatInputBar = isTimedOut,
		onChatInputBarReady = if fFlagAppChatPerfTrackingModule then var68 else nil,
		inputBarDisabledEndTimestampDisplay = timeoutEndTimestamp,
		onDisabledInputBarActivated = var63,
		scrollToTopOnInitialOsaLoad = var21.shouldShowOsaCardOnInitialLoad and var21.fetchedOldestMessage,
		navigateToSquadLobby = if getCanAccessParty then var1.navigateToSquadLobby else nil,
		shouldHideMoreMenuButton = if getCanAccessParty then not var56 else nil,
		isInitialMessageLoading = if fFlagAppChatConversationLoadingSkeletonModule then var23 else nil
	})) else nil
end

return universalAppPolicy.connect(function(p2)
	return {
		viewProfileOnAvatarPressed = p2.getChatTapConversationThumbnail(),
		getCanAccessParty = p2.getCanAccessParty()
	}
end)(ChatConversationContainer)