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
local searchPageContainerModule = require(script.Parent.Components.SearchPage.SearchPageContainer)
local searchEmptyStateModule = require(script.Parent.Components.SearchEmptyState.SearchEmptyState)
local subagentStatusModule = require(script.Parent.Components.SubagentStatus)
local myCreationsTabModule = require(script.Parent.Components.MyCreationsTab.MyCreationsTab)
local fFlagBuildExperienceAssetLibraryModule = require(script.Parent.Flags.FFlagBuildExperienceAssetLibrary)
local var1 = if fFlagBuildExperienceAssetLibraryModule then require(script.Parent.Components.AssetLibrary.AssetLibraryScreens) else nil
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
local fFlagBuildAdUpsellModule = require(script.Parent.Flags.FFlagBuildAdUpsell)
local fFlagEnableBuildAdPromotionModule = require(script.Parent.Flags.FFlagEnableBuildAdPromotion)
local _ = require(script.Parent.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local getBuildExperienceRefreshStoreModule = require(script.Parent.Stores.GetBuildExperienceRefreshStore)
local getSearchQueryStoreModule = require(script.Parent.Stores.GetSearchQueryStore)
local _ = require(script.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local buildNavigationParamsModule = require(script.Parent.utils.BuildNavigationParams)
local resumeBuildChatModule = require(script.Parent.utils.resumeBuildChat)
local useBuildPageLayoutModule = require(script.Parent.utils.useBuildPageLayout)
local useOnScreenKeyboardVisibleModule = require(script.Parent.utils.useOnScreenKeyboardVisible)
local fFlagBuildPublishNavigationSheetModule = require(script.Parent.Flags.FFlagBuildPublishNavigationSheet)
local fFlagEnableBuildTabOverride = sharedFlagsModule.FFlagEnableBuildTabOverride
local fFlagBuildExperienceAnalytics = sharedFlagsModule.FFlagBuildExperienceAnalytics
local fFlagBuildExperienceSessionization = sharedFlagsModule.FFlagBuildExperienceSessionization
local var2 = not fFlagEnableBuildTabOverride
local buildEligibilityDialogModule = require(script.Parent.Components.BuildEligibilityDialog)
local useBuildPageEligibilityModule = require(script.Parent.useBuildPageEligibility)
local var3 = if fFlagBuildPublishNavigationSheetModule then require(script.Parent.Components.PublishSheet.PublishSheetController) else nil
local var4 = if fFlagBuildExperienceSessionization then require(parent.TTINavigationTracking).useTTINavigationTracking else nil
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

local function BuildHomeScreen(p3)
	-- upvalues: useBuildPageLayoutModule (ref), useNavigationFocus (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), t (ref), resumeBuildChatModule (ref), getSearchQueryStoreModule (ref), fullscreenPageWithSafeArea (ref), view (ref), buildPageHeaderModule (ref), myCreationsTabModule (ref)
	local screenProps = p3.screenProps or {}
	local navigation = p3.navigation
	local var5 = useBuildPageLayoutModule()
	local var6 = useNavigationFocus()
	local tokens = var5.tokens
	local fallbackExperienceName = useLocalization({
		fallbackExperienceName = localizationStringsModule.BUILD_ASSISTANT_FALLBACK_NAME
	}).fallbackExperienceName
	local var7 = reactModule.useCallback(function(p4)
		-- upvalues: navigation (ref), t (copy)
		navigation.navigate(t.BuildChat, { target = p4 })
	end, { navigation })
	reactModule.useEffect(function()
		-- upvalues: resumeBuildChatModule (copy), screenProps (ref), fallbackExperienceName (ref), var7 (ref)
		return resumeBuildChatModule({
			universeId = screenProps.universeId,
			sessionId = screenProps.sessionId,
			creatorAgentChatStore = screenProps.creatorAgentChatStore,
			configurationStore = screenProps.configurationStore,
			fallbackExperienceName = fallbackExperienceName,
			onOpenChat = var7
		})
	end, {
		var7, screenProps.universeId, screenProps.sessionId,
		screenProps.resumeRequestId, screenProps.creatorAgentChatStore,
		screenProps.configurationStore, fallbackExperienceName
	})
	local searchQueryStore = screenProps.searchQueryStore or getSearchQueryStoreModule()
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var5.shouldIncludeBottomBar
	}, {
		Page = reactModule.createElement(view, { tag = "col align-x-center size-full bg-surface-0" }, {
			Header = reactModule.createElement(buildPageHeaderModule, {
				LayoutOrder = 1,
				height = var5.topBarHeight,
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
					isFocused = var6,
					autoOpenNewGame = screenProps.universeId == nil and screenProps.sessionId == nil,
					onOpenChat = var7
				})
			})
		})
	})
end

local function BuildSearchResults(p3)
	-- upvalues: reactModule (ref), searchEmptyStateModule (ref), experienceResultsListModule (ref)
	local var5 = p3.searchQueryStore.useDraftQuery()
	local current = p3.closingSnapshot.current
	local var6 = if current ~= nil then p3.results else current.results
	
	return if if current == nil then if var5 ~= "" then if var5 == var6.query then var6.isSettledNoResults else true else true else current.showEmptyState then reactModule.createElement(searchEmptyStateModule, { testId = "SearchPage.EmptyState" }) else reactModule.createElement(experienceResultsListModule, {
		testIdPrefix = "SearchPage",
		items = var6.items,
		hasDisplayedItems = #var6.displayedItems > 0,
		hasDisplayedResult = var6.hasDisplayedResult,
		hasPendingSummary = var6.hasPendingSummary,
		listStatus = var6.listStatus,
		failedLoadMore = var6.failedLoadMore,
		retryLoadMore = var6.retryLoadMore,
		loadError = var6.loadError,
		onOpenChat = p3.onOpenChat
	})
end

local function BuildSearchScreen(p3)
	-- upvalues: useBuildPageLayoutModule (ref), useNavigationFocus (ref), useOnScreenKeyboardVisibleModule (ref), getSearchQueryStoreModule (ref), signalsReactModule (ref), useLocalization (ref), reactModule (ref), t (ref), useMyCreationsResultsModule (ref), useScrollPerformanceTrackerModule (ref), experienceResultsLoadingSkeletonModule (ref), fullscreenPageWithSafeArea (ref), searchPageContainerModule (ref), BuildSearchResults (ref)
	local screenProps = p3.screenProps or {}
	local navigation = p3.navigation
	local var5 = useBuildPageLayoutModule()
	local var6 = useNavigationFocus()
	local var7 = useOnScreenKeyboardVisibleModule()
	local searchQueryStore = navigation.getParam("searchQueryStore") or (screenProps.searchQueryStore or getSearchQueryStoreModule())
	local var8 = signalsReactModule.useSignalBinding(searchQueryStore.getDraftQuery)
	local var9 = useLocalization({ searchbarPlaceholder = "Feature.Build.Label.SearchGames" })
	local var10 = reactModule.useCallback(function(p4)
		-- upvalues: navigation (ref), t (copy)
		navigation.navigate(t.BuildChat, { target = p4 })
	end, { navigation })
	local var11 = useMyCreationsResultsModule({
		creatorAgentChatStore = screenProps.creatorAgentChatStore,
		configurationStore = screenProps.configurationStore,
		searchStore = screenProps.searchStore,
		searchQueryStore = searchQueryStore,
		isFocused = var6
	})
	local var12 = reactModule.useRef(nil)
	local current = var12.current
	local var13 = var8:map(function(p4)
		-- upvalues: var12 (ref)
		local current = var12.current
		
		return if current == nil then p4 else current.query
	end)
	local var14 = if current ~= nil then var11 else current.results
	local var15 = reactModule.useRef(nil)
	useScrollPerformanceTrackerModule("LuaApp_Build_Search_Scroll", var15)
	local var16 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), reactModule (copy), experienceResultsLoadingSkeletonModule (copy)
		return if var14.isLoadingMore then reactModule.createElement(experienceResultsLoadingSkeletonModule, { LayoutOrder = 1, index = 1, testIdPrefix = "SearchPage" }) else nil
	end, { var14.isLoadingMore })
	local var17 = reactModule.useCallback(function()
		-- upvalues: searchQueryStore (ref), var12 (ref), var11 (ref), navigation (ref)
		local draftQuery = searchQueryStore.getDraftQuery()
		var12.current = {
			query = draftQuery,
			results = var11,
			showEmptyState = if draftQuery ~= "" then if draftQuery == var11.query then var11.isSettledNoResults else true else true
		}
		searchQueryStore.endSearch()
		navigation.goBack()
	end, { var12, navigation, var11, searchQueryStore })
	reactModule.useEffect(function()
		-- upvalues: searchQueryStore (ref)
		searchQueryStore.beginSearch()
		
		return searchQueryStore.endSearch
	end, { searchQueryStore })
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var5.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var5.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var5.shouldIncludeBottomBar and not var7
	}, {
		Page = reactModule.createElement(searchPageContainerModule, {
			showEmptyState = false,
			ref = var15,
			createFooter = var16,
			onBack = var17,
			onCanvasPositionChangedCallback = var14.loadMoreIfNeeded,
			onCanvasSizeChangedCallback = var14.loadMoreIfNeeded,
			refresh = var14.refresh,
			searchBarProps = {
				clear = searchQueryStore.clear,
				onFocusGained = searchQueryStore.beginSearch,
				placeholder = var9.searchbarPlaceholder,
				query = var13,
				setQuery = searchQueryStore.setQuery,
				shouldFocus = var6
			}
		}, {
			ExperienceResults = reactModule.createElement(BuildSearchResults, {
				closingSnapshot = var12,
				onOpenChat = var10,
				results = var11,
				searchQueryStore = searchQueryStore
			})
		})
	})
end

local function BuildGetUsersScreen(p3)
	-- upvalues: useBuildPageLayoutModule (ref), buildNavigationParamsModule (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), useAdsStatsPageViewModelModule (ref), adsStatsViewModule (ref), view (ref), button (ref), iconName (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), adsManagerMenuButtonModule (ref), fFlagBuildBackButtonChevronModule (ref), overlayProvider (ref), adCampaignCreatedToastModule (ref)
	local navigation = p3.navigation
	local var5 = useBuildPageLayoutModule()
	local target = buildNavigationParamsModule.getTarget(navigation)
	local var6 = if target ~= nil then nil else target.universeId
	local pageTitle = useLocalization({
		pageTitle = localizationStringsModule.ADS_STATS_PAGE_TITLE
	}).pageTitle
	local var7 = reactModule.useCallback(function()
		-- upvalues: navigation (ref)
		navigation.goBack()
	end, { navigation })
	local var8 = useAdsStatsPageViewModelModule(var6)
	local var9 = reactModule.createElement(adsStatsViewModule, var8)
	local var10, var11 = reactModule.useState(nil)
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var5.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var5.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var5.shouldIncludeBottomBar
	}, {
		Page = reactModule.createElement(overflowMenuPageShellModule, {
			scrollPerformanceIntervalName = "LuaApp_Build_GetUsers_Scroll",
			testId = "BuildPage.GetUsersPage",
			title = pageTitle,
			onClose = var7,
			content = var9,
			footer = if var8.isLoading or var8.isFailed then nil else reactModule.createElement(view, {
				tag = "col size-full-0 auto-y",
				testId = "BuildPage.GetUsers.Footer"
			}, {
				ToastAnchor = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "size-full-0",
					testId = "BuildPage.GetUsers.ToastAnchor",
					ref = var11
				}),
				Actions = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row size-full-0 auto-y padding-y-medium",
					testId = "BuildPage.GetUsers.Actions"
				}, {
					Create = reactModule.createElement(button, {
						testId = "BuildPage.GetUsers.Create",
						text = var8.createButtonText,
						icon = if var8.createButtonIsExternal then iconName.ArrowUpRightFromSquare else nil,
						size = inputSize.Large,
						variant = buttonVariant.Emphasis,
						fillBehavior = fillBehavior.Fill,
						width = UDim.new(1, 0),
						isLoading = var8.isPromotionCreatePending,
						onActivated = var8.onCreatePrimary
					})
				})
			}),
			disableScrolling = not var8.isLoading and (not var8.isFailed and not var8.hasCampaigns),
			headerTrailing = reactModule.createElement(adsManagerMenuButtonModule, {
				testId = "BuildPage.GetUsersPage.AdsManagerMenu",
				universeId = var6
			}),
			closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft
		}),
		SuccessToast = if var8.showCreateSuccessToast and var10 ~= nil then reactModule.createElement(overlayProvider, { gui = var10 }, {
			Toast = reactModule.createElement(adCampaignCreatedToastModule, {
				testId = "BuildPage.GetUsers.SuccessToast",
				onClose = var8.onDismissCreateSuccessToast,
				title = var8.createSuccessToastText
			})
		}) else nil
	})
end

local list = {
	{ [t.BuildHome] = { screen = BuildHomeScreen } },
	{
		[t.BuildChat] = {
			screen = function(p3)
				-- upvalues: buildNavigationParamsModule (ref), fFlagBuildExperienceAnalytics (ref), getBuildExperienceRefreshStoreModule (ref), useBuildPageLayoutModule (ref), fFlagBuildAdUpsellModule (ref), useNavigationFocus (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), fFlagBuildPublishNavigationSheetModule (ref), buildOverflowMenuScreensModule (ref), t (ref), fFlagBuildExperienceAssetLibraryModule (ref), var1 (ref), fFlagEnableBuildAdPromotionModule (ref), buildChatPageModule (ref), fullscreenPageWithSafeArea (ref), privateInvitesPickerHostModule (ref), var3 (ref)
				local navigation = p3.navigation
				local target = buildNavigationParamsModule.getTarget(navigation)
				local var5 = if fFlagBuildExperienceAnalytics then buildNavigationParamsModule.getInitialPrompt(navigation) else nil
				local var6 = getBuildExperienceRefreshStoreModule()
				local var7 = useBuildPageLayoutModule()
				local var8 = if fFlagBuildAdUpsellModule then useNavigationFocus() else true
				local var9 = useOnScreenKeyboardVisibleModule()
				local var10, var11 = reactModule.useState(false)
				local var12, var13 = reactModule.useState(false)
				local var14 = if target ~= nil then nil else target.universeId
				
				return reactModule.createElement(reactModule.Fragment, nil, {
					Page = reactModule.createElement(fullscreenPageWithSafeArea, {
						includeStatusBar = true,
						BackgroundColor3 = var7.tokens.Color.Surface.Surface_0.Color3,
						BackgroundTransparency = var7.tokens.Color.Surface.Surface_0.Transparency,
						includeBottomBar = var7.shouldIncludeBottomBar and not var9
					}, {
						Page = if target ~= nil then nil else reactModule.createElement(buildChatPageModule, {
							target = target,
							initialPrompt = var5,
							onClose = reactModule.useCallback(function()
								-- upvalues: navigation (ref)
								navigation.goBack()
							end, { navigation }),
							onOpenAgentsPage = reactModule.useCallback(function()
								-- upvalues: navigation (ref), t (copy), target (ref)
								navigation.navigate(t.BuildAgents, { target = target })
							end, { navigation, target }),
							onOpenAssetLibraryPage = if fFlagBuildExperienceAssetLibraryModule then reactModule.useCallback(function()
								-- upvalues: navigation (ref), var1 (copy), target (ref)
								navigation.navigate(var1.Screens.Browser, { target = target })
							end, { navigation, target }) else nil,
							onOpenCreatorCreditPage = reactModule.useCallback(function()
								-- upvalues: navigation (ref), t (copy), target (ref)
								navigation.navigate(t.BuildCreatorCredit, { target = target })
							end, { navigation, target }),
							onOpenGetUsersPage = if fFlagEnableBuildAdPromotionModule then reactModule.useCallback(function()
								-- upvalues: navigation (ref), t (copy), target (ref)
								navigation.navigate(t.BuildGetUsers, { target = target })
							end, { navigation, target }) else nil,
							onOpenConfigurationPage = reactModule.useCallback(function(p4)
								-- upvalues: fFlagBuildPublishNavigationSheetModule (copy), var13 (ref), buildOverflowMenuScreensModule (copy), navigation (ref), target (ref)
								if fFlagBuildPublishNavigationSheetModule and p4 == "publish" then
									var13(true)
									
									return
								end
								local var15 = buildOverflowMenuScreensModule.SCREEN_BY_PAGE[p4]
								
								if var15 == nil then
									return
								end
								navigation.navigate(var15, { target = target })
							end, { navigation, target }),
							onOpenInvitePicker = reactModule.useCallback(function()
								-- upvalues: var11 (ref)
								var11(true)
							end, {}),
							onNavigateToResolvedTarget = reactModule.useCallback(function(p4)
								-- upvalues: navigation (ref), var6 (ref)
								navigation.setParams({ target = p4 })
								var6.bumpRefreshTick()
							end, { navigation, var6 }),
							isFocused = if fFlagBuildAdUpsellModule then var8 else nil
						})
					}),
					Picker = if var10 and var14 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
						universeId = var14,
						onClose = reactModule.useCallback(function()
							-- upvalues: var11 (ref)
							var11(false)
						end, {}),
						onInvitesSent = reactModule.useCallback(function()
							-- upvalues: var11 (ref), navigation (ref), buildOverflowMenuScreensModule (copy), target (ref)
							var11(false)
							navigation.navigate(buildOverflowMenuScreensModule.Screens.BuildPlaytestInviteManagement, { target = target })
						end, { navigation, target })
					}) else nil,
					PublishSheet = if fFlagBuildPublishNavigationSheetModule and target ~= nil and target.universeId ~= nil then reactModule.createElement(var3, {
						isOpen = var12,
						target = target,
						onClose = reactModule.useCallback(function()
							-- upvalues: var13 (ref)
							var13(false)
						end, {}),
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
				local var5 = useBuildPageLayoutModule()
				local var6 = useLiveSubagentTaskState(navigation)
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var5.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var5.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var5.shouldIncludeBottomBar
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
							groups = if var6 ~= nil then {} else var6.groups,
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
				local var5
				local navigation = p3.navigation
				local var6 = useBuildPageLayoutModule()
				local var7 = useLiveSubagentTaskState(navigation)
				local subagentTaskGroupName = buildNavigationParamsModule.getSubagentTaskGroupName(navigation)
				
				if var7 == nil or subagentTaskGroupName == nil then
					var5 = nil
				else
					for i, v in var7.groups do
						if v.name == subagentTaskGroupName then
							var5 = v
						end
					end
					var5 = nil
				end
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var6.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var6.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var6.shouldIncludeBottomBar
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
						content = if var5 ~= nil then reactModule.createElement(view, { tag = "size-full" }) else reactModule.createElement(subagentStatusModule.AgentDetailsList, { testId = "BuildPage.AgentDetailsList", group = var5 }),
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
				local var8 = useBuildPageLayoutModule()
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var8.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var8.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var8.shouldIncludeBottomBar
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
	table.insert(list, {
		[buildOverflowMenuScreensModule.Screens.BuildMonetization] = {
			screen = buildOverflowMenuScreensModule.BuildMonetizationScreen
		}
	})
end
if fFlagBuildExperienceAnalytics then
	table.insert(list, {
		[buildOverflowMenuScreensModule.Screens.BuildStats] = { screen = buildOverflowMenuScreensModule.BuildStatsScreen }
	})
end
if fFlagEnableBuildAdPromotionModule then
	table.insert(list, { [t.BuildGetUsers] = { screen = BuildGetUsersScreen } })
end
table.insert(list, { [t.BuildSearch] = { screen = BuildSearchScreen } })

if fFlagBuildExperienceAssetLibraryModule then
	table.insert(list, {
		[var1.Screens.Browser] = { screen = var1.BrowserScreen }
	})
	table.insert(list, {
		[var1.Screens.Category] = { screen = var1.CategoryScreen }
	})
	table.insert(list, { [var1.Screens.Detail] = { screen = var1.DetailScreen } })
end
local var8 = roactNavigationModule.createRobloxStackNavigator(list, { initialRouteName = t.BuildHome })
local var9 = roactNavigationModule.createAppContainer(var8)

local function BuildPage(p4)
	-- upvalues: fFlagBuildExperienceSessionization (ref), var4 (ref), useBuildPageEligibilityModule (ref), var2 (ref), reactModule (ref), var8 (ref), var9 (ref), buildEligibilityDialogModule (ref), view (ref), loading (ref), iconSize (ref)
	if fFlagBuildExperienceSessionization then
		var4("NavigateTo_" .. p23.navigation.state.routeName)
	end
	local var10 = if fFlagBuildExperienceSessionization then p4.navigation.getParam("extraProps", {}) else p4
	local var11 = useBuildPageEligibilityModule.useBuildPageEligibility(var2)
	
	return if var11.canEnterBuild then if fFlagBuildExperienceSessionization then reactModule.createElement(var8, { navigation = p4.navigation, screenProps = var10 }) else reactModule.createElement(var9, { screenProps = var10 }) elseif var11.status == useBuildPageEligibilityModule.Status.Ineligible then reactModule.createElement(buildEligibilityDialogModule, {
		variant = useBuildPageEligibilityModule.Status.Ineligible,
		onDismiss = var11.onDialogDismiss
	}) elseif var11.status == useBuildPageEligibilityModule.Status.Error then reactModule.createElement(buildEligibilityDialogModule, {
		variant = useBuildPageEligibilityModule.Status.Error,
		onDismiss = var11.onDialogDismiss
	}) elseif var11.status == useBuildPageEligibilityModule.Status.Refreshing then reactModule.createElement(view, {
		tag = "col align-x-center align-y-center size-full",
		testId = "BuildPage.EligibilityLoading"
	}, {
		Spinner = reactModule.createElement(loading, { size = iconSize.Large })
	}) else reactModule.createElement(view, {
		tag = "size-full",
		testId = "BuildPage.EligibilityPrompting"
	})
end

if fFlagBuildExperienceSessionization then
	local buildPageScreen = reactModule.Component:extend("BuildPageScreen")
	
	function buildPageScreen.render(p4)
		-- upvalues: reactModule (ref), BuildPage (ref)
		return reactModule.createElement(BuildPage, p4.props)
	end
	
	buildPageScreen.router = var8.router
	
	return buildPageScreen
end
return BuildPage