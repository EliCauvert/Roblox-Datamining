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

local function _(p0, p1)
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

local var21 = roactNavigationModule.createAppContainer(roactNavigationModule.createRobloxStackNavigator({
	{
		BuildPillMenuLauncher = {
			screen = function(p2)
				-- upvalues: reactModule (ref), buildOverflowMenuScreensModule (ref)
				local navigation = p2.navigation
				local screenProps = p2.screenProps
				reactModule.useEffect(function()
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
			screen = function(p3)
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
						onAgentActivated = reactModule.useCallback(function(p4)
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
			screen = function(p5)
				-- upvalues: buildNavigationParamsModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), subagentStatusModule (ref), view (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
				local var24
				local navigation = p5.navigation
				local var22 = buildNavigationParamsModule.getSubagentTaskState(navigation) or p5.screenProps.subagentTaskState
				local subagentTaskGroupName = buildNavigationParamsModule.getSubagentTaskGroupName(navigation)
				
				if var22 == nil or subagentTaskGroupName == nil then
					var24 = nil
				else
					for i, v in var22.groups do
						if v.name == subagentTaskGroupName then
							var24 = v
						end
					end
					var24 = nil
				end
				return reactModule.createElement(overflowMenuPageShellModule, {
					testId = "BuildPillMenu.AgentDetailsPage",
					title = subagentTaskGroupName or (if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
						agents = localizationStringsModule.SUBAGENT_STATUS_AGENTS
					}) else nil).agents else localizationStringsModule.SUBAGENT_STATUS_AGENTS),
					onClose = reactModule.useCallback(function()
						-- upvalues: navigation (ref)
						navigation.goBack()
					end, { navigation }),
					content = if var24 ~= nil then reactModule.createElement(view, { tag = "size-full" }) else reactModule.createElement(subagentStatusModule.AgentDetailsList, { testId = "BuildPillMenu.AgentDetailsList", group = var24 }),
					closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
					scrollPerformanceIntervalName = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then "LuaApp_Build_AgentDetails_Scroll" else nil
				})
			end
		}
	},
	{
		BuildPillMenuCreatorCredit = {
			screen = function(p6)
				-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), creatorCreditPageContainerModule (ref), overflowMenuPageShellModule (ref), creatorCreditBalanceChipContainerModule (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref)
				local screenProps = p6.screenProps
				
				return reactModule.createElement(overflowMenuPageShellModule, {
					testId = "BuildPillMenu.CreatorCreditPage",
					title = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
						pageTitle = localizationStringsModule.CREATOR_CREDIT_PAGE_TITLE
					}) else nil).pageTitle else localizationStringsModule.CREATOR_CREDIT_PAGE_TITLE,
					onClose = reactModule.useCallback(function()
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
}, { initialRouteName = "BuildPillMenuLauncher" }))

local _ = function(p7)
	return if p7:IsA("ScreenGui") then p7 else p7:FindFirstAncestorOfClass("ScreenGui")
end

local _ = function(p8)
	return if p8 == nil or p8.type ~= "overflow" then nil else p8.page
end

local _ = function(p9)
	-- upvalues: buildOverflowMenuScreensModule (ref)
	return if p9 == nil then nil elseif p9.type == "agents" then "BuildPillMenuAgents" elseif p9.type == "invitePicker" then buildOverflowMenuScreensModule.Screens.BuildPrivateInvitesPicker elseif p9.type == "creator-credit" then "BuildPillMenuCreatorCredit" else nil
end

return reactModule.memo(function(p10)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useOverlay (ref), reactModule (ref), t (ref), buildOverflowMenuScreensModule (ref), creatorAgentChatModule (ref), useSessionSummaryModule (ref), privateInvitesPickerContainerModule (ref), view (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), privateInvitesManagementContainerModule (ref), var21 (ref), reactRobloxModule (ref), buildExperienceCompositionStyleSheetModule (ref), overlayProvider (ref)
	local var25 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
		privateInvitesPageTitle = localizationStringsModule.PRIVATE_INVITES_PAGE_TITLE
	}) else nil).privateInvitesPageTitle else localizationStringsModule.PRIVATE_INVITES_PAGE_TITLE
	local var26 = useOverlay()
	local var27, var28 = reactModule.useState(nil)
	local activePage = p10.activePage
	local var29 = if activePage == nil or activePage.type ~= "overflow" then nil else activePage.page
	local activePage_1 = p10.activePage
	activePage = if activePage_1 == nil then nil elseif activePage_1.type == "agents" then t.BuildAgents elseif activePage_1.type == "invitePicker" then buildOverflowMenuScreensModule.Screens.BuildPrivateInvitesPicker elseif activePage_1.type == "creator-credit" then t.BuildCreatorCredit else nil
	local subagentTaskState = useSessionSummaryModule(reactModule.useMemo(function()
		-- upvalues: creatorAgentChatModule (copy), p10 (ref)
		return creatorAgentChatModule.getCreatorAgentChatStore().getSessionForProject(p10.target.universeId, p10.target.placeId, p10.target.sessionId)
	end, {
		p10.target.universeId,
		p10.target.placeId,
		p10.target.sessionId
	})).subagentTaskState
	local var30 = if var26 ~= nil then nil elseif var26:IsA("ScreenGui") then var26 else var26:FindFirstAncestorOfClass("ScreenGui")
	local var31 = if var30 == nil or var30.Parent == nil then var26 else var30.Parent
	local var32 = if var30 ~= nil then 0 else var30.DisplayOrder
	reactModule.useEffect(function()
		-- upvalues: p10 (ref), var28 (ref)
		if p10.activePage == nil then
			var28(nil)
		end
	end, { p10.activePage })
	
	if p10.activePage == nil or var26 == nil then
		return nil
	end
	local var33 = if p10.activePage.type == "invitePicker" then reactModule.createElement(privateInvitesPickerContainerModule, {
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
				title = var25,
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
			Navigator = reactModule.createElement(var21, {
				screenProps = {
					showPreviewButton = false,
					initialPage = var29,
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
		DisplayOrder = var32,
		ref = var28,
		ScreenInsets = Enum.ScreenInsets.None,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
		Page = if var27 ~= nil then if p10.activePage.type == "invitePicker" then nil else var33 else reactModule.createElement(overlayProvider, { gui = var27 }, { Page = var33 })
	}), var31)
end)