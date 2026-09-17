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
local var1 = not fFlagEnableBuildTabOverride
local buildEligibilityDialogModule = require(script.Parent.Components.BuildEligibilityDialog)
local useBuildPageEligibilityModule = require(script.Parent.useBuildPageEligibility)
local var2 = if fFlagBuildPublishNavigationSheetModule then require(script.Parent.Components.PublishSheet.PublishSheetController) else nil
local var3 = if fFlagBuildExperienceSessionization then require(parent.TTINavigationTracking).useTTINavigationTracking else nil
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
	local var4 = useBuildPageLayoutModule()
	local var5 = useNavigationFocus()
	local tokens = var4.tokens
	local fallbackExperienceName = useLocalization({
		fallbackExperienceName = localizationStringsModule.BUILD_ASSISTANT_FALLBACK_NAME
	}).fallbackExperienceName
	local var6 = reactModule.useCallback(function(p4)
		-- upvalues: navigation (ref), t (copy)
		navigation.navigate(t.BuildChat, { target = p4 })
	end, { navigation })
	reactModule.useEffect(function()
		-- upvalues: resumeBuildChatModule (copy), screenProps (ref), fallbackExperienceName (ref), var6 (ref)
		return resumeBuildChatModule({
			universeId = screenProps.universeId,
			sessionId = screenProps.sessionId,
			creatorAgentChatStore = screenProps.creatorAgentChatStore,
			configurationStore = screenProps.configurationStore,
			fallbackExperienceName = fallbackExperienceName,
			onOpenChat = var6
		})
	end, {
		var6, screenProps.universeId, screenProps.sessionId,
		screenProps.resumeRequestId, screenProps.creatorAgentChatStore,
		screenProps.configurationStore, fallbackExperienceName
	})
	local searchQueryStore = screenProps.searchQueryStore or getSearchQueryStoreModule()
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var4.shouldIncludeBottomBar
	}, {
		Page = reactModule.createElement(view, { tag = "col align-x-center size-full bg-surface-0" }, {
			Header = reactModule.createElement(buildPageHeaderModule, {
				LayoutOrder = 1,
				height = var4.topBarHeight,
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
					isFocused = var5,
					autoOpenNewGame = screenProps.universeId == nil and screenProps.sessionId == nil,
					onOpenChat = var6
				})
			})
		})
	})
end

local function BuildSearchResults(p3)
	-- upvalues: reactModule (ref), searchEmptyStateModule (ref), experienceResultsListModule (ref)
	local var4 = p3.searchQueryStore.useDraftQuery()
	local current = p3.closingSnapshot.current
	local var5 = if current ~= nil then p3.results else current.results
	
	return if if current == nil then if var4 ~= "" then if var4 == var5.query then var5.isSettledNoResults else true else true else current.showEmptyState then reactModule.createElement(searchEmptyStateModule, { testId = "SearchPage.EmptyState" }) else reactModule.createElement(experienceResultsListModule, {
		testIdPrefix = "SearchPage",
		items = var5.items,
		hasDisplayedItems = #var5.displayedItems > 0,
		hasDisplayedResult = var5.hasDisplayedResult,
		hasPendingSummary = var5.hasPendingSummary,
		listStatus = var5.listStatus,
		failedLoadMore = var5.failedLoadMore,
		retryLoadMore = var5.retryLoadMore,
		loadError = var5.loadError,
		onOpenChat = p3.onOpenChat
	})
end

local function BuildSearchScreen(p3)
	-- upvalues: useBuildPageLayoutModule (ref), useNavigationFocus (ref), useOnScreenKeyboardVisibleModule (ref), getSearchQueryStoreModule (ref), signalsReactModule (ref), useLocalization (ref), reactModule (ref), t (ref), useMyCreationsResultsModule (ref), useScrollPerformanceTrackerModule (ref), experienceResultsLoadingSkeletonModule (ref), fullscreenPageWithSafeArea (ref), searchPageContainerModule (ref), BuildSearchResults (ref)
	local screenProps = p3.screenProps or {}
	local navigation = p3.navigation
	local var4 = useBuildPageLayoutModule()
	local var5 = useNavigationFocus()
	local var6 = useOnScreenKeyboardVisibleModule()
	local searchQueryStore = navigation.getParam("searchQueryStore") or (screenProps.searchQueryStore or getSearchQueryStoreModule())
	local var7 = signalsReactModule.useSignalBinding(searchQueryStore.getDraftQuery)
	local var8 = useLocalization({ searchbarPlaceholder = "Feature.Build.Label.SearchGames" })
	local var9 = reactModule.useCallback(function(p4)
		-- upvalues: navigation (ref), t (copy)
		navigation.navigate(t.BuildChat, { target = p4 })
	end, { navigation })
	local var10 = useMyCreationsResultsModule({
		creatorAgentChatStore = screenProps.creatorAgentChatStore,
		configurationStore = screenProps.configurationStore,
		searchStore = screenProps.searchStore,
		searchQueryStore = searchQueryStore,
		isFocused = var5
	})
	local var11 = reactModule.useRef(nil)
	local current = var11.current
	local var12 = var7:map(function(p4)
		-- upvalues: var11 (ref)
		local current = var11.current
		
		return if current == nil then p4 else current.query
	end)
	local var13 = if current ~= nil then var10 else current.results
	local var14 = reactModule.useRef(nil)
	useScrollPerformanceTrackerModule("LuaApp_Build_Search_Scroll", var14)
	local var15 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), reactModule (copy), experienceResultsLoadingSkeletonModule (copy)
		return if var13.isLoadingMore then reactModule.createElement(experienceResultsLoadingSkeletonModule, { LayoutOrder = 1, index = 1, testIdPrefix = "SearchPage" }) else nil
	end, { var13.isLoadingMore })
	local var16 = reactModule.useCallback(function()
		-- upvalues: searchQueryStore (ref), var11 (ref), var10 (ref), navigation (ref)
		local draftQuery = searchQueryStore.getDraftQuery()
		var11.current = {
			query = draftQuery,
			results = var10,
			showEmptyState = if draftQuery ~= "" then if draftQuery == var10.query then var10.isSettledNoResults else true else true
		}
		searchQueryStore.endSearch()
		navigation.goBack()
	end, { var11, navigation, var10, searchQueryStore })
	reactModule.useEffect(function()
		-- upvalues: searchQueryStore (ref)
		searchQueryStore.beginSearch()
		
		return searchQueryStore.endSearch
	end, { searchQueryStore })
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var4.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var4.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var4.shouldIncludeBottomBar and not var6
	}, {
		Page = reactModule.createElement(searchPageContainerModule, {
			showEmptyState = false,
			ref = var14,
			createFooter = var15,
			onBack = var16,
			onCanvasPositionChangedCallback = var13.loadMoreIfNeeded,
			onCanvasSizeChangedCallback = var13.loadMoreIfNeeded,
			refresh = var13.refresh,
			searchBarProps = {
				clear = searchQueryStore.clear,
				onFocusGained = searchQueryStore.beginSearch,
				placeholder = var8.searchbarPlaceholder,
				query = var12,
				setQuery = searchQueryStore.setQuery,
				shouldFocus = var5
			}
		}, {
			ExperienceResults = reactModule.createElement(BuildSearchResults, {
				closingSnapshot = var11,
				onOpenChat = var9,
				results = var10,
				searchQueryStore = searchQueryStore
			})
		})
	})
end

local function BuildGetUsersScreen(p3)
	-- upvalues: useBuildPageLayoutModule (ref), buildNavigationParamsModule (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), useAdsStatsPageViewModelModule (ref), adsStatsViewModule (ref), view (ref), button (ref), iconName (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), adsManagerMenuButtonModule (ref), fFlagBuildBackButtonChevronModule (ref), overlayProvider (ref), adCampaignCreatedToastModule (ref)
	local navigation = p3.navigation
	local var4 = useBuildPageLayoutModule()
	local target = buildNavigationParamsModule.getTarget(navigation)
	local var5 = if target ~= nil then nil else target.universeId
	local pageTitle = useLocalization({
		pageTitle = localizationStringsModule.ADS_STATS_PAGE_TITLE
	}).pageTitle
	local var6 = reactModule.useCallback(function()
		-- upvalues: navigation (ref)
		navigation.goBack()
	end, { navigation })
	local var7 = useAdsStatsPageViewModelModule(var5)
	local var8 = reactModule.createElement(adsStatsViewModule, var7)
	local var9, var10 = reactModule.useState(nil)
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var4.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var4.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var4.shouldIncludeBottomBar
	}, {
		Page = reactModule.createElement(overflowMenuPageShellModule, {
			scrollPerformanceIntervalName = "LuaApp_Build_GetUsers_Scroll",
			testId = "BuildPage.GetUsersPage",
			title = pageTitle,
			onClose = var6,
			content = var8,
			footer = if var7.isLoading or var7.isFailed then nil else reactModule.createElement(view, {
				tag = "col size-full-0 auto-y",
				testId = "BuildPage.GetUsers.Footer"
			}, {
				ToastAnchor = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "size-full-0",
					testId = "BuildPage.GetUsers.ToastAnchor",
					ref = var10
				}),
				Actions = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row size-full-0 auto-y padding-y-medium",
					testId = "BuildPage.GetUsers.Actions"
				}, {
					Create = reactModule.createElement(button, {
						testId = "BuildPage.GetUsers.Create",
						text = var7.createButtonText,
						icon = if var7.createButtonIsExternal then iconName.ArrowUpRightFromSquare else nil,
						size = inputSize.Large,
						variant = buttonVariant.Emphasis,
						fillBehavior = fillBehavior.Fill,
						width = UDim.new(1, 0),
						isLoading = var7.isPromotionCreatePending,
						onActivated = var7.onCreatePrimary
					})
				})
			}),
			disableScrolling = not var7.isLoading and (not var7.isFailed and not var7.hasCampaigns),
			headerTrailing = reactModule.createElement(adsManagerMenuButtonModule, {
				testId = "BuildPage.GetUsersPage.AdsManagerMenu",
				universeId = var5
			}),
			closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft
		}),
		SuccessToast = if var7.showCreateSuccessToast and var9 ~= nil then reactModule.createElement(overlayProvider, { gui = var9 }, {
			Toast = reactModule.createElement(adCampaignCreatedToastModule, {
				testId = "BuildPage.GetUsers.SuccessToast",
				onClose = var7.onDismissCreateSuccessToast,
				title = var7.createSuccessToastText
			})
		}) else nil
	})
end

local list = {
	{ [t.BuildHome] = { screen = BuildHomeScreen } },
	{
		[t.BuildChat] = {
			screen = function(p3)
				-- upvalues: buildNavigationParamsModule (ref), fFlagBuildExperienceAnalytics (ref), getBuildExperienceRefreshStoreModule (ref), useBuildPageLayoutModule (ref), fFlagBuildAdUpsellModule (ref), useNavigationFocus (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), fFlagBuildPublishNavigationSheetModule (ref), buildOverflowMenuScreensModule (ref), t (ref), fFlagEnableBuildAdPromotionModule (ref), buildChatPageModule (ref), fullscreenPageWithSafeArea (ref), privateInvitesPickerHostModule (ref), var2 (ref)
				local navigation = p3.navigation
				local target = buildNavigationParamsModule.getTarget(navigation)
				local var4 = if fFlagBuildExperienceAnalytics then buildNavigationParamsModule.getInitialPrompt(navigation) else nil
				local var5 = getBuildExperienceRefreshStoreModule()
				local var6 = useBuildPageLayoutModule()
				local var7 = if fFlagBuildAdUpsellModule then useNavigationFocus() else true
				local var8 = useOnScreenKeyboardVisibleModule()
				local var9, var10 = reactModule.useState(false)
				local var11, var12 = reactModule.useState(false)
				local var13 = if target ~= nil then nil else target.universeId
				
				return reactModule.createElement(reactModule.Fragment, nil, {
					Page = reactModule.createElement(fullscreenPageWithSafeArea, {
						includeStatusBar = true,
						BackgroundColor3 = var6.tokens.Color.Surface.Surface_0.Color3,
						BackgroundTransparency = var6.tokens.Color.Surface.Surface_0.Transparency,
						includeBottomBar = var6.shouldIncludeBottomBar and not var8
					}, {
						Page = if target ~= nil then nil else reactModule.createElement(buildChatPageModule, {
							target = target,
							initialPrompt = var4,
							onClose = reactModule.useCallback(function()
								-- upvalues: navigation (ref)
								navigation.goBack()
							end, { navigation }),
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
							onOpenConfigurationPage = reactModule.useCallback(function(p4)
								-- upvalues: fFlagBuildPublishNavigationSheetModule (copy), var12 (ref), buildOverflowMenuScreensModule (copy), navigation (ref), target (ref)
								if fFlagBuildPublishNavigationSheetModule and p4 == "publish" then
									var12(true)
									
									return
								end
								local var14 = buildOverflowMenuScreensModule.SCREEN_BY_PAGE[p4]
								
								if var14 == nil then
									return
								end
								navigation.navigate(var14, { target = target })
							end, { navigation, target }),
							onOpenInvitePicker = reactModule.useCallback(function()
								-- upvalues: var10 (ref)
								var10(true)
							end, {}),
							onNavigateToResolvedTarget = reactModule.useCallback(function(p4)
								-- upvalues: navigation (ref), var5 (ref)
								navigation.setParams({ target = p4 })
								var5.bumpRefreshTick()
							end, { navigation, var5 }),
							isFocused = if fFlagBuildAdUpsellModule then var7 else nil
						})
					}),
					Picker = if var9 and var13 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
						universeId = var13,
						onClose = reactModule.useCallback(function()
							-- upvalues: var10 (ref)
							var10(false)
						end, {}),
						onInvitesSent = reactModule.useCallback(function()
							-- upvalues: var10 (ref), navigation (ref), buildOverflowMenuScreensModule (copy), target (ref)
							var10(false)
							navigation.navigate(buildOverflowMenuScreensModule.Screens.BuildPlaytestInviteManagement, { target = target })
						end, { navigation, target })
					}) else nil,
					PublishSheet = if fFlagBuildPublishNavigationSheetModule and target ~= nil and target.universeId ~= nil then reactModule.createElement(var2, {
						isOpen = var11,
						target = target,
						onClose = reactModule.useCallback(function()
							-- upvalues: var12 (ref)
							var12(false)
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
				local var4 = useBuildPageLayoutModule()
				local var5 = useLiveSubagentTaskState(navigation)
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var4.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var4.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var4.shouldIncludeBottomBar
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
							groups = if var5 ~= nil then {} else var5.groups,
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
				local var4
				local navigation = p3.navigation
				local var5 = useBuildPageLayoutModule()
				local var6 = useLiveSubagentTaskState(navigation)
				local subagentTaskGroupName = buildNavigationParamsModule.getSubagentTaskGroupName(navigation)
				
				if var6 == nil or subagentTaskGroupName == nil then
					var4 = nil
				else
					for i, v in var6.groups do
						if v.name == subagentTaskGroupName then
							var4 = v
						end
					end
					var4 = nil
				end
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var5.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var5.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var5.shouldIncludeBottomBar
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
						content = if var4 ~= nil then reactModule.createElement(view, { tag = "size-full" }) else reactModule.createElement(subagentStatusModule.AgentDetailsList, { testId = "BuildPage.AgentDetailsList", group = var4 }),
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
				local var7 = useBuildPageLayoutModule()
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var7.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var7.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var7.shouldIncludeBottomBar
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
local var7 = roactNavigationModule.createRobloxStackNavigator(list, { initialRouteName = t.BuildHome })
local var8 = roactNavigationModule.createAppContainer(var7)

local function BuildPage(p4)
	-- upvalues: fFlagBuildExperienceSessionization (ref), var3 (ref), useBuildPageEligibilityModule (ref), var1 (ref), reactModule (ref), var7 (ref), var8 (ref), buildEligibilityDialogModule (ref), view (ref), loading (ref), iconSize (ref)
	if fFlagBuildExperienceSessionization then
		var3("NavigateTo_" .. p23.navigation.state.routeName)
	end
	local var9 = if fFlagBuildExperienceSessionization then p4.navigation.getParam("extraProps", {}) else p4
	local var10 = useBuildPageEligibilityModule.useBuildPageEligibility(var1)
	
	return if var10.canEnterBuild then if fFlagBuildExperienceSessionization then reactModule.createElement(var7, { navigation = p4.navigation, screenProps = var9 }) else reactModule.createElement(var8, { screenProps = var9 }) elseif var10.status == useBuildPageEligibilityModule.Status.Ineligible then reactModule.createElement(buildEligibilityDialogModule, {
		variant = useBuildPageEligibilityModule.Status.Ineligible,
		onDismiss = var10.onDialogDismiss
	}) elseif var10.status == useBuildPageEligibilityModule.Status.Error then reactModule.createElement(buildEligibilityDialogModule, {
		variant = useBuildPageEligibilityModule.Status.Error,
		onDismiss = var10.onDialogDismiss
	}) elseif var10.status == useBuildPageEligibilityModule.Status.Refreshing then reactModule.createElement(view, {
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
	
	buildPageScreen.router = var7.router
	
	return buildPageScreen
end
return BuildPage