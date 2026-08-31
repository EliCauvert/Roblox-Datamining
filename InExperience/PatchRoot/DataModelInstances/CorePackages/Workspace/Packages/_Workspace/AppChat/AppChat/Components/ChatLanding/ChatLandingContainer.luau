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
local signalsMigrationConfigModule = require(appChat.Flags.SignalsMigrationConfig)
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
local fFlagFriendsChatPlaceholderRenameFix = sharedFlagsModule.FFlagFriendsChatPlaceholderRenameFix
local getFFlagChatTabHideGroupsLinkOnVRModule = require(appChat.Flags.getFFlagChatTabHideGroupsLinkOnVR)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local fFlagAppChatTopBarSignalsStoreModule = require(appChat.Flags.FFlagAppChatTopBarSignalsStore)
local partyPageCarouselExperimentation = require(parent.SocialExperiments).PartyPageCarouselExperimentation
local fFlagCreateConnectionsHub = require(parent.SharedFlags).FFlagCreateConnectionsHub
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local squadQuickStartExperimentation = require(parent.SocialExperiments).SquadQuickStartExperimentation
local useCanAccessPartyModule = require(parent.Squads.useCanAccessParty)
local useConversationListModule = require(appChat.Hooks.useConversationList)
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
	-- upvalues: cryoModule (ref), t (ref), useAnalyticsModule (ref), useChatPlacementContext (ref), useDispatch (ref), useIsChatEnabledModule (ref), useIsGroupChatEnabledModule (ref), useIsChatEnabledFromReasonModule (ref), useIsInExperienceModule (ref), useAppChatIsWideModeModule (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), useIsAppLoadedModule (ref), useAreConversationsFetchingModule (ref), useHasConversationsModule (ref), useIsOldestConversationFetchedModule (ref), useLocalUserId (ref), useNavigation (ref), useStyle (ref), useTextSizeOffset (ref), useAnalyticsModule_1 (ref), fFlagCreateConnectionsHub (ref), useGetConversationsModule (ref), shouldReadConversationListFromSignalsStore (ref), useConversationListModule (ref), useEffect (ref), getConversationIdsModule (ref), name (ref), httpService (ref), usePrevious (ref), fetchConversationsByPageModule (ref), reactModule (ref), getOtherParticipantsModule (ref), useIsUserPendingModule (ref), conversationChannelsModule (ref), getConversationTitleModule (ref), useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), chatLandingTelemetryStateModule (ref), useEffectOnMount (ref), chatLandingTelemetryEventsModule (ref), useLocalization (ref), fFlagFriendsChatPlaceholderRenameFix (ref), useCallback (ref), partyPageCarouselExperimentation (ref), eventNamesModule (ref), var1 (ref), var2 (ref), enumScreensModule (ref), createConversationModule (ref), parseCreateConversationErrorsModule (ref), createConversationErrorModule (ref), useSelector (ref), useIsExternalNavigationAvailableModule (ref), fFlagAppIaScrollAway (ref), appNavBarModule (ref), useCanAccessPartyModule (ref), squadQuickStartExperimentation (ref), chatLoadingContainerModule (ref), noFriendsView (ref), emptyStateTypeModule (ref), appPage (ref), fFlagConnectionsToFriendsRename (ref), noConversationsLandingModule (ref), conversationListWithTopBarModule (ref), signalsMigrationConfigModule (ref), fFlagEnableScrollAwayContentScrollableFix (ref), visibilityControl (ref), getFFlagChatTabHideGroupsLinkOnVRModule (ref), isVRAppBuild (ref), fFlagAppChatTopBarSignalsStoreModule (ref), getTopBarStoreModule (ref), conversationGroupsEntryContainerModule (ref), useChatIsVisibleModule (ref), fFlagSignalsNavP3hMisc (ref)
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
	local var21 = useAnalyticsModule_1()
	local var22 = 64 + 2 * useTextSizeOffset()
	local var23 = if fFlagCreateConnectionsHub then var19.getScreenProps("navigateToLuaAppPages", {}) else nil
	local var24 = useGetConversationsModule()
	local t_1 = {}
	local t_2 = {}
	
	if shouldReadConversationListFromSignalsStore then
		local var25 = useConversationListModule(true)
		t_1 = var25.items
		t_2 = var25.listStatus
	end
	local var26
	local var27 = if shouldReadConversationListFromSignalsStore then t_1 else var24
	
	if shouldReadConversationListFromSignalsStore then
		var26 = t_2.isFetchingConversations == true
		var26 = nil
	else
		var26 = var15
	end
	local var28
	if shouldReadConversationListFromSignalsStore then
		var28 = #t_1 > 0
		var28 = nil
	else
		var28 = var16
	end
	local var29
	if shouldReadConversationListFromSignalsStore then
		var29 = t_2.oldestConversationIsFetched == true
		var29 = nil
	else
		var29 = var17
	end
	if shouldReadConversationListFromSignalsStore then
		useEffect(function()
			-- upvalues: var24 (ref), t_1 (write), getConversationIdsModule (copy), name (copy), httpService (copy)
			if #var24 == 0 and #t_1 == 0 then return end
			local var30, ok, ok_1
			local var31 = getConversationIdsModule(var24)
			local var32 = getConversationIdsModule(t_1)
			
			if #var31 == #var32 then
				for ok, ok_1 in var31 do
					if ok_1 ~= var32[ok] then
						var30 = false
					end
				end
				var30 = true
			else
				var30 = false
			end
			if not var30 then
				var30 = name
				local var33 = "Conversation list parity mismatch. Rodux ids: {}, Signals ids: {}"
				ok, ok_1 = pcall(function()
					-- upvalues: httpService (copy), var31 (ref)
					return httpService:JSONEncode(var31)
				end)
				local var34 = if ok then ok_1 else "[]"
				ok_1, status_1 = pcall(function()
					-- upvalues: httpService (copy), var32 (ref)
					return httpService:JSONEncode(var32)
				end)
				var30:warning(var33, var34, if ok_1 then status_1 else "[]")
			end
		end, { var24, t_1 })
	end
	local var30 = usePrevious(var7)
	useEffect(function()
		-- upvalues: name (copy), var30 (ref), var7 (ref), var6 (ref), fetchConversationsByPageModule (copy)
		name:debug("Comparing previousIsChatEnabled ({}) --> isChatEnabled ({})", var30, var7)
		
		if var30 ~= nil and var30 ~= var7 and var7 then
			name:info("Chat has become enabled, fetching conversations")
			var6(fetchConversationsByPageModule())
		end
	end, { var6, var7, var30 })
	local var31, var32, var33 = reactModule.useMemo(function()
		-- upvalues: var27 (ref), shouldReadConversationListFromSignalsStore (copy), cryoModule (copy), getOtherParticipantsModule (copy), var18 (ref), useIsUserPendingModule (copy), conversationChannelsModule (copy), getConversationTitleModule (copy), var8 (ref)
		local var34 = 0
		local var35 = 0
		local t = {}
		
		for i, v in var27 do
			local var36 = if shouldReadConversationListFromSignalsStore and v.otherParticipants == nil then cryoModule.Dictionary.join(v, { otherParticipants = getOtherParticipantsModule(v, var18) }) else v
			
			if useIsUserPendingModule(var36) then
				var34 += 1
			end
			if var36.moderationType == conversationChannelsModule.ModerationType.TrustedComms then
				var35 += 1
			end
			local var37 = getConversationTitleModule(var36)
			
			if var8 or var36.conversationType ~= "MultiUserConversation" then
				table.insert(t, cryoModule.Dictionary.join(var36, { title = var37 }))
			end
		end
		return t, var34, var35
	end, {
		var27,
		var8,
		if shouldReadConversationListFromSignalsStore then var18 else nil
	})
	local var38 = useTelemetryModule(chatLandingTelemetryLayerModule.Context)
	local emit = var38.emit
	
	if shouldReadConversationListFromSignalsStore then
		local var39 = reactModule.useRef(var38.emit)
		var39.current = var38.emit
		
		emit = function(...)
			-- upvalues: var39 (ref)
			var39.current(...)
		end
	end
	local frame
	local var40 = chatLandingTelemetryStateModule.useSetState()
	useEffect(function()
		-- upvalues: var40 (ref), cryoModule (copy), var31 (ref), var32 (ref), var33 (ref)
		var40(function(p4)
			-- upvalues: cryoModule (copy), var31 (copy), var32 (copy), var33 (copy)
			return cryoModule.Dictionary.join(p4, {
				chatLandingListCount = #var31,
				pendingConversationCount = var32,
				unfilteredConversationCount = var33
			})
		end)
	end, { #var31, var32, var33, var40 })
	useEffectOnMount(function()
		-- upvalues: var38 (ref), chatLandingTelemetryEventsModule (copy), var7 (ref)
		var38.emit(chatLandingTelemetryEventsModule.ScreenRendered, { isChatEnabled = var7 })
	end)
	local var41 = useLocalization({
		networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong",
		chatUnavailableWithUser = if fFlagFriendsChatPlaceholderRenameFix then "Feature.Chat.Message.ChatUnavailableWithUser" else "Feature.Chat.Message.PartyUnavailableWithUser"
	})
	local var42 = useCallback(function()
		-- upvalues: partyPageCarouselExperimentation (copy), httpService (copy), var4 (ref), eventNamesModule (copy), var5 (ref), var1 (copy), var2 (copy), var19 (ref), enumScreensModule (copy)
		if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
			local var43 = httpService:GenerateGUID(false)
			var4.fireAnalyticsEvent(eventNamesModule.ChatLandingPartyQuickStartButtonClicked, {
				clickLocation = var5.chatPlacement,
				partyAttemptId = var43,
				placeId = var1,
				universeId = var2
			})
			var19.navigate(enumScreensModule.QuickStartSquadInviteFriends, { uuid = var43 })
		end
	end, {
		var4,
		var5,
		var19,
		var1,
		var2
	})
	local var43 = useCallback(function(p4)
		-- upvalues: partyPageCarouselExperimentation (copy), var6 (ref), createConversationModule (copy), var21 (ref), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), var19 (ref), enumScreensModule (copy), parseCreateConversationErrorsModule (copy), var41 (ref), eventNamesModule (copy), createConversationErrorModule (copy)
		if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
			var6(createConversationModule("one_to_one", { p4 }, var21, "navigateToConversationFromSocialCarousel")):andThen(function(p5)
				-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), var19 (copy), enumScreensModule (copy)
				if fFlagAppChatPerfTrackingModule then
					appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = p5.id })
				end
				var19.navigate(enumScreensModule.ChatConversation, { conversationId = p5.id })
			end):catch(function(p5)
				-- upvalues: parseCreateConversationErrorsModule (copy), var41 (copy), var19 (copy), enumScreensModule (copy), var21 (copy), eventNamesModule (copy), createConversationErrorModule (copy)
				var19.navigate(enumScreensModule.RoactChatToast, {
					toastProps = {
						toastContent = {
							toastTitle = if parseCreateConversationErrorsModule(p5) == "participant_chat_disabled" then var41.chatUnavailableWithUser else var41.networkErrorText
						}
					}
				})
				
				if var21 then
					var21.fireAnalyticsEvent(eventNamesModule.NewConversationCreated, {
						createConversationResult = createConversationErrorModule.FetchConversationError
					})
				end
			end)
		end
	end, {
		var6,
		var41,
		parseCreateConversationErrorsModule,
		var19,
		var21
	})
	local var44 = cryoModule.isEmpty(var31)
	local var45 = useSelector(function(p4)
		return p4.ChatAppReducer.ChatSettings.retrievalStatus ~= "Done"
	end) or (if var44 then var26 else var44 and var28)
	local _ = nil
	local var46 = false
	local var47 = false
	local var48 = false
	local var49 = useIsExternalNavigationAvailableModule({
		enumScreensModule.AddFriends,
		enumScreensModule.PrivacySettings,
		enumScreensModule.Groups
	})
	local var50 = fFlagAppIaScrollAway and (not var12 and appNavBarModule.getScrollAwayEnabled())
	local var51 = useCanAccessPartyModule()
	local var52 = squadQuickStartExperimentation.getPartyQuickStartChangesEnabled() and var51
	
	if var45 then
		frame = reactModule.createElement(chatLoadingContainerModule, {
			cellWidth = 375,
			topBarHeight = var3.topBarHeight,
			pageHeaderText = var3.pageHeaderText,
			cellHeight = var22,
			topPadding = if fFlagAppIaScrollAway and var50 then var3.topBarHeight else nil
		})
		var46 = true
	elseif var7 and (not var44 or not var14 or var26) then
		local filterText = `conversationListWithTopBar{var3.filterText}`
		var46 = true
		var47 = true
		var48 = true
		frame = reactModule.createElement(conversationListWithTopBarModule, cryoModule.Dictionary.join(var3, {
			filterText = if var3.isShowingFilterBox then var3.filterText else nil,
			key = filterText,
			itemList = var31,
			appLoaded = var14,
			localUserId = var18,
			conversationsIsFetching = var26,
			oldestConversationIsFetched = var29,
			entryHeight = var22,
			isInExperience = var12,
			isWideMode = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() or signalsMigrationConfigModule.shouldUseFoundationConversationRow then var13 else nil,
			navigateToConversationFromUserId = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then var43 else nil,
			navigateToQuickStartSquadInviteFriends = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then var42 else nil,
			showGroupsLink = var49[enumScreensModule.Groups],
			canvasTopPadding = if fFlagAppIaScrollAway and var50 then var3.topBarHeight else nil,
			canAccessParty = var51,
			isPartyQuickStartEnabled = var52
		}))
	elseif var7 then
		frame = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = var20.Theme.BackgroundDefault.Color,
			BackgroundTransparency = var20.Tokens.Color.None.Transparency
		}, {
			NoFriendsView = reactModule.createElement(noFriendsView, {
				pageRenderReport = function()
					-- upvalues: var38 (ref), chatLandingTelemetryEventsModule (copy), emptyStateTypeModule (copy)
					var38.emit(chatLandingTelemetryEventsModule.ChatEmptyStateScreenRendered, { emptyStateType = emptyStateTypeModule.NoFriendsView })
				end,
				openAddFriendsPage = function()
					-- upvalues: var38 (ref), chatLandingTelemetryEventsModule (copy), fFlagCreateConnectionsHub (copy), var23 (ref), appPage (copy), var3 (ref)
					var38.emit(chatLandingTelemetryEventsModule.ChatAddFriendsBtnClicked, {})
					
					if fFlagCreateConnectionsHub then
						var23[appPage.CoHubAddConnections]()
						
						return
					end
					var3.navigateToAddFriends()
				end,
				noFriendsHeaderKey = if fFlagConnectionsToFriendsRename then "Feature.Chat.Label.AddFriends" else "Feature.Chat.Label.AddConnections",
				noFriendsTextLabelKey = if fFlagConnectionsToFriendsRename then "Feature.Chat.Text.NoFriends" else "Feature.Chat.Text.NoConnections",
				addFriendsBtnLabelKey = if fFlagConnectionsToFriendsRename then "Feature.Chat.Label.AddFriends" else "Feature.Chat.Label.AddConnections",
				addFriendsBtnEnabled = var49[enumScreensModule.AddFriends]
			})
		})
		var46 = true
	else
		frame = reactModule.createElement(noConversationsLandingModule, {
			chatEnabled = var7,
			privacySettingsEnabled = var9,
			globalRulesEnabled = var10,
			thirdPartyPrivacySettingsEnabled = var11,
			canNavigateToPrivacySettings = var49[enumScreensModule.PrivacySettings],
			canNavigateToAddFriends = var49[enumScreensModule.AddFriends],
			onCallToAction = function(p4)
				-- upvalues: var3 (ref), var38 (ref), chatLandingTelemetryEventsModule (copy), fFlagCreateConnectionsHub (copy), var23 (ref), appPage (copy)
				if p4 == "privacy" then
					var3.navigateToPrivacy()
					
					return
				elseif p4 == "friends" then
					var38.emit(chatLandingTelemetryEventsModule.ChatAddFriendsBtnClicked, {})
					
					if fFlagCreateConnectionsHub then
						var23[appPage.CoHubAddConnections]()
						
						return
					end
					var3.navigateToAddFriends()
				end
			end,
			fireRenderEvent = function(p4)
				-- upvalues: emptyStateTypeModule (copy), var38 (ref), chatLandingTelemetryEventsModule (copy)
				var38.emit(chatLandingTelemetryEventsModule.ChatEmptyStateScreenRendered, {
					emptyStateType = if p4 == "friends" then emptyStateTypeModule.NoFriendsView elseif p4 == "privacy" then emptyStateTypeModule.ChatSettingsDisabledView elseif p4 == "regional" then emptyStateTypeModule.ChatUnavailableRegionView else emptyStateTypeModule.EmptyConversationList
				})
			end
		})
	end
	if fFlagAppIaScrollAway and fFlagEnableScrollAwayContentScrollableFix then
		useEffect(function()
			-- upvalues: var50 (ref), visibilityControl (copy), var48 (write)
			if var50 then
				visibilityControl.setContentScrollable(var48)
				
				return
			end
		end, { var48, var50 })
	end
	if getFFlagChatTabHideGroupsLinkOnVRModule() and isVRAppBuild() then
		var46 = true
	end
	if fFlagAppChatTopBarSignalsStoreModule then
		useEffect(function()
			-- upvalues: var12 (ref), getTopBarStoreModule (copy), enumScreensModule (copy), var47 (write)
			if var12 then
				getTopBarStoreModule(false).setScreenTopBar(enumScreensModule.ChatLanding, { rightHidden = not var47 })
			end
		end, { var47, var12 })
	else
		local setScreenTopBar = var19.getScreenProps("setScreenTopBar", function() end)
		useEffect(function()
			-- upvalues: var12 (ref), setScreenTopBar (ref), enumScreensModule (copy), var47 (write)
			if var12 then
				setScreenTopBar(enumScreensModule.ChatLanding, { rightHidden = not var47 })
			end
		end, { var47, setScreenTopBar, var12 })
	end
	local _ = nil
	local var53 = if not var46 and var49[enumScreensModule.Groups] then reactModule.createElement(reactModule.Fragment, nil, {
		UIPadding = if fFlagAppIaScrollAway and var50 then reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var3.topBarHeight) }) else nil,
		groupsLink = reactModule.createElement(conversationGroupsEntryContainerModule, { entryHeight = var22 }),
		chatFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, -var22),
			Position = UDim2.new(0, 0, 0, var22)
		}, { chatContainer = frame })
	}) else frame
	local var54 = useChatIsVisibleModule()
	reactModule.useEffect(function()
		-- upvalues: var54 (ref), emit (write), chatLandingTelemetryEventsModule (copy), var7 (ref), var45 (ref)
		if var54 then
			emit(chatLandingTelemetryEventsModule.AppChatVisible, { isChatEnabled = var7, isChatLoading = var45 })
		end
	end, { var54, var7, var45 })
	
	if fFlagAppChatPerfTrackingModule then
		reactModule.useEffect(function()
			-- upvalues: var54 (ref), var45 (ref), var7 (ref), name (copy), var31 (ref), appChatPerfTrackerModule (copy)
			if not var54 then return end
			local var55 = not var45 and var7
			name:debug("TTI Ready Check (ChatLanding): isLoading={}, isChatEnabled={}, itemCount={}, ready={}", var45, var7, #var31, var55)
			
			if var55 and appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.ChatLandingTTI) then
				appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.ChatLandingTTI, { numElementsRendered = #var31 })
			end
		end, { var54, var45, var7, #var31 })
	end
	local var55 = reactModule.useRef({ isChatEnabled = var7, isChatLoading = var45 })
	reactModule.useEffect(function()
		-- upvalues: var55 (ref), var7 (ref), var45 (ref)
		var55.current = { isChatEnabled = var7, isChatLoading = var45 }
	end, { var7, var45 })
	useEffect(function()
		-- upvalues: var54 (ref), emit (write), chatLandingTelemetryEventsModule (copy), var55 (ref)
		return function()
			-- upvalues: var54 (copy), emit (copy), chatLandingTelemetryEventsModule (copy), var55 (copy)
			if var54 then
				emit(chatLandingTelemetryEventsModule.AppChatClosed, var55.current)
			end
		end
	end, { var54 })
	
	if not fFlagSignalsNavP3hMisc then
		return var53
	end
	local var56 = reactModule.useRef(nil)
	
	if var54 or var56.current == nil then
		var56.current = var53
	end
	return var56.current
end

return compose(roactRoduxModule.connect(nil, mapDispatchToPropsModule), roactPaginator.connect(function()
	return { pageSize = 30 }
end))(ChatLandingContainer)