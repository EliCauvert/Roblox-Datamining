local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local sharedFlagsModule = require(parent.SharedFlags)
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
local var26 = not sharedFlagsModule.FFlagEnableBuildTabOverride
local buildEligibilityDialogModule = require(script.Parent.Components.BuildEligibilityDialog)
local useBuildPageEligibilityModule = require(script.Parent.useBuildPageEligibility)
local _ = {
	BuildHome = "BuildHome",
	BuildChat = "BuildChat",
	BuildAgents = "BuildAgents",
	BuildAgentDetails = "BuildAgentDetails",
	BuildCreatorCredit = "BuildCreatorCredit"
}

local function _(p0, p1) --[[ line: 75 | named "findGroup" ]]
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

local function useLiveSubagentTaskState(p2) --[[ line: 89 ]]
	-- upvalues: buildNavigationParamsModule (ref), creatorAgentChatModule (ref), reactModule (ref), useSessionSummaryModule (ref)
	local target = buildNavigationParamsModule.getTarget(p2)
	assert(target ~= nil, "Agent pages require a build target")
	local creatorAgentChatStore = creatorAgentChatModule.getCreatorAgentChatStore()
	
	return useSessionSummaryModule(reactModule.useMemo(function() --[[ line: 93 ]]
		-- upvalues: creatorAgentChatStore (ref), target (ref)
		return creatorAgentChatStore.getSessionForProject(target.universeId, target.placeId, target.sessionId)
	end, {
		creatorAgentChatStore,
		target.universeId,
		target.placeId,
		target.sessionId
	})).subagentTaskState or buildNavigationParamsModule.getSubagentTaskState(p2)
end

local var30 = roactNavigationModule.createAppContainer(roactNavigationModule.createRobloxStackNavigator({
	{
		BuildHome = {
			screen = function(p3) --[[ line: 101 ]]
				-- upvalues: useBuildPageLayoutModule (ref), useNavigationFocus (ref), reactModule (ref), resumeBuildChatModule (ref), fullscreenPageWithSafeArea (ref), view (ref), buildPageHeaderModule (ref), buildSearchBarModule (ref), myCreationsTabModule (ref)
				local screenProps = p3.screenProps or {}
				local navigation = p3.navigation
				local var34 = useBuildPageLayoutModule()
				local var35 = useNavigationFocus()
				local tokens = var34.tokens
				local var36 = reactModule.useCallback(function(p4) --[[ line: 108 ]]
					-- upvalues: navigation (ref)
					navigation.navigate("BuildChat", { target = p4 })
				end, { navigation })
				reactModule.useEffect(function() --[[ line: 115 ]]
					-- upvalues: resumeBuildChatModule (copy), screenProps (ref), var36 (ref)
					return resumeBuildChatModule({
						universeId = screenProps.universeId,
						sessionId = screenProps.sessionId,
						creatorAgentChatStore = screenProps.creatorAgentChatStore,
						configurationStore = screenProps.configurationStore,
						onOpenChat = var36
					})
				end, {
					var36, screenProps.universeId, screenProps.sessionId,
					screenProps.resumeRequestId, screenProps.creatorAgentChatStore,
					screenProps.configurationStore
				})
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var34.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(view, { tag = "col align-x-center size-full bg-surface-0" }, {
						Header = reactModule.createElement(buildPageHeaderModule, { LayoutOrder = 1, height = var34.topBarHeight }),
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
								isFocused = var35,
								autoOpenNewGame = screenProps.universeId == nil and screenProps.sessionId == nil,
								onOpenChat = var36
							})
						})
					})
				})
			end
		}
	},
	{
		BuildChat = {
			screen = function(p5) --[[ line: 176 ]]
				-- upvalues: buildNavigationParamsModule (ref), getBuildExperienceRefreshStoreModule (ref), useBuildPageLayoutModule (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), buildOverflowMenuScreensModule (ref), buildChatPageModule (ref), fullscreenPageWithSafeArea (ref), privateInvitesPickerHostModule (ref)
				local navigation = p5.navigation
				local target = buildNavigationParamsModule.getTarget(navigation)
				local var38 = getBuildExperienceRefreshStoreModule()
				local var39 = useBuildPageLayoutModule()
				local var40 = useOnScreenKeyboardVisibleModule()
				local var41, var42 = reactModule.useState(false)
				local var43 = if target ~= nil then nil else target.universeId
				
				return reactModule.createElement(reactModule.Fragment, nil, {
					Page = reactModule.createElement(fullscreenPageWithSafeArea, {
						includeStatusBar = true,
						BackgroundColor3 = var39.tokens.Color.Surface.Surface_0.Color3,
						BackgroundTransparency = var39.tokens.Color.Surface.Surface_0.Transparency,
						includeBottomBar = var39.shouldIncludeBottomBar and not var40
					}, {
						Page = if target ~= nil then nil else reactModule.createElement(buildChatPageModule, {
							target = target,
							onClose = reactModule.useCallback(function() --[[ line: 184 ]]
								-- upvalues: navigation (ref)
								navigation.goBack()
							end, { navigation }),
							onOpenAgentsPage = reactModule.useCallback(function() --[[ line: 210 ]]
								-- upvalues: navigation (ref), target (ref)
								navigation.navigate("BuildAgents", { target = target })
							end, { navigation, target }),
							onOpenCreatorCreditPage = reactModule.useCallback(function() --[[ line: 215 ]]
								-- upvalues: navigation (ref), target (ref)
								navigation.navigate("BuildCreatorCredit", { target = target })
							end, { navigation, target }),
							onOpenConfigurationPage = reactModule.useCallback(function(p6) --[[ line: 188 ]]
								-- upvalues: navigation (ref), buildOverflowMenuScreensModule (copy), target (ref)
								navigation.navigate(buildOverflowMenuScreensModule.SCREEN_BY_PAGE[p6], { target = target })
							end, { navigation, target }),
							onOpenInvitePicker = reactModule.useCallback(function() --[[ line: 196 ]]
								-- upvalues: var42 (ref)
								var42(true)
							end, {}),
							onNavigateToResolvedTarget = reactModule.useCallback(function(p7) --[[ line: 220 ]]
								-- upvalues: navigation (ref), var38 (ref)
								navigation.setParams({ target = p7 })
								var38.bumpRefreshTick()
							end, { navigation, var38 })
						})
					}),
					Picker = if var41 and var43 ~= nil then reactModule.createElement(privateInvitesPickerHostModule, {
						universeId = var43,
						onClose = reactModule.useCallback(function() --[[ line: 199 ]]
							-- upvalues: var42 (ref)
							var42(false)
						end, {}),
						onInvitesSent = reactModule.useCallback(function() --[[ line: 204 ]]
							-- upvalues: var42 (ref), navigation (ref), buildOverflowMenuScreensModule (copy), target (ref)
							var42(false)
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
			screen = function(p8) --[[ line: 262 ]]
				-- upvalues: useBuildPageLayoutModule (ref), useLiveSubagentTaskState (ref), reactModule (ref), buildNavigationParamsModule (ref), subagentStatusModule (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), localizationStringsModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
				local navigation = p8.navigation
				local var44 = useBuildPageLayoutModule()
				local var45 = useLiveSubagentTaskState(navigation)
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var44.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var44.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var44.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(overflowMenuPageShellModule, {
						testId = "BuildPage.AgentsPage",
						title = localizationStringsModule.SUBAGENT_STATUS_AGENTS,
						onClose = reactModule.useCallback(function() --[[ line: 267 ]]
							-- upvalues: navigation (ref)
							navigation.goBack()
						end, { navigation }),
						content = reactModule.createElement(subagentStatusModule.AgentsList, {
							testId = "BuildPage.AgentsList",
							groups = if var45 ~= nil then {} else var45.groups,
							onAgentActivated = reactModule.useCallback(function(p9) --[[ line: 270 ]]
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
			screen = function(p10) --[[ line: 302 ]]
				-- upvalues: useBuildPageLayoutModule (ref), useLiveSubagentTaskState (ref), buildNavigationParamsModule (ref), reactModule (ref), subagentStatusModule (ref), view (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), localizationStringsModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
				local var49
				local navigation = p10.navigation
				local var46 = useBuildPageLayoutModule()
				local var47 = useLiveSubagentTaskState(navigation)
				local subagentTaskGroupName = buildNavigationParamsModule.getSubagentTaskGroupName(navigation)
				
				if var47 == nil or subagentTaskGroupName == nil then
					var49 = nil
				else
					for i, v in var47.groups do
						if v.name == subagentTaskGroupName then
							var49 = v
						end
					end
					var49 = nil
				end
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var46.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var46.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var46.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(overflowMenuPageShellModule, {
						testId = "BuildPage.AgentDetailsPage",
						title = subagentTaskGroupName or localizationStringsModule.SUBAGENT_STATUS_AGENTS,
						onClose = reactModule.useCallback(function() --[[ line: 309 ]]
							-- upvalues: navigation (ref)
							navigation.goBack()
						end, { navigation }),
						content = if var49 ~= nil then reactModule.createElement(view, { tag = "size-full" }) else reactModule.createElement(subagentStatusModule.AgentDetailsList, { testId = "BuildPage.AgentDetailsList", group = var49 }),
						closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
						scrollPerformanceIntervalName = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then "LuaApp_Build_AgentDetails_Scroll" else nil
					})
				})
			end
		}
	},
	{
		BuildCreatorCredit = {
			screen = function(p11) --[[ line: 341 ]]
				-- upvalues: useBuildPageLayoutModule (ref), reactModule (ref), creatorCreditPageContainerModule (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), localizationStringsModule (ref), creatorCreditBalanceChipContainerModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
				local navigation = p11.navigation
				local var50 = useBuildPageLayoutModule()
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var50.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var50.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var50.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(overflowMenuPageShellModule, {
						testId = "BuildPage.CreatorCreditPage",
						title = localizationStringsModule.CREATOR_CREDIT_PAGE_TITLE,
						onClose = reactModule.useCallback(function() --[[ line: 345 ]]
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

return function(p12) --[[ line: 441 | named "BuildPage" ]]
	-- upvalues: useBuildPageEligibilityModule (ref), var26 (ref), reactModule (ref), var30 (ref), buildEligibilityDialogModule (ref), view (ref), loading (ref), iconSize (ref)
	local var51 = useBuildPageEligibilityModule.useBuildPageEligibility(var26)
	
	return if var51.canEnterBuild then reactModule.createElement(var30, { screenProps = p12 or {} }) elseif var51.status == useBuildPageEligibilityModule.Status.Ineligible then reactModule.createElement(buildEligibilityDialogModule, {
		variant = useBuildPageEligibilityModule.Status.Ineligible,
		onDismiss = var51.onDialogDismiss
	}) elseif var51.status == useBuildPageEligibilityModule.Status.Error then reactModule.createElement(buildEligibilityDialogModule, {
		variant = useBuildPageEligibilityModule.Status.Error,
		onDismiss = var51.onDialogDismiss
	}) elseif var51.status == useBuildPageEligibilityModule.Status.Refreshing then reactModule.createElement(view, {
		tag = "col align-x-center align-y-center size-full",
		testId = "BuildPage.EligibilityLoading"
	}, {
		Spinner = reactModule.createElement(loading, { size = iconSize.Large })
	}) else reactModule.createElement(view, {
		tag = "size-full",
		testId = "BuildPage.EligibilityPrompting"
	})
end