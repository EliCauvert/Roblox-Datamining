local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local loading = foundationModule.Loading
local overlayProvider = foundationModule.OverlayProvider
local view = foundationModule.View
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local useNavigationFocus = navigationModule.useNavigationFocus
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local signalsReactModule = require(parent.SignalsReact)
local buildPageHeaderModule = require(script.Parent.Components.BuildPageHeader.BuildPageHeader)
local buildChatPageModule = require(script.Parent.Components.BuildChatPage.BuildChatPage)
local chatSheetModule = require(script.Parent.Components.ChatSheet.ChatSheet)
local fFlagBuildExperienceLibrary = sharedFlagsModule.FFlagBuildExperienceLibrary
local openLibraryModule = require(script.Parent.utils.openLibrary)
local searchPageContainerModule = require(script.Parent.Components.SearchPage.SearchPageContainer)
local searchEmptyStateModule = require(script.Parent.Components.SearchEmptyState.SearchEmptyState)
local subagentStatusModule = require(script.Parent.Components.SubagentStatus)
local myCreationsTabModule = require(script.Parent.Components.MyCreationsTab.MyCreationsTab)
local experienceResultsListModule = require(script.Parent.Components.MyCreationsTab.ExperienceResultsList)
local experienceResultsLoadingSkeletonModule = require(script.Parent.Components.MyCreationsTab.ExperienceResultsLoadingSkeleton)
local useMyCreationsResultsModule = require(script.Parent.Components.MyCreationsTab.useMyCreationsResults)
local buildOverflowMenuScreensModule = require(script.Parent.Components.BuildPillMenu.BuildOverflowMenuScreens)
local fFlagBuildExperienceMonetizationNativeUIModule = require(script.Parent.Flags.FFlagBuildExperienceMonetizationNativeUI)
local overflowMenuPageShellModule = require(script.Parent.Components.BuildPillMenu.OverflowMenuPageShell)
local privateInvitesPickerHostModule = require(script.Parent.Components.PrivateInvitesPicker.PrivateInvitesPickerHost)
local creatorCreditPageContainerModule = require(script.Parent.Components.CreatorCreditSheet.CreatorCreditPageContainer)
local creatorCreditBalanceChipContainerModule = require(script.Parent.Components.CreatorCreditSheet.CreatorCreditBalanceChip.CreatorCreditBalanceChipContainer)
local adsStatsViewModule = require(script.Parent.Components.Ads.AdsStatsView)
local useAdsStatsPageViewModelModule = require(script.Parent.Components.Ads.useAdsStatsPageViewModel)
local adsManagerMenuButtonModule = require(script.Parent.Components.Ads.AdsManagerMenuButton)
local adCampaignCreatedToastModule = require(script.Parent.Components.Ads.AdCampaignCreatedToast)
local _ = require(script.Parent.Chat.chatTypes)
local useSessionSummaryModule = require(script.Parent.Chat.useSessionSummary)
local useScrollPerformanceTrackerModule = require(script.Parent.Telemetry.useScrollPerformanceTracker)
local fFlagBuildBackButtonChevronModule = require(script.Parent.Flags.FFlagBuildBackButtonChevron)
local fFlagBuildExperienceChatSheetReversedContentModule = require(script.Parent.Flags.FFlagBuildExperienceChatSheetReversedContent)
local list = { 0.5, 1 }
local fFlagBuildAdUpsellModule = require(script.Parent.Flags.FFlagBuildAdUpsell)
local fFlagEnableBuildAdPromotionModule = require(script.Parent.Flags.FFlagEnableBuildAdPromotion)
local _ = require(script.Parent.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local getBuildExperienceRefreshStoreModule = require(script.Parent.Stores.GetBuildExperienceRefreshStore)
local getSearchQueryStoreModule = require(script.Parent.Stores.GetSearchQueryStore)
local _ = require(script.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local buildNavigationParamsModule = require(script.Parent.utils.BuildNavigationParams)
local resumeBuildChatModule = require(script.Parent.utils.resumeBuildChat)
local useBuildPageLayoutModule = require(script.Parent.utils.useBuildPageLayout)
local useManageBuildNavBarVisibilityModule = require(script.Parent.utils.useManageBuildNavBarVisibility)
local useOnScreenKeyboardVisibleModule = require(script.Parent.utils.useOnScreenKeyboardVisible)
local fFlagBuildPublishNavigationSheetModule = require(script.Parent.Flags.FFlagBuildPublishNavigationSheet)
local fFlagBuildExperiencePrivateInvitesModule = require(script.Parent.Flags.FFlagBuildExperiencePrivateInvites)
local fFlagBuildExperienceMyCreationsLongPressMenuModule = require(script.Parent.Flags.FFlagBuildExperienceMyCreationsLongPressMenu)
local fFlagEnableBuildTabOverride = sharedFlagsModule.FFlagEnableBuildTabOverride
local fFlagBuildExperienceAnalytics = sharedFlagsModule.FFlagBuildExperienceAnalytics
local fFlagBuildExperienceHideNavBarOnSubPages = sharedFlagsModule.FFlagBuildExperienceHideNavBarOnSubPages
local getAdsCampaignDeepLinkStoreModule = require(buildExperience.Stores.GetAdsCampaignDeepLinkStore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local fFlagBuildAdUpsellModule_1 = fFlagBuildAdUpsellModule or fFlagBuildExperienceMonetizationNativeUIModule
local var1 = not fFlagEnableBuildTabOverride
local buildEligibilityDialogModule = require(script.Parent.Components.BuildEligibilityDialog)
local useBuildPageEligibilityModule = require(script.Parent.useBuildPageEligibility)
local var2 = if fFlagBuildPublishNavigationSheetModule then require(script.Parent.Components.PublishSheet.PublishSheetController) else nil
local useTTINavigationTracking = require(parent.TTINavigationTracking).useTTINavigationTracking
local t = {
	BuildHome = "BuildHome",
	BuildSearch = "BuildSearch",
	BuildAgents = "BuildAgents",
	BuildAgentDetails = "BuildAgentDetails",
	BuildCreatorCredit = "BuildCreatorCredit",
	BuildGetUsers = "BuildGetUsers",
	BuildChat = buildNavigationParamsModule.BUILD_CHAT_SCREEN
}

local function _(p1, p2)
	return if p1 ~= "" then if p1 == p2.query then p2.isSettledNoResults else true else true
end

local _ = function(p1, p2)
	if p1 == nil or p2 == nil then
		return nil
	end
	for i, v in p1.groups do
		if v.name == p2 then
			return v
		end
	end
	return nil
end

local function useLiveSubagentTaskState(p3)
	-- upvalues: buildNavigationParamsModule (ref), creatorAgentChatModule (ref), reactModule (ref), useSessionSummaryModule (ref)
	local target = buildNavigationParamsModule.getTarget(p3)
	assert(target ~= nil, "Agent pages require a build target")
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	
	return useSessionSummaryModule(reactModule.useMemo(function()
		-- upvalues: creatorAgentChatStore (ref), target (ref)
		return creatorAgentChatStore.getSessionForProject(target.universeId, target.placeId, target.sessionId)
	end, {
		creatorAgentChatStore,
		target.universeId,
		target.placeId,
		target.sessionId
	})).subagentTaskState or buildNavigationParamsModule.getSubagentTaskState(p3)
end

local _ = function(p3)
	-- upvalues: reactModule (ref), t (ref)
	return reactModule.useCallback(function(p4)
		-- upvalues: p3 (ref), t (copy)
		p3.navigate(t.BuildChat, { target = p4 })
	end, { p3 })
end

local function useHomeConfigurationPages(p3)
	-- upvalues: reactModule (ref), fFlagBuildPublishNavigationSheetModule (ref), buildOverflowMenuScreensModule (ref)
	local var3, var4 = reactModule.useState(nil)
	local var5, var6 = reactModule.useState(false)
	
	return {
		onOpenConfigurationPage = reactModule.useCallback(function(p4, p5)
			-- upvalues: fFlagBuildPublishNavigationSheetModule (copy), var4 (ref), var6 (ref), buildOverflowMenuScreensModule (copy), p3 (ref)
			if fFlagBuildPublishNavigationSheetModule and p4 == "publish" then
				var4(p5)
				var6(true)
				
				return
			end
			local var7 = buildOverflowMenuScreensModule.SCREEN_BY_PAGE[p4]
			
			if var7 == nil then
				return
			end
			p3.navigate(var7, { target = p5 })
		end, { p3 }),
		publishSheetTarget = var3,
		isPublishSheetOpen = var5,
		onClosePublishSheet = reactModule.useCallback(function()
			-- upvalues: var6 (ref)
			var6(false)
		end, {}),
		navigateToPublishSubPage = reactModule.useCallback(function(p4, p5)
			-- upvalues: p3 (ref)
			p3.navigate(p4, { target = p5 })
		end, { p3 })
	}
end

local function BuildMonetizationScreen(p3)
	-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), roactNavigationModule (ref), buildOverflowMenuScreensModule (ref), chatSheetModule (ref), fFlagBuildExperienceChatSheetReversedContentModule (ref), list (ref)
	local navigation = p3.navigation
	local target = buildNavigationParamsModule.getTarget(navigation)
	local var3, var4 = reactModule.useState(false)
	local var5 = target ~= nil
	local var6 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var4 (ref)
		if var5 then
			var4(true)
		end
	end, { var5 })
	local var7 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		var4(false)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), navigation (ref), roactNavigationModule (copy), var7 (ref)
		if var3 then
			local var8 = navigation.addListener(roactNavigationModule.Events.WillBlur, var7)
			
			return function()
				-- upvalues: var8 (ref)
				var8.remove()
			end
		end
	end, { var3, navigation, var7 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Page = reactModule.createElement(buildOverflowMenuScreensModule.BuildMonetizationScreen, { navigation = navigation, onComposerActivated = var6 }),
		Chat = if var3 and target ~= nil then reactModule.createElement(chatSheetModule, {
			autoFocusComposer = true,
			defaultSnapPointIndex = 1,
			isOpen = true,
			onClose = var7,
			placeId = target.placeId,
			sessionId = target.sessionId,
			snapPoints = if fFlagBuildExperienceChatSheetReversedContentModule then list else { 0.5 },
			universeId = target.universeId
		}) else nil
	})
end

local function BuildHomeScreen(p3)
	-- upvalues: useBuildPageLayoutModule (ref), useNavigationFocus (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), t (ref), fFlagBuildExperienceMyCreationsLongPressMenuModule (ref), useHomeConfigurationPages (ref), fFlagBuildAdUpsellModule (ref), getAdsCampaignDeepLinkStoreModule (ref), sendBuildExperienceEventModule (ref), resumeBuildChatModule (ref), getSearchQueryStoreModule (ref), fullscreenPageWithSafeArea (ref), view (ref), buildPageHeaderModule (ref), myCreationsTabModule (ref), fFlagBuildPublishNavigationSheetModule (ref), var2 (ref)
	local screenProps = p3.screenProps or {}
	local navigation = p3.navigation
	local var3 = useBuildPageLayoutModule()
	local var4 = useNavigationFocus()
	local tokens = var3.tokens
	local fallbackExperienceName = useLocalization({
		fallbackExperienceName = localizationStringsModule.BUILD_ASSISTANT_FALLBACK_NAME
	}).fallbackExperienceName
	local var5 = reactModule.useCallback(function(p4)
		-- upvalues: navigation (ref), t (copy)
		navigation.navigate(t.BuildChat, { target = p4 })
	end, { navigation })
	local var6 = if fFlagBuildExperienceMyCreationsLongPressMenuModule then useHomeConfigurationPages(navigation) else nil
	local var7 = if var6 ~= nil then nil else var6.publishSheetTarget
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildAdUpsellModule (copy), getAdsCampaignDeepLinkStoreModule (copy), screenProps (ref), sendBuildExperienceEventModule (copy), resumeBuildChatModule (copy), fallbackExperienceName (ref), var5 (ref)
		if fFlagBuildAdUpsellModule then
			local var8 = getAdsCampaignDeepLinkStoreModule(false)
			
			if screenProps.resumeRequestId then
				local var9 = if screenProps.adsCampaignIntent then screenProps.universeId else nil
				
				if var8.begin(screenProps.resumeRequestId, var9) and var9 ~= nil then
					sendBuildExperienceEventModule("AD_CAMPAIGN_DEEP_LINK_RECEIVED", { universeId = screenProps.universeId }, { requestId = screenProps.resumeRequestId })
				end
			else
				local request = var8.getRequest(false)
				
				if request ~= nil then
					var8.finish(request.id)
				end
			end
		end
		return resumeBuildChatModule({
			universeId = screenProps.universeId,
			sessionId = screenProps.sessionId,
			creatorAgentChatStore = screenProps.creatorAgentChatStore,
			configurationStore = screenProps.configurationStore,
			fallbackExperienceName = fallbackExperienceName,
			onOpenChat = var5
		})
	end, {
		var5, screenProps.universeId, screenProps.sessionId,
		screenProps.resumeRequestId,
		if fFlagBuildAdUpsellModule then screenProps.adsCampaignIntent else nil,
		screenProps.creatorAgentChatStore, screenProps.configurationStore,
		fallbackExperienceName
	})
	local searchQueryStore = screenProps.searchQueryStore or getSearchQueryStoreModule()
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var3.shouldIncludeBottomBar
	}, {
		Page = reactModule.createElement(view, { tag = "col align-x-center size-full bg-surface-0" }, {
			Header = reactModule.createElement(buildPageHeaderModule, {
				LayoutOrder = 1,
				height = var3.topBarHeight,
				searchQueryStore = searchQueryStore,
				onOpenSearch = reactModule.useCallback(function()
					-- upvalues: searchQueryStore (ref), navigation (ref), t (copy)
					searchQueryStore.beginSearch()
					navigation.navigate(t.BuildSearch, { searchQueryStore = searchQueryStore })
				end, { navigation, searchQueryStore })
			}),
			Content = reactModule.createElement(view, {
				LayoutOrder = 2,
				ZIndex = 4,
				tag = "col align-x-center fill gap-small size-full-0"
			}, {
				SearchBarContainer = nil,
				MyCreations = reactModule.createElement(myCreationsTabModule, {
					LayoutOrder = 3,
					creatorAgentChatStore = screenProps.creatorAgentChatStore,
					configurationStore = screenProps.configurationStore,
					searchStore = screenProps.searchStore,
					searchQueryStore = screenProps.searchQueryStore,
					isFocused = var4,
					autoOpenNewGame = screenProps.universeId == nil and screenProps.sessionId == nil,
					onOpenChat = var5,
					onOpenConfigurationPage = if var6 ~= nil then nil else var6.onOpenConfigurationPage
				})
			})
		}),
		PublishSheet = if fFlagBuildPublishNavigationSheetModule and var6 ~= nil and (var7 ~= nil and var7.universeId ~= nil) then reactModule.createElement(var2, {
			isOpen = var6.isPublishSheetOpen,
			target = var7,
			onClose = var6.onClosePublishSheet,
			navigateToSubPage = var6.navigateToPublishSubPage
		}) else nil
	})
end

local function BuildSearchResults(p3)
	-- upvalues: reactModule (ref), searchEmptyStateModule (ref), experienceResultsListModule (ref)
	local var3 = p3.searchQueryStore.useDraftQuery()
	local current = p3.closingSnapshot.current
	local var4 = if current ~= nil then p3.results else current.results
	
	return if if current == nil then if var3 ~= "" then if var3 == var4.query then var4.isSettledNoResults else true else true else current.showEmptyState then reactModule.createElement(searchEmptyStateModule, { testId = "SearchPage.EmptyState" }) else reactModule.createElement(experienceResultsListModule, {
		testIdPrefix = "SearchPage",
		items = var4.items,
		hasDisplayedItems = #var4.displayedItems > 0,
		hasDisplayedResult = var4.hasDisplayedResult,
		hasPendingSummary = var4.hasPendingSummary,
		listStatus = var4.listStatus,
		failedLoadMore = var4.failedLoadMore,
		retryLoadMore = var4.retryLoadMore,
		loadError = var4.loadError,
		onOpenChat = p3.onOpenChat
	})
end

local function BuildSearchScreen(p3)
	-- upvalues: useBuildPageLayoutModule (ref), useNavigationFocus (ref), useOnScreenKeyboardVisibleModule (ref), getSearchQueryStoreModule (ref), signalsReactModule (ref), useLocalization (ref), reactModule (ref), t (ref), useMyCreationsResultsModule (ref), useScrollPerformanceTrackerModule (ref), experienceResultsLoadingSkeletonModule (ref), fullscreenPageWithSafeArea (ref), searchPageContainerModule (ref), BuildSearchResults (ref)
	local screenProps = p3.screenProps or {}
	local navigation = p3.navigation
	local var3 = useBuildPageLayoutModule()
	local var4 = useNavigationFocus()
	local var5 = useOnScreenKeyboardVisibleModule()
	local searchQueryStore = navigation.getParam("searchQueryStore") or (screenProps.searchQueryStore or getSearchQueryStoreModule())
	local var6 = signalsReactModule.useSignalBinding(searchQueryStore.getDraftQuery)
	local var7 = useLocalization({ searchbarPlaceholder = "Feature.Build.Label.SearchGames" })
	local var8 = reactModule.useCallback(function(p4)
		-- upvalues: navigation (ref), t (copy)
		navigation.navigate(t.BuildChat, { target = p4 })
	end, { navigation })
	local var9 = useMyCreationsResultsModule({
		creatorAgentChatStore = screenProps.creatorAgentChatStore,
		configurationStore = screenProps.configurationStore,
		searchStore = screenProps.searchStore,
		searchQueryStore = searchQueryStore,
		isFocused = var4
	})
	local var10 = reactModule.useRef(nil)
	local current = var10.current
	local var11 = var6:map(function(p4)
		-- upvalues: var10 (ref)
		local current = var10.current
		
		return if current == nil then p4 else current.query
	end)
	local var12 = if current ~= nil then var9 else current.results
	local var13 = reactModule.useRef(nil)
	useScrollPerformanceTrackerModule("LuaApp_Build_Search_Scroll", var13)
	local var14 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), reactModule (copy), experienceResultsLoadingSkeletonModule (copy)
		return if var12.isLoadingMore then reactModule.createElement(experienceResultsLoadingSkeletonModule, { LayoutOrder = 1, index = 1, testIdPrefix = "SearchPage" }) else nil
	end, { var12.isLoadingMore })
	local var15 = reactModule.useCallback(function()
		-- upvalues: searchQueryStore (ref), var10 (ref), var9 (ref), navigation (ref)
		local draftQuery = searchQueryStore.getDraftQuery()
		var10.current = {
			query = draftQuery,
			results = var9,
			showEmptyState = if draftQuery ~= "" then if draftQuery == var9.query then var9.isSettledNoResults else true else true
		}
		searchQueryStore.endSearch()
		navigation.goBack()
	end, { var10, navigation, var9, searchQueryStore })
	reactModule.useEffect(function()
		-- upvalues: searchQueryStore (ref)
		searchQueryStore.beginSearch()
		
		return searchQueryStore.endSearch
	end, { searchQueryStore })
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var3.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var3.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var3.shouldIncludeBottomBar and not var5
	}, {
		Page = reactModule.createElement(searchPageContainerModule, {
			showEmptyState = false,
			ref = var13,
			createFooter = var14,
			onBack = var15,
			onCanvasPositionChangedCallback = var12.loadMoreIfNeeded,
			onCanvasSizeChangedCallback = var12.loadMoreIfNeeded,
			refresh = var12.refresh,
			searchBarProps = {
				clear = searchQueryStore.clear,
				onFocusGained = searchQueryStore.beginSearch,
				placeholder = var7.searchbarPlaceholder,
				query = var11,
				setQuery = searchQueryStore.setQuery,
				shouldFocus = var4
			}
		}, {
			ExperienceResults = reactModule.createElement(BuildSearchResults, {
				closingSnapshot = var10,
				onOpenChat = var8,
				results = var9,
				searchQueryStore = searchQueryStore
			})
		})
	})
end

local function BuildGetUsersScreen(p3)
	-- upvalues: useBuildPageLayoutModule (ref), buildNavigationParamsModule (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), useAdsStatsPageViewModelModule (ref), adsStatsViewModule (ref), view (ref), button (ref), iconName (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), adsManagerMenuButtonModule (ref), fFlagBuildBackButtonChevronModule (ref), overlayProvider (ref), adCampaignCreatedToastModule (ref)
	local navigation = p3.navigation
	local var3 = useBuildPageLayoutModule()
	local target = buildNavigationParamsModule.getTarget(navigation)
	local var4 = if target ~= nil then nil else target.universeId
	local pageTitle = useLocalization({
		pageTitle = localizationStringsModule.ADS_STATS_PAGE_TITLE
	}).pageTitle
	local var5 = reactModule.useCallback(function()
		-- upvalues: navigation (ref)
		navigation.goBack()
	end, { navigation })
	local var6 = useAdsStatsPageViewModelModule(var4)
	local var7 = reactModule.createElement(adsStatsViewModule, var6)
	local var8, var9 = reactModule.useState(nil)
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var3.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var3.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var3.shouldIncludeBottomBar
	}, {
		Page = reactModule.createElement(overflowMenuPageShellModule, {
			scrollPerformanceIntervalName = "LuaApp_Build_GetUsers_Scroll",
			testId = "BuildPage.GetUsersPage",
			title = pageTitle,
			onClose = var5,
			content = var7,
			footer = if var6.isLoading or var6.isFailed then nil else reactModule.createElement(view, {
				tag = "col size-full-0 auto-y",
				testId = "BuildPage.GetUsers.Footer"
			}, {
				ToastAnchor = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "size-full-0",
					testId = "BuildPage.GetUsers.ToastAnchor",
					ref = var9
				}),
				Actions = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row size-full-0 auto-y padding-y-medium",
					testId = "BuildPage.GetUsers.Actions"
				}, {
					Create = reactModule.createElement(button, {
						testId = "BuildPage.GetUsers.Create",
						text = var6.createButtonText,
						icon = if var6.createButtonIsExternal then iconName.ArrowUpRightFromSquare else nil,
						size = inputSize.Large,
						variant = buttonVariant.Emphasis,
						fillBehavior = fillBehavior.Fill,
						width = UDim.new(1, 0),
						isLoading = var6.isPromotionCreatePending,
						onActivated = var6.onCreatePrimary
					})
				})
			}),
			disableScrolling = not var6.isLoading and (not var6.isFailed and not var6.hasCampaigns),
			headerTrailing = reactModule.createElement(adsManagerMenuButtonModule, {
				testId = "BuildPage.GetUsersPage.AdsManagerMenu",
				universeId = var4
			}),
			closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft
		}),
		SuccessToast = if var6.showCreateSuccessToast and var8 ~= nil then reactModule.createElement(overlayProvider, { gui = var8 }, {
			Toast = reactModule.createElement(adCampaignCreatedToastModule, {
				testId = "BuildPage.GetUsers.SuccessToast",
				onClose = var6.onDismissCreateSuccessToast,
				title = var6.createSuccessToastText
			})
		}) else nil
	})
end

local list_1 = {
	{ [t.BuildHome] = { screen = BuildHomeScreen } },
	{
		[t.BuildChat] = {
			screen = function(p3)
				-- upvalues: buildNavigationParamsModule (ref), fFlagBuildExperienceAnalytics (ref), getBuildExperienceRefreshStoreModule (ref), useBuildPageLayoutModule (ref), fFlagBuildAdUpsellModule_1 (ref), useNavigationFocus (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), fFlagBuildPublishNavigationSheetModule (ref), buildOverflowMenuScreensModule (ref), fFlagBuildExperienceLibrary (ref), openLibraryModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), t (ref), fFlagEnableBuildAdPromotionModule (ref), buildChatPageModule (ref), fullscreenPageWithSafeArea (ref), privateInvitesPickerHostModule (ref), var2 (ref)
				local navigation = p3.navigation
				local target = buildNavigationParamsModule.getTarget(navigation)
				local var3 = if fFlagBuildExperienceAnalytics then buildNavigationParamsModule.getInitialPrompt(navigation) else nil
				local var4 = getBuildExperienceRefreshStoreModule()
				local var5 = useBuildPageLayoutModule()
				local var6 = if fFlagBuildAdUpsellModule_1 then useNavigationFocus() else true
				local var7 = useOnScreenKeyboardVisibleModule()
				local var8, var9 = reactModule.useState(false)
				local var10, var11 = reactModule.useState(false)
				local var12 = reactModule.useCallback(function()
					-- upvalues: navigation (ref)
					navigation.goBack()
				end, { navigation })
				local var13 = reactModule.useCallback(function()
					-- upvalues: var11 (ref)
					var11(false)
				end, {})
				local var14 = reactModule.useCallback(function(p4)
					-- upvalues: fFlagBuildPublishNavigationSheetModule (copy), var11 (ref), buildOverflowMenuScreensModule (copy), navigation (ref), target (ref)
					if fFlagBuildPublishNavigationSheetModule and p4 == "publish" then
						var11(true)
						
						return
					end
					local var15 = buildOverflowMenuScreensModule.SCREEN_BY_PAGE[p4]
					
					if var15 == nil then
						return
					end
					navigation.navigate(var15, { target = target })
				end, { navigation, target })
				local var15 = reactModule.useCallback(function()
					-- upvalues: var9 (ref)
					var9(true)
				end, {})
				local var16 = reactModule.useCallback(function()
					-- upvalues: var9 (ref)
					var9(false)
				end, {})
				local var17 = reactModule.useCallback(function()
					-- upvalues: navigation (ref), buildOverflowMenuScreensModule (copy), target (ref)
					navigation.navigate(buildOverflowMenuScreensModule.Screens.BuildPlaytestInviteManagement, { target = target })
				end, { navigation, target })
				local var18 = if target ~= nil then nil else target.universeId
				
				return reactModule.createElement(reactModule.Fragment, nil, {
					Page = reactModule.createElement(fullscreenPageWithSafeArea, {
						includeStatusBar = true,
						BackgroundColor3 = var5.tokens.Color.Surface.Surface_0.Color3,
						BackgroundTransparency = var5.tokens.Color.Surface.Surface_0.Transparency,
						includeBottomBar = var5.shouldIncludeBottomBar and not var7
					}, {
						Page = if target ~= nil then nil else reactModule.createElement(buildChatPageModule, {
							target = target,
							onOpenLibrary = if fFlagBuildExperienceLibrary then reactModule.useCallback(function(p4)
								-- upvalues: target (ref), openLibraryModule (copy)
								local var19 = if target ~= nil then nil else target.placeId
								
								if var19 ~= nil then
									openLibraryModule(var19, p4)
								end
							end, { target }) else nil,
							initialPrompt = var3,
							onClose = var12,
							onOpenAgentsPage = reactModule.useCallback(function()
								-- upvalues: navigation (ref), t (copy), target (ref)
								navigation.navigate(t.BuildAgents, { target = target })
							end, { navigation, target }),
							onOpenCreatorCreditPage = reactModule.useCallback(function()
								-- upvalues: navigation (ref), t (copy), target (ref)
								navigation.navigate(t.BuildCreatorCredit, { target = target })
							end, { navigation, target }),
							onOpenGetUsersPage = if fFlagEnableBuildAdPromotionModule then reactModule.useCallback(function()
								-- upvalues: navigation (ref), t (copy), target (ref)
								navigation.navigate(t.BuildGetUsers, { target = target })
							end, { navigation, target }) else nil,
							onOpenConfigurationPage = var14,
							onOpenInvitePicker = var15,
							onOpenInviteManagement = var17,
							onNavigateToResolvedTarget = reactModule.useCallback(function(p4)
								-- upvalues: navigation (ref), var4 (ref)
								navigation.setParams({ target = p4 })
								var4.bumpRefreshTick()
							end, { navigation, var4 }),
							isFocused = if fFlagBuildAdUpsellModule_1 then var6 else nil
						})
					}),
					Picker = if var8 and var18 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
						universeId = var18,
						onClose = var16,
						onInvitesSent = reactModule.useCallback(function()
							-- upvalues: var9 (ref), fFlagBuildExperiencePrivateInvitesModule (copy), var17 (ref)
							var9(false)
							
							if fFlagBuildExperiencePrivateInvitesModule then
								var17()
							end
						end, { var17 })
					}) else nil,
					PublishSheet = if fFlagBuildPublishNavigationSheetModule and target ~= nil and target.universeId ~= nil then reactModule.createElement(var2, {
						isOpen = var10,
						target = target,
						onClose = var13,
						navigateToSubPage = reactModule.useCallback(function(p4, p5)
							-- upvalues: navigation (ref)
							navigation.navigate(p4, { target = p5 })
						end, { navigation })
					}) else nil
				})
			end
		}
	},
	{
		[buildOverflowMenuScreensModule.Screens.BuildPublish] = {
			screen = buildOverflowMenuScreensModule.BuildPublishScreen
		}
	},
	{
		[buildOverflowMenuScreensModule.Screens.BuildSettings] = {
			screen = buildOverflowMenuScreensModule.BuildSettingsScreen
		}
	},
	{
		[buildOverflowMenuScreensModule.Screens.BuildAudience] = {
			screen = buildOverflowMenuScreensModule.BuildAudienceScreen
		}
	},
	{
		[buildOverflowMenuScreensModule.Screens.BuildPlaytestInviteManagement] = {
			screen = buildOverflowMenuScreensModule.BuildPlaytestInviteManagementScreen
		}
	},
	{
		[buildOverflowMenuScreensModule.Screens.BuildTitleDescription] = {
			screen = buildOverflowMenuScreensModule.BuildTitleDescriptionScreen
		}
	},
	{
		[buildOverflowMenuScreensModule.Screens.BuildVersionTitleDescription] = {
			screen = buildOverflowMenuScreensModule.BuildVersionTitleDescriptionScreen
		}
	},
	{
		[buildOverflowMenuScreensModule.Screens.BuildMediaSelection] = {
			screen = buildOverflowMenuScreensModule.BuildMediaSelectionScreen
		}
	},
	{
		[t.BuildAgents] = {
			screen = function(p3)
				-- upvalues: useBuildPageLayoutModule (ref), useLiveSubagentTaskState (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), t (ref), buildNavigationParamsModule (ref), subagentStatusModule (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref)
				local navigation = p3.navigation
				local var3 = useBuildPageLayoutModule()
				local var4 = useLiveSubagentTaskState(navigation)
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var3.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var3.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var3.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(overflowMenuPageShellModule, {
						scrollPerformanceIntervalName = "LuaApp_Build_Agents_Scroll",
						testId = "BuildPage.AgentsPage",
						title = useLocalization({
							agents = localizationStringsModule.SUBAGENT_STATUS_AGENTS
						}).agents,
						onClose = reactModule.useCallback(function()
							-- upvalues: navigation (ref)
							navigation.goBack()
						end, { navigation }),
						content = reactModule.createElement(subagentStatusModule.AgentsList, {
							testId = "BuildPage.AgentsList",
							groups = if var4 ~= nil then {} else var4.groups,
							onAgentActivated = reactModule.useCallback(function(p4)
								-- upvalues: navigation (ref), t (copy), buildNavigationParamsModule (copy)
								navigation.navigate(t.BuildAgentDetails, {
									target = buildNavigationParamsModule.getTarget(navigation),
									subagentTaskGroupName = p4.name
								})
							end, { navigation })
						}),
						closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft
					})
				})
			end
		}
	},
	{
		[t.BuildAgentDetails] = {
			screen = function(p3)
				-- upvalues: useBuildPageLayoutModule (ref), useLiveSubagentTaskState (ref), buildNavigationParamsModule (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), subagentStatusModule (ref), view (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref)
				local var3
				local navigation = p3.navigation
				local var4 = useBuildPageLayoutModule()
				local var5 = useLiveSubagentTaskState(navigation)
				local subagentTaskGroupName = buildNavigationParamsModule.getSubagentTaskGroupName(navigation)
				
				if var5 == nil or subagentTaskGroupName == nil then
					var3 = nil
				else
					for i, v in var5.groups do
						if v.name == subagentTaskGroupName then
							var3 = v
						end
					end
					var3 = nil
				end
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var4.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var4.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var4.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(overflowMenuPageShellModule, {
						scrollPerformanceIntervalName = "LuaApp_Build_AgentDetails_Scroll",
						testId = "BuildPage.AgentDetailsPage",
						title = subagentTaskGroupName or useLocalization({
							agents = localizationStringsModule.SUBAGENT_STATUS_AGENTS
						}).agents,
						onClose = reactModule.useCallback(function()
							-- upvalues: navigation (ref)
							navigation.goBack()
						end, { navigation }),
						content = if var3 ~= nil then reactModule.createElement(view, { tag = "size-full" }) else reactModule.createElement(subagentStatusModule.AgentDetailsList, { testId = "BuildPage.AgentDetailsList", group = var3 }),
						closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft
					})
				})
			end
		}
	},
	{
		[t.BuildCreatorCredit] = {
			screen = function(p4)
				-- upvalues: useBuildPageLayoutModule (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), creatorCreditPageContainerModule (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), creatorCreditBalanceChipContainerModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref)
				local navigation = p4.navigation
				local var6 = useBuildPageLayoutModule()
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var6.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var6.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var6.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(overflowMenuPageShellModule, {
						scrollPerformanceIntervalName = "LuaApp_Build_CreatorCredit_Scroll",
						testId = "BuildPage.CreatorCreditPage",
						title = useLocalization({
							pageTitle = localizationStringsModule.CREATOR_CREDIT_PAGE_TITLE
						}).pageTitle,
						onClose = reactModule.useCallback(function()
							-- upvalues: navigation (ref)
							navigation.goBack()
						end, { navigation }),
						content = reactModule.createElement(creatorCreditPageContainerModule, nil),
						headerTrailing = reactModule.createElement(creatorCreditBalanceChipContainerModule),
						closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft
					})
				})
			end
		}
	}
}

if fFlagBuildExperienceMonetizationNativeUIModule then
	table.insert(list_1, {
		[buildOverflowMenuScreensModule.Screens.BuildMonetization] = { screen = BuildMonetizationScreen }
	})
end
if fFlagBuildExperienceAnalytics then
	table.insert(list_1, {
		[buildOverflowMenuScreensModule.Screens.BuildStats] = { screen = buildOverflowMenuScreensModule.BuildStatsScreen }
	})
end
if fFlagEnableBuildAdPromotionModule then
	table.insert(list_1, { [t.BuildGetUsers] = { screen = BuildGetUsersScreen } })
end
table.insert(list_1, { [t.BuildSearch] = { screen = BuildSearchScreen } })
local var6 = roactNavigationModule.createRobloxStackNavigator(list_1, { initialRouteName = t.BuildHome })

local function BuildPage(p4)
	-- upvalues: useTTINavigationTracking (ref), useBuildPageEligibilityModule (ref), var1 (ref), fFlagBuildExperienceHideNavBarOnSubPages (ref), useManageBuildNavBarVisibilityModule (ref), t (ref), reactModule (ref), var6 (ref), buildEligibilityDialogModule (ref), view (ref), loading (ref), iconSize (ref)
	useTTINavigationTracking("NavigateTo_" .. p30.navigation.state.routeName)
	local extraProps = p4.navigation.getParam("extraProps", {})
	local var7 = useBuildPageEligibilityModule.useBuildPageEligibility(var1)
	
	if fFlagBuildExperienceHideNavBarOnSubPages then
		useManageBuildNavBarVisibilityModule(p4.navigation, t.BuildHome)
	end
	return if var7.canEnterBuild then reactModule.createElement(var6, { navigation = p4.navigation, screenProps = extraProps }) elseif var7.status == useBuildPageEligibilityModule.Status.Ineligible then reactModule.createElement(buildEligibilityDialogModule, {
		variant = useBuildPageEligibilityModule.Status.Ineligible,
		onDismiss = var7.onDialogDismiss
	}) elseif var7.status == useBuildPageEligibilityModule.Status.Error then reactModule.createElement(buildEligibilityDialogModule, {
		variant = useBuildPageEligibilityModule.Status.Error,
		onDismiss = var7.onDialogDismiss
	}) elseif var7.status == useBuildPageEligibilityModule.Status.Refreshing then reactModule.createElement(view, {
		tag = "col align-x-center align-y-center size-full",
		testId = "BuildPage.EligibilityLoading"
	}, {
		Spinner = reactModule.createElement(loading, { size = iconSize.Large })
	}) else reactModule.createElement(view, {
		tag = "size-full",
		testId = "BuildPage.EligibilityPrompting"
	})
end

local buildPageScreen = reactModule.Component:extend("BuildPageScreen")

function buildPageScreen.render(p4)
	-- upvalues: reactModule (ref), BuildPage (ref)
	return reactModule.createElement(BuildPage, p4.props)
end

buildPageScreen.router = var6.router

return buildPageScreen