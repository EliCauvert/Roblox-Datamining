local httpService = game:GetService("HttpService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appCommonLibModule = require(parent.AppCommonLib)
local appNavBarModule = require(parent.AppNavBar)
local visibilityControl = appNavBarModule.VisibilityControl
local cryoModule = require(parent.Cryo)
local componentsModule = require(parent.FriendsLanding.Components)
local reactModule = require(parent.React)
local roactRoduxModule = require(parent.RoactRodux)
local sharedFlagsModule = require(parent.SharedFlags)
local UIBloxModule = require(parent.UIBlox)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffectOnMount = require(parent.RoactUtils).Hooks.useEffectOnMount
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useNavigation = require(parent.Navigation).useNavigation
local usePrevious = require(parent.RoactUtils).Hooks.usePrevious
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local appPage = require(parent.RobloxAppEnums).AppPage
local chatLoadingContainerModule = require(script.Parent.ChatLoading.ChatLoadingContainer)
local chatLandingTelemetryEventsModule = require(script.Parent.ChatLandingTelemetryEvents)
local conversationGroupsEntryContainerModule = require(script.Parent.ConversationGroupsEntryContainer)
local conversationListWithTopBarModule = require(script.Parent.ConversationListWithTopBar)
local name = require(script.Parent.Logger):new(script.Name)
local noConversationsLandingModule = require(script.Parent.NoConversationsLanding)
local mapDispatchToPropsModule = require(script.Parent.mapDispatchToProps)
local chatLandingTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local chatLandingTelemetryStateModule = require(appChat.Contexts.TelemetryState.ChatLandingTelemetryState)
local compose = require(appChat.SocialLibraries).RoduxTools.compose
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local createConversationModule = require(appChat.Conversations.Thunks.createConversation)
local createConversationErrorModule = require(appChat.Analytics.Enums.CreateConversationError)
local emptyStateTypeModule = require(appChat.Analytics.Enums.EmptyStateType)
local enumScreensModule = require(appChat.EnumScreens)
local eventNamesModule = require(appChat.Analytics.EventNames)
local fetchConversationsByPageModule = require(appChat.Conversations.Thunks.fetchConversationsByPage)
local getConversationTitleModule = require(appChat.Conversations.getConversationTitle)
local getOtherParticipantsModule = require(appChat.Conversations.getOtherParticipants)
local parseCreateConversationErrorsModule = require(appChat.Conversations.Thunks.parseCreateConversationErrors)
local roactPaginator = require(appChat.SocialLibraries).RoactPaginator
local useAnalyticsModule = require(appChat.Analytics.useAnalytics)
local useChatPlacementContext = require(appChat.Contexts.ChatPlacementContext).useChatPlacementContext
local useGetConversationsModule = require(appChat.Hooks.useGetConversations)
local useAreConversationsFetchingModule = require(appChat.Hooks.useAreConversationsFetching)
local useChatIsVisibleModule = require(appChat.Hooks.useChatIsVisible)
local useHasConversationsModule = require(appChat.Hooks.useHasConversations)
local useAppChatIsWideModeModule = require(appChat.Hooks.useAppChatIsWideMode)
local useIsAppLoadedModule = require(appChat.Hooks.useIsAppLoaded)
local useIsChatEnabledModule = require(appChat.Hooks.useIsChatEnabled)
local useIsExternalNavigationAvailableModule = require(appChat.Hooks.useIsExternalNavigationAvailable)
local useIsGroupChatEnabledModule = require(appChat.Hooks.useIsGroupChatEnabled)
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local useIsOldestConversationFetchedModule = require(appChat.Hooks.useIsOldestConversationFetched)
local useIsUserPendingModule = require(appChat.Hooks.useIsUserPending)
local useIsChatEnabledFromReasonModule = require(appChat.Hooks.useIsChatEnabledFromReason)
local useAnalyticsModule_1 = require(appChat.Analytics.useAnalytics)
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)
local getConversationIdsModule = require(appChat.Utils.getConversationIds)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local fFlagAppChatMessageTTIMilestonesModule = require(appChat.Flags.FFlagAppChatMessageTTIMilestones)
local fFlagAppChatUseNewConversationRowModule = require(appChat.Flags.FFlagAppChatUseNewConversationRow)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local isVRAppBuild = appCommonLibModule.IsVRAppBuild
local useStyle = UIBloxModule.Core.Style.useStyle
local useTextSizeOffset = UIBloxModule.Core.Style.useTextSizeOffset
local noFriendsView = componentsModule.NoFriendsView
local fFlagAppIaScrollAway = sharedFlagsModule.FFlagAppIaScrollAway
local fFlagEnableScrollAwayContentScrollableFix = sharedFlagsModule.FFlagEnableScrollAwayContentScrollableFix
local fFlagSignalsNavP3hMisc = sharedFlagsModule.FFlagSignalsNavP3hMisc
local fFlagAppChatConversationStoreModule = require(appChat.Flags.FFlagAppChatConversationStore)
local fFlagAppChatSignalsMessageStoreModule = require(appChat.Flags.FFlagAppChatSignalsMessageStore)
local getFFlagChatTabHideGroupsLinkOnVRModule = require(appChat.Flags.getFFlagChatTabHideGroupsLinkOnVR)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local fFlagAppChatTopBarSignalsStoreModule = require(appChat.Flags.FFlagAppChatTopBarSignalsStore)
local partyPageCarouselExperimentation = require(parent.SocialExperiments).PartyPageCarouselExperimentation
local fFlagCreateConnectionsHub = require(parent.SharedFlags).FFlagCreateConnectionsHub
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local squadQuickStartExperimentation = require(parent.SocialExperiments).SquadQuickStartExperimentation
local useCanAccessPartyModule = require(parent.Squads.useCanAccessParty)
local useConversationListModule = require(appChat.Hooks.useConversationList)
local fFlagAppChatSignalsMessageStoreModule_1 = fFlagAppChatUseNewConversationRowModule and (fFlagAppChatConversationStoreModule and fFlagAppChatSignalsMessageStoreModule)
local var58 = if game.PlaceId > 0 then tostring(game.PlaceId) else nil
local var59 = if game.GameId > 0 then tostring(game.GameId) else nil
local t = {
	topBarHeight = 0,
	isShowingFilterBox = false,
	navigateToSquadLobby = function() --[[ line: 118 ]] end
}

local function _(p0, p1) --[[ line: 121 | named "areConversationIdsEqual" ]]
	if #p0 ~= #p1 then
		return false
	end
	for i, v in p0 do
		if v ~= p1[i] then
			return false
		end
	end
	return true
end

local _ = function(p2) --[[ line: 135 | named "encodeConversationIds" ]]
	-- upvalues: httpService (ref)
	local ok, status = pcall(function() --[[ line: 136 ]]
		-- upvalues: httpService (copy), p2 (ref)
		return httpService:JSONEncode(p2)
	end)
	
	return if ok then status else "[]"
end

function ChatLandingContainer(p3) --[[ line: 142 ]]
	-- upvalues: cryoModule (ref), t (ref), useAnalyticsModule (ref), useChatPlacementContext (ref), useDispatch (ref), useIsChatEnabledModule (ref), useIsGroupChatEnabledModule (ref), useIsChatEnabledFromReasonModule (ref), useIsInExperienceModule (ref), useAppChatIsWideModeModule (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), useIsAppLoadedModule (ref), useAreConversationsFetchingModule (ref), useHasConversationsModule (ref), useIsOldestConversationFetchedModule (ref), useLocalUserId (ref), useNavigation (ref), useStyle (ref), useTextSizeOffset (ref), useAnalyticsModule_1 (ref), fFlagCreateConnectionsHub (ref), useGetConversationsModule (ref), fFlagAppChatSignalsMessageStoreModule_1 (ref), useConversationListModule (ref), useEffect (ref), getConversationIdsModule (ref), name (ref), httpService (ref), usePrevious (ref), fetchConversationsByPageModule (ref), reactModule (ref), getOtherParticipantsModule (ref), useIsUserPendingModule (ref), conversationChannelsModule (ref), getConversationTitleModule (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), chatLandingTelemetryStateModule (ref), useEffectOnMount (ref), chatLandingTelemetryEventsModule (ref), useLocalization (ref), useCallback (ref), partyPageCarouselExperimentation (ref), eventNamesModule (ref), var58 (ref), var59 (ref), enumScreensModule (ref), createConversationModule (ref), parseCreateConversationErrorsModule (ref), createConversationErrorModule (ref), useSelector (ref), useIsExternalNavigationAvailableModule (ref), fFlagAppIaScrollAway (ref), appNavBarModule (ref), useCanAccessPartyModule (ref), squadQuickStartExperimentation (ref), chatLoadingContainerModule (ref), noFriendsView (ref), emptyStateTypeModule (ref), appPage (ref), fFlagConnectionsToFriendsRename (ref), noConversationsLandingModule (ref), conversationListWithTopBarModule (ref), fFlagAppChatUseNewConversationRowModule (ref), fFlagEnableScrollAwayContentScrollableFix (ref), visibilityControl (ref), getFFlagChatTabHideGroupsLinkOnVRModule (ref), isVRAppBuild (ref), fFlagAppChatTopBarSignalsStoreModule (ref), getTopBarStoreModule (ref), conversationGroupsEntryContainerModule (ref), useChatIsVisibleModule (ref), fFlagSignalsNavP3hMisc (ref)
	local var61 = cryoModule.Dictionary.join(t, p3)
	local var62 = useAnalyticsModule()
	local var63 = useChatPlacementContext()
	local var64 = useDispatch()
	local var65 = useIsChatEnabledModule()
	local var66 = useIsGroupChatEnabledModule()
	local var67 = useIsChatEnabledFromReasonModule("privacySettingsEnabled")
	local var68 = useIsChatEnabledFromReasonModule("globalRulesEnabled")
	local var69 = useIsChatEnabledFromReasonModule("thirdPartyPrivacySettingsEnabled")
	local var70 = useIsInExperienceModule()
	local var71 = useAppChatIsWideModeModule(var70)
	
	if fFlagAppChatPerfTrackingModule and fFlagAppChatMessageTTIMilestonesModule and appChatPerfTrackerModule.Hooks then
		appChatPerfTrackerModule.Hooks.useTTIRenderAndMountedTracking(appChatPerfTrackerModule.getEventName(appChatPerfTrackerModule.Events.ChatLandingTTI) or "")
	end
	local var72 = useIsAppLoadedModule()
	local var73 = useAreConversationsFetchingModule()
	local var74 = useHasConversationsModule()
	local var75 = useIsOldestConversationFetchedModule()
	local var76 = useLocalUserId()
	local var77 = useNavigation()
	local var78 = useStyle()
	local var79 = useAnalyticsModule_1()
	local var80 = 64 + 2 * useTextSizeOffset()
	local var81 = if fFlagCreateConnectionsHub then var77.getScreenProps("navigateToLuaAppPages", {}) else nil
	local var82 = useGetConversationsModule()
	local t_1 = {}
	local t_2 = {}
	
	if fFlagAppChatSignalsMessageStoreModule_1 then
		local var85 = useConversationListModule(true)
		t_1 = var85.items
		t_2 = var85.listStatus
	end
	local var87
	local var86 = if fFlagAppChatSignalsMessageStoreModule_1 then t_1 else var82
	
	if fFlagAppChatSignalsMessageStoreModule_1 then
		var87 = t_2.isFetchingConversations == true
		var87 = nil
	else
		var87 = var73
	end
	local var88
	if fFlagAppChatSignalsMessageStoreModule_1 then
		var88 = #t_1 > 0
		var88 = nil
	else
		var88 = var74
	end
	local var89
	if fFlagAppChatSignalsMessageStoreModule_1 then
		var89 = t_2.oldestConversationIsFetched == true
		var89 = nil
	else
		var89 = var75
	end
	if fFlagAppChatSignalsMessageStoreModule_1 then
		useEffect(function() --[[ line: 197 ]]
			-- upvalues: var82 (ref), t_1 (write), getConversationIdsModule (copy), name (copy), httpService (copy)
			if #var82 == 0 and #t_1 == 0 then return end
			local var118, ok, ok_1
			local var116 = getConversationIdsModule(var82)
			local var117 = getConversationIdsModule(t_1)
			
			if #var116 == #var117 then
				for ok, ok_1 in var116 do
					if ok_1 ~= var117[ok] then
						var118 = false
					end
				end
				var118 = true
			else
				var118 = false
			end
			if not var118 then
				var118 = name
				local var119 = "Conversation list parity mismatch. Rodux ids: {}, Signals ids: {}"
				ok, ok_1 = pcall(function() --[[ line: 136 ]]
					-- upvalues: httpService (copy), var116 (ref)
					return httpService:JSONEncode(var116)
				end)
				local var120 = if ok then ok_1 else "[]"
				ok_1, status_1 = pcall(function() --[[ line: 136 ]]
					-- upvalues: httpService (copy), var117 (ref)
					return httpService:JSONEncode(var117)
				end)
				var118:warning(var119, var120, if ok_1 then status_1 else "[]")
			end
		end, { var82, t_1 })
	end
	local var90 = usePrevious(var65)
	useEffect(function() --[[ line: 215 ]]
		-- upvalues: name (copy), var90 (ref), var65 (ref), var64 (ref), fetchConversationsByPageModule (copy)
		name:debug("Comparing previousIsChatEnabled ({}) --> isChatEnabled ({})", var90, var65)
		
		if var90 ~= nil and var90 ~= var65 and var65 then
			name:info("Chat has become enabled, fetching conversations")
			var64(fetchConversationsByPageModule())
		end
	end, { var64, var65, var90 })
	local var91, var92, var93 = reactModule.useMemo(function() --[[ line: 231 ]]
		-- upvalues: var86 (ref), fFlagAppChatSignalsMessageStoreModule_1 (copy), cryoModule (copy), getOtherParticipantsModule (copy), var76 (ref), useIsUserPendingModule (copy), conversationChannelsModule (copy), getConversationTitleModule (copy), var66 (ref)
		local var121 = 0
		local var122 = 0
		local t = {}
		
		for i, v in var86 do
			local var124 = if fFlagAppChatSignalsMessageStoreModule_1 and v.otherParticipants == nil then cryoModule.Dictionary.join(v, { otherParticipants = getOtherParticipantsModule(v, var76) }) else v
			
			if useIsUserPendingModule(var124) then
				var121 += 1
			end
			if var124.moderationType == conversationChannelsModule.ModerationType.TrustedComms then
				var122 += 1
			end
			local var125 = getConversationTitleModule(var124)
			
			if var66 or var124.conversationType ~= "MultiUserConversation" then
				table.insert(t, cryoModule.Dictionary.join(var124, { title = var125 }))
			end
		end
		return t, var121, var122
	end, {
		var86,
		var66,
		if fFlagAppChatSignalsMessageStoreModule_1 then var76 else nil
	})
	local var94 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	local emit = var94.emit
	
	if fFlagAppChatSignalsMessageStoreModule_1 then
		local var95 = reactModule.useRef(var94.emit)
		var95.current = var94.emit
		
		emit = function(...) --[[ line: 274 ]]
			-- upvalues: var95 (ref)
			var95.current(...)
		end
	end
	local frame
	local var96 = chatLandingTelemetryStateModule.useSetState()
	useEffect(function() --[[ line: 280 ]]
		-- upvalues: var96 (ref), cryoModule (copy), var91 (ref), var92 (ref), var93 (ref)
		var96(function(p4) --[[ line: 281 ]]
			-- upvalues: cryoModule (copy), var91 (copy), var92 (copy), var93 (copy)
			return cryoModule.Dictionary.join(p4, {
				chatLandingListCount = #var91,
				pendingConversationCount = var92,
				unfilteredConversationCount = var93
			})
		end)
	end, { #var91, var92, var93, var96 })
	useEffectOnMount(function() --[[ line: 290 ]]
		-- upvalues: var94 (ref), chatLandingTelemetryEventsModule (copy), var65 (ref)
		var94.emit(chatLandingTelemetryEventsModule.ScreenRendered, { isChatEnabled = var65 })
	end)
	local var97 = useLocalization({
		partyUnavailableWithUser = "Feature.Chat.Message.PartyUnavailableWithUser",
		networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong"
	})
	local var98 = useCallback(function() --[[ line: 301 ]]
		-- upvalues: partyPageCarouselExperimentation (copy), httpService (copy), var62 (ref), eventNamesModule (copy), var63 (ref), var58 (copy), var59 (copy), var77 (ref), enumScreensModule (copy)
		if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
			local var126 = httpService:GenerateGUID(false)
			var62.fireAnalyticsEvent(eventNamesModule.ChatLandingPartyQuickStartButtonClicked, {
				clickLocation = var63.chatPlacement,
				partyAttemptId = var126,
				placeId = var58,
				universeId = var59
			})
			var77.navigate(enumScreensModule.QuickStartSquadInviteFriends, { uuid = var126 })
		end
	end, {
		var62,
		var63,
		var77,
		var58,
		var59
	})
	local var99 = useCallback(function(p5) --[[ line: 318 ]]
		-- upvalues: partyPageCarouselExperimentation (copy), var64 (ref), createConversationModule (copy), var79 (ref), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), var77 (ref), enumScreensModule (copy), parseCreateConversationErrorsModule (copy), var97 (ref), eventNamesModule (copy), createConversationErrorModule (copy)
		if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
			var64(createConversationModule("one_to_one", { p5 }, var79, "navigateToConversationFromSocialCarousel")):andThen(function(p7) --[[ line: 332 ]]
				-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), var77 (copy), enumScreensModule (copy)
				if fFlagAppChatPerfTrackingModule then
					appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = p7.id })
				end
				var77.navigate(enumScreensModule.ChatConversation, { conversationId = p7.id })
			end):catch(function(p6) --[[ line: 342 ]]
				-- upvalues: parseCreateConversationErrorsModule (copy), var97 (copy), var77 (copy), enumScreensModule (copy), var79 (copy), eventNamesModule (copy), createConversationErrorModule (copy)
				var77.navigate(enumScreensModule.RoactChatToast, {
					toastProps = {
						toastContent = {
							toastTitle = if parseCreateConversationErrorsModule(p6) == "participant_chat_disabled" then var97.partyUnavailableWithUser else var97.networkErrorText
						}
					}
				})
				
				if var79 then
					var79.fireAnalyticsEvent(eventNamesModule.NewConversationCreated, {
						createConversationResult = createConversationErrorModule.FetchConversationError
					})
				end
			end)
		end
	end, {
		var64,
		var97,
		parseCreateConversationErrorsModule,
		var77,
		var79
	})
	local var100 = cryoModule.isEmpty(var91)
	local var101 = useSelector(function(p8) --[[ line: 365 ]]
		return p8.ChatAppReducer.ChatSettings.retrievalStatus ~= "Done"
	end) or (if var100 then var87 else var100 and var88)
	local _ = nil
	local var102 = false
	local var103 = false
	local var104 = false
	local var105 = useIsExternalNavigationAvailableModule({
		enumScreensModule.AddFriends,
		enumScreensModule.PrivacySettings,
		enumScreensModule.Groups
	})
	local var106 = fFlagAppIaScrollAway and (not var70 and appNavBarModule.getScrollAwayEnabled())
	local var107 = useCanAccessPartyModule()
	local var107_1 = squadQuickStartExperimentation.getPartyQuickStartChangesEnabled() and var107
	
	if var101 then
		frame = reactModule.createElement(chatLoadingContainerModule, {
			cellWidth = 375,
			topBarHeight = var61.topBarHeight,
			pageHeaderText = var61.pageHeaderText,
			cellHeight = var80,
			topPadding = if fFlagAppIaScrollAway and var106 then var61.topBarHeight else nil
		})
		var102 = true
	elseif var65 and (not var100 or not var72 or var87) then
		local filterText = `conversationListWithTopBar{var61.filterText}`
		var102 = true
		var103 = true
		var104 = true
		frame = reactModule.createElement(conversationListWithTopBarModule, cryoModule.Dictionary.join(var61, {
			filterText = if var61.isShowingFilterBox then var61.filterText else nil,
			key = filterText,
			itemList = var91,
			appLoaded = var72,
			localUserId = var76,
			conversationsIsFetching = var87,
			oldestConversationIsFetched = var89,
			entryHeight = var80,
			isInExperience = var70,
			isWideMode = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() or fFlagAppChatUseNewConversationRowModule then var71 else nil,
			navigateToConversationFromUserId = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then var99 else nil,
			navigateToQuickStartSquadInviteFriends = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then var98 else nil,
			showGroupsLink = var105[enumScreensModule.Groups],
			canvasTopPadding = if fFlagAppIaScrollAway and var106 then var61.topBarHeight else nil,
			canAccessParty = var107,
			isPartyQuickStartEnabled = var107_1
		}))
	elseif var65 then
		frame = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = var78.Theme.BackgroundDefault.Color,
			BackgroundTransparency = var78.Tokens.Color.None.Transparency
		}, {
			NoFriendsView = reactModule.createElement(noFriendsView, {
				pageRenderReport = function() --[[ line: 411 ]]
					-- upvalues: var94 (ref), chatLandingTelemetryEventsModule (copy), emptyStateTypeModule (copy)
					var94.emit(chatLandingTelemetryEventsModule.ChatEmptyStateScreenRendered, { emptyStateType = emptyStateTypeModule.NoFriendsView })
				end,
				openAddFriendsPage = function() --[[ line: 416 ]]
					-- upvalues: var94 (ref), chatLandingTelemetryEventsModule (copy), fFlagCreateConnectionsHub (copy), var81 (ref), appPage (copy), var61 (ref)
					var94.emit(chatLandingTelemetryEventsModule.ChatAddFriendsBtnClicked, {})
					
					if fFlagCreateConnectionsHub then
						var81[appPage.CoHubAddConnections]()
						
						return
					end
					var61.navigateToAddFriends()
				end,
				noFriendsHeaderKey = if fFlagConnectionsToFriendsRename then "Feature.Chat.Label.AddFriends" else "Feature.Chat.Label.AddConnections",
				noFriendsTextLabelKey = if fFlagConnectionsToFriendsRename then "Feature.Chat.Text.NoFriends" else "Feature.Chat.Text.NoConnections",
				addFriendsBtnLabelKey = if fFlagConnectionsToFriendsRename then "Feature.Chat.Label.AddFriends" else "Feature.Chat.Label.AddConnections",
				addFriendsBtnEnabled = var105[enumScreensModule.AddFriends]
			})
		})
		var102 = true
	else
		frame = reactModule.createElement(noConversationsLandingModule, {
			chatEnabled = var65,
			privacySettingsEnabled = var67,
			globalRulesEnabled = var68,
			thirdPartyPrivacySettingsEnabled = var69,
			canNavigateToPrivacySettings = var105[enumScreensModule.PrivacySettings],
			canNavigateToAddFriends = var105[enumScreensModule.AddFriends],
			onCallToAction = function(p9) --[[ line: 446 ]]
				-- upvalues: var61 (ref), var94 (ref), chatLandingTelemetryEventsModule (copy), fFlagCreateConnectionsHub (copy), var81 (ref), appPage (copy)
				if p9 == "privacy" then
					var61.navigateToPrivacy()
					
					return
				elseif p9 == "friends" then
					var94.emit(chatLandingTelemetryEventsModule.ChatAddFriendsBtnClicked, {})
					
					if fFlagCreateConnectionsHub then
						var81[appPage.CoHubAddConnections]()
						
						return
					end
					var61.navigateToAddFriends()
				end
			end,
			fireRenderEvent = function(p10) --[[ line: 458 ]]
				-- upvalues: emptyStateTypeModule (copy), var94 (ref), chatLandingTelemetryEventsModule (copy)
				var94.emit(chatLandingTelemetryEventsModule.ChatEmptyStateScreenRendered, {
					emptyStateType = if p10 == "friends" then emptyStateTypeModule.NoFriendsView elseif p10 == "privacy" then emptyStateTypeModule.ChatSettingsDisabledView elseif p10 == "regional" then emptyStateTypeModule.ChatUnavailableRegionView else emptyStateTypeModule.EmptyConversationList
				})
			end
		})
	end
	if fFlagAppIaScrollAway and fFlagEnableScrollAwayContentScrollableFix then
		useEffect(function() --[[ line: 513 ]]
			-- upvalues: var106 (ref), visibilityControl (copy), var104 (write)
			if var106 then
				visibilityControl.setContentScrollable(var104)
				
				return
			end
		end, { var104, var106 })
	end
	if getFFlagChatTabHideGroupsLinkOnVRModule() and isVRAppBuild() then
		var102 = true
	end
	if fFlagAppChatTopBarSignalsStoreModule then
		useEffect(function() --[[ line: 527 ]]
			-- upvalues: var70 (ref), getTopBarStoreModule (copy), enumScreensModule (copy), var103 (write)
			if var70 then
				getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatLanding, { rightHidden = not var103 })
			end
		end, { var103, var70 })
	else
		local setScreenTopBar = var77.getScreenProps("setScreenTopBar", function() --[[ line: 535 ]] end)
		useEffect(function() --[[ line: 536 ]]
			-- upvalues: var70 (ref), setScreenTopBar (ref), enumScreensModule (copy), var103 (write)
			if var70 then
				setScreenTopBar(enumScreensModule.ChatLanding, { rightHidden = not var103 })
			end
		end, { var103, setScreenTopBar, var70 })
	end
	local _ = nil
	local var112 = if not var102 and var105[enumScreensModule.Groups] then reactModule.createElement(reactModule.Fragment, nil, {
		UIPadding = if fFlagAppIaScrollAway and var106 then reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var61.topBarHeight) }) else nil,
		groupsLink = reactModule.createElement(conversationGroupsEntryContainerModule, { entryHeight = var80 }),
		chatFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, -var80),
			Position = UDim2.new(0, 0, 0, var80)
		}, { chatContainer = frame })
	}) else frame
	local var113 = useChatIsVisibleModule()
	reactModule.useEffect(function() --[[ line: 577 ]]
		-- upvalues: var113 (ref), emit (write), chatLandingTelemetryEventsModule (copy), var65 (ref), var101 (ref)
		if var113 then
			emit(chatLandingTelemetryEventsModule.AppChatVisible, { isChatEnabled = var65, isChatLoading = var101 })
		end
	end, { var113, var65, var101 })
	
	if fFlagAppChatPerfTrackingModule then
		reactModule.useEffect(function() --[[ line: 587 ]]
			-- upvalues: var113 (ref), var101 (ref), var65 (ref), name (copy), var91 (ref), appChatPerfTrackerModule (copy)
			if not var113 then return end
			local var65_1 = not var101 and var65
			name:debug("TTI Ready Check (ChatLanding): isLoading={}, isChatEnabled={}, itemCount={}, ready={}", var101, var65, #var91, var65_1)
			
			if var65_1 and appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.ChatLandingTTI) then
				appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.ChatLandingTTI, { numElementsRendered = #var91 })
			end
		end, { var113, var101, var65, #var91 })
	end
	local var114 = reactModule.useRef({ isChatEnabled = var65, isChatLoading = var101 })
	reactModule.useEffect(function() --[[ line: 611 ]]
		-- upvalues: var114 (ref), var65 (ref), var101 (ref)
		var114.current = { isChatEnabled = var65, isChatLoading = var101 }
	end, { var65, var101 })
	useEffect(function() --[[ line: 620 ]]
		-- upvalues: var113 (ref), emit (write), chatLandingTelemetryEventsModule (copy), var114 (ref)
		return function() --[[ line: 621 ]]
			-- upvalues: var113 (copy), emit (copy), chatLandingTelemetryEventsModule (copy), var114 (copy)
			if var113 then
				emit(chatLandingTelemetryEventsModule.AppChatClosed, var114.current)
			end
		end
	end, { var113 })
	
	if not fFlagSignalsNavP3hMisc then
		return var112
	end
	local var115 = reactModule.useRef(nil)
	
	if var113 or var115.current == nil then
		var115.current = var112
	end
	return var115.current
end

return compose(roactRoduxModule.connect(nil, mapDispatchToPropsModule), roactPaginator.connect(function() --[[ line: 645 ]]
	return { pageSize = 30 }
end))(ChatLandingContainer)