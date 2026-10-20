local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local SharedFlagsModule = require(Parent.SharedFlags)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local Loading = FoundationModule.Loading
local OverlayProvider = FoundationModule.OverlayProvider
local View = FoundationModule.View
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local SignalsReactModule = require(Parent.SignalsReact)
local BuildPageHeaderModule = require(script.Parent.Components.BuildPageHeader.BuildPageHeader)
local BuildChatPageModule = require(script.Parent.Components.BuildChatPage.BuildChatPage)
local ChatSheetModule = require(script.Parent.Components.ChatSheet.ChatSheet)
local FFlagBuildExperienceLibrary = SharedFlagsModule.FFlagBuildExperienceLibrary
local OpenLibraryModule = require(script.Parent.utils.openLibrary)
local SearchPageContainerModule = require(script.Parent.Components.SearchPage.SearchPageContainer)
local SearchEmptyStateModule = require(script.Parent.Components.SearchEmptyState.SearchEmptyState)
local SubagentStatusModule = require(script.Parent.Components.SubagentStatus)
local MyCreationsTabModule = require(script.Parent.Components.MyCreationsTab.MyCreationsTab)
local ExperienceResultsListModule = require(script.Parent.Components.MyCreationsTab.ExperienceResultsList)
local ExperienceResultsLoadingSkeletonModule = require(script.Parent.Components.MyCreationsTab.ExperienceResultsLoadingSkeleton)
local UseMyCreationsResultsModule = require(script.Parent.Components.MyCreationsTab.useMyCreationsResults)
local BuildOverflowMenuScreensModule = require(script.Parent.Components.BuildPillMenu.BuildOverflowMenuScreens)
local FFlagBuildExperienceMonetizationNativeUIModule = require(script.Parent.Flags.FFlagBuildExperienceMonetizationNativeUI)
local OverflowMenuPageShellModule = require(script.Parent.Components.BuildPillMenu.OverflowMenuPageShell)
local PrivateInvitesPickerHostModule = require(script.Parent.Components.PrivateInvitesPicker.PrivateInvitesPickerHost)
local CreatorCreditPageContainerModule = require(script.Parent.Components.CreatorCreditSheet.CreatorCreditPageContainer)
local CreatorCreditBalanceChipContainerModule = require(script.Parent.Components.CreatorCreditSheet.CreatorCreditBalanceChip.CreatorCreditBalanceChipContainer)
local AdsStatsViewModule = require(script.Parent.Components.Ads.AdsStatsView)
local UseAdsStatsPageViewModelModule = require(script.Parent.Components.Ads.useAdsStatsPageViewModel)
local AdsManagerMenuButtonModule = require(script.Parent.Components.Ads.AdsManagerMenuButton)
local AdCampaignCreatedToastModule = require(script.Parent.Components.Ads.AdCampaignCreatedToast)
local _ = require(script.Parent.Chat.chatTypes)
local UseSessionSummaryModule = require(script.Parent.Chat.useSessionSummary)
local UseScrollPerformanceTrackerModule = require(script.Parent.Telemetry.useScrollPerformanceTracker)
local FFlagBuildBackButtonChevronModule = require(script.Parent.Flags.FFlagBuildBackButtonChevron)
local FFlagBuildExperienceChatSheetReversedContentModule = require(script.Parent.Flags.FFlagBuildExperienceChatSheetReversedContent)
local list = { 0.5, 1 }
local FFlagBuildAdUpsellModule = require(script.Parent.Flags.FFlagBuildAdUpsell)
local FFlagEnableBuildAdPromotionModule = require(script.Parent.Flags.FFlagEnableBuildAdPromotion)
local _ = require(script.Parent.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local GetBuildExperienceRefreshStoreModule = require(script.Parent.Stores.GetBuildExperienceRefreshStore)
local GetSearchQueryStoreModule = require(script.Parent.Stores.GetSearchQueryStore)
local _ = require(script.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local BuildNavigationParamsModule = require(script.Parent.utils.BuildNavigationParams)
local ResumeBuildChatModule = require(script.Parent.utils.resumeBuildChat)
local UseBuildPageLayoutModule = require(script.Parent.utils.useBuildPageLayout)
local UseManageBuildNavBarVisibilityModule = require(script.Parent.utils.useManageBuildNavBarVisibility)
local UseOnScreenKeyboardVisibleModule = require(script.Parent.utils.useOnScreenKeyboardVisible)
local FFlagBuildPublishNavigationSheetModule = require(script.Parent.Flags.FFlagBuildPublishNavigationSheet)
local FFlagBuildExperiencePrivateInvitesModule = require(script.Parent.Flags.FFlagBuildExperiencePrivateInvites)
local FFlagBuildExperienceMyCreationsLongPressMenuModule = require(script.Parent.Flags.FFlagBuildExperienceMyCreationsLongPressMenu)
local FFlagBuildExperienceAnalytics = SharedFlagsModule.FFlagBuildExperienceAnalytics
local FFlagBuildExperienceHideNavBarOnSubPages = SharedFlagsModule.FFlagBuildExperienceHideNavBarOnSubPages
local GetAdsCampaignDeepLinkStoreModule = require(BuildExperience.Stores.GetAdsCampaignDeepLinkStore)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local FFlagBuildAdUpsellModule1 = FFlagBuildAdUpsellModule or FFlagBuildExperienceMonetizationNativeUIModule
local NoFFlagEnableBuildTabOverride = not SharedFlagsModule.FFlagEnableBuildTabOverride
local BuildEligibilityDialogModule = require(script.Parent.Components.BuildEligibilityDialog)
local UseBuildPageEligibilityModule = require(script.Parent.useBuildPageEligibility)
local PublishSheetControllerModule = if FFlagBuildPublishNavigationSheetModule then require(script.Parent.Components.PublishSheet.PublishSheetController) else nil
local UseTTINavigationTrackingFunction = require(Parent.TTINavigationTracking).useTTINavigationTracking
local config = {
	BuildHome = "BuildHome",
	BuildSearch = "BuildSearch",
	BuildAgents = "BuildAgents",
	BuildAgentDetails = "BuildAgentDetails",
	BuildCreatorCredit = "BuildCreatorCredit",
	BuildGetUsers = "BuildGetUsers",
	BuildChat = BuildNavigationParamsModule.BUILD_CHAT_SCREEN
}

local function _(Query, p1)
	return Query == "" or (Query ~= p1.query or p1.isSettledNoResults)
end

local _ = function(p1, Name)
	if p1 == nil or Name == nil then
		return nil
	end
	for _, group in p1.groups do
		if group.name == Name then
			return group
		end
	end
	return nil
end

local function useLiveSubagentTaskState(Navigation)
	-- upvalues: BuildNavigationParamsModule (copy), CreatorAgentChatModule (copy), ReactModule (copy), UseSessionSummaryModule (copy)
	local Target = BuildNavigationParamsModule.getTarget(Navigation)
	assert(Target ~= nil, "Agent pages require a build target")
	local CreatorAgentChatStore = CreatorAgentChatModule.getCreatorAgentChatStore()
	
	return UseSessionSummaryModule((ReactModule.useMemo(function()
		-- upvalues: CreatorAgentChatStore (copy), Target (copy)
		return CreatorAgentChatStore.getSessionForProject(Target.universeId, Target.placeId, Target.sessionId)
	end, {
		CreatorAgentChatStore,
		Target.universeId,
		Target.placeId,
		Target.sessionId
	}))).subagentTaskState or BuildNavigationParamsModule.getSubagentTaskState(Navigation)
end

local _ = function(p2)
	-- upvalues: ReactModule (copy), config (copy)
	return ReactModule.useCallback(function(Target)
		-- upvalues: p2 (copy), config (upval)
		p2.navigate(config.BuildChat, { target = Target })
	end, { p2 })
end

local function useHomeConfigurationPages(Navigation)
	-- upvalues: ReactModule (copy), FFlagBuildPublishNavigationSheetModule (copy), BuildOverflowMenuScreensModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	
	return {
		onOpenConfigurationPage = ReactModule.useCallback(function(p2, Target)
			-- upvalues: FFlagBuildPublishNavigationSheetModule (upval), UseStateResult2 (copy), UseStateResult2_1 (copy), BuildOverflowMenuScreensModule (upval), Navigation (copy)
			if FFlagBuildPublishNavigationSheetModule and p2 == "publish" then
				UseStateResult2(Target)
				UseStateResult2_1(true)
				
				return
			end
			local SCREENBYPAGEEntry = BuildOverflowMenuScreensModule.SCREEN_BY_PAGE[p2]
			
			if SCREENBYPAGEEntry ~= nil then
				Navigation.navigate(SCREENBYPAGEEntry, { target = Target })
				
				return
			end
		end, { Navigation }),
		publishSheetTarget = UseStateResult,
		isPublishSheetOpen = UseStateResult1,
		onClosePublishSheet = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(false)
		end, {}),
		navigateToPublishSubPage = ReactModule.useCallback(function(p2, Target)
			-- upvalues: Navigation (copy)
			Navigation.navigate(p2, { target = Target })
		end, { Navigation })
	}
end

local function BuildMonetizationScreen(p2)
	-- upvalues: BuildNavigationParamsModule (copy), ReactModule (copy), RoactNavigationModule (copy), BuildOverflowMenuScreensModule (copy), ChatSheetModule (copy), FFlagBuildExperienceChatSheetReversedContentModule (copy), list (copy)
	local Navigation = p2.navigation
	local Target = BuildNavigationParamsModule.getTarget(Navigation)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local HasTarget = Target ~= nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: HasTarget (copy), UseStateResult2 (copy)
		if HasTarget then
			UseStateResult2(true)
		end
	end, { HasTarget })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), Navigation (copy), RoactNavigationModule (upval), UseResult1 (copy)
		if not UseStateResult then return end
		local AddListenerResult = Navigation.addListener(RoactNavigationModule.Events.WillBlur, UseResult1)
		
		return function()
			-- upvalues: AddListenerResult (copy)
			AddListenerResult.remove()
		end
	end, { UseStateResult, Navigation, UseResult1 })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Page = ReactModule.createElement(BuildOverflowMenuScreensModule.BuildMonetizationScreen, { navigation = Navigation, onComposerActivated = UseResult }),
		Chat = if UseStateResult and Target ~= nil then ReactModule.createElement(ChatSheetModule, {
			autoFocusComposer = true,
			defaultSnapPointIndex = 1,
			isOpen = true,
			onClose = UseResult1,
			placeId = Target.placeId,
			sessionId = Target.sessionId,
			snapPoints = if FFlagBuildExperienceChatSheetReversedContentModule then list else { 0.5 },
			universeId = Target.universeId
		}) else nil
	})
end

local function BuildSearchResults(p2)
	-- upvalues: ReactModule (copy), SearchEmptyStateModule (copy), ExperienceResultsListModule (copy)
	local UseDraftQueryResult = p2.searchQueryStore.useDraftQuery()
	local Current = p2.closingSnapshot.current
	local Results = if Current == nil then p2.results else Current.results
	local IsUseDraftQueryResultMatch = if Current == nil then UseDraftQueryResult == "" or (UseDraftQueryResult ~= Results.query or Results.isSettledNoResults) else Current.showEmptyState
	
	return if IsUseDraftQueryResultMatch then ReactModule.createElement(SearchEmptyStateModule, { testId = "SearchPage.EmptyState" }) else ReactModule.createElement(ExperienceResultsListModule, {
		testIdPrefix = "SearchPage",
		items = Results.items,
		hasDisplayedItems = #Results.displayedItems > 0,
		hasDisplayedResult = Results.hasDisplayedResult,
		hasPendingSummary = Results.hasPendingSummary,
		listStatus = Results.listStatus,
		failedLoadMore = Results.failedLoadMore,
		retryLoadMore = Results.retryLoadMore,
		loadError = Results.loadError,
		onOpenChat = p2.onOpenChat
	})
end

local function BuildSearchScreen(p2)
	-- upvalues: UseBuildPageLayoutModule (copy), UseNavigationFocusFunction (copy), UseOnScreenKeyboardVisibleModule (copy), GetSearchQueryStoreModule (copy), SignalsReactModule (copy), UseLocalizationFunction (copy), ReactModule (copy), config (copy), UseMyCreationsResultsModule (copy), UseScrollPerformanceTrackerModule (copy), ExperienceResultsLoadingSkeletonModule (copy), FullscreenPageWithSafeArea (copy), SearchPageContainerModule (copy), BuildSearchResults (copy)
	local ScreenProps = p2.screenProps or {}
	local Navigation = p2.navigation
	local UseBuildPageLayoutModuleResult = UseBuildPageLayoutModule()
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local UseOnScreenKeyboardVisibleModuleResult = UseOnScreenKeyboardVisibleModule()
	local SearchQueryStoreParam = Navigation.getParam("searchQueryStore") or (ScreenProps.searchQueryStore or GetSearchQueryStoreModule())
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(SearchQueryStoreParam.getDraftQuery)
	local UseLocalizationResult = UseLocalizationFunction({ searchbarPlaceholder = "Feature.Build.Label.SearchGames" })
	local UseResult = ReactModule.useCallback(function(Target)
		-- upvalues: Navigation (copy), config (upval)
		Navigation.navigate(config.BuildChat, { target = Target })
	end, { Navigation })
	local UseMyCreationsResultsModuleResult = UseMyCreationsResultsModule({
		creatorAgentChatStore = ScreenProps.creatorAgentChatStore,
		configurationStore = ScreenProps.configurationStore,
		searchStore = ScreenProps.searchStore,
		searchQueryStore = SearchQueryStoreParam,
		isFocused = UseNavigationFocusResult
	})
	local UseRefResult = ReactModule.useRef(nil)
	local Current = UseRefResult.current
	local MapResult = UseSignalBindingResult:map(function(p3)
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		return if Current == nil then p3 else Current.query
	end)
	local UseMyCreationsResultsModuleResult1 = if Current == nil then UseMyCreationsResultsModuleResult else Current.results
	local UseRefResult1 = ReactModule.useRef(nil)
	UseScrollPerformanceTrackerModule("LuaApp_Build_Search_Scroll", UseRefResult1)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseMyCreationsResultsModuleResult1 (copy), ReactModule (upval), ExperienceResultsLoadingSkeletonModule (upval)
		return if UseMyCreationsResultsModuleResult1.isLoadingMore then ReactModule.createElement(ExperienceResultsLoadingSkeletonModule, { LayoutOrder = 1, index = 1, testIdPrefix = "SearchPage" }) else nil
	end, { UseMyCreationsResultsModuleResult1.isLoadingMore })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: SearchQueryStoreParam (copy), UseRefResult (copy), UseMyCreationsResultsModuleResult (copy), Navigation (copy)
		local DraftQuery = SearchQueryStoreParam.getDraftQuery()
		UseRefResult.current = {
			query = DraftQuery,
			results = UseMyCreationsResultsModuleResult,
			showEmptyState = DraftQuery == "" or (DraftQuery ~= UseMyCreationsResultsModuleResult.query or UseMyCreationsResultsModuleResult.isSettledNoResults)
		}
		SearchQueryStoreParam.endSearch()
		Navigation.goBack()
	end, {
		UseRefResult,
		Navigation,
		UseMyCreationsResultsModuleResult,
		SearchQueryStoreParam
	})
	ReactModule.useEffect(function()
		-- upvalues: SearchQueryStoreParam (copy)
		SearchQueryStoreParam.beginSearch()
		
		return SearchQueryStoreParam.endSearch
	end, { SearchQueryStoreParam })
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = UseBuildPageLayoutModuleResult.shouldIncludeBottomBar and not UseOnScreenKeyboardVisibleModuleResult
	}, {
		Page = ReactModule.createElement(SearchPageContainerModule, {
			showEmptyState = false,
			ref = UseRefResult1,
			createFooter = UseResult1,
			onBack = UseResult2,
			onCanvasPositionChangedCallback = UseMyCreationsResultsModuleResult1.loadMoreIfNeeded,
			onCanvasSizeChangedCallback = UseMyCreationsResultsModuleResult1.loadMoreIfNeeded,
			refresh = UseMyCreationsResultsModuleResult1.refresh,
			searchBarProps = {
				clear = SearchQueryStoreParam.clear,
				onFocusGained = SearchQueryStoreParam.beginSearch,
				placeholder = UseLocalizationResult.searchbarPlaceholder,
				query = MapResult,
				setQuery = SearchQueryStoreParam.setQuery,
				shouldFocus = UseNavigationFocusResult
			}
		}, {
			ExperienceResults = ReactModule.createElement(BuildSearchResults, {
				closingSnapshot = UseRefResult,
				onOpenChat = UseResult,
				results = UseMyCreationsResultsModuleResult,
				searchQueryStore = SearchQueryStoreParam
			})
		})
	})
end

local function BuildGetUsersScreen(p2)
	-- upvalues: UseBuildPageLayoutModule (copy), BuildNavigationParamsModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), UseAdsStatsPageViewModelModule (copy), AdsStatsViewModule (copy), View (copy), Button (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy), FullscreenPageWithSafeArea (copy), OverflowMenuPageShellModule (copy), AdsManagerMenuButtonModule (copy), FFlagBuildBackButtonChevronModule (copy), OverlayProvider (copy), AdCampaignCreatedToastModule (copy)
	local Navigation = p2.navigation
	local UseBuildPageLayoutModuleResult = UseBuildPageLayoutModule()
	local Target = BuildNavigationParamsModule.getTarget(Navigation)
	local UniverseId = if Target == nil then nil else Target.universeId
	local PageTitle = UseLocalizationFunction({
		pageTitle = LocalizationStringsModule.ADS_STATS_PAGE_TITLE
	}).pageTitle
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Navigation (copy)
		Navigation.goBack()
	end, { Navigation })
	local UseAdsStatsPageViewModelModuleResult = UseAdsStatsPageViewModelModule(UniverseId)
	local Element = ReactModule.createElement(AdsStatsViewModule, UseAdsStatsPageViewModelModuleResult)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = UseBuildPageLayoutModuleResult.shouldIncludeBottomBar
	}, {
		Page = ReactModule.createElement(OverflowMenuPageShellModule, {
			scrollPerformanceIntervalName = "LuaApp_Build_GetUsers_Scroll",
			testId = "BuildPage.GetUsersPage",
			title = PageTitle,
			onClose = UseResult,
			content = Element,
			footer = if UseAdsStatsPageViewModelModuleResult.isLoading or UseAdsStatsPageViewModelModuleResult.isFailed then nil else ReactModule.createElement(View, {
				tag = "col size-full-0 auto-y",
				testId = "BuildPage.GetUsers.Footer"
			}, {
				ToastAnchor = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "size-full-0",
					testId = "BuildPage.GetUsers.ToastAnchor",
					ref = UseStateResult2
				}),
				Actions = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "row size-full-0 auto-y padding-y-medium",
					testId = "BuildPage.GetUsers.Actions"
				}, {
					Create = ReactModule.createElement(Button, {
						testId = "BuildPage.GetUsers.Create",
						text = UseAdsStatsPageViewModelModuleResult.createButtonText,
						icon = if UseAdsStatsPageViewModelModuleResult.createButtonIsExternal then IconName.ArrowUpRightFromSquare else nil,
						size = InputSize.Large,
						variant = ButtonVariant.Emphasis,
						fillBehavior = FillBehavior.Fill,
						width = UDim.new(1, 0),
						isLoading = UseAdsStatsPageViewModelModuleResult.isPromotionCreatePending,
						onActivated = UseAdsStatsPageViewModelModuleResult.onCreatePrimary
					})
				})
			}),
			disableScrolling = not UseAdsStatsPageViewModelModuleResult.isLoading and (not UseAdsStatsPageViewModelModuleResult.isFailed and not UseAdsStatsPageViewModelModuleResult.hasCampaigns),
			headerTrailing = ReactModule.createElement(AdsManagerMenuButtonModule, {
				testId = "BuildPage.GetUsersPage.AdsManagerMenu",
				universeId = UniverseId
			}),
			closeIcon = if FFlagBuildBackButtonChevronModule then nil else IconName.ChevronLargeLeft
		}),
		SuccessToast = if UseAdsStatsPageViewModelModuleResult.showCreateSuccessToast and UseStateResult ~= nil then ReactModule.createElement(OverlayProvider, { gui = UseStateResult }, {
			Toast = ReactModule.createElement(AdCampaignCreatedToastModule, {
				testId = "BuildPage.GetUsers.SuccessToast",
				onClose = UseAdsStatsPageViewModelModuleResult.onDismissCreateSuccessToast,
				title = UseAdsStatsPageViewModelModuleResult.createSuccessToastText
			})
		}) else nil
	})
end

local List = {
	{
		[config.BuildHome] = {
			screen = function(p2)
				-- upvalues: UseBuildPageLayoutModule (copy), UseNavigationFocusFunction (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), config (copy), FFlagBuildExperienceMyCreationsLongPressMenuModule (copy), useHomeConfigurationPages (copy), FFlagBuildAdUpsellModule (copy), GetAdsCampaignDeepLinkStoreModule (copy), SendBuildExperienceEventModule (copy), ResumeBuildChatModule (copy), GetSearchQueryStoreModule (copy), FullscreenPageWithSafeArea (copy), View (copy), BuildPageHeaderModule (copy), MyCreationsTabModule (copy), FFlagBuildPublishNavigationSheetModule (copy), PublishSheetControllerModule (copy)
				local ScreenProps = p2.screenProps or {}
				local Navigation = p2.navigation
				local UseBuildPageLayoutModuleResult = UseBuildPageLayoutModule()
				local UseNavigationFocusResult = UseNavigationFocusFunction()
				local Tokens = UseBuildPageLayoutModuleResult.tokens
				local FallbackExperienceName = UseLocalizationFunction({
					fallbackExperienceName = LocalizationStringsModule.BUILD_ASSISTANT_FALLBACK_NAME
				}).fallbackExperienceName
				local UseResult = ReactModule.useCallback(function(Target)
					-- upvalues: Navigation (copy), config (upval)
					Navigation.navigate(config.BuildChat, { target = Target })
				end, { Navigation })
				local UseHomeConfigurationPagesResult = if FFlagBuildExperienceMyCreationsLongPressMenuModule then useHomeConfigurationPages(Navigation) else nil
				local PublishSheetTarget = if UseHomeConfigurationPagesResult == nil then nil else UseHomeConfigurationPagesResult.publishSheetTarget
				ReactModule.useEffect(function()
					-- upvalues: FFlagBuildAdUpsellModule (upval), GetAdsCampaignDeepLinkStoreModule (upval), ScreenProps (copy), SendBuildExperienceEventModule (upval), ResumeBuildChatModule (upval), FallbackExperienceName (copy), UseResult (copy)
					if FFlagBuildAdUpsellModule then
						local AdsCampaignDeepLinkStoreModule = GetAdsCampaignDeepLinkStoreModule(false)
						
						if ScreenProps.resumeRequestId then
							local UniverseId = if ScreenProps.adsCampaignIntent then ScreenProps.universeId else nil
							
							if AdsCampaignDeepLinkStoreModule.begin(ScreenProps.resumeRequestId, UniverseId) and UniverseId ~= nil then
								SendBuildExperienceEventModule("AD_CAMPAIGN_DEEP_LINK_RECEIVED", { universeId = ScreenProps.universeId }, { requestId = ScreenProps.resumeRequestId })
							end
						else
							local Request = AdsCampaignDeepLinkStoreModule.getRequest(false)
							
							if Request ~= nil then
								AdsCampaignDeepLinkStoreModule.finish(Request.id)
							end
						end
					end
					return ResumeBuildChatModule({
						universeId = ScreenProps.universeId,
						sessionId = ScreenProps.sessionId,
						creatorAgentChatStore = ScreenProps.creatorAgentChatStore,
						configurationStore = ScreenProps.configurationStore,
						fallbackExperienceName = FallbackExperienceName,
						onOpenChat = UseResult
					})
				end, {
					UseResult, ScreenProps.universeId, ScreenProps.sessionId,
					ScreenProps.resumeRequestId,
					if FFlagBuildAdUpsellModule then ScreenProps.adsCampaignIntent else nil,
					ScreenProps.creatorAgentChatStore, ScreenProps.configurationStore,
					FallbackExperienceName
				})
				local SearchQueryStore = ScreenProps.searchQueryStore or GetSearchQueryStoreModule()
				
				return ReactModule.createElement(FullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = Tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = Tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = UseBuildPageLayoutModuleResult.shouldIncludeBottomBar
				}, {
					Page = ReactModule.createElement(View, { tag = "col align-x-center size-full bg-surface-0" }, {
						Header = ReactModule.createElement(BuildPageHeaderModule, {
							LayoutOrder = 1,
							height = UseBuildPageLayoutModuleResult.topBarHeight,
							searchQueryStore = SearchQueryStore,
							onOpenSearch = ReactModule.useCallback(function()
								-- upvalues: SearchQueryStore (copy), Navigation (copy), config (upval)
								SearchQueryStore.beginSearch()
								Navigation.navigate(config.BuildSearch, { searchQueryStore = SearchQueryStore })
							end, { Navigation, SearchQueryStore })
						}),
						Content = ReactModule.createElement(View, {
							LayoutOrder = 2,
							ZIndex = 4,
							tag = "col align-x-center fill gap-small size-full-0"
						}, {
							SearchBarContainer = nil,
							MyCreations = ReactModule.createElement(MyCreationsTabModule, {
								LayoutOrder = 3,
								creatorAgentChatStore = ScreenProps.creatorAgentChatStore,
								configurationStore = ScreenProps.configurationStore,
								searchStore = ScreenProps.searchStore,
								searchQueryStore = ScreenProps.searchQueryStore,
								isFocused = UseNavigationFocusResult,
								autoOpenNewGame = ScreenProps.universeId == nil and ScreenProps.sessionId == nil,
								onOpenChat = UseResult,
								onOpenConfigurationPage = if UseHomeConfigurationPagesResult == nil then nil else UseHomeConfigurationPagesResult.onOpenConfigurationPage
							})
						})
					}),
					PublishSheet = if FFlagBuildPublishNavigationSheetModule and UseHomeConfigurationPagesResult ~= nil and PublishSheetTarget ~= nil and PublishSheetTarget.universeId ~= nil then ReactModule.createElement(PublishSheetControllerModule, {
						isOpen = UseHomeConfigurationPagesResult.isPublishSheetOpen,
						target = PublishSheetTarget,
						onClose = UseHomeConfigurationPagesResult.onClosePublishSheet,
						navigateToSubPage = UseHomeConfigurationPagesResult.navigateToPublishSubPage
					}) else nil
				})
			end
		}
	},
	{
		[config.BuildChat] = {
			screen = function(p2)
				-- upvalues: BuildNavigationParamsModule (copy), FFlagBuildExperienceAnalytics (copy), GetBuildExperienceRefreshStoreModule (copy), UseBuildPageLayoutModule (copy), FFlagBuildAdUpsellModule1 (copy), UseNavigationFocusFunction (copy), UseOnScreenKeyboardVisibleModule (copy), ReactModule (copy), FFlagBuildPublishNavigationSheetModule (copy), BuildOverflowMenuScreensModule (copy), FFlagBuildExperienceLibrary (copy), OpenLibraryModule (copy), FFlagBuildExperiencePrivateInvitesModule (copy), config (copy), FFlagEnableBuildAdPromotionModule (copy), BuildChatPageModule (copy), FullscreenPageWithSafeArea (copy), PrivateInvitesPickerHostModule (copy), PublishSheetControllerModule (copy)
				local Navigation = p2.navigation
				local Target = BuildNavigationParamsModule.getTarget(Navigation)
				local InitialPrompt = if FFlagBuildExperienceAnalytics then BuildNavigationParamsModule.getInitialPrompt(Navigation) else nil
				local BuildExperienceRefreshStoreModule = GetBuildExperienceRefreshStoreModule()
				local UseBuildPageLayoutModuleResult = UseBuildPageLayoutModule()
				local NoFFlagBuildAdUpsellModule1 = not FFlagBuildAdUpsellModule1 or UseNavigationFocusFunction()
				local UseOnScreenKeyboardVisibleModuleResult = UseOnScreenKeyboardVisibleModule()
				local UseStateResult, UseStateResult2 = ReactModule.useState(false)
				local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
				local UseResult = ReactModule.useCallback(function()
					-- upvalues: Navigation (copy)
					Navigation.goBack()
				end, { Navigation })
				local UseResult1 = ReactModule.useCallback(function()
					-- upvalues: UseStateResult2_1 (copy)
					UseStateResult2_1(false)
				end, {})
				local UseResult2 = ReactModule.useCallback(function(p3)
					-- upvalues: FFlagBuildPublishNavigationSheetModule (upval), UseStateResult2_1 (copy), BuildOverflowMenuScreensModule (upval), Navigation (copy), Target (copy)
					if FFlagBuildPublishNavigationSheetModule and p3 == "publish" then
						UseStateResult2_1(true)
						
						return
					end
					local SCREENBYPAGEEntry = BuildOverflowMenuScreensModule.SCREEN_BY_PAGE[p3]
					
					if SCREENBYPAGEEntry ~= nil then
						Navigation.navigate(SCREENBYPAGEEntry, { target = Target })
						
						return
					end
				end, { Navigation, Target })
				local UseResult3 = ReactModule.useCallback(function()
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(true)
				end, {})
				local UseResult4 = ReactModule.useCallback(function()
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(false)
				end, {})
				local UseResult5 = ReactModule.useCallback(function()
					-- upvalues: Navigation (copy), BuildOverflowMenuScreensModule (upval), Target (copy)
					Navigation.navigate(BuildOverflowMenuScreensModule.Screens.BuildPlaytestInviteManagement, { target = Target })
				end, { Navigation, Target })
				local UseResult6 = if FFlagBuildExperienceLibrary then ReactModule.useCallback(function(p3)
					-- upvalues: Target (copy), OpenLibraryModule (upval)
					local PlaceId = if Target == nil then nil else Target.placeId
					
					if PlaceId ~= nil then
						OpenLibraryModule(PlaceId, p3)
					end
				end, { Target }) else nil
				local UseResult7 = ReactModule.useCallback(function()
					-- upvalues: UseStateResult2 (copy), FFlagBuildExperiencePrivateInvitesModule (upval), UseResult5 (copy)
					UseStateResult2(false)
					
					if FFlagBuildExperiencePrivateInvitesModule then
						UseResult5()
					end
				end, { UseResult5 })
				local UseResult8 = ReactModule.useCallback(function()
					-- upvalues: Navigation (copy), config (upval), Target (copy)
					Navigation.navigate(config.BuildAgents, { target = Target })
				end, { Navigation, Target })
				local UseResult9 = ReactModule.useCallback(function()
					-- upvalues: Navigation (copy), config (upval), Target (copy)
					Navigation.navigate(config.BuildCreatorCredit, { target = Target })
				end, { Navigation, Target })
				local UseResult10 = ReactModule.useCallback(function(p3, Target)
					-- upvalues: Navigation (copy)
					Navigation.navigate(p3, { target = Target })
				end, { Navigation })
				local UseResult11 = if FFlagEnableBuildAdPromotionModule then ReactModule.useCallback(function()
					-- upvalues: Navigation (copy), config (upval), Target (copy)
					Navigation.navigate(config.BuildGetUsers, { target = Target })
				end, { Navigation, Target }) else nil
				local UseResult12 = ReactModule.useCallback(function(Target)
					-- upvalues: Navigation (copy), BuildExperienceRefreshStoreModule (copy)
					Navigation.setParams({ target = Target })
					BuildExperienceRefreshStoreModule.bumpRefreshTick()
				end, { Navigation, BuildExperienceRefreshStoreModule })
				local UniverseId = if Target == nil then nil else Target.universeId
				
				return ReactModule.createElement(ReactModule.Fragment, nil, {
					Page = ReactModule.createElement(FullscreenPageWithSafeArea, {
						includeStatusBar = true,
						BackgroundColor3 = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Color3,
						BackgroundTransparency = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Transparency,
						includeBottomBar = UseBuildPageLayoutModuleResult.shouldIncludeBottomBar and not UseOnScreenKeyboardVisibleModuleResult
					}, {
						Page = if Target == nil then nil else ReactModule.createElement(BuildChatPageModule, {
							target = Target,
							onOpenLibrary = UseResult6,
							initialPrompt = InitialPrompt,
							onClose = UseResult,
							onOpenAgentsPage = UseResult8,
							onOpenCreatorCreditPage = UseResult9,
							onOpenGetUsersPage = UseResult11,
							onOpenConfigurationPage = UseResult2,
							onOpenInvitePicker = UseResult3,
							onOpenInviteManagement = UseResult5,
							onNavigateToResolvedTarget = UseResult12,
							isFocused = if FFlagBuildAdUpsellModule1 then NoFFlagBuildAdUpsellModule1 else nil
						})
					}),
					Picker = if UseStateResult and UniverseId ~= nil then ReactModule.createElement(PrivateInvitesPickerHostModule, {
						universeId = UniverseId,
						onClose = UseResult4,
						onInvitesSent = UseResult7
					}) else nil,
					PublishSheet = if FFlagBuildPublishNavigationSheetModule and (Target ~= nil and Target.universeId ~= nil) then ReactModule.createElement(PublishSheetControllerModule, {
						isOpen = UseStateResult1,
						target = Target,
						onClose = UseResult1,
						navigateToSubPage = UseResult10
					}) else nil
				})
			end
		}
	},
	{
		[BuildOverflowMenuScreensModule.Screens.BuildPublish] = {
			screen = BuildOverflowMenuScreensModule.BuildPublishScreen
		}
	},
	{
		[BuildOverflowMenuScreensModule.Screens.BuildSettings] = {
			screen = BuildOverflowMenuScreensModule.BuildSettingsScreen
		}
	},
	{
		[BuildOverflowMenuScreensModule.Screens.BuildAudience] = {
			screen = BuildOverflowMenuScreensModule.BuildAudienceScreen
		}
	},
	{
		[BuildOverflowMenuScreensModule.Screens.BuildPlaytestInviteManagement] = {
			screen = BuildOverflowMenuScreensModule.BuildPlaytestInviteManagementScreen
		}
	},
	{
		[BuildOverflowMenuScreensModule.Screens.BuildTitleDescription] = {
			screen = BuildOverflowMenuScreensModule.BuildTitleDescriptionScreen
		}
	},
	{
		[BuildOverflowMenuScreensModule.Screens.BuildVersionTitleDescription] = {
			screen = BuildOverflowMenuScreensModule.BuildVersionTitleDescriptionScreen
		}
	},
	{
		[BuildOverflowMenuScreensModule.Screens.BuildMediaSelection] = {
			screen = BuildOverflowMenuScreensModule.BuildMediaSelectionScreen
		}
	},
	{
		[config.BuildAgents] = {
			screen = function(p2)
				-- upvalues: UseBuildPageLayoutModule (copy), useLiveSubagentTaskState (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), config (copy), BuildNavigationParamsModule (copy), SubagentStatusModule (copy), FullscreenPageWithSafeArea (copy), OverflowMenuPageShellModule (copy), FFlagBuildBackButtonChevronModule (copy), IconName (copy)
				local Navigation = p2.navigation
				local UseBuildPageLayoutModuleResult = UseBuildPageLayoutModule()
				local UseLiveSubagentTaskStateResult = useLiveSubagentTaskState(Navigation)
				
				return ReactModule.createElement(FullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = UseBuildPageLayoutModuleResult.shouldIncludeBottomBar
				}, {
					Page = ReactModule.createElement(OverflowMenuPageShellModule, {
						scrollPerformanceIntervalName = "LuaApp_Build_Agents_Scroll",
						testId = "BuildPage.AgentsPage",
						title = UseLocalizationFunction({
							agents = LocalizationStringsModule.SUBAGENT_STATUS_AGENTS
						}).agents,
						onClose = ReactModule.useCallback(function()
							-- upvalues: Navigation (copy)
							Navigation.goBack()
						end, { Navigation }),
						content = ReactModule.createElement(SubagentStatusModule.AgentsList, {
							testId = "BuildPage.AgentsList",
							groups = if UseLiveSubagentTaskStateResult == nil then {} else UseLiveSubagentTaskStateResult.groups,
							onAgentActivated = ReactModule.useCallback(function(p3)
								-- upvalues: Navigation (copy), config (upval), BuildNavigationParamsModule (upval)
								Navigation.navigate(config.BuildAgentDetails, {
									target = BuildNavigationParamsModule.getTarget(Navigation),
									subagentTaskGroupName = p3.name
								})
							end, { Navigation })
						}),
						closeIcon = if FFlagBuildBackButtonChevronModule then nil else IconName.ChevronLargeLeft
					})
				})
			end
		}
	},
	{
		[config.BuildAgentDetails] = {
			screen = function(p2)
				-- upvalues: UseBuildPageLayoutModule (copy), useLiveSubagentTaskState (copy), BuildNavigationParamsModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), SubagentStatusModule (copy), View (copy), FullscreenPageWithSafeArea (copy), OverflowMenuPageShellModule (copy), FFlagBuildBackButtonChevronModule (copy), IconName (copy)
				local Navigation = p2.navigation
				local UseBuildPageLayoutModuleResult = UseBuildPageLayoutModule()
				local UseLiveSubagentTaskStateResult = useLiveSubagentTaskState(Navigation)
				local SubagentTaskGroupName = BuildNavigationParamsModule.getSubagentTaskGroupName(Navigation)
				local Group = nil
				
				if UseLiveSubagentTaskStateResult == nil or SubagentTaskGroupName == nil then
					Group = nil
				else
					Group = nil
					
					for _, group in UseLiveSubagentTaskStateResult.groups do
						if group.name == SubagentTaskGroupName then
							Group = group
							break
						end
					end
				end
				local Agents = UseLocalizationFunction({
					agents = LocalizationStringsModule.SUBAGENT_STATUS_AGENTS
				}).agents
				
				return ReactModule.createElement(FullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = UseBuildPageLayoutModuleResult.shouldIncludeBottomBar
				}, {
					Page = ReactModule.createElement(OverflowMenuPageShellModule, {
						scrollPerformanceIntervalName = "LuaApp_Build_AgentDetails_Scroll",
						testId = "BuildPage.AgentDetailsPage",
						title = SubagentTaskGroupName or Agents,
						onClose = ReactModule.useCallback(function()
							-- upvalues: Navigation (copy)
							Navigation.goBack()
						end, { Navigation }),
						content = if Group == nil then ReactModule.createElement(View, { tag = "size-full" }) else ReactModule.createElement(SubagentStatusModule.AgentDetailsList, { testId = "BuildPage.AgentDetailsList", group = Group }),
						closeIcon = if FFlagBuildBackButtonChevronModule then nil else IconName.ChevronLargeLeft
					})
				})
			end
		}
	},
	{
		[config.BuildCreatorCredit] = {
			screen = function(p3)
				-- upvalues: UseBuildPageLayoutModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), CreatorCreditPageContainerModule (copy), FullscreenPageWithSafeArea (copy), OverflowMenuPageShellModule (copy), CreatorCreditBalanceChipContainerModule (copy), FFlagBuildBackButtonChevronModule (copy), IconName (copy)
				local Navigation = p3.navigation
				local UseBuildPageLayoutModuleResult = UseBuildPageLayoutModule()
				
				return ReactModule.createElement(FullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = UseBuildPageLayoutModuleResult.shouldIncludeBottomBar
				}, {
					Page = ReactModule.createElement(OverflowMenuPageShellModule, {
						scrollPerformanceIntervalName = "LuaApp_Build_CreatorCredit_Scroll",
						testId = "BuildPage.CreatorCreditPage",
						title = UseLocalizationFunction({
							pageTitle = LocalizationStringsModule.CREATOR_CREDIT_PAGE_TITLE
						}).pageTitle,
						onClose = ReactModule.useCallback(function()
							-- upvalues: Navigation (copy)
							Navigation.goBack()
						end, { Navigation }),
						content = ReactModule.createElement(CreatorCreditPageContainerModule, nil),
						headerTrailing = ReactModule.createElement(CreatorCreditBalanceChipContainerModule),
						closeIcon = if FFlagBuildBackButtonChevronModule then nil else IconName.ChevronLargeLeft
					})
				})
			end
		}
	}
}

if FFlagBuildExperienceMonetizationNativeUIModule then
	table.insert(List, {
		[BuildOverflowMenuScreensModule.Screens.BuildMonetization] = { screen = BuildMonetizationScreen }
	})
end
if FFlagBuildExperienceAnalytics then
	table.insert(List, {
		[BuildOverflowMenuScreensModule.Screens.BuildStats] = { screen = BuildOverflowMenuScreensModule.BuildStatsScreen }
	})
end
if FFlagEnableBuildAdPromotionModule then
	table.insert(List, {
		[config.BuildGetUsers] = { screen = BuildGetUsersScreen }
	})
end
table.insert(List, { [config.BuildSearch] = { screen = BuildSearchScreen } })
local RobloxStackNavigator = RoactNavigationModule.createRobloxStackNavigator(List, { initialRouteName = config.BuildHome })

local function BuildPage(p3)
	-- upvalues: UseTTINavigationTrackingFunction (copy), UseBuildPageEligibilityModule (copy), NoFFlagEnableBuildTabOverride (copy), FFlagBuildExperienceHideNavBarOnSubPages (copy), UseManageBuildNavBarVisibilityModule (copy), config (copy), ReactModule (copy), RobloxStackNavigator (copy), BuildEligibilityDialogModule (copy), View (copy), Loading (copy), IconSize (copy)
	UseTTINavigationTrackingFunction("NavigateTo_" .. p3.navigation.state.routeName)
	local ExtraPropsParam = p3.navigation.getParam("extraProps", {})
	local UseBuildPageEligibilityResult = UseBuildPageEligibilityModule.useBuildPageEligibility(NoFFlagEnableBuildTabOverride)
	
	if FFlagBuildExperienceHideNavBarOnSubPages then
		UseManageBuildNavBarVisibilityModule(p3.navigation, config.BuildHome)
	end
	return if UseBuildPageEligibilityResult.canEnterBuild then ReactModule.createElement(RobloxStackNavigator, {
		navigation = p3.navigation,
		screenProps = ExtraPropsParam
	}) elseif UseBuildPageEligibilityResult.status == UseBuildPageEligibilityModule.Status.Ineligible then ReactModule.createElement(BuildEligibilityDialogModule, {
		variant = UseBuildPageEligibilityModule.Status.Ineligible,
		onDismiss = UseBuildPageEligibilityResult.onDialogDismiss
	}) elseif UseBuildPageEligibilityResult.status == UseBuildPageEligibilityModule.Status.Error then ReactModule.createElement(BuildEligibilityDialogModule, {
		variant = UseBuildPageEligibilityModule.Status.Error,
		onDismiss = UseBuildPageEligibilityResult.onDialogDismiss
	}) elseif UseBuildPageEligibilityResult.status == UseBuildPageEligibilityModule.Status.Refreshing then ReactModule.createElement(View, {
		tag = "col align-x-center align-y-center size-full",
		testId = "BuildPage.EligibilityLoading"
	}, {
		Spinner = ReactModule.createElement(Loading, { size = IconSize.Large })
	}) else ReactModule.createElement(View, {
		tag = "size-full",
		testId = "BuildPage.EligibilityPrompting"
	})
end

local BuildPageScreen = ReactModule.Component:extend("BuildPageScreen")

function BuildPageScreen.render(p3)
	-- upvalues: ReactModule (copy), BuildPage (copy)
	return ReactModule.createElement(BuildPage, p3.props)
end

BuildPageScreen.router = RobloxStackNavigator.router

return BuildPageScreen