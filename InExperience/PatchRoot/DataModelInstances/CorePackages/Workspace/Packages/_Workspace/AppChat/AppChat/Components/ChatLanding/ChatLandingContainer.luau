local httpService = game:GetService("HttpService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appCommonLibModule = require(parent.AppCommonLib)
local appNavBarModule = require(parent.AppNavBar)
local visibilityControl = appNavBarModule.VisibilityControl
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
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
local signalsMigrationConfigModule = require(appChat.Flags.SignalsMigrationConfig)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local fFlagAppChatConsoleFocusFixesModule = require(appChat.Flags.FFlagAppChatConsoleFocusFixes)
local fFlagAppChatServerSideConversationSearchModule = require(appChat.Flags.FFlagAppChatServerSideConversationSearch)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local isVRAppBuild = appCommonLibModule.IsVRAppBuild
local useTokens = foundationModule.Hooks.useTokens
local useStyle = UIBloxModule.Core.Style.useStyle
local useTextSizeOffset = UIBloxModule.Core.Style.useTextSizeOffset
local noFriendsView = componentsModule.NoFriendsView
local fFlagAppIaScrollAway = sharedFlagsModule.FFlagAppIaScrollAway
local fFlagEnableScrollAwayContentScrollableFix = sharedFlagsModule.FFlagEnableScrollAwayContentScrollableFix
local fFlagSignalsNavP3hMisc = sharedFlagsModule.FFlagSignalsNavP3hMisc
local fFlagFriendsChatPlaceholderRenameFix = sharedFlagsModule.FFlagFriendsChatPlaceholderRenameFix
local getFFlagChatTabHideGroupsLinkOnVRModule = require(appChat.Flags.getFFlagChatTabHideGroupsLinkOnVR)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local partyPageCarouselExperimentation = require(parent.SocialExperiments).PartyPageCarouselExperimentation
local fFlagCreateConnectionsHub = require(parent.SharedFlags).FFlagCreateConnectionsHub
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local squadQuickStartExperimentation = require(parent.SocialExperiments).SquadQuickStartExperimentation
local useCanAccessPartyModule = require(parent.Squads.useCanAccessParty)
local useConversationListModule = require(appChat.Hooks.useConversationList)
local useConversationSearchListPropsModule = require(appChat.Hooks.useConversationSearchListProps)
local shouldReadConversationListFromSignalsStore = signalsMigrationConfigModule.shouldReadConversationListFromSignalsStore
local var1 = if game.PlaceId > 0 then tostring(game.PlaceId) else nil
local var2 = if game.GameId > 0 then tostring(game.GameId) else nil
local t = {
	topBarHeight = 0,
	isShowingFilterBox = false,
	navigateToSquadLobby = function() end
}

local function _(p1, p2)
	if #p1 ~= #p2 then
		return false
	end
	for i, v in p1 do
		if v ~= p2[i] then
			return false
		end
	end
	return true
end

local _ = function(p3)
	-- upvalues: httpService (ref)
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p3 (ref)
		return httpService:JSONEncode(p3)
	end)
	
	return if ok then status else "[]"
end

function ChatLandingContainer(p3)
	-- upvalues: cryoModule (ref), t (ref), useAnalyticsModule (ref), useChatPlacementContext (ref), useDispatch (ref), useIsChatEnabledModule (ref), useIsGroupChatEnabledModule (ref), useIsChatEnabledFromReasonModule (ref), useIsInExperienceModule (ref), useAppChatIsWideModeModule (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), useIsAppLoadedModule (ref), useAreConversationsFetchingModule (ref), useHasConversationsModule (ref), useIsOldestConversationFetchedModule (ref), useLocalUserId (ref), useNavigation (ref), useStyle (ref), useTextSizeOffset (ref), useAnalyticsModule_1 (ref), fFlagAppChatConsoleFocusFixesModule (ref), useTokens (ref), fFlagCreateConnectionsHub (ref), useGetConversationsModule (ref), shouldReadConversationListFromSignalsStore (ref), useConversationListModule (ref), fFlagAppChatServerSideConversationSearchModule (ref), useConversationSearchListPropsModule (ref), useEffect (ref), getConversationIdsModule (ref), name (ref), httpService (ref), usePrevious (ref), fetchConversationsByPageModule (ref), reactModule (ref), getOtherParticipantsModule (ref), useIsUserPendingModule (ref), conversationChannelsModule (ref), getConversationTitleModule (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), chatLandingTelemetryStateModule (ref), useEffectOnMount (ref), chatLandingTelemetryEventsModule (ref), useLocalization (ref), fFlagFriendsChatPlaceholderRenameFix (ref), useCallback (ref), partyPageCarouselExperimentation (ref), eventNamesModule (ref), var1 (ref), var2 (ref), enumScreensModule (ref), createConversationModule (ref), parseCreateConversationErrorsModule (ref), createConversationErrorModule (ref), useSelector (ref), useIsExternalNavigationAvailableModule (ref), fFlagAppIaScrollAway (ref), appNavBarModule (ref), useCanAccessPartyModule (ref), squadQuickStartExperimentation (ref), chatLoadingContainerModule (ref), noFriendsView (ref), emptyStateTypeModule (ref), appPage (ref), fFlagConnectionsToFriendsRename (ref), noConversationsLandingModule (ref), conversationListWithTopBarModule (ref), signalsMigrationConfigModule (ref), fFlagEnableScrollAwayContentScrollableFix (ref), visibilityControl (ref), getFFlagChatTabHideGroupsLinkOnVRModule (ref), isVRAppBuild (ref), getTopBarStoreModule (ref), conversationGroupsEntryContainerModule (ref), useChatIsVisibleModule (ref), fFlagSignalsNavP3hMisc (ref)
	local var3 = cryoModule.Dictionary.join(t, p3)
	local var4 = useAnalyticsModule()
	local var5 = useChatPlacementContext()
	local var6 = useDispatch()
	local var7 = useIsChatEnabledModule()
	local var8 = useIsGroupChatEnabledModule()
	local var9 = useIsChatEnabledFromReasonModule("privacySettingsEnabled")
	local var10 = useIsChatEnabledFromReasonModule("globalRulesEnabled")
	local var11 = useIsChatEnabledFromReasonModule("thirdPartyPrivacySettingsEnabled")
	local var12 = useIsInExperienceModule()
	local var13 = useAppChatIsWideModeModule(var12)
	
	if fFlagAppChatPerfTrackingModule and fFlagAppChatMessageTTIMilestonesModule and appChatPerfTrackerModule.Hooks then
		appChatPerfTrackerModule.Hooks.useTTIRenderAndMountedTracking(appChatPerfTrackerModule.getEventName(appChatPerfTrackerModule.Events.ChatLandingTTI) or "")
	end
	local var14 = useIsAppLoadedModule()
	local var15 = useAreConversationsFetchingModule()
	local var16 = useHasConversationsModule()
	local var17 = useIsOldestConversationFetchedModule()
	local var18 = useLocalUserId()
	local var19 = useNavigation()
	local var20 = useStyle()
	local var21 = useTextSizeOffset()
	local var22 = useAnalyticsModule_1()
	local var23 = if fFlagAppChatConsoleFocusFixesModule then (if fFlagAppChatConsoleFocusFixesModule then useTokens() else nil).Size.Size_1600 + 2 * var21 else 64 + 2 * var21
	local var24 = if fFlagCreateConnectionsHub then var19.getScreenProps("navigateToLuaAppPages", {}) else nil
	local var25 = useGetConversationsModule()
	local t_1 = {}
	local t_2 = {}
	
	if shouldReadConversationListFromSignalsStore then
		local var26 = useConversationListModule(true)
		t_1 = var26.items
		t_2 = var26.listStatus
	end
	local var27
	local var28 = if shouldReadConversationListFromSignalsStore then t_1 else var25
	
	if shouldReadConversationListFromSignalsStore then
		var27 = t_2.isFetchingConversations == true
		var27 = nil
	else
		var27 = var15
	end
	local var29
	if shouldReadConversationListFromSignalsStore then
		var29 = #t_1 > 0
		var29 = nil
	else
		var29 = var16
	end
	local var30
	if shouldReadConversationListFromSignalsStore then
		var30 = t_2.oldestConversationIsFetched == true
		var30 = nil
	else
		var30 = var17
	end
	local var31 = false
	local t_3 = {}
	
	if fFlagAppChatServerSideConversationSearchModule then
		local var32, var33 = useConversationSearchListPropsModule(var3.filterText, var3.isShowingFilterBox == true, var18, var8, var3.navigateToConversation)
		var31 = var32
		t_3 = var33
	end
	if shouldReadConversationListFromSignalsStore then
		useEffect(function()
			-- upvalues: var25 (ref), t_1 (write), getConversationIdsModule (copy), name (copy), httpService (copy)
			if #var25 == 0 and #t_1 == 0 then return end
			local var34, ok, ok_1
			local var35 = getConversationIdsModule(var25)
			local var36 = getConversationIdsModule(t_1)
			
			if #var35 == #var36 then
				for ok, ok_1 in var35 do
					if ok_1 ~= var36[ok] then
						var34 = false
					end
				end
				var34 = true
			else
				var34 = false
			end
			if not var34 then
				var34 = name
				local var37 = "Conversation list parity mismatch. Rodux ids: {}, Signals ids: {}"
				ok, ok_1 = pcall(function()
					-- upvalues: httpService (copy), var35 (ref)
					return httpService:JSONEncode(var35)
				end)
				local var38 = if ok then ok_1 else "[]"
				ok_1, status_1 = pcall(function()
					-- upvalues: httpService (copy), var36 (ref)
					return httpService:JSONEncode(var36)
				end)
				var34:warning(var37, var38, if ok_1 then status_1 else "[]")
			end
		end, { var25, t_1 })
	end
	local var34 = usePrevious(var7)
	useEffect(function()
		-- upvalues: name (copy), var34 (ref), var7 (ref), var6 (ref), fetchConversationsByPageModule (copy)
		name:debug("Comparing previousIsChatEnabled ({}) --> isChatEnabled ({})", var34, var7)
		
		if var34 ~= nil and var34 ~= var7 and var7 then
			name:info("Chat has become enabled, fetching conversations")
			var6(fetchConversationsByPageModule())
		end
	end, { var6, var7, var34 })
	local var35, var36, var37 = reactModule.useMemo(function()
		-- upvalues: var28 (ref), shouldReadConversationListFromSignalsStore (copy), cryoModule (copy), getOtherParticipantsModule (copy), var18 (ref), useIsUserPendingModule (copy), conversationChannelsModule (copy), getConversationTitleModule (copy), var8 (ref)
		local var38 = 0
		local var39 = 0
		local t = {}
		
		for i, v in var28 do
			local var40 = if shouldReadConversationListFromSignalsStore and v.otherParticipants == nil then cryoModule.Dictionary.join(v, { otherParticipants = getOtherParticipantsModule(v, var18) }) else v
			
			if useIsUserPendingModule(var40) then
				var38 += 1
			end
			if var40.moderationType == conversationChannelsModule.ModerationType.TrustedComms then
				var39 += 1
			end
			local var41 = getConversationTitleModule(var40)
			
			if var8 or var40.conversationType ~= "MultiUserConversation" then
				table.insert(t, cryoModule.Dictionary.join(var40, { title = var41 }))
			end
		end
		return t, var38, var39
	end, {
		var28,
		var8,
		if shouldReadConversationListFromSignalsStore then var18 else nil
	})
	local var42 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	local emit = var42.emit
	
	if shouldReadConversationListFromSignalsStore then
		local var43 = reactModule.useRef(var42.emit)
		var43.current = var42.emit
		
		emit = function(...)
			-- upvalues: var43 (ref)
			var43.current(...)
		end
	end
	local frame
	local var44 = chatLandingTelemetryStateModule.useSetState()
	useEffect(function()
		-- upvalues: var44 (ref), cryoModule (copy), var35 (ref), var36 (ref), var37 (ref)
		var44(function(p4)
			-- upvalues: cryoModule (copy), var35 (copy), var36 (copy), var37 (copy)
			return cryoModule.Dictionary.join(p4, {
				chatLandingListCount = #var35,
				pendingConversationCount = var36,
				unfilteredConversationCount = var37
			})
		end)
	end, { #var35, var36, var37, var44 })
	useEffectOnMount(function()
		-- upvalues: var42 (ref), chatLandingTelemetryEventsModule (copy), var7 (ref)
		var42.emit(chatLandingTelemetryEventsModule.ScreenRendered, { isChatEnabled = var7 })
	end)
	local var45 = useLocalization({
		networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong",
		chatUnavailableWithUser = if fFlagFriendsChatPlaceholderRenameFix then "Feature.Chat.Message.ChatUnavailableWithUser" else "Feature.Chat.Message.PartyUnavailableWithUser"
	})
	local var46 = useCallback(function()
		-- upvalues: partyPageCarouselExperimentation (copy), httpService (copy), var4 (ref), eventNamesModule (copy), var5 (ref), var1 (copy), var2 (copy), var19 (ref), enumScreensModule (copy)
		if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
			local var47 = httpService:GenerateGUID(false)
			var4.fireAnalyticsEvent(eventNamesModule.ChatLandingPartyQuickStartButtonClicked, {
				clickLocation = var5.chatPlacement,
				partyAttemptId = var47,
				placeId = var1,
				universeId = var2
			})
			var19.navigate(enumScreensModule.QuickStartSquadInviteFriends, { uuid = var47 })
		end
	end, {
		var4,
		var5,
		var19,
		var1,
		var2
	})
	local var47 = useCallback(function(p4)
		-- upvalues: partyPageCarouselExperimentation (copy), var6 (ref), createConversationModule (copy), var22 (ref), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), var19 (ref), enumScreensModule (copy), parseCreateConversationErrorsModule (copy), var45 (ref), eventNamesModule (copy), createConversationErrorModule (copy)
		if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
			var6(createConversationModule("one_to_one", { p4 }, var22, "navigateToConversationFromSocialCarousel")):andThen(function(p5)
				-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), var19 (copy), enumScreensModule (copy)
				if fFlagAppChatPerfTrackingModule then
					appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = p5.id })
				end
				var19.navigate(enumScreensModule.ChatConversation, { conversationId = p5.id })
			end):catch(function(p5)
				-- upvalues: parseCreateConversationErrorsModule (copy), var45 (copy), var19 (copy), enumScreensModule (copy), var22 (copy), eventNamesModule (copy), createConversationErrorModule (copy)
				var19.navigate(enumScreensModule.RoactChatToast, {
					toastProps = {
						toastContent = {
							toastTitle = if parseCreateConversationErrorsModule(p5) == "participant_chat_disabled" then var45.chatUnavailableWithUser else var45.networkErrorText
						}
					}
				})
				
				if var22 then
					var22.fireAnalyticsEvent(eventNamesModule.NewConversationCreated, {
						createConversationResult = createConversationErrorModule.FetchConversationError
					})
				end
			end)
		end
	end, {
		var6,
		var45,
		parseCreateConversationErrorsModule,
		var19,
		var22
	})
	local var48 = cryoModule.isEmpty(var35)
	local var49 = useSelector(function(p4)
		return p4.ChatAppReducer.ChatSettings.retrievalStatus ~= "Done"
	end) or (if var48 then var27 else var48 and var29)
	local _ = nil
	local var50 = false
	local var51 = false
	local var52 = false
	local var53 = useIsExternalNavigationAvailableModule({
		enumScreensModule.AddFriends,
		enumScreensModule.PrivacySettings,
		enumScreensModule.Groups
	})
	local var54 = fFlagAppIaScrollAway and (not var12 and appNavBarModule.getScrollAwayEnabled())
	local var55 = useCanAccessPartyModule()
	local var56 = squadQuickStartExperimentation.getPartyQuickStartChangesEnabled() and var55
	
	if var49 then
		frame = reactModule.createElement(chatLoadingContainerModule, {
			cellWidth = 375,
			topBarHeight = var3.topBarHeight,
			pageHeaderText = var3.pageHeaderText,
			cellHeight = var23,
			topPadding = if fFlagAppIaScrollAway and var54 then var3.topBarHeight else nil
		})
		var50 = true
	elseif var7 and (var31 or not var48 or (not var14 or var27)) then
		local filterText = `conversationListWithTopBar{var3.filterText}`
		var50 = true
		var51 = true
		var52 = true
		frame = reactModule.createElement(conversationListWithTopBarModule, cryoModule.Dictionary.join(var3, {
			filterText = if var3.isShowingFilterBox then var3.filterText else nil,
			key = filterText,
			itemList = var35,
			appLoaded = var14,
			localUserId = var18,
			conversationsIsFetching = var27,
			oldestConversationIsFetched = var30,
			entryHeight = var23,
			isInExperience = var12,
			isWideMode = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() or signalsMigrationConfigModule.shouldUseFoundationConversationRow then var13 else nil,
			navigateToConversationFromUserId = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then var47 else nil,
			navigateToQuickStartSquadInviteFriends = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then var46 else nil,
			showGroupsLink = var53[enumScreensModule.Groups],
			canvasTopPadding = if fFlagAppIaScrollAway and var54 then var3.topBarHeight else nil,
			canAccessParty = var55,
			isPartyQuickStartEnabled = var56
		}, t_3))
	elseif var7 then
		frame = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = var20.Theme.BackgroundDefault.Color,
			BackgroundTransparency = var20.Tokens.Color.None.Transparency
		}, {
			NoFriendsView = reactModule.createElement(noFriendsView, {
				pageRenderReport = function()
					-- upvalues: var42 (ref), chatLandingTelemetryEventsModule (copy), emptyStateTypeModule (copy)
					var42.emit(chatLandingTelemetryEventsModule.ChatEmptyStateScreenRendered, { emptyStateType = emptyStateTypeModule.NoFriendsView })
				end,
				openAddFriendsPage = function()
					-- upvalues: var42 (ref), chatLandingTelemetryEventsModule (copy), fFlagCreateConnectionsHub (copy), var24 (ref), appPage (copy), var3 (ref)
					var42.emit(chatLandingTelemetryEventsModule.ChatAddFriendsBtnClicked, {})
					
					if fFlagCreateConnectionsHub then
						var24[appPage.CoHubAddConnections]()
						
						return
					end
					var3.navigateToAddFriends()
				end,
				noFriendsHeaderKey = if fFlagConnectionsToFriendsRename then "Feature.Chat.Label.AddFriends" else "Feature.Chat.Label.AddConnections",
				noFriendsTextLabelKey = if fFlagConnectionsToFriendsRename then "Feature.Chat.Text.NoFriends" else "Feature.Chat.Text.NoConnections",
				addFriendsBtnLabelKey = if fFlagConnectionsToFriendsRename then "Feature.Chat.Label.AddFriends" else "Feature.Chat.Label.AddConnections",
				addFriendsBtnEnabled = var53[enumScreensModule.AddFriends]
			})
		})
		var50 = true
	else
		frame = reactModule.createElement(noConversationsLandingModule, {
			chatEnabled = var7,
			privacySettingsEnabled = var9,
			globalRulesEnabled = var10,
			thirdPartyPrivacySettingsEnabled = var11,
			canNavigateToPrivacySettings = var53[enumScreensModule.PrivacySettings],
			canNavigateToAddFriends = var53[enumScreensModule.AddFriends],
			onCallToAction = function(p4)
				-- upvalues: var3 (ref), var42 (ref), chatLandingTelemetryEventsModule (copy), fFlagCreateConnectionsHub (copy), var24 (ref), appPage (copy)
				if p4 == "privacy" then
					var3.navigateToPrivacy()
					
					return
				elseif p4 == "friends" then
					var42.emit(chatLandingTelemetryEventsModule.ChatAddFriendsBtnClicked, {})
					
					if fFlagCreateConnectionsHub then
						var24[appPage.CoHubAddConnections]()
						
						return
					end
					var3.navigateToAddFriends()
				end
			end,
			fireRenderEvent = function(p4)
				-- upvalues: emptyStateTypeModule (copy), var42 (ref), chatLandingTelemetryEventsModule (copy)
				var42.emit(chatLandingTelemetryEventsModule.ChatEmptyStateScreenRendered, {
					emptyStateType = if p4 == "friends" then emptyStateTypeModule.NoFriendsView elseif p4 == "privacy" then emptyStateTypeModule.ChatSettingsDisabledView elseif p4 == "regional" then emptyStateTypeModule.ChatUnavailableRegionView else emptyStateTypeModule.EmptyConversationList
				})
			end
		})
	end
	if fFlagAppIaScrollAway and fFlagEnableScrollAwayContentScrollableFix then
		useEffect(function()
			-- upvalues: var54 (ref), visibilityControl (copy), var52 (write)
			if var54 then
				visibilityControl.setContentScrollable(var52)
				
				return
			end
		end, { var52, var54 })
	end
	if getFFlagChatTabHideGroupsLinkOnVRModule() and isVRAppBuild() then
		var50 = true
	end
	useEffect(function()
		-- upvalues: var12 (ref), getTopBarStoreModule (copy), enumScreensModule (copy), var51 (write)
		if var12 then
			getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatLanding, { rightHidden = not var51 })
		end
	end, { var51, var12 })
	local _ = nil
	local var57 = if not var50 and var53[enumScreensModule.Groups] then reactModule.createElement(reactModule.Fragment, nil, {
		UIPadding = if fFlagAppIaScrollAway and var54 then reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var3.topBarHeight) }) else nil,
		groupsLink = reactModule.createElement(conversationGroupsEntryContainerModule, { entryHeight = var23 }),
		chatFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, -var23),
			Position = UDim2.new(0, 0, 0, var23)
		}, { chatContainer = frame })
	}) else frame
	local var58 = useChatIsVisibleModule()
	reactModule.useEffect(function()
		-- upvalues: var58 (ref), emit (write), chatLandingTelemetryEventsModule (copy), var7 (ref), var49 (ref)
		if var58 then
			emit(chatLandingTelemetryEventsModule.AppChatVisible, { isChatEnabled = var7, isChatLoading = var49 })
		end
	end, { var58, var7, var49 })
	
	if fFlagAppChatPerfTrackingModule then
		reactModule.useEffect(function()
			-- upvalues: var58 (ref), var49 (ref), var7 (ref), name (copy), var35 (ref), appChatPerfTrackerModule (copy)
			if not var58 then return end
			local var59 = not var49 and var7
			name:debug("TTI Ready Check (ChatLanding): isLoading={}, isChatEnabled={}, itemCount={}, ready={}", var49, var7, #var35, var59)
			
			if var59 and appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.ChatLandingTTI) then
				appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.ChatLandingTTI, { numElementsRendered = #var35 })
			end
		end, { var58, var49, var7, #var35 })
	end
	local var59 = reactModule.useRef({ isChatEnabled = var7, isChatLoading = var49 })
	reactModule.useEffect(function()
		-- upvalues: var59 (ref), var7 (ref), var49 (ref)
		var59.current = { isChatEnabled = var7, isChatLoading = var49 }
	end, { var7, var49 })
	useEffect(function()
		-- upvalues: var58 (ref), emit (write), chatLandingTelemetryEventsModule (copy), var59 (ref)
		return function()
			-- upvalues: var58 (copy), emit (copy), chatLandingTelemetryEventsModule (copy), var59 (copy)
			if var58 then
				emit(chatLandingTelemetryEventsModule.AppChatClosed, var59.current)
			end
		end
	end, { var58 })
	
	if not fFlagSignalsNavP3hMisc then
		return var57
	end
	local var60 = reactModule.useRef(nil)
	
	if var58 or var60.current == nil then
		var60.current = var57
	end
	return var60.current
end

return compose(roactRoduxModule.connect(nil, mapDispatchToPropsModule), roactPaginator.connect(function()
	return { pageSize = 30 }
end))(ChatLandingContainer)