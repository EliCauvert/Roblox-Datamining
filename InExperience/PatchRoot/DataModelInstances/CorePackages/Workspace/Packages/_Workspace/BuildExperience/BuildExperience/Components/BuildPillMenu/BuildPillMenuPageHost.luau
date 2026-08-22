local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local roactNavigationModule = require(parent.RoactNavigation)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local view = foundationModule.View
local overlayProvider = foundationModule.OverlayProvider
local useOverlay = foundationModule.Hooks.useOverlay
local iconName = foundationModule.Enums.IconName
local buildOverflowMenuScreensModule = require(script.Parent.BuildOverflowMenuScreens)
local fFlagBuildExperienceAssetLibraryModule = require(buildExperience.Flags.FFlagBuildExperienceAssetLibrary)
local var10 = if fFlagBuildExperienceAssetLibraryModule then require(buildExperience.Components.AssetLibrary.AssetLibraryScreens) else nil
local privateInvitesPickerContainerModule = require(buildExperience.Components.PrivateInvitesPicker.PrivateInvitesPickerContainer)
local privateInvitesManagementContainerModule = require(buildExperience.Components.GameConfigurations.PrivateInvitesManagement.PrivateInvitesManagementContainer)
local overflowMenuPageShellModule = require(script.Parent.OverflowMenuPageShell)
local buildExperienceCompositionStyleSheetModule = require(buildExperience.Components.BuildExperienceCompositionStyleSheet)
local creatorCreditPageContainerModule = require(buildExperience.Components.CreatorCreditSheet.CreatorCreditPageContainer)
local subagentStatusModule = require(buildExperience.Components.SubagentStatus)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(buildExperience.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local fFlagBuildBackButtonChevronModule = require(buildExperience.Flags.FFlagBuildBackButtonChevron)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local buildNavigationParamsModule = require(buildExperience.utils.BuildNavigationParams)
local useSessionSummaryModule = require(buildExperience.Chat.useSessionSummary)
local creatorCreditBalanceChipContainerModule = require(buildExperience.Components.CreatorCreditSheet.CreatorCreditBalanceChip.CreatorCreditBalanceChipContainer)
local t = {
	Launcher = "BuildPillMenuLauncher",
	BuildAgents = "BuildPillMenuAgents",
	BuildAgentDetails = "BuildPillMenuAgentDetails",
	BuildCreatorCredit = "BuildPillMenuCreatorCredit"
}

local function _(p0, p1) --[[ line: 90 | named "findGroup" ]]
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

local list = {
	{
		BuildPillMenuLauncher = {
			screen = function(p2) --[[ line: 104 ]]
				-- upvalues: reactModule (ref), buildOverflowMenuScreensModule (ref)
				local navigation = p2.navigation
				local screenProps = p2.screenProps
				reactModule.useEffect(function() --[[ line: 108 ]]
					-- upvalues: screenProps (ref), navigation (ref), buildOverflowMenuScreensModule (copy)
					if screenProps.initialPage ~= nil then
						navigation.navigate(buildOverflowMenuScreensModule.SCREEN_BY_PAGE[screenProps.initialPage], { target = screenProps.target })
						
						return
					elseif screenProps.initialScreen ~= nil then
						navigation.navigate(screenProps.initialScreen, { target = screenProps.target })
					end
				end, {
					navigation,
					screenProps.initialPage,
					screenProps.initialScreen,
					screenProps.target
				})
				
				return nil
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
		[buildOverflowMenuScreensModule.Screens.BuildPrivateInvitesPicker] = {
			screen = buildOverflowMenuScreensModule.BuildPrivateInvitesPickerScreen
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
		BuildPillMenuAgents = {
			screen = function(p3) --[[ line: 123 ]]
				-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), subagentStatusModule (ref), overflowMenuPageShellModule (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
				local navigation = p3.navigation
				local screenProps = p3.screenProps
				local subagentTaskState = screenProps.subagentTaskState
				
				return reactModule.createElement(overflowMenuPageShellModule, {
					testId = "BuildPillMenu.AgentsPage",
					title = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
						agents = localizationStringsModule.SUBAGENT_STATUS_AGENTS
					}) else nil).agents else localizationStringsModule.SUBAGENT_STATUS_AGENTS,
					onClose = screenProps.onClose,
					content = reactModule.createElement(subagentStatusModule.AgentsList, {
						testId = "BuildPillMenu.AgentsList",
						groups = if subagentTaskState ~= nil then {} else subagentTaskState.groups,
						onAgentActivated = reactModule.useCallback(function(p4) --[[ line: 136 ]]
							-- upvalues: navigation (ref), screenProps (ref)
							navigation.navigate("BuildPillMenuAgentDetails", {
								target = screenProps.target,
								subagentTaskGroupName = p4.name
							})
						end, { navigation, screenProps.target })
					}),
					scrollPerformanceIntervalName = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then "LuaApp_Build_Agents_Scroll" else nil
				})
			end
		}
	},
	{
		BuildPillMenuAgentDetails = {
			screen = function(p5) --[[ line: 160 ]]
				-- upvalues: buildNavigationParamsModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), subagentStatusModule (ref), view (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
				local var27
				local navigation = p5.navigation
				local var25 = buildNavigationParamsModule.getSubagentTaskState(navigation) or p5.screenProps.subagentTaskState
				local subagentTaskGroupName = buildNavigationParamsModule.getSubagentTaskGroupName(navigation)
				
				if var25 == nil or subagentTaskGroupName == nil then
					var27 = nil
				else
					for i, v in var25.groups do
						if v.name == subagentTaskGroupName then
							var27 = v
						end
					end
					var27 = nil
				end
				return reactModule.createElement(overflowMenuPageShellModule, {
					testId = "BuildPillMenu.AgentDetailsPage",
					title = subagentTaskGroupName or (if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
						agents = localizationStringsModule.SUBAGENT_STATUS_AGENTS
					}) else nil).agents else localizationStringsModule.SUBAGENT_STATUS_AGENTS),
					onClose = reactModule.useCallback(function() --[[ line: 175 ]]
						-- upvalues: navigation (ref)
						navigation.goBack()
					end, { navigation }),
					content = if var27 ~= nil then reactModule.createElement(view, { tag = "size-full" }) else reactModule.createElement(subagentStatusModule.AgentDetailsList, { testId = "BuildPillMenu.AgentDetailsList", group = var27 }),
					closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
					scrollPerformanceIntervalName = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then "LuaApp_Build_AgentDetails_Scroll" else nil
				})
			end
		}
	},
	{
		BuildPillMenuCreatorCredit = {
			screen = function(p6) --[[ line: 200 ]]
				-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), creatorCreditPageContainerModule (ref), overflowMenuPageShellModule (ref), creatorCreditBalanceChipContainerModule (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
				local screenProps = p6.screenProps
				
				return reactModule.createElement(overflowMenuPageShellModule, {
					testId = "BuildPillMenu.CreatorCreditPage",
					title = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
						pageTitle = localizationStringsModule.CREATOR_CREDIT_PAGE_TITLE
					}) else nil).pageTitle else localizationStringsModule.CREATOR_CREDIT_PAGE_TITLE,
					onClose = reactModule.useCallback(function() --[[ line: 211 ]]
						-- upvalues: screenProps (ref)
						screenProps.onClose()
					end, { screenProps.onClose }),
					content = reactModule.createElement(creatorCreditPageContainerModule, nil),
					headerTrailing = reactModule.createElement(creatorCreditBalanceChipContainerModule),
					scrollPerformanceIntervalName = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then "LuaApp_Build_CreatorCredit_Scroll" else nil
				})
			end
		}
	}
}

if fFlagBuildExperienceAssetLibraryModule then
	table.insert(list, {
		[var10.Screens.Browser] = { screen = var10.BrowserScreen }
	})
	table.insert(list, {
		[var10.Screens.Category] = { screen = var10.CategoryScreen }
	})
	table.insert(list, { [var10.Screens.Detail] = { screen = var10.DetailScreen } })
end
local var24 = roactNavigationModule.createAppContainer(roactNavigationModule.createRobloxStackNavigator(list, { initialRouteName = "BuildPillMenuLauncher" }))

local _ = function(p7) --[[ line: 309 | named "getOverlayScreenGui" ]]
	return if p7:IsA("ScreenGui") then p7 else p7:FindFirstAncestorOfClass("ScreenGui")
end

local _ = function(p8) --[[ line: 317 | named "getInitialPage" ]]
	return if p8 == nil or p8.type ~= "overflow" then nil else p8.page
end

local _ = function(p9) --[[ line: 321 | named "getInitialScreen" ]]
	-- upvalues: fFlagBuildExperienceAssetLibraryModule (ref), var10 (ref), buildOverflowMenuScreensModule (ref)
	return if p9 == nil then nil elseif p9.type == "agents" then "BuildPillMenuAgents" elseif fFlagBuildExperienceAssetLibraryModule and p9.type == "asset-library" then var10.Screens.Browser elseif p9.type == "invitePicker" then buildOverflowMenuScreensModule.Screens.BuildPrivateInvitesPicker elseif p9.type == "creator-credit" then "BuildPillMenuCreatorCredit" else nil
end

return reactModule.memo(function(p10) --[[ line: 340 | named "BuildPillMenuPageHost" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useOverlay (ref), reactModule (ref), t (ref), fFlagBuildExperienceAssetLibraryModule (ref), var10 (ref), buildOverflowMenuScreensModule (ref), creatorAgentChatModule (ref), useSessionSummaryModule (ref), privateInvitesPickerContainerModule (ref), view (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), privateInvitesManagementContainerModule (ref), var24 (ref), reactRobloxModule (ref), buildExperienceCompositionStyleSheetModule (ref), overlayProvider (ref)
	local var28 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
		privateInvitesPageTitle = localizationStringsModule.PRIVATE_INVITES_PAGE_TITLE
	}) else nil).privateInvitesPageTitle else localizationStringsModule.PRIVATE_INVITES_PAGE_TITLE
	local var29 = useOverlay()
	local var30, var31 = reactModule.useState(nil)
	local activePage = p10.activePage
	local var32 = if activePage == nil or activePage.type ~= "overflow" then nil else activePage.page
	local activePage_1 = p10.activePage
	activePage = if activePage_1 == nil then nil elseif activePage_1.type == "agents" then t.BuildAgents elseif fFlagBuildExperienceAssetLibraryModule and activePage_1.type == "asset-library" then var10.Screens.Browser elseif activePage_1.type == "invitePicker" then buildOverflowMenuScreensModule.Screens.BuildPrivateInvitesPicker elseif activePage_1.type == "creator-credit" then t.BuildCreatorCredit else nil
	local subagentTaskState = useSessionSummaryModule(reactModule.useMemo(function() --[[ line: 353 ]]
		-- upvalues: creatorAgentChatModule (copy), p10 (ref)
		return creatorAgentChatModule.getCreatorAgentChatStore().getSessionForProject(p10.target.universeId, p10.target.placeId, p10.target.sessionId)
	end, {
		p10.target.universeId,
		p10.target.placeId,
		p10.target.sessionId
	})).subagentTaskState
	local var33 = if var29 ~= nil then nil elseif var29:IsA("ScreenGui") then var29 else var29:FindFirstAncestorOfClass("ScreenGui")
	local var34 = if var33 == nil or var33.Parent == nil then var29 else var33.Parent
	local var35 = if var33 ~= nil then 0 else var33.DisplayOrder
	reactModule.useEffect(function() --[[ line: 364 ]]
		-- upvalues: p10 (ref), var31 (ref)
		if p10.activePage == nil then
			var31(nil)
		end
	end, { p10.activePage })
	
	if p10.activePage == nil or var29 == nil then
		return nil
	end
	local var36 = if p10.activePage.type == "invitePicker" then reactModule.createElement(privateInvitesPickerContainerModule, {
		universeId = p10.target.universeId,
		onClose = p10.onClose,
		onInvitesSent = p10.onInvitesSent or p10.onClose
	}) elseif p10.activePage.type == "playtestManagement" then reactModule.createElement(view, {
		ZIndex = 10,
		tag = "size-full bg-surface-0",
		testId = "build-pill-menu-playtest-management"
	}, {
		Content = reactModule.createElement(view, { tag = "size-full margin-top-large" }, {
			Management = reactModule.createElement(overflowMenuPageShellModule, {
				testId = "BuildPillMenu.playtestInviteManagement.Page",
				title = var28,
				closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
				onClose = p10.onClose,
				content = reactModule.createElement(privateInvitesManagementContainerModule, {
					universeId = p10.target.universeId,
					onOpenInvitePicker = p10.onOpenInvitePicker or p10.onClose
				})
			})
		})
	}) else reactModule.createElement(view, {
		ZIndex = 10,
		tag = "size-full bg-surface-0",
		testId = "build-pill-menu-page-view"
	}, {
		Content = reactModule.createElement(view, { tag = "size-full margin-top-large" }, {
			Navigator = reactModule.createElement(var24, {
				screenProps = {
					showPreviewButton = false,
					isPillMenu = true,
					initialPage = var32,
					initialScreen = activePage,
					target = p10.target,
					subagentTaskState = subagentTaskState,
					onClose = p10.onClose
				}
			})
		})
	})
	
	return reactRobloxModule.createPortal(reactModule.createElement("ScreenGui", {
		ClipToDeviceSafeArea = false,
		IgnoreGuiInset = true,
		Name = "BuildExperiencePillMenuPage",
		DisplayOrder = var35,
		ref = var31,
		ScreenInsets = Enum.ScreenInsets.None,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
		Page = if var30 ~= nil then if p10.activePage.type == "invitePicker" then nil else var36 else reactModule.createElement(overlayProvider, { gui = var30 }, { Page = var36 })
	}), var34)
end)