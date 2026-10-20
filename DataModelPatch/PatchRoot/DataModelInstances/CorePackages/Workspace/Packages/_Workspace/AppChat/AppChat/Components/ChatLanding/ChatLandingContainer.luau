local HttpService = game:GetService("HttpService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppNavBarModule = require(Parent.AppNavBar)
local VisibilityControl = AppNavBarModule.VisibilityControl
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local SharedFlagsModule = require(Parent.SharedFlags)
local UIBloxModule = require(Parent.UIBlox)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectOnMountFunction = require(Parent.RoactUtils).Hooks.useEffectOnMount
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UsePreviousFunction = require(Parent.RoactUtils).Hooks.usePrevious
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local AppPage = require(Parent.RobloxAppEnums).AppPage
local ChatLoadingContainerModule = require(script.Parent.ChatLoading.ChatLoadingContainer)
local ChatLandingTelemetryEventsModule = require(script.Parent.ChatLandingTelemetryEvents)
local ConversationGroupsEntryContainerModule = require(script.Parent.ConversationGroupsEntryContainer)
local ConversationListWithTopBarModule = require(script.Parent.ConversationListWithTopBar)
local NewResult = require(script.Parent.Logger):new(script.Name)
local NoConversationsLandingModule = require(script.Parent.NoConversationsLanding)
local MapDispatchToPropsModule = require(script.Parent.mapDispatchToProps)
local ChatLandingTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ChatLandingTelemetryStateModule = require(AppChat.Contexts.TelemetryState.ChatLandingTelemetryState)
local ComposeFunction = require(AppChat.SocialLibraries).RoduxTools.compose
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local CreateConversationModule = require(AppChat.Conversations.Thunks.createConversation)
local CreateConversationErrorModule = require(AppChat.Analytics.Enums.CreateConversationError)
local EmptyStateTypeModule = require(AppChat.Analytics.Enums.EmptyStateType)
local EnumScreensModule = require(AppChat.EnumScreens)
local EventNamesModule = require(AppChat.Analytics.EventNames)
local FetchConversationsByPageModule = require(AppChat.Conversations.Thunks.fetchConversationsByPage)
local GetConversationTitleModule = require(AppChat.Conversations.getConversationTitle)
local GetOtherParticipantsModule = require(AppChat.Conversations.getOtherParticipants)
local ParseCreateConversationErrorsModule = require(AppChat.Conversations.Thunks.parseCreateConversationErrors)
local RoactPaginator = require(AppChat.SocialLibraries).RoactPaginator
local UseAnalyticsModule = require(AppChat.Analytics.useAnalytics)
local UseChatPlacementContextFunction = require(AppChat.Contexts.ChatPlacementContext).useChatPlacementContext
local UseGetConversationsModule = require(AppChat.Hooks.useGetConversations)
local UseAreConversationsFetchingModule = require(AppChat.Hooks.useAreConversationsFetching)
local UseChatIsVisibleModule = require(AppChat.Hooks.useChatIsVisible)
local UseHasConversationsModule = require(AppChat.Hooks.useHasConversations)
local UseAppChatIsWideModeModule = require(AppChat.Hooks.useAppChatIsWideMode)
local UseIsAppLoadedModule = require(AppChat.Hooks.useIsAppLoaded)
local UseIsChatEnabledModule = require(AppChat.Hooks.useIsChatEnabled)
local UseIsExternalNavigationAvailableModule = require(AppChat.Hooks.useIsExternalNavigationAvailable)
local UseIsGroupChatEnabledModule = require(AppChat.Hooks.useIsGroupChatEnabled)
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local UseIsOldestConversationFetchedModule = require(AppChat.Hooks.useIsOldestConversationFetched)
local UseIsUserPendingModule = require(AppChat.Hooks.useIsUserPending)
local UseIsChatEnabledFromReasonModule = require(AppChat.Hooks.useIsChatEnabledFromReason)
local UseAnalyticsModule1 = require(AppChat.Analytics.useAnalytics)
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local GetConversationIdsModule = require(AppChat.Utils.getConversationIds)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagAppChatMessageTTIMilestonesModule = require(AppChat.Flags.FFlagAppChatMessageTTIMilestones)
local FFlagAppChatUseNewConversationRowModule = require(AppChat.Flags.FFlagAppChatUseNewConversationRow)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local IsVRAppBuildFunction = require(Parent.AppCommonLib).IsVRAppBuild
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local NoFriendsView = require(Parent.FriendsLanding.Components).NoFriendsView
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagEnableScrollAwayContentScrollableFix = SharedFlagsModule.FFlagEnableScrollAwayContentScrollableFix
local FFlagAppChatConversationStoreModule = require(AppChat.Flags.FFlagAppChatConversationStore)
local FFlagAppChatSignalsMessageStoreModule = require(AppChat.Flags.FFlagAppChatSignalsMessageStore)
local GetFFlagChatTabHideGroupsLinkOnVRModule = require(AppChat.Flags.getFFlagChatTabHideGroupsLinkOnVR)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local FFlagAppChatTopBarSignalsStoreModule = require(AppChat.Flags.FFlagAppChatTopBarSignalsStore)
local PartyPageCarouselExperimentation = require(Parent.SocialExperiments).PartyPageCarouselExperimentation
local FFlagCreateConnectionsHub = require(Parent.SharedFlags).FFlagCreateConnectionsHub
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local SquadQuickStartExperimentation = require(Parent.SocialExperiments).SquadQuickStartExperimentation
local UseCanAccessPartyModule = require(Parent.Squads.useCanAccessParty)
local UseConversationListModule = require(AppChat.Hooks.useConversationList)
local FFlagAppChatSignalsMessageStoreModule1 = FFlagAppChatUseNewConversationRowModule and (FFlagAppChatConversationStoreModule and FFlagAppChatSignalsMessageStoreModule)
local Text = if game.PlaceId > 0 then tostring(game.PlaceId) else nil
local Text1 = if game.GameId > 0 then tostring(game.GameId) else nil
local config = {
	topBarHeight = 0,
	isShowingFilterBox = false,
	navigateToSquadLobby = function() end
}

local function _(List, p1): boolean
	if #List ~= #p1 then
		return false
	end
	for i, value in List do
		if value ~= p1[i] then
			return false
		end
	end
	return true
end

local _ = function(p2)
	-- upvalues: HttpService (copy)
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), p2 (copy)
		return HttpService:JSONEncode(p2)
	end)
	
	return if Success then Result else "[]"
end

function ChatLandingContainer(p2)
	-- upvalues: CryoModule (copy), config (copy), UseAnalyticsModule (copy), UseChatPlacementContextFunction (copy), UseDispatchFunction (copy), UseIsChatEnabledModule (copy), UseIsGroupChatEnabledModule (copy), UseIsChatEnabledFromReasonModule (copy), UseIsInExperienceModule (copy), UseAppChatIsWideModeModule (copy), FFlagAppChatPerfTrackingModule (copy), FFlagAppChatMessageTTIMilestonesModule (copy), AppChatPerfTrackerModule (copy), UseIsAppLoadedModule (copy), UseAreConversationsFetchingModule (copy), UseHasConversationsModule (copy), UseIsOldestConversationFetchedModule (copy), UseLocalUserIdFunction (copy), UseNavigationFunction (copy), UseStyleFunction (copy), UseTextSizeOffsetFunction (copy), UseAnalyticsModule1 (copy), FFlagCreateConnectionsHub (copy), UseGetConversationsModule (copy), FFlagAppChatSignalsMessageStoreModule1 (copy), UseConversationListModule (copy), UseEffectFunction (copy), GetConversationIdsModule (copy), NewResult (copy), HttpService (copy), UsePreviousFunction (copy), FetchConversationsByPageModule (copy), ReactModule (copy), GetOtherParticipantsModule (copy), UseIsUserPendingModule (copy), ConversationChannelsModule (copy), GetConversationTitleModule (copy), UseTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), ChatLandingTelemetryStateModule (copy), UseEffectOnMountFunction (copy), ChatLandingTelemetryEventsModule (copy), UseLocalizationFunction (copy), UseCallbackFunction (copy), PartyPageCarouselExperimentation (copy), EventNamesModule (copy), Text (copy), Text1 (copy), EnumScreensModule (copy), CreateConversationModule (copy), ParseCreateConversationErrorsModule (copy), CreateConversationErrorModule (copy), UseSelectorFunction (copy), UseIsExternalNavigationAvailableModule (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), UseCanAccessPartyModule (copy), SquadQuickStartExperimentation (copy), ChatLoadingContainerModule (copy), NoFriendsView (copy), EmptyStateTypeModule (copy), AppPage (copy), FFlagConnectionsToFriendsRename (copy), NoConversationsLandingModule (copy), ConversationListWithTopBarModule (copy), FFlagAppChatUseNewConversationRowModule (copy), FFlagEnableScrollAwayContentScrollableFix (copy), VisibilityControl (copy), GetFFlagChatTabHideGroupsLinkOnVRModule (copy), IsVRAppBuildFunction (copy), FFlagAppChatTopBarSignalsStoreModule (copy), GetTopBarStoreModule (copy), ConversationGroupsEntryContainerModule (copy), UseChatIsVisibleModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p2)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseChatPlacementContextResult = UseChatPlacementContextFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseIsChatEnabledModuleResult = UseIsChatEnabledModule()
	local UseIsGroupChatEnabledModuleResult = UseIsGroupChatEnabledModule()
	local PrivacySettingsEnabled = UseIsChatEnabledFromReasonModule("privacySettingsEnabled")
	local GlobalRulesEnabled = UseIsChatEnabledFromReasonModule("globalRulesEnabled")
	local ThirdPartyPrivacySettingsEnabled = UseIsChatEnabledFromReasonModule("thirdPartyPrivacySettingsEnabled")
	local UseIsInExperienceModuleResult = UseIsInExperienceModule()
	local UseAppChatIsWideModeModuleResult = UseAppChatIsWideModeModule(UseIsInExperienceModuleResult)
	
	if FFlagAppChatPerfTrackingModule and FFlagAppChatMessageTTIMilestonesModule and AppChatPerfTrackerModule.Hooks then
		AppChatPerfTrackerModule.Hooks.useTTIRenderAndMountedTracking(AppChatPerfTrackerModule.getEventName(AppChatPerfTrackerModule.Events.ChatLandingTTI) or "")
	end
	local UseIsAppLoadedModuleResult = UseIsAppLoadedModule()
	local UseAreConversationsFetchingModuleResult = UseAreConversationsFetchingModule()
	local UseHasConversationsModuleResult = UseHasConversationsModule()
	local UseIsOldestConversationFetchedModuleResult = UseIsOldestConversationFetchedModule()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseStyleResult = UseStyleFunction()
	local UseTextSizeOffsetResult: number = UseTextSizeOffsetFunction()
	local UseAnalyticsModuleResult1 = UseAnalyticsModule1()
	local YOffset = 64 + 2 * UseTextSizeOffsetResult
	local NavigateToLuaAppPagesScreenProps = if FFlagCreateConnectionsHub then UseNavigationResult.getScreenProps("navigateToLuaAppPages", {}) else nil
	local UseGetConversationsModuleResult = UseGetConversationsModule()
	local Items = {}
	local ListStatus = {}
	
	if FFlagAppChatSignalsMessageStoreModule1 then
		local UseConversationListModuleResult = UseConversationListModule(true)
		Items = UseConversationListModuleResult.items
		ListStatus = UseConversationListModuleResult.listStatus
	end
	local Items1 = if FFlagAppChatSignalsMessageStoreModule1 then Items else UseGetConversationsModuleResult
	local IsIsFetchingConversations = if FFlagAppChatSignalsMessageStoreModule1 then ListStatus.isFetchingConversations == true else UseAreConversationsFetchingModuleResult
	local UseHasConversationsModuleResult1 = if FFlagAppChatSignalsMessageStoreModule1 then #Items > 0 else UseHasConversationsModuleResult
	local IsOldestConversationIsFetched = if FFlagAppChatSignalsMessageStoreModule1 then ListStatus.oldestConversationIsFetched == true else UseIsOldestConversationFetchedModuleResult
	
	if FFlagAppChatSignalsMessageStoreModule1 then
		UseEffectFunction(function()
			-- upvalues: UseGetConversationsModuleResult (copy), Items (ref), GetConversationIdsModule (upval), NewResult (upval), HttpService (upval)
			if #UseGetConversationsModuleResult == 0 and #Items == 0 then return end
			local ConversationIdsModule = GetConversationIdsModule(UseGetConversationsModuleResult)
			local ConversationIdsModule1 = GetConversationIdsModule(Items)
			local Flag = nil
			
			if #ConversationIdsModule == #ConversationIdsModule1 then
				Flag = true
				
				for i, value in ConversationIdsModule do
					if value ~= ConversationIdsModule1[i] then
						Flag = false
						break
					end
				end
			else
				Flag = false
			end
			if not Flag then
				local v1 = "Conversation list parity mismatch. Rodux ids: {}, Signals ids: {}"
				local Success, Result = pcall(function()
					-- upvalues: HttpService (upval), ConversationIdsModule (copy)
					return HttpService:JSONEncode(ConversationIdsModule)
				end)
				local Result1 = if Success then Result else "[]"
				local Success1, Result2 = pcall(function()
					-- upvalues: HttpService (upval), ConversationIdsModule1 (copy)
					return HttpService:JSONEncode(ConversationIdsModule1)
				end)
				NewResult:warning(v1, Result1, if Success1 then Result2 else "[]")
			end
		end, { UseGetConversationsModuleResult, Items })
	end
	local UsePreviousResult = UsePreviousFunction(UseIsChatEnabledModuleResult)
	UseEffectFunction(function()
		-- upvalues: NewResult (upval), UsePreviousResult (copy), UseIsChatEnabledModuleResult (copy), UseDispatchResult (copy), FetchConversationsByPageModule (upval)
		NewResult:debug("Comparing previousIsChatEnabled ({}) --> isChatEnabled ({})", UsePreviousResult, UseIsChatEnabledModuleResult)
		
		if UsePreviousResult ~= nil and UsePreviousResult ~= UseIsChatEnabledModuleResult and UseIsChatEnabledModuleResult then
			NewResult:info("Chat has become enabled, fetching conversations")
			UseDispatchResult(FetchConversationsByPageModule())
		end
	end, {
		UseDispatchResult,
		UseIsChatEnabledModuleResult,
		UsePreviousResult
	})
	local UseMemoResult, UseMemoResult2, UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: Items1 (copy), FFlagAppChatSignalsMessageStoreModule1 (upval), CryoModule (upval), GetOtherParticipantsModule (upval), UseLocalUserIdResult (copy), UseIsUserPendingModule (upval), ConversationChannelsModule (upval), GetConversationTitleModule (upval), UseIsGroupChatEnabledModuleResult (copy)
		local Count = 0
		local Count1 = 0
		local JoinResults = {}
		
		for _, value in Items1 do
			local JoinResult = if FFlagAppChatSignalsMessageStoreModule1 and value.otherParticipants == nil then CryoModule.Dictionary.join(value, {
				otherParticipants = GetOtherParticipantsModule(value, UseLocalUserIdResult)
			}) else value
			
			if UseIsUserPendingModule(JoinResult) then
				Count += 1
			end
			if JoinResult.moderationType == ConversationChannelsModule.ModerationType.TrustedComms then
				Count1 += 1
			end
			local ConversationTitleModule = GetConversationTitleModule(JoinResult)
			
			if UseIsGroupChatEnabledModuleResult or JoinResult.conversationType ~= "MultiUserConversation" then
				table.insert(JoinResults, CryoModule.Dictionary.join(JoinResult, { title = ConversationTitleModule }))
			end
		end
		return JoinResults, Count, Count1
	end, {
		Items1,
		UseIsGroupChatEnabledModuleResult,
		if FFlagAppChatSignalsMessageStoreModule1 then UseLocalUserIdResult else nil
	})
	local UseTelemetryModuleResult = UseTelemetryModule(ChatLandingTelemetryLayerModule.Context)
	local EmitFunction = UseTelemetryModuleResult.emit
	
	if FFlagAppChatSignalsMessageStoreModule1 then
		local UseRefResult = ReactModule.useRef(UseTelemetryModuleResult.emit)
		UseRefResult.current = UseTelemetryModuleResult.emit
		
		EmitFunction = function(...)
			-- upvalues: UseRefResult (copy)
			UseRefResult.current(...)
		end
	end
	local UseSetStateResult = ChatLandingTelemetryStateModule.useSetState()
	UseEffectFunction(function()
		-- upvalues: UseSetStateResult (copy), CryoModule (upval), UseMemoResult (copy), UseMemoResult2 (copy), UseMemoResult3 (copy)
		UseSetStateResult(function(p3)
			-- upvalues: CryoModule (upval), UseMemoResult (upval), UseMemoResult2 (upval), UseMemoResult3 (upval)
			return CryoModule.Dictionary.join(p3, {
				chatLandingListCount = #UseMemoResult,
				pendingConversationCount = UseMemoResult2,
				unfilteredConversationCount = UseMemoResult3
			})
		end)
	end, {
		#UseMemoResult,
		UseMemoResult2,
		UseMemoResult3,
		UseSetStateResult
	})
	UseEffectOnMountFunction(function()
		-- upvalues: UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval), UseIsChatEnabledModuleResult (copy)
		UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule.ScreenRendered, { isChatEnabled = UseIsChatEnabledModuleResult })
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		partyUnavailableWithUser = "Feature.Chat.Message.PartyUnavailableWithUser",
		networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong"
	})
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: PartyPageCarouselExperimentation (upval), HttpService (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseChatPlacementContextResult (copy), Text (upval), Text1 (upval), UseNavigationResult (copy), EnumScreensModule (upval)
		if PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
			local Guid = HttpService:GenerateGUID(false)
			UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.ChatLandingPartyQuickStartButtonClicked, {
				clickLocation = UseChatPlacementContextResult.chatPlacement,
				partyAttemptId = Guid,
				placeId = Text,
				universeId = Text1
			})
			UseNavigationResult.navigate(EnumScreensModule.QuickStartSquadInviteFriends, { uuid = Guid })
		end
	end, {
		UseAnalyticsModuleResult,
		UseChatPlacementContextResult,
		UseNavigationResult,
		Text,
		Text1
	})
	local UseCallbackResult1 = UseCallbackFunction(function(p3)
		-- upvalues: PartyPageCarouselExperimentation (upval), UseDispatchResult (copy), CreateConversationModule (upval), UseAnalyticsModuleResult1 (copy), FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval), UseNavigationResult (copy), EnumScreensModule (upval), ParseCreateConversationErrorsModule (upval), UseLocalizationResult (copy), EventNamesModule (upval), CreateConversationErrorModule (upval)
		if PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
			UseDispatchResult(CreateConversationModule("one_to_one", { p3 }, UseAnalyticsModuleResult1, "navigateToConversationFromSocialCarousel")):andThen(function(Result)
				-- upvalues: FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval), UseNavigationResult (upval), EnumScreensModule (upval)
				if FFlagAppChatPerfTrackingModule then
					AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = Result.id })
				end
				UseNavigationResult.navigate(EnumScreensModule.ChatConversation, { conversationId = Result.id })
			end):catch(function(Err)
				-- upvalues: ParseCreateConversationErrorsModule (upval), UseLocalizationResult (upval), UseNavigationResult (upval), EnumScreensModule (upval), UseAnalyticsModuleResult1 (upval), EventNamesModule (upval), CreateConversationErrorModule (upval)
				UseNavigationResult.navigate(EnumScreensModule.RoactChatToast, {
					toastProps = {
						toastContent = {
							toastTitle = if ParseCreateConversationErrorsModule(Err) == "participant_chat_disabled" then UseLocalizationResult.partyUnavailableWithUser else UseLocalizationResult.networkErrorText
						}
					}
				})
				
				if UseAnalyticsModuleResult1 then
					UseAnalyticsModuleResult1.fireAnalyticsEvent(EventNamesModule.NewConversationCreated, {
						createConversationResult = CreateConversationErrorModule.FetchConversationError
					})
				end
			end)
		end
	end, {
		UseDispatchResult,
		UseLocalizationResult,
		ParseCreateConversationErrorsModule,
		UseNavigationResult,
		UseAnalyticsModuleResult1
	})
	local IsEmpty = CryoModule.isEmpty(UseMemoResult)
	local UseSelectorResult = UseSelectorFunction(function(p3): boolean
		return p3.ChatAppReducer.ChatSettings.retrievalStatus ~= "Done"
	end) or (IsEmpty and IsIsFetchingConversations or IsEmpty and UseHasConversationsModuleResult1)
	local Flag = false
	local Flag1 = false
	local Flag2 = false
	local UseIsExternalNavigationAvailableModuleResult = UseIsExternalNavigationAvailableModule({
		EnumScreensModule.AddFriends,
		EnumScreensModule.PrivacySettings,
		EnumScreensModule.Groups
	})
	local ScrollAwayEnabled = FFlagAppIaScrollAway and (not UseIsInExperienceModuleResult and AppNavBarModule.getScrollAwayEnabled())
	local UseCanAccessPartyModuleResult = UseCanAccessPartyModule()
	local UseCanAccessPartyModuleResult1 = SquadQuickStartExperimentation.getPartyQuickStartChangesEnabled() and UseCanAccessPartyModuleResult
	local Element = nil
	
	if UseSelectorResult then
		Element = ReactModule.createElement(ChatLoadingContainerModule, {
			cellWidth = 375,
			topBarHeight = JoinResult.topBarHeight,
			pageHeaderText = JoinResult.pageHeaderText,
			cellHeight = YOffset,
			topPadding = if FFlagAppIaScrollAway and ScrollAwayEnabled then JoinResult.topBarHeight else nil
		})
		Flag = true
	elseif UseIsChatEnabledModuleResult and (not IsEmpty or not UseIsAppLoadedModuleResult or IsIsFetchingConversations) then
		Flag = true
		Flag1 = true
		Flag2 = true
		Element = ReactModule.createElement(ConversationListWithTopBarModule, CryoModule.Dictionary.join(JoinResult, {
			filterText = JoinResult.isShowingFilterBox and JoinResult.filterText or nil,
			key = `conversationListWithTopBar{JoinResult.filterText}`,
			itemList = UseMemoResult,
			appLoaded = UseIsAppLoadedModuleResult,
			localUserId = UseLocalUserIdResult,
			conversationsIsFetching = IsIsFetchingConversations,
			oldestConversationIsFetched = IsOldestConversationIsFetched,
			entryHeight = YOffset,
			isInExperience = UseIsInExperienceModuleResult,
			isWideMode = if PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() or FFlagAppChatUseNewConversationRowModule then UseAppChatIsWideModeModuleResult else nil,
			navigateToConversationFromUserId = if PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() then UseCallbackResult1 else nil,
			navigateToQuickStartSquadInviteFriends = if PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() then UseCallbackResult else nil,
			showGroupsLink = UseIsExternalNavigationAvailableModuleResult[EnumScreensModule.Groups],
			canvasTopPadding = if FFlagAppIaScrollAway and ScrollAwayEnabled then JoinResult.topBarHeight else nil,
			canAccessParty = UseCanAccessPartyModuleResult,
			isPartyQuickStartEnabled = UseCanAccessPartyModuleResult1
		}))
	elseif UseIsChatEnabledModuleResult then
		Element = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
			BackgroundTransparency = UseStyleResult.Tokens.Color.None.Transparency
		}, {
			NoFriendsView = ReactModule.createElement(NoFriendsView, {
				pageRenderReport = function()
					-- upvalues: UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval), EmptyStateTypeModule (upval)
					UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule.ChatEmptyStateScreenRendered, { emptyStateType = EmptyStateTypeModule.NoFriendsView })
				end,
				openAddFriendsPage = function()
					-- upvalues: UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval), FFlagCreateConnectionsHub (upval), NavigateToLuaAppPagesScreenProps (copy), AppPage (upval), JoinResult (copy)
					UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule.ChatAddFriendsBtnClicked, {})
					
					if FFlagCreateConnectionsHub then
						NavigateToLuaAppPagesScreenProps[AppPage.CoHubAddConnections]()
						
						return
					else
						JoinResult.navigateToAddFriends()
					end
				end,
				noFriendsHeaderKey = if FFlagConnectionsToFriendsRename then "Feature.Chat.Label.AddFriends" else "Feature.Chat.Label.AddConnections",
				noFriendsTextLabelKey = if FFlagConnectionsToFriendsRename then "Feature.Chat.Text.NoFriends" else "Feature.Chat.Text.NoConnections",
				addFriendsBtnLabelKey = if FFlagConnectionsToFriendsRename then "Feature.Chat.Label.AddFriends" else "Feature.Chat.Label.AddConnections",
				addFriendsBtnEnabled = UseIsExternalNavigationAvailableModuleResult[EnumScreensModule.AddFriends]
			})
		})
		Flag = true
	else
		Element = ReactModule.createElement(NoConversationsLandingModule, {
			chatEnabled = UseIsChatEnabledModuleResult,
			privacySettingsEnabled = PrivacySettingsEnabled,
			globalRulesEnabled = GlobalRulesEnabled,
			thirdPartyPrivacySettingsEnabled = ThirdPartyPrivacySettingsEnabled,
			canNavigateToPrivacySettings = UseIsExternalNavigationAvailableModuleResult[EnumScreensModule.PrivacySettings],
			canNavigateToAddFriends = UseIsExternalNavigationAvailableModuleResult[EnumScreensModule.AddFriends],
			onCallToAction = function(p3)
				-- upvalues: JoinResult (copy), UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval), FFlagCreateConnectionsHub (upval), NavigateToLuaAppPagesScreenProps (copy), AppPage (upval)
				if p3 == "privacy" then
					JoinResult.navigateToPrivacy()
					
					return
				end
				if p3 == "friends" then
					UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule.ChatAddFriendsBtnClicked, {})
					
					if FFlagCreateConnectionsHub then
						NavigateToLuaAppPagesScreenProps[AppPage.CoHubAddConnections]()
						
						return
					end
					JoinResult.navigateToAddFriends()
				end
			end,
			fireRenderEvent = function(p3)
				-- upvalues: EmptyStateTypeModule (upval), UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval)
				UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule.ChatEmptyStateScreenRendered, {
					emptyStateType = if p3 == "friends" then EmptyStateTypeModule.NoFriendsView elseif p3 == "privacy" then EmptyStateTypeModule.ChatSettingsDisabledView elseif p3 == "regional" then EmptyStateTypeModule.ChatUnavailableRegionView else EmptyStateTypeModule.EmptyConversationList
				})
			end
		})
	end
	if FFlagAppIaScrollAway and FFlagEnableScrollAwayContentScrollableFix then
		UseEffectFunction(function()
			-- upvalues: ScrollAwayEnabled (copy), VisibilityControl (upval), Flag2 (ref)
			if ScrollAwayEnabled then
				VisibilityControl.setContentScrollable(Flag2)
				
				return
			end
		end, { Flag2, ScrollAwayEnabled })
	end
	if GetFFlagChatTabHideGroupsLinkOnVRModule() and IsVRAppBuildFunction() then
		Flag = true
	end
	if FFlagAppChatTopBarSignalsStoreModule then
		UseEffectFunction(function()
			-- upvalues: UseIsInExperienceModuleResult (copy), GetTopBarStoreModule (upval), EnumScreensModule (upval), Flag1 (ref)
			if UseIsInExperienceModuleResult then
				GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatLanding, { rightHidden = not Flag1 })
			end
		end, { Flag1, UseIsInExperienceModuleResult })
	else
		local SetScreenTopBarScreenProps = UseNavigationResult.getScreenProps("setScreenTopBar", function() end)
		UseEffectFunction(function()
			-- upvalues: UseIsInExperienceModuleResult (copy), SetScreenTopBarScreenProps (copy), EnumScreensModule (upval), Flag1 (ref)
			if UseIsInExperienceModuleResult then
				SetScreenTopBarScreenProps(EnumScreensModule.ChatLanding, { rightHidden = not Flag1 })
			end
		end, {
			Flag1,
			SetScreenTopBarScreenProps,
			UseIsInExperienceModuleResult
		})
	end
	local Element1 = if not Flag and UseIsExternalNavigationAvailableModuleResult[EnumScreensModule.Groups] then ReactModule.createElement(ReactModule.Fragment, nil, {
		UIPadding = if FFlagAppIaScrollAway and ScrollAwayEnabled then ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, JoinResult.topBarHeight) }) else nil,
		groupsLink = ReactModule.createElement(ConversationGroupsEntryContainerModule, { entryHeight = YOffset }),
		chatFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, -YOffset),
			Position = UDim2.new(0, 0, 0, YOffset)
		}, { chatContainer = Element })
	}) else Element
	local UseChatIsVisibleModuleResult = UseChatIsVisibleModule()
	ReactModule.useEffect(function()
		-- upvalues: UseChatIsVisibleModuleResult (copy), EmitFunction (ref), ChatLandingTelemetryEventsModule (upval), UseIsChatEnabledModuleResult (copy), UseSelectorResult (copy)
		if UseChatIsVisibleModuleResult then
			EmitFunction(ChatLandingTelemetryEventsModule.AppChatVisible, {
				isChatEnabled = UseIsChatEnabledModuleResult,
				isChatLoading = UseSelectorResult
			})
		end
	end, {
		UseChatIsVisibleModuleResult,
		UseIsChatEnabledModuleResult,
		UseSelectorResult
	})
	
	if FFlagAppChatPerfTrackingModule then
		ReactModule.useEffect(function()
			-- upvalues: UseChatIsVisibleModuleResult (copy), UseSelectorResult (copy), UseIsChatEnabledModuleResult (copy), NewResult (upval), UseMemoResult (copy), AppChatPerfTrackerModule (upval)
			if not UseChatIsVisibleModuleResult then return end
			local UseIsChatEnabledModuleResult1 = not UseSelectorResult and UseIsChatEnabledModuleResult
			NewResult:debug("TTI Ready Check (ChatLanding): isLoading={}, isChatEnabled={}, itemCount={}, ready={}", UseSelectorResult, UseIsChatEnabledModuleResult, #UseMemoResult, UseIsChatEnabledModuleResult1)
			
			if UseIsChatEnabledModuleResult1 and AppChatPerfTrackerModule.isActive(AppChatPerfTrackerModule.Events.ChatLandingTTI) then
				AppChatPerfTrackerModule.finish(AppChatPerfTrackerModule.Events.ChatLandingTTI, { numElementsRendered = #UseMemoResult })
			end
		end, {
			UseChatIsVisibleModuleResult,
			UseSelectorResult,
			UseIsChatEnabledModuleResult,
			#UseMemoResult
		})
	end
	local UseRefResult1 = ReactModule.useRef({
		isChatEnabled = UseIsChatEnabledModuleResult,
		isChatLoading = UseSelectorResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseIsChatEnabledModuleResult (copy), UseSelectorResult (copy)
		UseRefResult1.current = {
			isChatEnabled = UseIsChatEnabledModuleResult,
			isChatLoading = UseSelectorResult
		}
	end, { UseIsChatEnabledModuleResult, UseSelectorResult })
	UseEffectFunction(function()
		-- upvalues: UseChatIsVisibleModuleResult (copy), EmitFunction (ref), ChatLandingTelemetryEventsModule (upval), UseRefResult1 (copy)
		return function()
			-- upvalues: UseChatIsVisibleModuleResult (upval), EmitFunction (upval), ChatLandingTelemetryEventsModule (upval), UseRefResult1 (upval)
			if UseChatIsVisibleModuleResult then
				EmitFunction(ChatLandingTelemetryEventsModule.AppChatClosed, UseRefResult1.current)
			end
		end
	end, { UseChatIsVisibleModuleResult })
	
	return Element1
end

return ComposeFunction(RoactRoduxModule.connect(nil, MapDispatchToPropsModule), RoactPaginator.connect(function()
	return { pageSize = 30 }
end))(ChatLandingContainer)