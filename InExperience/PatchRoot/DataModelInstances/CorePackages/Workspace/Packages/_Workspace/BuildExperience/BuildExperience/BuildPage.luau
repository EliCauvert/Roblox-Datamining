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
local view = foundationModule.View
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local useNavigationFocus = navigationModule.useNavigationFocus
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
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
local overflowMenuPageShellModule = require(script.Parent.Components.BuildPillMenu.OverflowMenuPageShell)
local privateInvitesPickerHostModule = require(script.Parent.Components.PrivateInvitesPicker.PrivateInvitesPickerHost)
local creatorCreditPageContainerModule = require(script.Parent.Components.CreatorCreditSheet.CreatorCreditPageContainer)
local creatorCreditBalanceChipContainerModule = require(script.Parent.Components.CreatorCreditSheet.CreatorCreditBalanceChip.CreatorCreditBalanceChipContainer)
local adsStatsContainerModule = require(script.Parent.Components.Ads.AdsStatsContainer)
local _ = require(script.Parent.Chat.chatTypes)
local useSessionSummaryModule = require(script.Parent.Chat.useSessionSummary)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(script.Parent.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local var8 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(script.Parent.Telemetry.useScrollPerformanceTracker) else nil
local fFlagBuildBackButtonChevronModule = require(script.Parent.Flags.FFlagBuildBackButtonChevron)
local fFlagBuildAdUpsellModule = require(script.Parent.Flags.FFlagBuildAdUpsell)
local fFlagEnableBuildAdPromotionModule = require(script.Parent.Flags.FFlagEnableBuildAdPromotion)
local _ = require(script.Parent.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local getBuildExperienceRefreshStoreModule = require(script.Parent.Stores.GetBuildExperienceRefreshStore)
local var9 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(script.Parent.Stores.GetSearchQueryStore) else nil
local _ = require(script.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local buildNavigationParamsModule = require(script.Parent.utils.BuildNavigationParams)
local resumeBuildChatModule = require(script.Parent.utils.resumeBuildChat)
local useBuildPageLayoutModule = require(script.Parent.utils.useBuildPageLayout)
local useOnScreenKeyboardVisibleModule = require(script.Parent.utils.useOnScreenKeyboardVisible)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local var10 = not sharedFlagsModule.FFlagEnableBuildTabOverride
local buildEligibilityDialogModule = require(script.Parent.Components.BuildEligibilityDialog)
local useBuildPageEligibilityModule = require(script.Parent.useBuildPageEligibility)
local _ = {
	BuildHome = "BuildHome",
	BuildChat = "BuildChat",
	BuildSearch = "BuildSearch",
	BuildAgents = "BuildAgents",
	BuildAgentDetails = "BuildAgentDetails",
	BuildCreatorCredit = "BuildCreatorCredit",
	BuildGetUsers = "BuildGetUsers"
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
	-- upvalues: reactModule (ref)
	return reactModule.useCallback(function(p4)
		-- upvalues: p3 (ref)
		p3.navigate("BuildChat", { target = p4 })
	end, { p3 })
end

local function BuildHomeScreen(p3)
	-- upvalues: useBuildPageLayoutModule (ref), useNavigationFocus (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), resumeBuildChatModule (ref), fFlagBuildAddSearchIconAndMoveSearchbarModule (ref), var9 (ref), view (ref), buildSearchBarModule (ref), fullscreenPageWithSafeArea (ref), buildPageHeaderModule (ref), myCreationsTabModule (ref)
	local screenProps = p3.screenProps or {}
	local navigation = p3.navigation
	local var11 = useBuildPageLayoutModule()
	local var12 = useNavigationFocus()
	local tokens = var11.tokens
	local var13 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
		fallbackExperienceName = localizationStringsModule.BUILD_ASSISTANT_FALLBACK_NAME
	}) else nil).fallbackExperienceName else nil
	local var14 = reactModule.useCallback(function(p4)
		-- upvalues: navigation (ref)
		navigation.navigate("BuildChat", { target = p4 })
	end, { navigation })
	reactModule.useEffect(function()
		-- upvalues: resumeBuildChatModule (copy), screenProps (ref), var13 (ref), var14 (ref)
		return resumeBuildChatModule({
			universeId = screenProps.universeId,
			sessionId = screenProps.sessionId,
			creatorAgentChatStore = screenProps.creatorAgentChatStore,
			configurationStore = screenProps.configurationStore,
			fallbackExperienceName = var13,
			onOpenChat = var14
		})
	end, {
		var14, screenProps.universeId, screenProps.sessionId,
		screenProps.resumeRequestId, screenProps.creatorAgentChatStore,
		screenProps.configurationStore, var13
	})
	local var15 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then screenProps.searchQueryStore or var9() else nil
	
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
				searchQueryStore = var15,
				onOpenSearch = if fFlagBuildAddSearchIconAndMoveSearchbarModule then reactModule.useCallback(function()
					-- upvalues: var15 (ref), navigation (ref)
					var15.beginSearch()
					navigation.navigate("BuildSearch", { searchQueryStore = var15 })
				end, { navigation, var15 }) else nil
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
					onOpenChat = var14
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
	-- upvalues: useBuildPageLayoutModule (ref), useNavigationFocus (ref), useOnScreenKeyboardVisibleModule (ref), var9 (ref), var1 (ref), useLocalization (ref), reactModule (ref), var7 (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var8 (ref), var6 (ref), fullscreenPageWithSafeArea (ref), var2 (ref), BuildSearchResults (ref)
	local screenProps = p3.screenProps or {}
	local navigation = p3.navigation
	local var11 = useBuildPageLayoutModule()
	local var12 = useNavigationFocus()
	local var13 = useOnScreenKeyboardVisibleModule()
	local searchQueryStore = navigation.getParam("searchQueryStore") or (screenProps.searchQueryStore or var9())
	local var14 = var1.useSignalBinding(searchQueryStore.getDraftQuery)
	local var15 = useLocalization({ searchbarPlaceholder = "Feature.Build.Label.SearchGames" })
	local var16 = reactModule.useCallback(function(p4)
		-- upvalues: navigation (ref)
		navigation.navigate("BuildChat", { target = p4 })
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
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var8("LuaApp_Build_Search_Scroll", var21)
	end
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
			ref = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then var21 else nil,
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
	-- upvalues: useBuildPageLayoutModule (ref), buildNavigationParamsModule (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), adsStatsContainerModule (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
	local navigation = p3.navigation
	local var11 = useBuildPageLayoutModule()
	local target = buildNavigationParamsModule.getTarget(navigation)
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var11.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var11.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var11.shouldIncludeBottomBar
	}, {
		Page = reactModule.createElement(overflowMenuPageShellModule, {
			testId = "BuildPage.GetUsersPage",
			title = useLocalization({
				pageTitle = localizationStringsModule.ADS_STATS_PAGE_TITLE
			}).pageTitle,
			onClose = reactModule.useCallback(function()
				-- upvalues: navigation (ref)
				navigation.goBack()
			end, { navigation }),
			content = reactModule.createElement(adsStatsContainerModule, {
				universeId = if target ~= nil then nil else target.universeId
			}),
			closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
			scrollPerformanceIntervalName = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then "LuaApp_Build_GetUsers_Scroll" else nil
		})
	})
end

local list = {
	{ BuildHome = { screen = BuildHomeScreen } },
	{
		BuildChat = {
			screen = function(p3)
				-- upvalues: buildNavigationParamsModule (ref), getBuildExperienceRefreshStoreModule (ref), useBuildPageLayoutModule (ref), fFlagBuildAdUpsellModule (ref), useNavigationFocus (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), buildOverflowMenuScreensModule (ref), fFlagBuildExperienceAssetLibraryModule (ref), var4 (ref), fFlagEnableBuildAdPromotionModule (ref), buildChatPageModule (ref), fullscreenPageWithSafeArea (ref), privateInvitesPickerHostModule (ref)
				local navigation = p3.navigation
				local target = buildNavigationParamsModule.getTarget(navigation)
				local var11 = getBuildExperienceRefreshStoreModule()
				local var12 = useBuildPageLayoutModule()
				local var13 = if fFlagBuildAdUpsellModule then useNavigationFocus() else true
				local var14 = useOnScreenKeyboardVisibleModule()
				local var15, var16 = reactModule.useState(false)
				local var17 = if target ~= nil then nil else target.universeId
				
				return reactModule.createElement(reactModule.Fragment, nil, {
					Page = reactModule.createElement(fullscreenPageWithSafeArea, {
						includeStatusBar = true,
						BackgroundColor3 = var12.tokens.Color.Surface.Surface_0.Color3,
						BackgroundTransparency = var12.tokens.Color.Surface.Surface_0.Transparency,
						includeBottomBar = var12.shouldIncludeBottomBar and not var14
					}, {
						Page = if target ~= nil then nil else reactModule.createElement(buildChatPageModule, {
							target = target,
							onClose = reactModule.useCallback(function()
								-- upvalues: navigation (ref)
								navigation.goBack()
							end, { navigation }),
							onOpenAgentsPage = reactModule.useCallback(function()
								-- upvalues: navigation (ref), target (ref)
								navigation.navigate("BuildAgents", { target = target })
							end, { navigation, target }),
							onOpenAssetLibraryPage = if fFlagBuildExperienceAssetLibraryModule then reactModule.useCallback(function()
								-- upvalues: navigation (ref), var4 (copy), target (ref)
								navigation.navigate(var4.Screens.Browser, { target = target })
							end, { navigation, target }) else nil,
							onOpenCreatorCreditPage = reactModule.useCallback(function()
								-- upvalues: navigation (ref), target (ref)
								navigation.navigate("BuildCreatorCredit", { target = target })
							end, { navigation, target }),
							onOpenGetUsersPage = if fFlagEnableBuildAdPromotionModule then reactModule.useCallback(function()
								-- upvalues: navigation (ref), target (ref)
								navigation.navigate("BuildGetUsers", { target = target })
							end, { navigation, target }) else nil,
							onOpenConfigurationPage = reactModule.useCallback(function(p4)
								-- upvalues: navigation (ref), buildOverflowMenuScreensModule (copy), target (ref)
								navigation.navigate(buildOverflowMenuScreensModule.SCREEN_BY_PAGE[p4], { target = target })
							end, { navigation, target }),
							onOpenInvitePicker = reactModule.useCallback(function()
								-- upvalues: var16 (ref)
								var16(true)
							end, {}),
							onNavigateToResolvedTarget = reactModule.useCallback(function(p4)
								-- upvalues: navigation (ref), var11 (ref)
								navigation.setParams({ target = p4 })
								var11.bumpRefreshTick()
							end, { navigation, var11 }),
							isFocused = if fFlagBuildAdUpsellModule then var13 else nil
						})
					}),
					Picker = if var15 and var17 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
						universeId = var17,
						onClose = reactModule.useCallback(function()
							-- upvalues: var16 (ref)
							var16(false)
						end, {}),
						onInvitesSent = reactModule.useCallback(function()
							-- upvalues: var16 (ref), navigation (ref), buildOverflowMenuScreensModule (copy), target (ref)
							var16(false)
							navigation.navigate(buildOverflowMenuScreensModule.Screens.BuildPlaytestInviteManagement, { target = target })
						end, { navigation, target })
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
		BuildAgents = {
			screen = function(p3)
				-- upvalues: useBuildPageLayoutModule (ref), useLiveSubagentTaskState (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), buildNavigationParamsModule (ref), subagentStatusModule (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
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
						testId = "BuildPage.AgentsPage",
						title = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
							agents = localizationStringsModule.SUBAGENT_STATUS_AGENTS
						}) else nil).agents else localizationStringsModule.SUBAGENT_STATUS_AGENTS,
						onClose = reactModule.useCallback(function()
							-- upvalues: navigation (ref)
							navigation.goBack()
						end, { navigation }),
						content = reactModule.createElement(subagentStatusModule.AgentsList, {
							testId = "BuildPage.AgentsList",
							groups = if var12 ~= nil then {} else var12.groups,
							onAgentActivated = reactModule.useCallback(function(p4)
								-- upvalues: navigation (ref), buildNavigationParamsModule (copy)
								navigation.navigate("BuildAgentDetails", {
									target = buildNavigationParamsModule.getTarget(navigation),
									subagentTaskGroupName = p4.name
								})
							end, { navigation })
						}),
						closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
						scrollPerformanceIntervalName = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then "LuaApp_Build_Agents_Scroll" else nil
					})
				})
			end
		}
	},
	{
		BuildAgentDetails = {
			screen = function(p3)
				-- upvalues: useBuildPageLayoutModule (ref), useLiveSubagentTaskState (ref), buildNavigationParamsModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), subagentStatusModule (ref), view (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
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
						testId = "BuildPage.AgentDetailsPage",
						title = subagentTaskGroupName or (if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
							agents = localizationStringsModule.SUBAGENT_STATUS_AGENTS
						}) else nil).agents else localizationStringsModule.SUBAGENT_STATUS_AGENTS),
						onClose = reactModule.useCallback(function()
							-- upvalues: navigation (ref)
							navigation.goBack()
						end, { navigation }),
						content = if var11 ~= nil then reactModule.createElement(view, { tag = "size-full" }) else reactModule.createElement(subagentStatusModule.AgentDetailsList, { testId = "BuildPage.AgentDetailsList", group = var11 }),
						closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
						scrollPerformanceIntervalName = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then "LuaApp_Build_AgentDetails_Scroll" else nil
					})
				})
			end
		}
	},
	{
		BuildCreatorCredit = {
			screen = function(p4)
				-- upvalues: useBuildPageLayoutModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), creatorCreditPageContainerModule (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), creatorCreditBalanceChipContainerModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
				local navigation = p4.navigation
				local var14 = useBuildPageLayoutModule()
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var14.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var14.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var14.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(overflowMenuPageShellModule, {
						testId = "BuildPage.CreatorCreditPage",
						title = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
							pageTitle = localizationStringsModule.CREATOR_CREDIT_PAGE_TITLE
						}) else nil).pageTitle else localizationStringsModule.CREATOR_CREDIT_PAGE_TITLE,
						onClose = reactModule.useCallback(function()
							-- upvalues: navigation (ref)
							navigation.goBack()
						end, { navigation }),
						content = reactModule.createElement(creatorCreditPageContainerModule, nil),
						headerTrailing = reactModule.createElement(creatorCreditBalanceChipContainerModule),
						closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
						scrollPerformanceIntervalName = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then "LuaApp_Build_CreatorCredit_Scroll" else nil
					})
				})
			end
		}
	}
}

if fFlagEnableBuildAdPromotionModule then
	table.insert(list, { BuildGetUsers = { screen = BuildGetUsersScreen } })
end
if fFlagBuildAddSearchIconAndMoveSearchbarModule then
	table.insert(list, { BuildSearch = { screen = BuildSearchScreen } })
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
local var14 = roactNavigationModule.createAppContainer(roactNavigationModule.createRobloxStackNavigator(list, { initialRouteName = "BuildHome" }))

return function(p4)
	-- upvalues: useBuildPageEligibilityModule (ref), var10 (ref), reactModule (ref), var14 (ref), buildEligibilityDialogModule (ref), view (ref), loading (ref), iconSize (ref)
	local var15 = useBuildPageEligibilityModule.useBuildPageEligibility(var10)
	
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