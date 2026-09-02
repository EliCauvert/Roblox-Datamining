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
local fFlagBuildAddSearchIconAndMoveSearchbarModule = require(script.Parent.Flags.FFlagBuildAddSearchIconAndMoveSearchbar)
local var1 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(parent.SignalsReact) else nil
local buildPageHeaderModule = require(script.Parent.Components.BuildPageHeader.BuildPageHeader)
local buildChatPageModule = require(script.Parent.Components.BuildChatPage.BuildChatPage)
local buildSearchBarModule = require(script.Parent.Components.BuildSearchBar.BuildSearchBar)
local var2 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(script.Parent.Components.SearchPage.SearchPageContainer) else nil
local var3 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(script.Parent.Components.SearchEmptyState.SearchEmptyState) else nil
local subagentStatusModule = require(script.Parent.Components.SubagentStatus)
local myCreationsTabModule = require(script.Parent.Components.MyCreationsTab.MyCreationsTab)
local fFlagBuildExperienceAssetLibraryModule = require(script.Parent.Flags.FFlagBuildExperienceAssetLibrary)
local var4 = if fFlagBuildExperienceAssetLibraryModule then require(script.Parent.Components.AssetLibrary.AssetLibraryScreens) else nil
local var5 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(script.Parent.Components.MyCreationsTab.ExperienceResultsList) else nil
local var6 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(script.Parent.Components.MyCreationsTab.ExperienceResultsLoadingSkeleton) else nil
local var7 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(script.Parent.Components.MyCreationsTab.useMyCreationsResults) else nil
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
local var8 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(script.Parent.Stores.GetSearchQueryStore) else nil
local _ = require(script.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local buildNavigationParamsModule = require(script.Parent.utils.BuildNavigationParams)
local resumeBuildChatModule = require(script.Parent.utils.resumeBuildChat)
local useBuildPageLayoutModule = require(script.Parent.utils.useBuildPageLayout)
local useOnScreenKeyboardVisibleModule = require(script.Parent.utils.useOnScreenKeyboardVisible)
local fFlagBuildPublishNavigationSheetModule = require(script.Parent.Flags.FFlagBuildPublishNavigationSheet)
local fFlagBuildExperienceAnalytics = sharedFlagsModule.FFlagBuildExperienceAnalytics
local var9 = not sharedFlagsModule.FFlagEnableBuildTabOverride
local buildEligibilityDialogModule = require(script.Parent.Components.BuildEligibilityDialog)
local useBuildPageEligibilityModule = require(script.Parent.useBuildPageEligibility)
local var10 = if fFlagBuildPublishNavigationSheetModule then require(script.Parent.Components.PublishSheet.PublishSheetController) else nil
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
	-- upvalues: useBuildPageLayoutModule (ref), useNavigationFocus (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), t (ref), resumeBuildChatModule (ref), fFlagBuildAddSearchIconAndMoveSearchbarModule (ref), var8 (ref), view (ref), buildSearchBarModule (ref), fullscreenPageWithSafeArea (ref), buildPageHeaderModule (ref), myCreationsTabModule (ref)
	local screenProps = p3.screenProps or {}
	local navigation = p3.navigation
	local var11 = useBuildPageLayoutModule()
	local var12 = useNavigationFocus()
	local tokens = var11.tokens
	local fallbackExperienceName = useLocalization({
		fallbackExperienceName = localizationStringsModule.BUILD_ASSISTANT_FALLBACK_NAME
	}).fallbackExperienceName
	local var13 = reactModule.useCallback(function(p4)
		-- upvalues: navigation (ref), t (copy)
		navigation.navigate(t.BuildChat, { target = p4 })
	end, { navigation })
	reactModule.useEffect(function()
		-- upvalues: resumeBuildChatModule (copy), screenProps (ref), fallbackExperienceName (ref), var13 (ref)
		return resumeBuildChatModule({
			universeId = screenProps.universeId,
			sessionId = screenProps.sessionId,
			creatorAgentChatStore = screenProps.creatorAgentChatStore,
			configurationStore = screenProps.configurationStore,
			fallbackExperienceName = fallbackExperienceName,
			onOpenChat = var13
		})
	end, {
		var13, screenProps.universeId, screenProps.sessionId,
		screenProps.resumeRequestId, screenProps.creatorAgentChatStore,
		screenProps.configurationStore, fallbackExperienceName
	})
	local var14 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then screenProps.searchQueryStore or var8() else nil
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var11.shouldIncludeBottomBar
	}, {
		Page = reactModule.createElement(view, { tag = "col align-x-center size-full bg-surface-0" }, {
			Header = reactModule.createElement(buildPageHeaderModule, {
				LayoutOrder = 1,
				height = var11.topBarHeight,
				searchQueryStore = var14,
				onOpenSearch = if fFlagBuildAddSearchIconAndMoveSearchbarModule then reactModule.useCallback(function()
					-- upvalues: var14 (ref), navigation (ref), t (copy)
					var14.beginSearch()
					navigation.navigate(t.BuildSearch, { searchQueryStore = var14 })
				end, { navigation, var14 }) else nil
			}),
			Content = reactModule.createElement(view, {
				LayoutOrder = 2,
				ZIndex = 4,
				tag = "col align-x-center fill gap-small size-full-0"
			}, {
				SearchBarContainer = if not fFlagBuildAddSearchIconAndMoveSearchbarModule then reactModule.createElement(view, {
					LayoutOrder = 1,
					ZIndex = 2,
					tag = "composition-content-header size-full-0 auto-y bg-surface-0",
					testId = "BuildPage.SearchBarContainer"
				}, {
					SearchBar = reactModule.createElement(buildSearchBarModule, { store = screenProps.searchQueryStore })
				}) else nil,
				MyCreations = reactModule.createElement(myCreationsTabModule, {
					LayoutOrder = 3,
					creatorAgentChatStore = screenProps.creatorAgentChatStore,
					configurationStore = screenProps.configurationStore,
					searchStore = if fFlagBuildAddSearchIconAndMoveSearchbarModule then screenProps.searchStore else nil,
					searchQueryStore = screenProps.searchQueryStore,
					isFocused = var12,
					autoOpenNewGame = screenProps.universeId == nil and screenProps.sessionId == nil,
					onOpenChat = var13
				})
			})
		})
	})
end

local function BuildSearchResults(p3)
	-- upvalues: reactModule (ref), var3 (ref), var5 (ref)
	local var11 = p3.searchQueryStore.useDraftQuery()
	local current = p3.closingSnapshot.current
	local var12 = if current ~= nil then p3.results else current.results
	
	return if if current == nil then if var11 ~= "" then if var11 == var12.query then var12.isSettledNoResults else true else true else current.showEmptyState then reactModule.createElement(var3, { testId = "SearchPage.EmptyState" }) else reactModule.createElement(var5, {
		testIdPrefix = "SearchPage",
		items = var12.items,
		hasDisplayedItems = #var12.displayedItems > 0,
		hasDisplayedResult = var12.hasDisplayedResult,
		hasPendingSummary = var12.hasPendingSummary,
		listStatus = var12.listStatus,
		failedLoadMore = var12.failedLoadMore,
		retryLoadMore = var12.retryLoadMore,
		loadError = var12.loadError,
		onOpenChat = p3.onOpenChat
	})
end

local function BuildSearchScreen(p3)
	-- upvalues: useBuildPageLayoutModule (ref), useNavigationFocus (ref), useOnScreenKeyboardVisibleModule (ref), var8 (ref), var1 (ref), useLocalization (ref), reactModule (ref), t (ref), var7 (ref), useScrollPerformanceTrackerModule (ref), var6 (ref), fullscreenPageWithSafeArea (ref), var2 (ref), BuildSearchResults (ref)
	local screenProps = p3.screenProps or {}
	local navigation = p3.navigation
	local var11 = useBuildPageLayoutModule()
	local var12 = useNavigationFocus()
	local var13 = useOnScreenKeyboardVisibleModule()
	local searchQueryStore = navigation.getParam("searchQueryStore") or (screenProps.searchQueryStore or var8())
	local var14 = var1.useSignalBinding(searchQueryStore.getDraftQuery)
	local var15 = useLocalization({ searchbarPlaceholder = "Feature.Build.Label.SearchGames" })
	local var16 = reactModule.useCallback(function(p4)
		-- upvalues: navigation (ref), t (copy)
		navigation.navigate(t.BuildChat, { target = p4 })
	end, { navigation })
	local var17 = var7({
		creatorAgentChatStore = screenProps.creatorAgentChatStore,
		configurationStore = screenProps.configurationStore,
		searchStore = screenProps.searchStore,
		searchQueryStore = searchQueryStore,
		isFocused = var12
	})
	local var18 = reactModule.useRef(nil)
	local current = var18.current
	local var19 = var14:map(function(p4)
		-- upvalues: var18 (ref)
		local current = var18.current
		
		return if current == nil then p4 else current.query
	end)
	local var20 = if current ~= nil then var17 else current.results
	local var21 = reactModule.useRef(nil)
	useScrollPerformanceTrackerModule("LuaApp_Build_Search_Scroll", var21)
	local var22 = reactModule.useCallback(function()
		-- upvalues: var20 (ref), reactModule (copy), var6 (copy)
		return if var20.isLoadingMore then reactModule.createElement(var6, { LayoutOrder = 1, index = 1, testIdPrefix = "SearchPage" }) else nil
	end, { var20.isLoadingMore })
	local var23 = reactModule.useCallback(function()
		-- upvalues: searchQueryStore (ref), var18 (ref), var17 (ref), navigation (ref)
		local draftQuery = searchQueryStore.getDraftQuery()
		var18.current = {
			query = draftQuery,
			results = var17,
			showEmptyState = if draftQuery ~= "" then if draftQuery == var17.query then var17.isSettledNoResults else true else true
		}
		searchQueryStore.endSearch()
		navigation.goBack()
	end, { var18, navigation, var17, searchQueryStore })
	reactModule.useEffect(function()
		-- upvalues: searchQueryStore (ref)
		searchQueryStore.beginSearch()
		
		return searchQueryStore.endSearch
	end, { searchQueryStore })
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var11.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var11.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var11.shouldIncludeBottomBar and not var13
	}, {
		Page = reactModule.createElement(var2, {
			showEmptyState = false,
			ref = var21,
			createFooter = var22,
			onBack = var23,
			onCanvasPositionChangedCallback = var20.loadMoreIfNeeded,
			onCanvasSizeChangedCallback = var20.loadMoreIfNeeded,
			refresh = var20.refresh,
			searchBarProps = {
				clear = searchQueryStore.clear,
				onFocusGained = searchQueryStore.beginSearch,
				placeholder = var15.searchbarPlaceholder,
				query = var19,
				setQuery = searchQueryStore.setQuery,
				shouldFocus = var12
			}
		}, {
			ExperienceResults = reactModule.createElement(BuildSearchResults, {
				closingSnapshot = var18,
				onOpenChat = var16,
				results = var17,
				searchQueryStore = searchQueryStore
			})
		})
	})
end

local function BuildGetUsersScreen(p3)
	-- upvalues: useBuildPageLayoutModule (ref), buildNavigationParamsModule (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), useAdsStatsPageViewModelModule (ref), adsStatsViewModule (ref), view (ref), button (ref), iconName (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), adsManagerMenuButtonModule (ref), fFlagBuildBackButtonChevronModule (ref), overlayProvider (ref), adCampaignCreatedToastModule (ref)
	local navigation = p3.navigation
	local var11 = useBuildPageLayoutModule()
	local target = buildNavigationParamsModule.getTarget(navigation)
	local var12 = if target ~= nil then nil else target.universeId
	local pageTitle = useLocalization({
		pageTitle = localizationStringsModule.ADS_STATS_PAGE_TITLE
	}).pageTitle
	local var13 = reactModule.useCallback(function()
		-- upvalues: navigation (ref)
		navigation.goBack()
	end, { navigation })
	local var14 = useAdsStatsPageViewModelModule(var12)
	local var15 = reactModule.createElement(adsStatsViewModule, var14)
	local var16, var17 = reactModule.useState(nil)
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var11.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var11.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var11.shouldIncludeBottomBar
	}, {
		Page = reactModule.createElement(overflowMenuPageShellModule, {
			scrollPerformanceIntervalName = "LuaApp_Build_GetUsers_Scroll",
			testId = "BuildPage.GetUsersPage",
			title = pageTitle,
			onClose = var13,
			content = var15,
			footer = if var14.isLoading or var14.isFailed then nil else reactModule.createElement(view, {
				tag = "col size-full-0 auto-y",
				testId = "BuildPage.GetUsers.Footer"
			}, {
				ToastAnchor = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "size-full-0",
					testId = "BuildPage.GetUsers.ToastAnchor",
					ref = var17
				}),
				Actions = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "row size-full-0 auto-y padding-y-medium",
					testId = "BuildPage.GetUsers.Actions"
				}, {
					Create = reactModule.createElement(button, {
						testId = "BuildPage.GetUsers.Create",
						text = var14.createButtonText,
						icon = if var14.createButtonIsExternal then iconName.ArrowUpRightFromSquare else nil,
						size = inputSize.Large,
						variant = buttonVariant.Emphasis,
						fillBehavior = fillBehavior.Fill,
						width = UDim.new(1, 0),
						isLoading = var14.isPromotionCreatePending,
						onActivated = var14.onCreatePrimary
					})
				})
			}),
			disableScrolling = not var14.isLoading and (not var14.isFailed and not var14.hasCampaigns),
			headerTrailing = reactModule.createElement(adsManagerMenuButtonModule, {
				testId = "BuildPage.GetUsersPage.AdsManagerMenu",
				universeId = var12
			}),
			closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft
		}),
		SuccessToast = if var14.showCreateSuccessToast and var16 ~= nil then reactModule.createElement(overlayProvider, { gui = var16 }, {
			Toast = reactModule.createElement(adCampaignCreatedToastModule, {
				testId = "BuildPage.GetUsers.SuccessToast",
				onClose = var14.onDismissCreateSuccessToast,
				title = var14.createSuccessToastText
			})
		}) else nil
	})
end

local list = {
	{ [t.BuildHome] = { screen = BuildHomeScreen } },
	{
		[t.BuildChat] = {
			screen = function(p3)
				-- upvalues: buildNavigationParamsModule (ref), fFlagBuildExperienceAnalytics (ref), getBuildExperienceRefreshStoreModule (ref), useBuildPageLayoutModule (ref), fFlagBuildAdUpsellModule (ref), useNavigationFocus (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), fFlagBuildPublishNavigationSheetModule (ref), buildOverflowMenuScreensModule (ref), t (ref), fFlagBuildExperienceAssetLibraryModule (ref), var4 (ref), fFlagEnableBuildAdPromotionModule (ref), buildChatPageModule (ref), fullscreenPageWithSafeArea (ref), privateInvitesPickerHostModule (ref), var10 (ref)
				local navigation = p3.navigation
				local target = buildNavigationParamsModule.getTarget(navigation)
				local var11 = if fFlagBuildExperienceAnalytics then buildNavigationParamsModule.getInitialPrompt(navigation) else nil
				local var12 = getBuildExperienceRefreshStoreModule()
				local var13 = useBuildPageLayoutModule()
				local var14 = if fFlagBuildAdUpsellModule then useNavigationFocus() else true
				local var15 = useOnScreenKeyboardVisibleModule()
				local var16, var17 = reactModule.useState(false)
				local var18, var19 = reactModule.useState(false)
				local var20 = if target ~= nil then nil else target.universeId
				
				return reactModule.createElement(reactModule.Fragment, nil, {
					Page = reactModule.createElement(fullscreenPageWithSafeArea, {
						includeStatusBar = true,
						BackgroundColor3 = var13.tokens.Color.Surface.Surface_0.Color3,
						BackgroundTransparency = var13.tokens.Color.Surface.Surface_0.Transparency,
						includeBottomBar = var13.shouldIncludeBottomBar and not var15
					}, {
						Page = if target ~= nil then nil else reactModule.createElement(buildChatPageModule, {
							target = target,
							initialPrompt = var11,
							onClose = reactModule.useCallback(function()
								-- upvalues: navigation (ref)
								navigation.goBack()
							end, { navigation }),
							onOpenAgentsPage = reactModule.useCallback(function()
								-- upvalues: navigation (ref), t (copy), target (ref)
								navigation.navigate(t.BuildAgents, { target = target })
							end, { navigation, target }),
							onOpenAssetLibraryPage = if fFlagBuildExperienceAssetLibraryModule then reactModule.useCallback(function()
								-- upvalues: navigation (ref), var4 (copy), target (ref)
								navigation.navigate(var4.Screens.Browser, { target = target })
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
								-- upvalues: fFlagBuildPublishNavigationSheetModule (copy), var19 (ref), buildOverflowMenuScreensModule (copy), navigation (ref), target (ref)
								if fFlagBuildPublishNavigationSheetModule and p4 == "publish" then
									var19(true)
									
									return
								end
								local var21 = buildOverflowMenuScreensModule.SCREEN_BY_PAGE[p4]
								
								if var21 == nil then
									return
								end
								navigation.navigate(var21, { target = target })
							end, { navigation, target }),
							onOpenInvitePicker = reactModule.useCallback(function()
								-- upvalues: var17 (ref)
								var17(true)
							end, {}),
							onNavigateToResolvedTarget = reactModule.useCallback(function(p4)
								-- upvalues: navigation (ref), var12 (ref)
								navigation.setParams({ target = p4 })
								var12.bumpRefreshTick()
							end, { navigation, var12 }),
							isFocused = if fFlagBuildAdUpsellModule then var14 else nil
						})
					}),
					Picker = if var16 and var20 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
						universeId = var20,
						onClose = reactModule.useCallback(function()
							-- upvalues: var17 (ref)
							var17(false)
						end, {}),
						onInvitesSent = reactModule.useCallback(function()
							-- upvalues: var17 (ref), navigation (ref), buildOverflowMenuScreensModule (copy), target (ref)
							var17(false)
							navigation.navigate(buildOverflowMenuScreensModule.Screens.BuildPlaytestInviteManagement, { target = target })
						end, { navigation, target })
					}) else nil,
					PublishSheet = if fFlagBuildPublishNavigationSheetModule and target ~= nil and target.universeId ~= nil then reactModule.createElement(var10, {
						isOpen = var18,
						target = target,
						onClose = reactModule.useCallback(function()
							-- upvalues: var19 (ref)
							var19(false)
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
				local var11 = useBuildPageLayoutModule()
				local var12 = useLiveSubagentTaskState(navigation)
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var11.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var11.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var11.shouldIncludeBottomBar
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
							groups = if var12 ~= nil then {} else var12.groups,
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
				local var11
				local navigation = p3.navigation
				local var12 = useBuildPageLayoutModule()
				local var13 = useLiveSubagentTaskState(navigation)
				local subagentTaskGroupName = buildNavigationParamsModule.getSubagentTaskGroupName(navigation)
				
				if var13 == nil or subagentTaskGroupName == nil then
					var11 = nil
				else
					for i, v in var13.groups do
						if v.name == subagentTaskGroupName then
							var11 = v
						end
					end
					var11 = nil
				end
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var12.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var12.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var12.shouldIncludeBottomBar
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
						content = if var11 ~= nil then reactModule.createElement(view, { tag = "size-full" }) else reactModule.createElement(subagentStatusModule.AgentDetailsList, { testId = "BuildPage.AgentDetailsList", group = var11 }),
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
				local var14 = useBuildPageLayoutModule()
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var14.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var14.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var14.shouldIncludeBottomBar
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
if fFlagBuildAddSearchIconAndMoveSearchbarModule then
	table.insert(list, { [t.BuildSearch] = { screen = BuildSearchScreen } })
end
if fFlagBuildExperienceAssetLibraryModule then
	table.insert(list, {
		[var4.Screens.Browser] = { screen = var4.BrowserScreen }
	})
	table.insert(list, {
		[var4.Screens.Category] = { screen = var4.CategoryScreen }
	})
	table.insert(list, { [var4.Screens.Detail] = { screen = var4.DetailScreen } })
end
local var14 = roactNavigationModule.createAppContainer(roactNavigationModule.createRobloxStackNavigator(list, { initialRouteName = t.BuildHome }))

return function(p4)
	-- upvalues: useBuildPageEligibilityModule (ref), var9 (ref), reactModule (ref), var14 (ref), buildEligibilityDialogModule (ref), view (ref), loading (ref), iconSize (ref)
	local var15 = useBuildPageEligibilityModule.useBuildPageEligibility(var9)
	
	return if var15.canEnterBuild then reactModule.createElement(var14, { screenProps = p4 or {} }) elseif var15.status == useBuildPageEligibilityModule.Status.Ineligible then reactModule.createElement(buildEligibilityDialogModule, {
		variant = useBuildPageEligibilityModule.Status.Ineligible,
		onDismiss = var15.onDialogDismiss
	}) elseif var15.status == useBuildPageEligibilityModule.Status.Error then reactModule.createElement(buildEligibilityDialogModule, {
		variant = useBuildPageEligibilityModule.Status.Error,
		onDismiss = var15.onDialogDismiss
	}) elseif var15.status == useBuildPageEligibilityModule.Status.Refreshing then reactModule.createElement(view, {
		tag = "col align-x-center align-y-center size-full",
		testId = "BuildPage.EligibilityLoading"
	}, {
		Spinner = reactModule.createElement(loading, { size = iconSize.Large })
	}) else reactModule.createElement(view, {
		tag = "size-full",
		testId = "BuildPage.EligibilityPrompting"
	})
end