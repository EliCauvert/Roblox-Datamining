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
local buildPageHeaderModule = require(script.Parent.Components.BuildPageHeader.BuildPageHeader)
local buildChatPageModule = require(script.Parent.Components.BuildChatPage.BuildChatPage)
local buildSearchBarModule = require(script.Parent.Components.BuildSearchBar.BuildSearchBar)
local subagentStatusModule = require(script.Parent.Components.SubagentStatus)
local myCreationsTabModule = require(script.Parent.Components.MyCreationsTab.MyCreationsTab)
local fFlagBuildExperienceAssetLibraryModule = require(script.Parent.Flags.FFlagBuildExperienceAssetLibrary)
local var14 = if fFlagBuildExperienceAssetLibraryModule then require(script.Parent.Components.AssetLibrary.AssetLibraryScreens) else nil
local buildOverflowMenuScreensModule = require(script.Parent.Components.BuildPillMenu.BuildOverflowMenuScreens)
local overflowMenuPageShellModule = require(script.Parent.Components.BuildPillMenu.OverflowMenuPageShell)
local privateInvitesPickerHostModule = require(script.Parent.Components.PrivateInvitesPicker.PrivateInvitesPickerHost)
local creatorCreditPageContainerModule = require(script.Parent.Components.CreatorCreditSheet.CreatorCreditPageContainer)
local creatorCreditBalanceChipContainerModule = require(script.Parent.Components.CreatorCreditSheet.CreatorCreditBalanceChip.CreatorCreditBalanceChipContainer)
local _ = require(script.Parent.Chat.chatTypes)
local useSessionSummaryModule = require(script.Parent.Chat.useSessionSummary)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(script.Parent.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local fFlagBuildBackButtonChevronModule = require(script.Parent.Flags.FFlagBuildBackButtonChevron)
local _ = require(script.Parent.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local getBuildExperienceRefreshStoreModule = require(script.Parent.Stores.GetBuildExperienceRefreshStore)
local _ = require(script.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local buildNavigationParamsModule = require(script.Parent.utils.BuildNavigationParams)
local resumeBuildChatModule = require(script.Parent.utils.resumeBuildChat)
local useBuildPageLayoutModule = require(script.Parent.utils.useBuildPageLayout)
local useOnScreenKeyboardVisibleModule = require(script.Parent.utils.useOnScreenKeyboardVisible)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local var28 = not sharedFlagsModule.FFlagEnableBuildTabOverride
local buildEligibilityDialogModule = require(script.Parent.Components.BuildEligibilityDialog)
local useBuildPageEligibilityModule = require(script.Parent.useBuildPageEligibility)
local _ = {
	BuildHome = "BuildHome",
	BuildChat = "BuildChat",
	BuildAgents = "BuildAgents",
	BuildAgentDetails = "BuildAgentDetails",
	BuildCreatorCredit = "BuildCreatorCredit"
}

local function _(p0, p1) --[[ line: 81 | named "findGroup" ]]
	if p0 == nil or p1 == nil then
		return nil
	end
	for i, v in p0.groups do
		if v.name == p1 then
			return v
		end
	end
	return nil
end

local function useLiveSubagentTaskState(p2) --[[ line: 95 ]]
	-- upvalues: buildNavigationParamsModule (ref), creatorAgentChatModule (ref), reactModule (ref), useSessionSummaryModule (ref)
	local target = buildNavigationParamsModule.getTarget(p2)
	assert(target ~= nil, "Agent pages require a build target")
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	
	return useSessionSummaryModule(reactModule.useMemo(function() --[[ line: 99 ]]
		-- upvalues: creatorAgentChatStore (ref), target (ref)
		return creatorAgentChatStore.getSessionForProject(target.universeId, target.placeId, target.sessionId)
	end, {
		creatorAgentChatStore,
		target.universeId,
		target.placeId,
		target.sessionId
	})).subagentTaskState or buildNavigationParamsModule.getSubagentTaskState(p2)
end

local list = {
	{
		BuildHome = {
			screen = function(p3) --[[ line: 107 ]]
				-- upvalues: useBuildPageLayoutModule (ref), useNavigationFocus (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), resumeBuildChatModule (ref), fullscreenPageWithSafeArea (ref), view (ref), buildPageHeaderModule (ref), buildSearchBarModule (ref), myCreationsTabModule (ref)
				local screenProps = p3.screenProps or {}
				local navigation = p3.navigation
				local var37 = useBuildPageLayoutModule()
				local var38 = useNavigationFocus()
				local tokens = var37.tokens
				local var39 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
					fallbackExperienceName = localizationStringsModule.BUILD_ASSISTANT_FALLBACK_NAME
				}) else nil).fallbackExperienceName else nil
				local var40 = reactModule.useCallback(function(p4) --[[ line: 120 ]]
					-- upvalues: navigation (ref)
					navigation.navigate("BuildChat", { target = p4 })
				end, { navigation })
				reactModule.useEffect(function() --[[ line: 127 ]]
					-- upvalues: resumeBuildChatModule (copy), screenProps (ref), var39 (ref), var40 (ref)
					return resumeBuildChatModule({
						universeId = screenProps.universeId,
						sessionId = screenProps.sessionId,
						creatorAgentChatStore = screenProps.creatorAgentChatStore,
						configurationStore = screenProps.configurationStore,
						fallbackExperienceName = var39,
						onOpenChat = var40
					})
				end, {
					var40, screenProps.universeId, screenProps.sessionId,
					screenProps.resumeRequestId, screenProps.creatorAgentChatStore,
					screenProps.configurationStore, var39
				})
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var37.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(view, { tag = "col align-x-center size-full bg-surface-0" }, {
						Header = reactModule.createElement(buildPageHeaderModule, { LayoutOrder = 1, height = var37.topBarHeight }),
						Content = reactModule.createElement(view, {
							LayoutOrder = 2,
							ZIndex = 4,
							tag = "col align-x-center fill gap-small size-full-0"
						}, {
							SearchBarContainer = reactModule.createElement(view, {
								LayoutOrder = 1,
								ZIndex = 2,
								tag = "composition-content-header size-full-0 auto-y bg-surface-0",
								testId = "BuildPage.SearchBarContainer"
							}, {
								SearchBar = reactModule.createElement(buildSearchBarModule, { store = screenProps.searchQueryStore })
							}),
							MyCreations = reactModule.createElement(myCreationsTabModule, {
								LayoutOrder = 3,
								creatorAgentChatStore = screenProps.creatorAgentChatStore,
								configurationStore = screenProps.configurationStore,
								searchQueryStore = screenProps.searchQueryStore,
								isFocused = var38,
								autoOpenNewGame = screenProps.universeId == nil and screenProps.sessionId == nil,
								onOpenChat = var40
							})
						})
					})
				})
			end
		}
	},
	{
		BuildChat = {
			screen = function(p5) --[[ line: 190 ]]
				-- upvalues: buildNavigationParamsModule (ref), getBuildExperienceRefreshStoreModule (ref), useBuildPageLayoutModule (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), buildOverflowMenuScreensModule (ref), fFlagBuildExperienceAssetLibraryModule (ref), var14 (ref), buildChatPageModule (ref), fullscreenPageWithSafeArea (ref), privateInvitesPickerHostModule (ref)
				local navigation = p5.navigation
				local target = buildNavigationParamsModule.getTarget(navigation)
				local var42 = getBuildExperienceRefreshStoreModule()
				local var43 = useBuildPageLayoutModule()
				local var44 = useOnScreenKeyboardVisibleModule()
				local var45, var46 = reactModule.useState(false)
				local var47 = if target ~= nil then nil else target.universeId
				
				return reactModule.createElement(reactModule.Fragment, nil, {
					Page = reactModule.createElement(fullscreenPageWithSafeArea, {
						includeStatusBar = true,
						BackgroundColor3 = var43.tokens.Color.Surface.Surface_0.Color3,
						BackgroundTransparency = var43.tokens.Color.Surface.Surface_0.Transparency,
						includeBottomBar = var43.shouldIncludeBottomBar and not var44
					}, {
						Page = if target ~= nil then nil else reactModule.createElement(buildChatPageModule, {
							target = target,
							onClose = reactModule.useCallback(function() --[[ line: 198 ]]
								-- upvalues: navigation (ref)
								navigation.goBack()
							end, { navigation }),
							onOpenAgentsPage = reactModule.useCallback(function() --[[ line: 224 ]]
								-- upvalues: navigation (ref), target (ref)
								navigation.navigate("BuildAgents", { target = target })
							end, { navigation, target }),
							onOpenAssetLibraryPage = if fFlagBuildExperienceAssetLibraryModule then reactModule.useCallback(function() --[[ line: 232 ]]
								-- upvalues: navigation (ref), var14 (copy), target (ref)
								navigation.navigate(var14.Screens.Browser, { target = target })
							end, { navigation, target }) else nil,
							onOpenCreatorCreditPage = reactModule.useCallback(function() --[[ line: 238 ]]
								-- upvalues: navigation (ref), target (ref)
								navigation.navigate("BuildCreatorCredit", { target = target })
							end, { navigation, target }),
							onOpenConfigurationPage = reactModule.useCallback(function(p6) --[[ line: 202 ]]
								-- upvalues: navigation (ref), buildOverflowMenuScreensModule (copy), target (ref)
								navigation.navigate(buildOverflowMenuScreensModule.SCREEN_BY_PAGE[p6], { target = target })
							end, { navigation, target }),
							onOpenInvitePicker = reactModule.useCallback(function() --[[ line: 210 ]]
								-- upvalues: var46 (ref)
								var46(true)
							end, {}),
							onNavigateToResolvedTarget = reactModule.useCallback(function(p7) --[[ line: 243 ]]
								-- upvalues: navigation (ref), var42 (ref)
								navigation.setParams({ target = p7 })
								var42.bumpRefreshTick()
							end, { navigation, var42 })
						})
					}),
					Picker = if var45 and var47 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
						universeId = var47,
						onClose = reactModule.useCallback(function() --[[ line: 213 ]]
							-- upvalues: var46 (ref)
							var46(false)
						end, {}),
						onInvitesSent = reactModule.useCallback(function() --[[ line: 218 ]]
							-- upvalues: var46 (ref), navigation (ref), buildOverflowMenuScreensModule (copy), target (ref)
							var46(false)
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
			screen = function(p8) --[[ line: 286 ]]
				-- upvalues: useBuildPageLayoutModule (ref), useLiveSubagentTaskState (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), buildNavigationParamsModule (ref), subagentStatusModule (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
				local navigation = p8.navigation
				local var48 = useBuildPageLayoutModule()
				local var49 = useLiveSubagentTaskState(navigation)
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var48.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var48.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var48.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(overflowMenuPageShellModule, {
						testId = "BuildPage.AgentsPage",
						title = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
							agents = localizationStringsModule.SUBAGENT_STATUS_AGENTS
						}) else nil).agents else localizationStringsModule.SUBAGENT_STATUS_AGENTS,
						onClose = reactModule.useCallback(function() --[[ line: 299 ]]
							-- upvalues: navigation (ref)
							navigation.goBack()
						end, { navigation }),
						content = reactModule.createElement(subagentStatusModule.AgentsList, {
							testId = "BuildPage.AgentsList",
							groups = if var49 ~= nil then {} else var49.groups,
							onAgentActivated = reactModule.useCallback(function(p9) --[[ line: 302 ]]
								-- upvalues: navigation (ref), buildNavigationParamsModule (copy)
								navigation.navigate("BuildAgentDetails", {
									target = buildNavigationParamsModule.getTarget(navigation),
									subagentTaskGroupName = p9.name
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
			screen = function(p10) --[[ line: 334 ]]
				-- upvalues: useBuildPageLayoutModule (ref), useLiveSubagentTaskState (ref), buildNavigationParamsModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), subagentStatusModule (ref), view (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
				local var53
				local navigation = p10.navigation
				local var50 = useBuildPageLayoutModule()
				local var51 = useLiveSubagentTaskState(navigation)
				local subagentTaskGroupName = buildNavigationParamsModule.getSubagentTaskGroupName(navigation)
				
				if var51 == nil or subagentTaskGroupName == nil then
					var53 = nil
				else
					for i, v in var51.groups do
						if v.name == subagentTaskGroupName then
							var53 = v
						end
					end
					var53 = nil
				end
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var50.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var50.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var50.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(overflowMenuPageShellModule, {
						testId = "BuildPage.AgentDetailsPage",
						title = subagentTaskGroupName or (if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
							agents = localizationStringsModule.SUBAGENT_STATUS_AGENTS
						}) else nil).agents else localizationStringsModule.SUBAGENT_STATUS_AGENTS),
						onClose = reactModule.useCallback(function() --[[ line: 349 ]]
							-- upvalues: navigation (ref)
							navigation.goBack()
						end, { navigation }),
						content = if var53 ~= nil then reactModule.createElement(view, { tag = "size-full" }) else reactModule.createElement(subagentStatusModule.AgentDetailsList, { testId = "BuildPage.AgentDetailsList", group = var53 }),
						closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
						scrollPerformanceIntervalName = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then "LuaApp_Build_AgentDetails_Scroll" else nil
					})
				})
			end
		}
	},
	{
		BuildCreatorCredit = {
			screen = function(p11) --[[ line: 381 ]]
				-- upvalues: useBuildPageLayoutModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), creatorCreditPageContainerModule (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), creatorCreditBalanceChipContainerModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
				local navigation = p11.navigation
				local var54 = useBuildPageLayoutModule()
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var54.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var54.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var54.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(overflowMenuPageShellModule, {
						testId = "BuildPage.CreatorCreditPage",
						title = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
							pageTitle = localizationStringsModule.CREATOR_CREDIT_PAGE_TITLE
						}) else nil).pageTitle else localizationStringsModule.CREATOR_CREDIT_PAGE_TITLE,
						onClose = reactModule.useCallback(function() --[[ line: 393 ]]
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

if fFlagBuildExperienceAssetLibraryModule then
	table.insert(list, {
		[var14.Screens.Browser] = { screen = var14.BrowserScreen }
	})
	table.insert(list, {
		[var14.Screens.Category] = { screen = var14.CategoryScreen }
	})
	table.insert(list, { [var14.Screens.Detail] = { screen = var14.DetailScreen } })
end
local var33 = roactNavigationModule.createAppContainer(roactNavigationModule.createRobloxStackNavigator(list, { initialRouteName = "BuildHome" }))

return function(p12) --[[ line: 505 | named "BuildPage" ]]
	-- upvalues: useBuildPageEligibilityModule (ref), var28 (ref), reactModule (ref), var33 (ref), buildEligibilityDialogModule (ref), view (ref), loading (ref), iconSize (ref)
	local var55 = useBuildPageEligibilityModule.useBuildPageEligibility(var28)
	
	return if var55.canEnterBuild then reactModule.createElement(var33, { screenProps = p12 or {} }) elseif var55.status == useBuildPageEligibilityModule.Status.Ineligible then reactModule.createElement(buildEligibilityDialogModule, {
		variant = useBuildPageEligibilityModule.Status.Ineligible,
		onDismiss = var55.onDialogDismiss
	}) elseif var55.status == useBuildPageEligibilityModule.Status.Error then reactModule.createElement(buildEligibilityDialogModule, {
		variant = useBuildPageEligibilityModule.Status.Error,
		onDismiss = var55.onDialogDismiss
	}) elseif var55.status == useBuildPageEligibilityModule.Status.Refreshing then reactModule.createElement(view, {
		tag = "col align-x-center align-y-center size-full",
		testId = "BuildPage.EligibilityLoading"
	}, {
		Spinner = reactModule.createElement(loading, { size = iconSize.Large })
	}) else reactModule.createElement(view, {
		tag = "size-full",
		testId = "BuildPage.EligibilityPrompting"
	})
end