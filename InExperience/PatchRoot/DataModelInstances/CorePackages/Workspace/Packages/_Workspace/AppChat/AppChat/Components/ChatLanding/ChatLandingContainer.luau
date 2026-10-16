local HttpService = game:GetService("HttpService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppCommonLibModule = require(Parent.AppCommonLib)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local AppNavBarModule = require(Parent.AppNavBar)
local VisibilityControl = AppNavBarModule.VisibilityControl
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local ComponentsModule = require(Parent.FriendsLanding.Components)
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
local SignalsMigrationConfigModule = require(AppChat.Flags.SignalsMigrationConfig)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local FFlagAppChatConsoleFocusFixesModule = require(AppChat.Flags.FFlagAppChatConsoleFocusFixes)
local FFlagAppChatServerSideConversationSearchModule = require(AppChat.Flags.FFlagAppChatServerSideConversationSearch)
local FFlagAppChatSkipSearchWhenChatDisabledModule = require(AppChat.Flags.FFlagAppChatSkipSearchWhenChatDisabled)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local IsVRAppBuildFunction = AppCommonLibModule.IsVRAppBuild
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local NoFriendsView = ComponentsModule.NoFriendsView
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagEnableScrollAwayContentScrollableFix = SharedFlagsModule.FFlagEnableScrollAwayContentScrollableFix
local FFlagSignalsNavP3hMisc = SharedFlagsModule.FFlagSignalsNavP3hMisc
local GetFFlagChatTabHideGroupsLinkOnVRModule = require(AppChat.Flags.getFFlagChatTabHideGroupsLinkOnVR)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local PartyPageCarouselExperimentation = require(Parent.SocialExperiments).PartyPageCarouselExperimentation
local FFlagCreateConnectionsHub = require(Parent.SharedFlags).FFlagCreateConnectionsHub
local SquadQuickStartExperimentation = require(Parent.SocialExperiments).SquadQuickStartExperimentation
local UseCanAccessPartyModule = require(Parent.Squads.useCanAccessParty)
local UseConversationListModule = require(AppChat.Hooks.useConversationList)
local UseConversationSearchListPropsModule = require(AppChat.Hooks.useConversationSearchListProps)
local UseChatSearchSessionModule = require(AppChat.Hooks.useChatSearchSession)
local FFlagAppChatSearchSessionTelemetryModule = require(AppChat.Flags.FFlagAppChatSearchSessionTelemetry)
local FFlagAppChatVisibleIsInConversationModule = require(AppChat.Flags.FFlagAppChatVisibleIsInConversation)
local GetIsInConversationForTelemetryModule = require(script.Parent.Utils.getIsInConversationForTelemetry)
local FFlagAppChatConversationLoadRetryModule = require(AppChat.Flags.FFlagAppChatConversationLoadRetry)
local RoduxNetworkingModule = require(AppChat.Http.RoduxNetworking)
local ShouldReadConversationListFromSignalsStore = SignalsMigrationConfigModule.shouldReadConversationListFromSignalsStore
local Text = if game.PlaceId > 0 then tostring(game.PlaceId) else nil
local Text1 = if game.GameId > 0 then tostring(game.GameId) else nil
local config = {
	topBarHeight = 0,
	isShowingFilterBox = false,
	navigateToSquadLobby = function() --[[ Line: 126 ]] end
}

local function _(List, p1): boolean --[[ Line: 129 | Named "areConversationIdsEqual" ]]
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

local _ = function(p2) --[[ Line: 143 | Named "encodeConversationIds" ]]
	-- upvalues: HttpService (copy)
	local Success, Result = pcall(function() --[[ Line: 144 ]]
		-- upvalues: HttpService (upval), p2 (copy)
		return HttpService:JSONEncode(p2)
	end)
	
	return if Success then Result else "[]"
end

function ChatLandingContainer(p2) --[[ Line: 153 ]]
	-- upvalues: CryoModule (copy), config (copy), UseAnalyticsModule (copy), UseChatPlacementContextFunction (copy), UseDispatchFunction (copy), UseIsChatEnabledModule (copy), UseIsGroupChatEnabledModule (copy), UseIsChatEnabledFromReasonModule (copy), UseIsInExperienceModule (copy), UseAppChatIsWideModeModule (copy), FFlagAppChatPerfTrackingModule (copy), FFlagAppChatMessageTTIMilestonesModule (copy), AppChatPerfTrackerModule (copy), UseIsAppLoadedModule (copy), UseAreConversationsFetchingModule (copy), UseHasConversationsModule (copy), UseIsOldestConversationFetchedModule (copy), UseLocalUserIdFunction (copy), UseNavigationFunction (copy), UseStyleFunction (copy), UseTextSizeOffsetFunction (copy), UseAnalyticsModule1 (copy), FFlagAppChatConsoleFocusFixesModule (copy), UseTokensFunction (copy), FFlagCreateConnectionsHub (copy), UseGetConversationsModule (copy), ShouldReadConversationListFromSignalsStore (copy), UseConversationListModule (copy), FFlagAppChatConversationLoadRetryModule (copy), UseSelectorFunction (copy), AppChatNetworkingModule (copy), RoduxNetworkingModule (copy), FFlagAppChatServerSideConversationSearchModule (copy), FFlagAppChatSkipSearchWhenChatDisabledModule (copy), UseConversationSearchListPropsModule (copy), FFlagAppChatSearchSessionTelemetryModule (copy), UseChatSearchSessionModule (copy), UseEffectFunction (copy), GetConversationIdsModule (copy), NewResult (copy), HttpService (copy), UsePreviousFunction (copy), FetchConversationsByPageModule (copy), ReactModule (copy), GetOtherParticipantsModule (copy), UseIsUserPendingModule (copy), ConversationChannelsModule (copy), GetConversationTitleModule (copy), UseTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), ChatLandingTelemetryStateModule (copy), UseEffectOnMountFunction (copy), ChatLandingTelemetryEventsModule (copy), UseLocalizationFunction (copy), UseCallbackFunction (copy), PartyPageCarouselExperimentation (copy), EventNamesModule (copy), Text (copy), Text1 (copy), EnumScreensModule (copy), CreateConversationModule (copy), ParseCreateConversationErrorsModule (copy), CreateConversationErrorModule (copy), UseIsExternalNavigationAvailableModule (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), UseCanAccessPartyModule (copy), SquadQuickStartExperimentation (copy), ChatLoadingContainerModule (copy), FoundationModule (copy), NoFriendsView (copy), EmptyStateTypeModule (copy), AppPage (copy), NoConversationsLandingModule (copy), ConversationListWithTopBarModule (copy), SignalsMigrationConfigModule (copy), FFlagEnableScrollAwayContentScrollableFix (copy), VisibilityControl (copy), GetFFlagChatTabHideGroupsLinkOnVRModule (copy), IsVRAppBuildFunction (copy), GetTopBarStoreModule (copy), ConversationGroupsEntryContainerModule (copy), UseChatIsVisibleModule (copy), FFlagAppChatVisibleIsInConversationModule (copy), GetIsInConversationForTelemetryModule (copy), FFlagSignalsNavP3hMisc (copy)
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
	local UseTokensResult = if FFlagAppChatConsoleFocusFixesModule then UseTokensFunction() else nil
	local NewSize = if FFlagAppChatConsoleFocusFixesModule then UseTokensResult.Size.Size_1600 + 2 * UseTextSizeOffsetResult else 64 + 2 * UseTextSizeOffsetResult
	local NavigateToLuaAppPagesScreenProps = if FFlagCreateConnectionsHub then UseNavigationResult.getScreenProps("navigateToLuaAppPages", {}) else nil
	local UseGetConversationsModuleResult = UseGetConversationsModule()
	local Items = {}
	local ListStatus = {}
	
	if ShouldReadConversationListFromSignalsStore then
		local UseConversationListModuleResult = UseConversationListModule(true)
		Items = UseConversationListModuleResult.items
		ListStatus = UseConversationListModuleResult.listStatus
	end
	local Items1 = if ShouldReadConversationListFromSignalsStore then Items else UseGetConversationsModuleResult
	local IsIsFetchingConversations = if ShouldReadConversationListFromSignalsStore then ListStatus.isFetchingConversations == true else UseAreConversationsFetchingModuleResult
	local UseHasConversationsModuleResult1 = if ShouldReadConversationListFromSignalsStore then #Items > 0 else UseHasConversationsModuleResult
	local IsOldestConversationIsFetched = if ShouldReadConversationListFromSignalsStore then ListStatus.oldestConversationIsFetched == true else UseIsOldestConversationFetchedModuleResult
	local IsFetchingMatch = false
	local IsFailedMatch = false
	
	if FFlagAppChatConversationLoadRetryModule then
		if ShouldReadConversationListFromSignalsStore then
			local IsIsFetchingNextPage = ListStatus.isFetchingNextPage == true
			IsFetchingMatch = ListStatus.isFetchingConversations == true and not IsIsFetchingNextPage
			IsFailedMatch = ListStatus.error ~= nil and (ListStatus.hasFetchedInitialPage ~= true and not IsFetchingMatch)
		else
			local UseSelectorResult = UseSelectorFunction(function(p3) --[[ Line: 221 ]]
				-- upvalues: AppChatNetworkingModule (upval)
				return AppChatNetworkingModule.rodux.GetUserConversations.getStatus(p3)
			end)
			IsFetchingMatch = UseSelectorResult == RoduxNetworkingModule.Enum.NetworkStatus.Fetching
			IsFailedMatch = UseSelectorResult == RoduxNetworkingModule.Enum.NetworkStatus.Failed
		end
	end
	local v1 = false
	local t = {}
	
	if FFlagAppChatServerSideConversationSearchModule then
		local IsIsShowingFilterBox = JoinResult.isShowingFilterBox == true
		
		if FFlagAppChatSkipSearchWhenChatDisabledModule then
			IsIsShowingFilterBox = IsIsShowingFilterBox and UseIsChatEnabledModuleResult
		end
		v1, t = UseConversationSearchListPropsModule(JoinResult.filterText, IsIsShowingFilterBox, UseLocalUserIdResult, UseIsGroupChatEnabledModuleResult, JoinResult.navigateToConversation)
	end
	if FFlagAppChatSearchSessionTelemetryModule then
		local HasS = JoinResult.isShowingFilterBox == true and (JoinResult.filterText ~= nil and JoinResult.filterText:match("%S") ~= nil)
		
		if FFlagAppChatServerSideConversationSearchModule and FFlagAppChatSkipSearchWhenChatDisabledModule then
			HasS = HasS and UseIsChatEnabledModuleResult
		end
		UseChatSearchSessionModule(HasS, FFlagAppChatServerSideConversationSearchModule)
	end
	if ShouldReadConversationListFromSignalsStore then
		UseEffectFunction(function() --[[ Line: 263 ]]
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
				local v2 = "Conversation list parity mismatch. Rodux ids: {}, Signals ids: {}"
				local Success, Result = pcall(function() --[[ Line: 144 ]]
					-- upvalues: HttpService (upval), ConversationIdsModule (copy)
					return HttpService:JSONEncode(ConversationIdsModule)
				end)
				local Result1 = if Success then Result else "[]"
				local Success1, Result2 = pcall(function() --[[ Line: 144 ]]
					-- upvalues: HttpService (upval), ConversationIdsModule1 (copy)
					return HttpService:JSONEncode(ConversationIdsModule1)
				end)
				NewResult:warning(v2, Result1, if Success1 then Result2 else "[]")
			end
		end, { UseGetConversationsModuleResult, Items })
	end
	local UsePreviousResult = UsePreviousFunction(UseIsChatEnabledModuleResult)
	UseEffectFunction(function() --[[ Line: 281 ]]
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
	local UseMemoResult, UseMemoResult2, UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 297 ]]
		-- upvalues: Items1 (copy), ShouldReadConversationListFromSignalsStore (upval), CryoModule (upval), GetOtherParticipantsModule (upval), UseLocalUserIdResult (copy), UseIsUserPendingModule (upval), ConversationChannelsModule (upval), GetConversationTitleModule (upval), UseIsGroupChatEnabledModuleResult (copy)
		local Count = 0
		local Count1 = 0
		local JoinResults = {}
		
		for _, value in Items1 do
			local JoinResult = if ShouldReadConversationListFromSignalsStore and value.otherParticipants == nil then CryoModule.Dictionary.join(value, {
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
		if ShouldReadConversationListFromSignalsStore then UseLocalUserIdResult else nil
	})
	local UseTelemetryModuleResult = UseTelemetryModule(ChatLandingTelemetryLayerModule.Context)
	local EmitFunction = UseTelemetryModuleResult.emit
	
	if ShouldReadConversationListFromSignalsStore then
		local UseRefResult = ReactModule.useRef(UseTelemetryModuleResult.emit)
		UseRefResult.current = UseTelemetryModuleResult.emit
		
		EmitFunction = function(...) --[[ Line: 340 ]]
			-- upvalues: UseRefResult (copy)
			UseRefResult.current(...)
		end
	end
	local UseSetStateResult = ChatLandingTelemetryStateModule.useSetState()
	UseEffectFunction(function() --[[ Line: 346 ]]
		-- upvalues: UseSetStateResult (copy), CryoModule (upval), UseMemoResult (copy), UseMemoResult2 (copy), UseMemoResult3 (copy)
		UseSetStateResult(function(p3) --[[ Line: 347 ]]
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
	UseEffectOnMountFunction(function() --[[ Line: 356 ]]
		-- upvalues: UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval), UseIsChatEnabledModuleResult (copy)
		UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule.ScreenRendered, { isChatEnabled = UseIsChatEnabledModuleResult })
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		chatUnavailableWithUser = "Feature.Chat.Message.ChatUnavailableWithUser",
		networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong",
		conversationLoadError = if FFlagAppChatConversationLoadRetryModule then "CommonUI.Messages.Response.PageError" else nil,
		refresh = if FFlagAppChatConversationLoadRetryModule then "CommonUI.Controls.Action.Refresh" else nil
	})
	local UseCallbackResult = UseCallbackFunction(function() --[[ Line: 371 ]]
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
	local UseCallbackResult1 = UseCallbackFunction(function(p3) --[[ Line: 388 ]]
		-- upvalues: PartyPageCarouselExperimentation (upval), UseDispatchResult (copy), CreateConversationModule (upval), UseAnalyticsModuleResult1 (copy), FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval), UseNavigationResult (copy), EnumScreensModule (upval), ParseCreateConversationErrorsModule (upval), UseLocalizationResult (copy), EventNamesModule (upval), CreateConversationErrorModule (upval)
		if PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
			UseDispatchResult(CreateConversationModule("one_to_one", { p3 }, UseAnalyticsModuleResult1, "navigateToConversationFromSocialCarousel")):andThen(function(Result) --[[ Line: 402 ]]
				-- upvalues: FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval), UseNavigationResult (upval), EnumScreensModule (upval)
				if FFlagAppChatPerfTrackingModule then
					AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = Result.id })
				end
				UseNavigationResult.navigate(EnumScreensModule.ChatConversation, { conversationId = Result.id })
			end):catch(function(Err) --[[ Line: 412 ]]
				-- upvalues: ParseCreateConversationErrorsModule (upval), UseLocalizationResult (upval), UseNavigationResult (upval), EnumScreensModule (upval), UseAnalyticsModuleResult1 (upval), EventNamesModule (upval), CreateConversationErrorModule (upval)
				UseNavigationResult.navigate(EnumScreensModule.RoactChatToast, {
					toastProps = {
						toastContent = {
							toastTitle = if ParseCreateConversationErrorsModule(Err) == "participant_chat_disabled" then UseLocalizationResult.chatUnavailableWithUser else UseLocalizationResult.networkErrorText
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
	local UseSelectorResult = UseSelectorFunction(function(p3): boolean --[[ Line: 435 ]]
		return p3.ChatAppReducer.ChatSettings.retrievalStatus ~= "Done"
	end) or (IsEmpty and IsIsFetchingConversations or IsEmpty and UseHasConversationsModuleResult1)
	local Flag = false
	local Flag1 = false
	local Flag11 = false
	local UseIsExternalNavigationAvailableModuleResult = UseIsExternalNavigationAvailableModule({
		EnumScreensModule.AddFriends,
		EnumScreensModule.PrivacySettings,
		EnumScreensModule.Groups
	})
	local ScrollAwayEnabled = FFlagAppIaScrollAway and (not UseIsInExperienceModuleResult and AppNavBarModule.getScrollAwayEnabled())
	local UseCanAccessPartyModuleResult = UseCanAccessPartyModule()
	local UseCanAccessPartyModuleResult1 = SquadQuickStartExperimentation.getPartyQuickStartChangesEnabled() and UseCanAccessPartyModuleResult
	local IsChatLoading = UseSelectorResult
	
	if FFlagAppChatConversationLoadRetryModule and UseIsChatEnabledModuleResult and not v1 and IsEmpty then
		IsChatLoading = IsChatLoading or IsFetchingMatch
	end
	local Element1 = nil
	if IsChatLoading then
		Element1 = ReactModule.createElement(ChatLoadingContainerModule, {
			cellWidth = 375,
			topBarHeight = JoinResult.topBarHeight,
			pageHeaderText = JoinResult.pageHeaderText,
			cellHeight = NewSize,
			topPadding = if FFlagAppIaScrollAway and ScrollAwayEnabled then JoinResult.topBarHeight else nil
		})
		Flag = true
	elseif FFlagAppChatConversationLoadRetryModule and UseIsChatEnabledModuleResult and not v1 and IsEmpty and (UseIsAppLoadedModuleResult and not IsIsFetchingConversations and IsFailedMatch) then
		Element1 = ReactModule.createElement(FoundationModule.Empty, {
			text = UseLocalizationResult.conversationLoadError,
			button = {
				text = UseLocalizationResult.refresh,
				onActivated = JoinResult.onRetryConversations
			}
		})
		Flag = true
	elseif UseIsChatEnabledModuleResult and (v1 or not IsEmpty or (not UseIsAppLoadedModuleResult or IsIsFetchingConversations)) then
		Flag = true
		Flag1 = true
		Flag11 = true
		Element1 = ReactModule.createElement(ConversationListWithTopBarModule, CryoModule.Dictionary.join(JoinResult, {
			filterText = JoinResult.isShowingFilterBox and JoinResult.filterText or nil,
			key = `conversationListWithTopBar{JoinResult.filterText}`,
			itemList = UseMemoResult,
			appLoaded = UseIsAppLoadedModuleResult,
			localUserId = UseLocalUserIdResult,
			conversationsIsFetching = IsIsFetchingConversations,
			oldestConversationIsFetched = IsOldestConversationIsFetched,
			entryHeight = NewSize,
			isInExperience = UseIsInExperienceModuleResult,
			isWideMode = if PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() or SignalsMigrationConfigModule.shouldUseFoundationConversationRow then UseAppChatIsWideModeModuleResult else nil,
			navigateToConversationFromUserId = if PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() then UseCallbackResult1 else nil,
			navigateToQuickStartSquadInviteFriends = if PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() then UseCallbackResult else nil,
			showGroupsLink = UseIsExternalNavigationAvailableModuleResult[EnumScreensModule.Groups],
			canvasTopPadding = if FFlagAppIaScrollAway and ScrollAwayEnabled then JoinResult.topBarHeight else nil,
			canAccessParty = UseCanAccessPartyModuleResult,
			isPartyQuickStartEnabled = UseCanAccessPartyModuleResult1
		}, t))
	elseif UseIsChatEnabledModuleResult then
		Element1 = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
			BackgroundTransparency = UseStyleResult.Tokens.Color.None.Transparency
		}, {
			NoFriendsView = ReactModule.createElement(NoFriendsView, {
				noFriendsHeaderKey = "Feature.Chat.Label.AddFriends",
				noFriendsTextLabelKey = "Feature.Chat.Text.NoFriends",
				addFriendsBtnLabelKey = "Feature.Chat.Label.AddFriends",
				pageRenderReport = function() --[[ Line: 503 ]]
					-- upvalues: UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval), EmptyStateTypeModule (upval)
					UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule.ChatEmptyStateScreenRendered, { emptyStateType = EmptyStateTypeModule.NoFriendsView })
				end,
				openAddFriendsPage = function() --[[ Line: 508 ]]
					-- upvalues: UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval), FFlagCreateConnectionsHub (upval), NavigateToLuaAppPagesScreenProps (copy), AppPage (upval), JoinResult (copy)
					UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule.ChatAddFriendsBtnClicked, {})
					
					if FFlagCreateConnectionsHub then
						NavigateToLuaAppPagesScreenProps[AppPage.CoHubAddConnections]()
						
						return
					else
						JoinResult.navigateToAddFriends()
					end
				end,
				addFriendsBtnEnabled = UseIsExternalNavigationAvailableModuleResult[EnumScreensModule.AddFriends]
			})
		})
		Flag = true
	else
		Element1 = ReactModule.createElement(NoConversationsLandingModule, {
			chatEnabled = UseIsChatEnabledModuleResult,
			privacySettingsEnabled = PrivacySettingsEnabled,
			globalRulesEnabled = GlobalRulesEnabled,
			thirdPartyPrivacySettingsEnabled = ThirdPartyPrivacySettingsEnabled,
			canNavigateToPrivacySettings = UseIsExternalNavigationAvailableModuleResult[EnumScreensModule.PrivacySettings],
			canNavigateToAddFriends = UseIsExternalNavigationAvailableModuleResult[EnumScreensModule.AddFriends],
			onCallToAction = function(p3) --[[ Line: 532 ]]
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
			fireRenderEvent = function(p3) --[[ Line: 544 ]]
				-- upvalues: EmptyStateTypeModule (upval), UseTelemetryModuleResult (copy), ChatLandingTelemetryEventsModule (upval)
				UseTelemetryModuleResult.emit(ChatLandingTelemetryEventsModule.ChatEmptyStateScreenRendered, {
					emptyStateType = if p3 == "friends" then EmptyStateTypeModule.NoFriendsView elseif p3 == "privacy" then EmptyStateTypeModule.ChatSettingsDisabledView elseif p3 == "regional" then EmptyStateTypeModule.ChatUnavailableRegionView else EmptyStateTypeModule.EmptyConversationList
				})
			end
		})
	end
	if FFlagAppIaScrollAway and FFlagEnableScrollAwayContentScrollableFix then
		UseEffectFunction(function() --[[ Line: 599 ]]
			-- upvalues: ScrollAwayEnabled (copy), VisibilityControl (upval), Flag11 (ref)
			if ScrollAwayEnabled then
				VisibilityControl.setContentScrollable(Flag11)
				
				return
			end
		end, { Flag11, ScrollAwayEnabled })
	end
	if GetFFlagChatTabHideGroupsLinkOnVRModule() and IsVRAppBuildFunction() then
		Flag = true
	end
	UseEffectFunction(function() --[[ Line: 612 ]]
		-- upvalues: UseIsInExperienceModuleResult (copy), GetTopBarStoreModule (upval), EnumScreensModule (upval), Flag1 (ref)
		if UseIsInExperienceModuleResult then
			GetTopBarStoreModule(false).setScreenTopBar(EnumScreensModule.ChatLanding, { rightHidden = not Flag1 })
		end
	end, { Flag1, UseIsInExperienceModuleResult })
	local Element = if not Flag and UseIsExternalNavigationAvailableModuleResult[EnumScreensModule.Groups] then ReactModule.createElement(ReactModule.Fragment, nil, {
		UIPadding = if FFlagAppIaScrollAway and ScrollAwayEnabled then ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, JoinResult.topBarHeight) }) else nil,
		groupsLink = ReactModule.createElement(ConversationGroupsEntryContainerModule, { entryHeight = NewSize }),
		chatFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, -NewSize),
			Position = UDim2.new(0, 0, 0, NewSize)
		}, { chatContainer = Element1 })
	}) else Element1
	local UseChatIsVisibleModuleResult = UseChatIsVisibleModule()
	ReactModule.useEffect(function() --[[ Line: 653 ]]
		-- upvalues: UseChatIsVisibleModuleResult (copy), EmitFunction (ref), ChatLandingTelemetryEventsModule (upval), UseIsChatEnabledModuleResult (copy), UseSelectorResult (copy), FFlagAppChatVisibleIsInConversationModule (upval), GetIsInConversationForTelemetryModule (upval), UseNavigationResult (copy)
		if UseChatIsVisibleModuleResult then
			EmitFunction(ChatLandingTelemetryEventsModule.AppChatVisible, {
				isChatEnabled = UseIsChatEnabledModuleResult,
				isChatLoading = UseSelectorResult,
				isInConversation = if FFlagAppChatVisibleIsInConversationModule then GetIsInConversationForTelemetryModule(UseNavigationResult) else nil
			})
		end
	end, {
		UseChatIsVisibleModuleResult,
		UseIsChatEnabledModuleResult,
		UseSelectorResult
	})
	
	if FFlagAppChatPerfTrackingModule then
		ReactModule.useEffect(function() --[[ Line: 666 ]]
			-- upvalues: UseChatIsVisibleModuleResult (copy), IsChatLoading (ref), UseIsChatEnabledModuleResult (copy), NewResult (upval), UseMemoResult (copy), AppChatPerfTrackerModule (upval)
			if not UseChatIsVisibleModuleResult then return end
			local UseIsChatEnabledModuleResult1 = not IsChatLoading and UseIsChatEnabledModuleResult
			NewResult:debug("TTI Ready Check (ChatLanding): isLoading={}, isChatEnabled={}, itemCount={}, ready={}", IsChatLoading, UseIsChatEnabledModuleResult, #UseMemoResult, UseIsChatEnabledModuleResult1)
			
			if UseIsChatEnabledModuleResult1 and AppChatPerfTrackerModule.isActive(AppChatPerfTrackerModule.Events.ChatLandingTTI) then
				AppChatPerfTrackerModule.finish(AppChatPerfTrackerModule.Events.ChatLandingTTI, { numElementsRendered = #UseMemoResult })
			end
		end, {
			UseChatIsVisibleModuleResult,
			IsChatLoading,
			UseIsChatEnabledModuleResult,
			#UseMemoResult
		})
	end
	local UseRefResult1 = ReactModule.useRef({
		isChatEnabled = UseIsChatEnabledModuleResult,
		isChatLoading = UseSelectorResult
	})
	ReactModule.useEffect(function() --[[ Line: 690 ]]
		-- upvalues: UseRefResult1 (copy), UseIsChatEnabledModuleResult (copy), UseSelectorResult (copy)
		UseRefResult1.current = {
			isChatEnabled = UseIsChatEnabledModuleResult,
			isChatLoading = UseSelectorResult
		}
	end, { UseIsChatEnabledModuleResult, UseSelectorResult })
	UseEffectFunction(function() --[[ Line: 699 ]]
		-- upvalues: UseChatIsVisibleModuleResult (copy), EmitFunction (ref), ChatLandingTelemetryEventsModule (upval), UseRefResult1 (copy)
		return function() --[[ Line: 700 ]]
			-- upvalues: UseChatIsVisibleModuleResult (upval), EmitFunction (upval), ChatLandingTelemetryEventsModule (upval), UseRefResult1 (upval)
			if UseChatIsVisibleModuleResult then
				EmitFunction(ChatLandingTelemetryEventsModule.AppChatClosed, UseRefResult1.current)
			end
		end
	end, { UseChatIsVisibleModuleResult })
	
	if not FFlagSignalsNavP3hMisc then
		return Element
	end
	local UseRefResult2 = ReactModule.useRef(nil)
	
	if UseChatIsVisibleModuleResult or UseRefResult2.current == nil then
		UseRefResult2.current = Element
	end
	return UseRefResult2.current
end

local function paginatorParameters() --[[ Line: 721 ]]
	return { pageSize = 30 }
end

local v2 = ComposeFunction(RoactRoduxModule.connect(nil, MapDispatchToPropsModule), RoactPaginator.connect(paginatorParameters))(ChatLandingContainer)
local v3 = ComposeFunction(RoactRoduxModule.connect(nil, MapDispatchToPropsModule), RoactPaginator.connect(paginatorParameters))(function(p3) --[[ Line: 735 | Named "PaginatorPropsBridge" ]]
	-- upvalues: RoactPaginator (copy), ReactModule (copy)
	local v4 = p3[RoactPaginator.loadNext]
	local v5 = p3[RoactPaginator.loadPrevious]
	local OnPaginatorReadyFunction = p3.onPaginatorReady
	ReactModule.useLayoutEffect(function() --[[ Line: 739 ]]
		-- upvalues: OnPaginatorReadyFunction (copy), RoactPaginator (upval), v4 (copy), v5 (copy)
		OnPaginatorReadyFunction({
			[RoactPaginator.loadNext] = v4,
			[RoactPaginator.loadPrevious] = v5
		})
	end, { v4, v5, OnPaginatorReadyFunction })
	
	return nil
end)
local v4 = RoactRoduxModule.connect(nil, MapDispatchToPropsModule)(ChatLandingContainer)

local function ChatLandingContainerWithRetry(p3) --[[ Line: 755 ]]
	-- upvalues: ReactModule (copy), UseCallbackFunction (copy), RoactPaginator (copy), v3 (copy), v4 (copy), CryoModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef({})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Paginator = ReactModule.createElement(v3, {
			key = UseStateResult,
			onPaginatorReady = UseCallbackFunction(function(Current) --[[ Line: 763 ]]
				-- upvalues: UseRefResult (copy)
				UseRefResult.current = Current
			end, {})
		}),
		Landing = ReactModule.createElement(v4, CryoModule.Dictionary.join(p3, {
			[RoactPaginator.loadNext] = UseCallbackFunction(function(...) --[[ Line: 766 ]]
				-- upvalues: UseRefResult (copy), RoactPaginator (upval)
				local CurrentEntry = UseRefResult.current[RoactPaginator.loadNext]
				
				return if CurrentEntry then CurrentEntry(...) else nil
			end, {}),
			[RoactPaginator.loadPrevious] = UseCallbackFunction(function(...) --[[ Line: 773 ]]
				-- upvalues: UseRefResult (copy), RoactPaginator (upval)
				local CurrentEntry = UseRefResult.current[RoactPaginator.loadPrevious]
				
				return if CurrentEntry then CurrentEntry(...) else nil
			end, {}),
			onRetryConversations = UseCallbackFunction(function() --[[ Line: 758 ]]
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(function(p4: number): number --[[ Line: 759 ]]
					return p4 + 1
				end)
			end, {})
		}))
	})
end

return if FFlagAppChatConversationLoadRetryModule then ChatLandingContainerWithRetry else v2