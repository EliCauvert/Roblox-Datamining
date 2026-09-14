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
local fFlagBuildExperienceAnalytics = sharedFlagsModule.FFlagBuildExperienceAnalytics
local fFlagMyStatsMediaSelector = sharedFlagsModule.FFlagMyStatsMediaSelector
local view = foundationModule.View
local overlayProvider = foundationModule.OverlayProvider
local useOverlay = foundationModule.Hooks.useOverlay
local iconName = foundationModule.Enums.IconName
local buildOverflowMenuScreensModule = require(script.Parent.BuildOverflowMenuScreens)
local fFlagBuildExperienceAssetLibraryModule = require(buildExperience.Flags.FFlagBuildExperienceAssetLibrary)
local fFlagBuildExperienceMonetizationNativeUIModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local var1 = if fFlagBuildExperienceAssetLibraryModule then require(buildExperience.Components.AssetLibrary.AssetLibraryScreens) else nil
local privateInvitesPickerContainerModule = require(buildExperience.Components.PrivateInvitesPicker.PrivateInvitesPickerContainer)
local privateInvitesManagementContainerModule = require(buildExperience.Components.GameConfigurations.PrivateInvitesManagement.PrivateInvitesManagementContainer)
local overflowMenuPageShellModule = require(script.Parent.OverflowMenuPageShell)
local buildExperienceCompositionStyleSheetModule = require(buildExperience.Components.BuildExperienceCompositionStyleSheet)
local creatorCreditPageContainerModule = require(buildExperience.Components.CreatorCreditSheet.CreatorCreditPageContainer)
local subagentStatusModule = require(buildExperience.Components.SubagentStatus)
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

local list = {
	{
		BuildPillMenuLauncher = {
			screen = function(p3)
				-- upvalues: reactModule (ref), buildOverflowMenuScreensModule (ref)
				local navigation = p3.navigation
				local screenProps = p3.screenProps
				reactModule.useEffect(function()
					-- upvalues: screenProps (ref), buildOverflowMenuScreensModule (copy), navigation (ref)
					if screenProps.initialPage == nil then
						if screenProps.initialScreen ~= nil then
							navigation.navigate(screenProps.initialScreen, { dismissOnBack = true, target = screenProps.target })
						end
						return
					else
						local initialPage = buildOverflowMenuScreensModule.SCREEN_BY_PAGE[screenProps.initialPage]
						
						if initialPage == nil then
							return
						end
						navigation.navigate(initialPage, { target = screenProps.target })
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
				-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), subagentStatusModule (ref), overflowMenuPageShellModule (ref)
				local navigation = p3.navigation
				local screenProps = p3.screenProps
				local subagentTaskState = screenProps.subagentTaskState
				
				return reactModule.createElement(overflowMenuPageShellModule, {
					scrollPerformanceIntervalName = "LuaApp_Build_Agents_Scroll",
					testId = "BuildPillMenu.AgentsPage",
					title = useLocalization({
						agents = localizationStringsModule.SUBAGENT_STATUS_AGENTS
					}).agents,
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
					})
				})
			end
		}
	},
	{
		BuildPillMenuAgentDetails = {
			screen = function(p3)
				-- upvalues: buildNavigationParamsModule (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), subagentStatusModule (ref), view (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref)
				local var2
				local navigation = p3.navigation
				local var3 = buildNavigationParamsModule.getSubagentTaskState(navigation) or p3.screenProps.subagentTaskState
				local subagentTaskGroupName = buildNavigationParamsModule.getSubagentTaskGroupName(navigation)
				
				if var3 == nil or subagentTaskGroupName == nil then
					var2 = nil
				else
					for i, v in var3.groups do
						if v.name == subagentTaskGroupName then
							var2 = v
						end
					end
					var2 = nil
				end
				return reactModule.createElement(overflowMenuPageShellModule, {
					scrollPerformanceIntervalName = "LuaApp_Build_AgentDetails_Scroll",
					testId = "BuildPillMenu.AgentDetailsPage",
					title = subagentTaskGroupName or useLocalization({
						agents = localizationStringsModule.SUBAGENT_STATUS_AGENTS
					}).agents,
					onClose = reactModule.useCallback(function()
						-- upvalues: navigation (ref)
						navigation.goBack()
					end, { navigation }),
					content = if var2 ~= nil then reactModule.createElement(view, { tag = "size-full" }) else reactModule.createElement(subagentStatusModule.AgentDetailsList, { testId = "BuildPillMenu.AgentDetailsList", group = var2 }),
					closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft
				})
			end
		}
	},
	{
		BuildPillMenuCreatorCredit = {
			screen = function(p4)
				-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), creatorCreditPageContainerModule (ref), overflowMenuPageShellModule (ref), creatorCreditBalanceChipContainerModule (ref)
				local screenProps = p4.screenProps
				
				return reactModule.createElement(overflowMenuPageShellModule, {
					scrollPerformanceIntervalName = "LuaApp_Build_CreatorCredit_Scroll",
					testId = "BuildPillMenu.CreatorCreditPage",
					title = useLocalization({
						pageTitle = localizationStringsModule.CREATOR_CREDIT_PAGE_TITLE
					}).pageTitle,
					onClose = reactModule.useCallback(function()
						-- upvalues: screenProps (ref)
						screenProps.onClose()
					end, { screenProps.onClose }),
					content = reactModule.createElement(creatorCreditPageContainerModule, nil),
					headerTrailing = reactModule.createElement(creatorCreditBalanceChipContainerModule)
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
if fFlagMyStatsMediaSelector then
	table.insert(list, {
		[buildOverflowMenuScreensModule.Screens.BuildMediaSelection] = {
			screen = buildOverflowMenuScreensModule.BuildMediaSelectionScreen
		}
	})
end
if fFlagBuildExperienceAssetLibraryModule then
	table.insert(list, {
		[var1.Screens.Browser] = { screen = var1.BrowserScreen }
	})
	table.insert(list, {
		[var1.Screens.Category] = { screen = var1.CategoryScreen }
	})
	table.insert(list, { [var1.Screens.Detail] = { screen = var1.DetailScreen } })
end
local var4 = roactNavigationModule.createAppContainer(roactNavigationModule.createRobloxStackNavigator(list, { initialRouteName = "BuildPillMenuLauncher" }))

local _ = function(p4)
	return if p4:IsA("ScreenGui") then p4 else p4:FindFirstAncestorOfClass("ScreenGui")
end

local _ = function(p4)
	return if p4 == nil or p4.type ~= "overflow" then nil else p4.page
end

local _ = function(p4)
	-- upvalues: fFlagBuildExperienceAssetLibraryModule (ref), var1 (ref), buildOverflowMenuScreensModule (ref)
	return if p4 == nil then nil elseif p4.type == "agents" then "BuildPillMenuAgents" elseif fFlagBuildExperienceAssetLibraryModule and p4.type == "asset-library" then var1.Screens.Browser elseif p4.type == "invitePicker" then buildOverflowMenuScreensModule.Screens.BuildPrivateInvitesPicker elseif p4.type == "creator-credit" then "BuildPillMenuCreatorCredit" elseif p4.type == "screen" then p4.screen else nil
end

local _ = function(p4)
	return if p4 == nil or p4.type ~= "screen" then nil else p4.target
end

return reactModule.memo(function(p4)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), useOverlay (ref), reactModule (ref), t (ref), fFlagBuildExperienceAssetLibraryModule (ref), var1 (ref), buildOverflowMenuScreensModule (ref), creatorAgentChatModule (ref), useSessionSummaryModule (ref), privateInvitesPickerContainerModule (ref), view (ref), overflowMenuPageShellModule (ref), fFlagBuildBackButtonChevronModule (ref), iconName (ref), privateInvitesManagementContainerModule (ref), var4 (ref), reactRobloxModule (ref), buildExperienceCompositionStyleSheetModule (ref), overlayProvider (ref)
	local privateInvitesPageTitle = useLocalization({
		privateInvitesPageTitle = localizationStringsModule.PRIVATE_INVITES_PAGE_TITLE
	}).privateInvitesPageTitle
	local var5 = useOverlay()
	local var6, var7 = reactModule.useState(nil)
	local activePage = p4.activePage
	local var8 = if activePage == nil or activePage.type ~= "overflow" then nil else activePage.page
	local activePage_1 = p4.activePage
	activePage = if activePage_1 == nil then nil elseif activePage_1.type == "agents" then t.BuildAgents elseif fFlagBuildExperienceAssetLibraryModule and activePage_1.type == "asset-library" then var1.Screens.Browser elseif activePage_1.type == "invitePicker" then buildOverflowMenuScreensModule.Screens.BuildPrivateInvitesPicker elseif activePage_1.type == "creator-credit" then t.BuildCreatorCredit elseif activePage_1.type == "screen" then activePage_1.screen else nil
	local activePage_2 = p4.activePage
	local var9 = if activePage_2 == nil or activePage_2.type ~= "screen" then nil else activePage_2.target
	local subagentTaskState = useSessionSummaryModule(reactModule.useMemo(function()
		-- upvalues: creatorAgentChatModule (copy), p4 (ref)
		return creatorAgentChatModule.getCreatorAgentChatStore().getSessionForProject(p4.target.universeId, p4.target.placeId, p4.target.sessionId)
	end, {
		p4.target.universeId,
		p4.target.placeId,
		p4.target.sessionId
	})).subagentTaskState
	local var10 = if var5 ~= nil then nil elseif var5:IsA("ScreenGui") then var5 else var5:FindFirstAncestorOfClass("ScreenGui")
	local var11 = if var10 == nil or var10.Parent == nil then var5 else var10.Parent
	local var12 = if var10 ~= nil then 0 else var10.DisplayOrder
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), var7 (ref)
		if p4.activePage == nil then
			var7(nil)
		end
	end, { p4.activePage })
	
	if p4.activePage == nil or var5 == nil then
		return nil
	end
	local var13 = if p4.activePage.type == "invitePicker" then reactModule.createElement(privateInvitesPickerContainerModule, {
		universeId = p4.target.universeId,
		onClose = p4.onClose,
		onInvitesSent = p4.onInvitesSent or p4.onClose
	}) elseif p4.activePage.type == "playtestManagement" then reactModule.createElement(view, {
		ZIndex = 10,
		tag = "size-full bg-surface-0",
		testId = "build-pill-menu-playtest-management"
	}, {
		Content = reactModule.createElement(view, { tag = "size-full margin-top-large" }, {
			Management = reactModule.createElement(overflowMenuPageShellModule, {
				testId = "BuildPillMenu.playtestInviteManagement.Page",
				title = privateInvitesPageTitle,
				closeIcon = if fFlagBuildBackButtonChevronModule then nil else iconName.ChevronLargeLeft,
				onClose = p4.onClose,
				content = reactModule.createElement(privateInvitesManagementContainerModule, {
					universeId = p4.target.universeId,
					onOpenInvitePicker = p4.onOpenInvitePicker or p4.onClose
				})
			})
		})
	}) else reactModule.createElement(view, {
		ZIndex = 10,
		tag = "size-full bg-surface-0",
		testId = "build-pill-menu-page-view"
	}, {
		Content = reactModule.createElement(view, { tag = "size-full margin-top-large" }, {
			Navigator = reactModule.createElement(var4, {
				screenProps = {
					showPreviewButton = false,
					isPillMenu = true,
					initialPage = var8,
					initialScreen = activePage,
					target = var9 or p4.target,
					subagentTaskState = subagentTaskState,
					onClose = p4.onClose,
					onOpenChat = p4.onOpenChat
				}
			})
		})
	})
	
	return reactRobloxModule.createPortal(reactModule.createElement("ScreenGui", {
		ClipToDeviceSafeArea = false,
		IgnoreGuiInset = true,
		Name = "BuildExperiencePillMenuPage",
		DisplayOrder = var12,
		ref = var7,
		ScreenInsets = Enum.ScreenInsets.None,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
		Page = if var6 ~= nil then if p4.activePage.type == "invitePicker" then nil else var13 else reactModule.createElement(overlayProvider, { gui = var6 }, { Page = var13 })
	}), var11)
end)