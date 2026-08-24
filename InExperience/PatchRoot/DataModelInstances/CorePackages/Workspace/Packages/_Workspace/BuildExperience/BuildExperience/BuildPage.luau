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
local var9 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(parent.SignalsReact) else nil
local buildPageHeaderModule = require(script.Parent.Components.BuildPageHeader.BuildPageHeader)
local buildChatPageModule = require(script.Parent.Components.BuildChatPage.BuildChatPage)
local buildSearchBarModule = require(script.Parent.Components.BuildSearchBar.BuildSearchBar)
local var13 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(script.Parent.Components.SearchPage.SearchPageContainer) else nil
local var14 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(script.Parent.Components.SearchEmptyState.SearchEmptyState) else nil
local subagentStatusModule = require(script.Parent.Components.SubagentStatus)
local myCreationsTabModule = require(script.Parent.Components.MyCreationsTab.MyCreationsTab)
local fFlagBuildExperienceAssetLibraryModule = require(script.Parent.Flags.FFlagBuildExperienceAssetLibrary)
local var18 = if fFlagBuildExperienceAssetLibraryModule then require(script.Parent.Components.AssetLibrary.AssetLibraryScreens) else nil
local var19 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(script.Parent.Components.MyCreationsTab.ExperienceResultsList) else nil
local var20 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(script.Parent.Components.MyCreationsTab.ExperienceResultsLoadingSkeleton) else nil
local var21 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(script.Parent.Components.MyCreationsTab.useMyCreationsResults) else nil
local buildOverflowMenuScreensModule = require(script.Parent.Components.BuildPillMenu.BuildOverflowMenuScreens)
local overflowMenuPageShellModule = require(script.Parent.Components.BuildPillMenu.OverflowMenuPageShell)
local privateInvitesPickerHostModule = require(script.Parent.Components.PrivateInvitesPicker.PrivateInvitesPickerHost)
local creatorCreditPageContainerModule = require(script.Parent.Components.CreatorCreditSheet.CreatorCreditPageContainer)
local creatorCreditBalanceChipContainerModule = require(script.Parent.Components.CreatorCreditSheet.CreatorCreditBalanceChip.CreatorCreditBalanceChipContainer)
local _ = require(script.Parent.Chat.chatTypes)
local useSessionSummaryModule = require(script.Parent.Chat.useSessionSummary)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(script.Parent.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local var29 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(script.Parent.Telemetry.useScrollPerformanceTracker) else nil
local fFlagBuildBackButtonChevronModule = require(script.Parent.Flags.FFlagBuildBackButtonChevron)
local _ = require(script.Parent.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local getBuildExperienceRefreshStoreModule = require(script.Parent.Stores.GetBuildExperienceRefreshStore)
local var32 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then require(script.Parent.Stores.GetSearchQueryStore) else nil
local _ = require(script.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local buildNavigationParamsModule = require(script.Parent.utils.BuildNavigationParams)
local resumeBuildChatModule = require(script.Parent.utils.resumeBuildChat)
local useBuildPageLayoutModule = require(script.Parent.utils.useBuildPageLayout)
local useOnScreenKeyboardVisibleModule = require(script.Parent.utils.useOnScreenKeyboardVisible)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local var37 = not sharedFlagsModule.FFlagEnableBuildTabOverride
local buildEligibilityDialogModule = require(script.Parent.Components.BuildEligibilityDialog)
local useBuildPageEligibilityModule = require(script.Parent.useBuildPageEligibility)
local _ = {
	BuildHome = "BuildHome",
	BuildChat = "BuildChat",
	BuildSearch = "BuildSearch",
	BuildAgents = "BuildAgents",
	BuildAgentDetails = "BuildAgentDetails",
	BuildCreatorCredit = "BuildCreatorCredit"
}

local function _(p0, p1) --[[ line: 117 | named "shouldShowSearchEmptyState" ]]
	return if p0 ~= "" then if p0 == p1.query then p1.isSettledNoResults else true else true
end

local _ = function(p2, p3) --[[ line: 132 | named "findGroup" ]]
	if p2 == nil or p3 == nil then
		return nil
	end
	for i, v in p2.groups do
		if v.name == p3 then
			return v
		end
	end
	return nil
end

local function useLiveSubagentTaskState(p4) --[[ line: 146 ]]
	-- upvalues: buildNavigationParamsModule (ref), creatorAgentChatModule (ref), reactModule (ref), useSessionSummaryModule (ref)
	local target = buildNavigationParamsModule.getTarget(p4)
	assert(target ~= nil, "Agent pages require a build target")
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	
	return useSessionSummaryModule(reactModule.useMemo(function() --[[ line: 150 ]]
		-- upvalues: creatorAgentChatStore (ref), target (ref)
		return creatorAgentChatStore.getSessionForProject(target.universeId, target.placeId, target.sessionId)
	end, {
		creatorAgentChatStore,
		target.universeId,
		target.placeId,
		target.sessionId
	})).subagentTaskState or buildNavigationParamsModule.getSubagentTaskState(p4)
end

local _ = function(p5) --[[ line: 158 | named "useOpenBuildChat" ]]
	-- upvalues: reactModule (ref)
	return reactModule.useCallback(function(p6) --[[ line: 159 ]]
		-- upvalues: p5 (ref)
		p5.navigate("BuildChat", { target = p6 })
	end, { p5 })
end

local function BuildHomeScreen(p7) --[[ line: 166 ]]
	-- upvalues: useBuildPageLayoutModule (ref), useNavigationFocus (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), resumeBuildChatModule (ref), fFlagBuildAddSearchIconAndMoveSearchbarModule (ref), var32 (ref), view (ref), buildSearchBarModule (ref), fullscreenPageWithSafeArea (ref), buildPageHeaderModule (ref), myCreationsTabModule (ref)
	local screenProps = p7.screenProps or {}
	local navigation = p7.navigation
	local var49 = useBuildPageLayoutModule()
	local var50 = useNavigationFocus()
	local tokens = var49.tokens
	local var51 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
		fallbackExperienceName = localizationStringsModule.BUILD_ASSISTANT_FALLBACK_NAME
	}) else nil).fallbackExperienceName else nil
	local var52 = reactModule.useCallback(function(p8) --[[ line: 179 ]]
		-- upvalues: navigation (ref)
		navigation.navigate("BuildChat", { target = p8 })
	end, { navigation })
	reactModule.useEffect(function() --[[ line: 186 ]]
		-- upvalues: resumeBuildChatModule (copy), screenProps (ref), var51 (ref), var52 (ref)
		return resumeBuildChatModule({
			universeId = screenProps.universeId,
			sessionId = screenProps.sessionId,
			creatorAgentChatStore = screenProps.creatorAgentChatStore,
			configurationStore = screenProps.configurationStore,
			fallbackExperienceName = var51,
			onOpenChat = var52
		})
	end, {
		var52, screenProps.universeId, screenProps.sessionId,
		screenProps.resumeRequestId, screenProps.creatorAgentChatStore,
		screenProps.configurationStore, var51
	})
	local var53 = if fFlagBuildAddSearchIconAndMoveSearchbarModule then screenProps.searchQueryStore or var32() else nil
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var49.shouldIncludeBottomBar
	}, {
		Page = reactModule.createElement(view, { tag = "col align-x-center size-full bg-surface-0" }, {
			Header = reactModule.createElement(buildPageHeaderModule, {
				LayoutOrder = 1,
				height = var49.topBarHeight,
				searchQueryStore = var53,
				onOpenSearch = if fFlagBuildAddSearchIconAndMoveSearchbarModule then reactModule.useCallback(function() --[[ line: 227 ]]
					-- upvalues: var53 (ref), navigation (ref)
					var53.beginSearch()
					navigation.navigate("BuildSearch", { searchQueryStore = var53 })
				end, { navigation, var53 }) else nil
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
					isFocused = var50,
					autoOpenNewGame = screenProps.universeId == nil and screenProps.sessionId == nil,
					onOpenChat = var52
				})
			})
		})
	})
end

local function BuildSearchResults(p9) --[[ line: 280 ]]
	-- upvalues: reactModule (ref), var14 (ref), var19 (ref)
	local var54 = p9.searchQueryStore.useDraftQuery()
	local current = p9.closingSnapshot.current
	local var55 = if current ~= nil then p9.results else current.results
	
	return if if current == nil then if var54 ~= "" then if var54 == var55.query then var55.isSettledNoResults else true else true else current.showEmptyState then reactModule.createElement(var14, { testId = "SearchPage.EmptyState" }) else reactModule.createElement(var19, {
		testIdPrefix = "SearchPage",
		items = var55.items,
		hasDisplayedItems = #var55.displayedItems > 0,
		hasDisplayedResult = var55.hasDisplayedResult,
		hasPendingSummary = var55.hasPendingSummary,
		listStatus = var55.listStatus,
		failedLoadMore = var55.failedLoadMore,
		retryLoadMore = var55.retryLoadMore,
		loadError = var55.loadError,
		onOpenChat = p9.onOpenChat
	})
end

local function BuildSearchScreen(p10) --[[ line: 308 ]]
	-- upvalues: useBuildPageLayoutModule (ref), useNavigationFocus (ref), useOnScreenKeyboardVisibleModule (ref), var32 (ref), var9 (ref), useLocalization (ref), reactModule (ref), var21 (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var29 (ref), var20 (ref), fullscreenPageWithSafeArea (ref), var13 (ref), BuildSearchResults (ref)
	local screenProps = p10.screenProps or {}
	local navigation = p10.navigation
	local var57 = useBuildPageLayoutModule()
	local var58 = useNavigationFocus()
	local var59 = useOnScreenKeyboardVisibleModule()
	local searchQueryStore = navigation.getParam("searchQueryStore") or (screenProps.searchQueryStore or var32())
	local var61 = var9.useSignalBinding(searchQueryStore.getDraftQuery)
	local var62 = useLocalization({ searchbarPlaceholder = "Feature.Build.Label.SearchGames" })
	local var63 = reactModule.useCallback(function(p11) --[[ line: 159 ]]
		-- upvalues: navigation (ref)
		navigation.navigate("BuildChat", { target = p11 })
	end, { navigation })
	local var64 = var21({
		creatorAgentChatStore = screenProps.creatorAgentChatStore,
		configurationStore = screenProps.configurationStore,
		searchStore = screenProps.searchStore,
		searchQueryStore = searchQueryStore,
		isFocused = var58
	})
	local var65 = reactModule.useRef(nil)
	local current = var65.current
	local var66 = var61:map(function(p12) --[[ line: 331 ]]
		-- upvalues: var65 (ref)
		local current = var65.current
		
		return if current == nil then p12 else current.query
	end)
	local var67 = if current ~= nil then var64 else current.results
	local var68 = reactModule.useRef(nil)
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var29("LuaApp_Build_Search_Scroll", var68)
	end
	local var69 = reactModule.useCallback(function() --[[ line: 341 ]]
		-- upvalues: var67 (ref), reactModule (copy), var20 (copy)
		return if var67.isLoadingMore then reactModule.createElement(var20, { LayoutOrder = 1, index = 1, testIdPrefix = "SearchPage" }) else nil
	end, { var67.isLoadingMore })
	local var70 = reactModule.useCallback(function() --[[ line: 352 ]]
		-- upvalues: searchQueryStore (ref), var65 (ref), var64 (ref), navigation (ref)
		local draftQuery = searchQueryStore.getDraftQuery()
		var65.current = {
			query = draftQuery,
			results = var64,
			showEmptyState = if draftQuery ~= "" then if draftQuery == var64.query then var64.isSettledNoResults else true else true
		}
		searchQueryStore.endSearch()
		navigation.goBack()
	end, { var65, navigation, var64, searchQueryStore })
	reactModule.useEffect(function() --[[ line: 363 ]]
		-- upvalues: searchQueryStore (ref)
		searchQueryStore.beginSearch()
		
		return searchQueryStore.endSearch
	end, { searchQueryStore })
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var57.tokens.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var57.tokens.Color.Surface.Surface_0.Transparency,
		includeBottomBar = var57.shouldIncludeBottomBar and not var59
	}, {
		Page = reactModule.createElement(var13, {
			showEmptyState = false,
			ref = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then var68 else nil,
			createFooter = var69,
			onBack = var70,
			onCanvasPositionChangedCallback = var67.loadMoreIfNeeded,
			onCanvasSizeChangedCallback = var67.loadMoreIfNeeded,
			refresh = var67.refresh,
			searchBarProps = {
				clear = searchQueryStore.clear,
				onFocusGained = searchQueryStore.beginSearch,
				placeholder = var62.searchbarPlaceholder,
				query = var66,
				setQuery = searchQueryStore.setQuery,
				shouldFocus = var58
			}
		}, {
			ExperienceResults = reactModule.createElement(BuildSearchResults, {
				closingSnapshot = var65,
				onOpenChat = var63,
				results = var64,
				searchQueryStore = searchQueryStore
			})
		})
	})
end

local list = {
	{ BuildHome = { screen = BuildHomeScreen } },
	{
		BuildChat = {
			screen = function(p13) --[[ line: 401 ]]
				-- upvalues: buildNavigationParamsModule (ref), getBuildExperienceRefreshStoreModule (ref), useBuildPageLayoutModule (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), buildOverflowMenuScreensModule (ref), fFlagBuildExperienceAssetLibraryModule (ref), var18 (ref), buildChatPageModule (ref), fullscreenPageWithSafeArea (ref), privateInvitesPickerHostModule (ref)
				local navigation = p13.navigation
				local target = buildNavigationParamsModule.getTarget(navigation)
				local var73 = getBuildExperienceRefreshStoreModule()
				local var74 = useBuildPageLayoutModule()
				local var75 = useOnScreenKeyboardVisibleModule()
				local var76, var77 = reactModule.useState(false)
				local var78 = if target ~= nil then nil else target.universeId
				
				return reactModule.createElement(reactModule.Fragment, nil, {
					Page = reactModule.createElement(fullscreenPageWithSafeArea, {
						includeStatusBar = true,
						BackgroundColor3 = var74.tokens.Color.Surface.Surface_0.Color3,
						BackgroundTransparency = var74.tokens.Color.Surface.Surface_0.Transparency,
						includeBottomBar = var74.shouldIncludeBottomBar and not var75
					}, {
						Page = if target ~= nil then nil else reactModule.createElement(buildChatPageModule, {
							target = target,
							onClose = reactModule.useCallback(function() --[[ line: 409 ]]
								-- upvalues: navigation (ref)
								navigation.goBack()
							end, { navigation }),
							onOpenAgentsPage = reactModule.useCallback(function() --[[ line: 435 ]]
								-- upvalues: navigation (ref), target (ref)
								navigation.navigate("BuildAgents", { target = target })
							end, { navigation, target }),
							onOpenAssetLibraryPage = if fFlagBuildExperienceAssetLibraryModule then reactModule.useCallback(function() --[[ line: 443 ]]
								-- upvalues: navigation (ref), var18 (copy), target (ref)
								navigation.navigate(var18.Screens.Browser, { target = target })
							end, { navigation, target }) else nil,
							onOpenCreatorCreditPage = reactModule.useCallback(function() --[[ line: 449 ]]
								-- upvalues: navigation (ref), target (ref)
								navigation.navigate("BuildCreatorCredit", { target = target })
							end, { navigation, target }),
							onOpenConfigurationPage = reactModule.useCallback(function(p14) --[[ line: 413 ]]
								-- upvalues: navigation (ref), buildOverflowMenuScreensModule (copy), target (ref)
								navigation.navigate(buildOverflowMenuScreensModule.SCREEN_BY_PAGE[p14], { target = target })
							end, { navigation, target }),
							onOpenInvitePicker = reactModule.useCallback(function() --[[ line: 421 ]]
								-- upvalues: var77 (ref)
								var77(true)
							end, {}),
							onNavigateToResolvedTarget = reactModule.useCallback(function(p15) --[[ line: 454 ]]
								-- upvalues: navigation (ref), var73 (ref)
								navigation.setParams({ target = p15 })
								var73.bumpRefreshTick()
							end, { navigation, var73 })
						})
					}),
					Picker = if var76 and var78 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
						universeId = var78,
						onClose = reactModule.useCallback(function() --[[ line: 424 ]]
							-- upvalues: var77 (ref)
							var77(false)
						end, {}),
						onInvitesSent = reactModule.useCallback(function() --[[ line: 429 ]]
							-- upvalues: var77 (ref), navigation (ref), buildOverflowMenuScreensModule (copy), target (ref)
							var77(false)
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
			screen = function(p16) --[[ line: 497 ]]
				-- upvalues: useBuildPageLayoutModule (ref), useLiveSubagentTaskState (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), buildNavigationParamsModule (ref), subagentStatusModule (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
				local navigation = p16.navigation
				local var79 = useBuildPageLayoutModule()
				local var80 = useLiveSubagentTaskState(navigation)
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var79.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var79.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var79.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(overflowMenuPageShellModule, {
						testId = "BuildPage.AgentsPage",
						title = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
							agents = localizationStringsModule.SUBAGENT_STATUS_AGENTS
						}) else nil).agents else localizationStringsModule.SUBAGENT_STATUS_AGENTS,
						onClose = reactModule.useCallback(function() --[[ line: 510 ]]
							-- upvalues: navigation (ref)
							navigation.goBack()
						end, { navigation }),
						content = reactModule.createElement(subagentStatusModule.AgentsList, {
							testId = "BuildPage.AgentsList",
							groups = if var80 ~= nil then {} else var80.groups,
							onAgentActivated = reactModule.useCallback(function(p17) --[[ line: 513 ]]
								-- upvalues: navigation (ref), buildNavigationParamsModule (copy)
								navigation.navigate("BuildAgentDetails", {
									target = buildNavigationParamsModule.getTarget(navigation),
									subagentTaskGroupName = p17.name
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
			screen = function(p18) --[[ line: 545 ]]
				-- upvalues: useBuildPageLayoutModule (ref), useLiveSubagentTaskState (ref), buildNavigationParamsModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), subagentStatusModule (ref), view (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
				local var84
				local navigation = p18.navigation
				local var81 = useBuildPageLayoutModule()
				local var82 = useLiveSubagentTaskState(navigation)
				local subagentTaskGroupName = buildNavigationParamsModule.getSubagentTaskGroupName(navigation)
				
				if var82 == nil or subagentTaskGroupName == nil then
					var84 = nil
				else
					for i, v in var82.groups do
						if v.name == subagentTaskGroupName then
							var84 = v
						end
					end
					var84 = nil
				end
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var81.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var81.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var81.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(overflowMenuPageShellModule, {
						testId = "BuildPage.AgentDetailsPage",
						title = subagentTaskGroupName or (if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
							agents = localizationStringsModule.SUBAGENT_STATUS_AGENTS
						}) else nil).agents else localizationStringsModule.SUBAGENT_STATUS_AGENTS),
						onClose = reactModule.useCallback(function() --[[ line: 560 ]]
							-- upvalues: navigation (ref)
							navigation.goBack()
						end, { navigation }),
						content = if var84 ~= nil then reactModule.createElement(view, { tag = "size-full" }) else reactModule.createElement(subagentStatusModule.AgentDetailsList, { testId = "BuildPage.AgentDetailsList", group = var84 }),
						closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
						scrollPerformanceIntervalName = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then "LuaApp_Build_AgentDetails_Scroll" else nil
					})
				})
			end
		}
	},
	{
		BuildCreatorCredit = {
			screen = function(p19) --[[ line: 592 ]]
				-- upvalues: useBuildPageLayoutModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), creatorCreditPageContainerModule (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), creatorCreditBalanceChipContainerModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
				local navigation = p19.navigation
				local var85 = useBuildPageLayoutModule()
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var85.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var85.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var85.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(overflowMenuPageShellModule, {
						testId = "BuildPage.CreatorCreditPage",
						title = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
							pageTitle = localizationStringsModule.CREATOR_CREDIT_PAGE_TITLE
						}) else nil).pageTitle else localizationStringsModule.CREATOR_CREDIT_PAGE_TITLE,
						onClose = reactModule.useCallback(function() --[[ line: 604 ]]
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

if fFlagBuildAddSearchIconAndMoveSearchbarModule then
	table.insert(list, { BuildSearch = { screen = BuildSearchScreen } })
end
if fFlagBuildExperienceAssetLibraryModule then
	table.insert(list, {
		[var18.Screens.Browser] = { screen = var18.BrowserScreen }
	})
	table.insert(list, {
		[var18.Screens.Category] = { screen = var18.CategoryScreen }
	})
	table.insert(list, { [var18.Screens.Detail] = { screen = var18.DetailScreen } })
end
local var45 = roactNavigationModule.createAppContainer(roactNavigationModule.createRobloxStackNavigator(list, { initialRouteName = "BuildHome" }))

return function(p20) --[[ line: 723 | named "BuildPage" ]]
	-- upvalues: useBuildPageEligibilityModule (ref), var37 (ref), reactModule (ref), var45 (ref), buildEligibilityDialogModule (ref), view (ref), loading (ref), iconSize (ref)
	local var86 = useBuildPageEligibilityModule.useBuildPageEligibility(var37)
	
	return if var86.canEnterBuild then reactModule.createElement(var45, { screenProps = p20 or {} }) elseif var86.status == useBuildPageEligibilityModule.Status.Ineligible then reactModule.createElement(buildEligibilityDialogModule, {
		variant = useBuildPageEligibilityModule.Status.Ineligible,
		onDismiss = var86.onDialogDismiss
	}) elseif var86.status == useBuildPageEligibilityModule.Status.Error then reactModule.createElement(buildEligibilityDialogModule, {
		variant = useBuildPageEligibilityModule.Status.Error,
		onDismiss = var86.onDialogDismiss
	}) elseif var86.status == useBuildPageEligibilityModule.Status.Refreshing then reactModule.createElement(view, {
		tag = "col align-x-center align-y-center size-full",
		testId = "BuildPage.EligibilityLoading"
	}, {
		Spinner = reactModule.createElement(loading, { size = iconSize.Large })
	}) else reactModule.createElement(view, {
		tag = "size-full",
		testId = "BuildPage.EligibilityPrompting"
	})
end