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
local var1 = not sharedFlagsModule.FFlagEnableBuildTabOverride
local buildEligibilityDialogModule = require(script.Parent.Components.BuildEligibilityDialog)
local useBuildPageEligibilityModule = require(script.Parent.useBuildPageEligibility)
local _ = {
	BuildHome = "BuildHome",
	BuildChat = "BuildChat",
	BuildAgents = "BuildAgents",
	BuildAgentDetails = "BuildAgentDetails",
	BuildCreatorCredit = "BuildCreatorCredit"
}

local function _(p1, p2)
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

local var2 = roactNavigationModule.createAppContainer(roactNavigationModule.createRobloxStackNavigator({
	{
		BuildHome = {
			screen = function(p3)
				-- upvalues: useBuildPageLayoutModule (ref), useNavigationFocus (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), resumeBuildChatModule (ref), fullscreenPageWithSafeArea (ref), view (ref), buildPageHeaderModule (ref), buildSearchBarModule (ref), myCreationsTabModule (ref)
				local screenProps = p3.screenProps or {}
				local navigation = p3.navigation
				local var3 = useBuildPageLayoutModule()
				local var4 = useNavigationFocus()
				local tokens = var3.tokens
				local var5 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
					fallbackExperienceName = localizationStringsModule.BUILD_ASSISTANT_FALLBACK_NAME
				}) else nil).fallbackExperienceName else nil
				local var6 = reactModule.useCallback(function(p4)
					-- upvalues: navigation (ref)
					navigation.navigate("BuildChat", { target = p4 })
				end, { navigation })
				reactModule.useEffect(function()
					-- upvalues: resumeBuildChatModule (copy), screenProps (ref), var5 (ref), var6 (ref)
					return resumeBuildChatModule({
						universeId = screenProps.universeId,
						sessionId = screenProps.sessionId,
						creatorAgentChatStore = screenProps.creatorAgentChatStore,
						configurationStore = screenProps.configurationStore,
						fallbackExperienceName = var5,
						onOpenChat = var6
					})
				end, {
					var6, screenProps.universeId, screenProps.sessionId,
					screenProps.resumeRequestId, screenProps.creatorAgentChatStore,
					screenProps.configurationStore, var5
				})
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var3.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(view, { tag = "col align-x-center size-full bg-surface-0" }, {
						Header = reactModule.createElement(buildPageHeaderModule, { LayoutOrder = 1, height = var3.topBarHeight }),
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
								isFocused = var4,
								autoOpenNewGame = screenProps.universeId == nil and screenProps.sessionId == nil,
								onOpenChat = var6
							})
						})
					})
				})
			end
		}
	},
	{
		BuildChat = {
			screen = function(p3)
				-- upvalues: buildNavigationParamsModule (ref), getBuildExperienceRefreshStoreModule (ref), useBuildPageLayoutModule (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), buildOverflowMenuScreensModule (ref), buildChatPageModule (ref), fullscreenPageWithSafeArea (ref), privateInvitesPickerHostModule (ref)
				local navigation = p3.navigation
				local target = buildNavigationParamsModule.getTarget(navigation)
				local var3 = getBuildExperienceRefreshStoreModule()
				local var4 = useBuildPageLayoutModule()
				local var5 = useOnScreenKeyboardVisibleModule()
				local var6, var7 = reactModule.useState(false)
				local var8 = if target ~= nil then nil else target.universeId
				
				return reactModule.createElement(reactModule.Fragment, nil, {
					Page = reactModule.createElement(fullscreenPageWithSafeArea, {
						includeStatusBar = true,
						BackgroundColor3 = var4.tokens.Color.Surface.Surface_0.Color3,
						BackgroundTransparency = var4.tokens.Color.Surface.Surface_0.Transparency,
						includeBottomBar = var4.shouldIncludeBottomBar and not var5
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
							onOpenCreatorCreditPage = reactModule.useCallback(function()
								-- upvalues: navigation (ref), target (ref)
								navigation.navigate("BuildCreatorCredit", { target = target })
							end, { navigation, target }),
							onOpenConfigurationPage = reactModule.useCallback(function(p4)
								-- upvalues: navigation (ref), buildOverflowMenuScreensModule (copy), target (ref)
								navigation.navigate(buildOverflowMenuScreensModule.SCREEN_BY_PAGE[p4], { target = target })
							end, { navigation, target }),
							onOpenInvitePicker = reactModule.useCallback(function()
								-- upvalues: var7 (ref)
								var7(true)
							end, {}),
							onNavigateToResolvedTarget = reactModule.useCallback(function(p4)
								-- upvalues: navigation (ref), var3 (ref)
								navigation.setParams({ target = p4 })
								var3.bumpRefreshTick()
							end, { navigation, var3 })
						})
					}),
					Picker = if var6 and var8 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
						universeId = var8,
						onClose = reactModule.useCallback(function()
							-- upvalues: var7 (ref)
							var7(false)
						end, {}),
						onInvitesSent = reactModule.useCallback(function()
							-- upvalues: var7 (ref), navigation (ref), buildOverflowMenuScreensModule (copy), target (ref)
							var7(false)
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
				local var3 = useBuildPageLayoutModule()
				local var4 = useLiveSubagentTaskState(navigation)
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var3.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var3.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var3.shouldIncludeBottomBar
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
							groups = if var4 ~= nil then {} else var4.groups,
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
						testId = "BuildPage.AgentDetailsPage",
						title = subagentTaskGroupName or (if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
							agents = localizationStringsModule.SUBAGENT_STATUS_AGENTS
						}) else nil).agents else localizationStringsModule.SUBAGENT_STATUS_AGENTS),
						onClose = reactModule.useCallback(function()
							-- upvalues: navigation (ref)
							navigation.goBack()
						end, { navigation }),
						content = if var3 ~= nil then reactModule.createElement(view, { tag = "size-full" }) else reactModule.createElement(subagentStatusModule.AgentDetailsList, { testId = "BuildPage.AgentDetailsList", group = var3 }),
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
				local var6 = useBuildPageLayoutModule()
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var6.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var6.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var6.shouldIncludeBottomBar
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
}, { initialRouteName = "BuildHome" }))

return function(p4)
	-- upvalues: useBuildPageEligibilityModule (ref), var1 (ref), reactModule (ref), var2 (ref), buildEligibilityDialogModule (ref), view (ref), loading (ref), iconSize (ref)
	local var6 = useBuildPageEligibilityModule.useBuildPageEligibility(var1)
	
	return if var6.canEnterBuild then reactModule.createElement(var2, { screenProps = p4 or {} }) elseif var6.status == useBuildPageEligibilityModule.Status.Ineligible then reactModule.createElement(buildEligibilityDialogModule, {
		variant = useBuildPageEligibilityModule.Status.Ineligible,
		onDismiss = var6.onDialogDismiss
	}) elseif var6.status == useBuildPageEligibilityModule.Status.Error then reactModule.createElement(buildEligibilityDialogModule, {
		variant = useBuildPageEligibilityModule.Status.Error,
		onDismiss = var6.onDialogDismiss
	}) elseif var6.status == useBuildPageEligibilityModule.Status.Refreshing then reactModule.createElement(view, {
		tag = "col align-x-center align-y-center size-full",
		testId = "BuildPage.EligibilityLoading"
	}, {
		Spinner = reactModule.createElement(loading, { size = iconSize.Large })
	}) else reactModule.createElement(view, {
		tag = "size-full",
		testId = "BuildPage.EligibilityPrompting"
	})
end