local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local SignalsReactModule = require(Parent.SignalsReact)
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local RoactNavigationModule = require(Parent.RoactNavigation)
local SharedFlagsModule = require(Parent.SharedFlags)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperienceAnalytics = SharedFlagsModule.FFlagBuildExperienceAnalytics
local FFlagMyStatsMediaSelector = SharedFlagsModule.FFlagMyStatsMediaSelector
local View = FoundationModule.View
local OverlayProvider = FoundationModule.OverlayProvider
local UseOverlayFunction = FoundationModule.Hooks.useOverlay
local BuildOverflowMenuScreensModule = require(script.Parent.BuildOverflowMenuScreens)
local FFlagBuildExperienceModelPickerModule = require(BuildExperience.Flags.FFlagBuildExperienceModelPicker)
local PrivateInvitesPickerContainerModule = require(BuildExperience.Components.PrivateInvitesPicker.PrivateInvitesPickerContainer)
local PrivateInvitesManagementContainerModule = require(BuildExperience.Components.GameConfigurations.PrivateInvitesManagement.PrivateInvitesManagementContainer)
local OverflowMenuPageShellModule = require(script.Parent.OverflowMenuPageShell)
local BuildExperienceCompositionStyleSheetModule = require(BuildExperience.Components.BuildExperienceCompositionStyleSheet)
local CreatorCreditPageContainerModule = require(BuildExperience.Components.CreatorCreditSheet.CreatorCreditPageContainer)
local SubagentStatusModule = require(BuildExperience.Components.SubagentStatus)
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local BuildNavigationParamsModule = require(BuildExperience.utils.BuildNavigationParams)
local UseSessionSummaryModule = require(BuildExperience.Chat.useSessionSummary)
local CreatorCreditBalanceChipContainerModule = require(BuildExperience.Components.CreatorCreditSheet.CreatorCreditBalanceChip.CreatorCreditBalanceChipContainer)
local config = {
	Launcher = "BuildPillMenuLauncher",
	BuildAgents = "BuildPillMenuAgents",
	BuildAgentDetails = "BuildPillMenuAgentDetails",
	BuildCreatorCredit = "BuildPillMenuCreatorCredit"
}

local function _(p1, Name)
	if p1 == nil or Name == nil then
		return nil
	end
	for _, group in p1.groups do
		if group.name == Name then
			return group
		end
	end
	return nil
end

local List = {
	{
		BuildPillMenuLauncher = {
			screen = function(p2)
				-- upvalues: ReactModule (copy), BuildOverflowMenuScreensModule (copy)
				local Navigation = p2.navigation
				local ScreenProps = p2.screenProps
				ReactModule.useEffect(function()
					-- upvalues: ScreenProps (copy), BuildOverflowMenuScreensModule (upval), Navigation (copy)
					if ScreenProps.initialPage ~= nil then
						local SCREENBYPAGEEntry = BuildOverflowMenuScreensModule.SCREEN_BY_PAGE[ScreenProps.initialPage]
						
						if SCREENBYPAGEEntry ~= nil then
							Navigation.navigate(SCREENBYPAGEEntry, { target = ScreenProps.target })
							
							return
						end
						return
					elseif ScreenProps.initialScreen ~= nil then
						Navigation.navigate(ScreenProps.initialScreen, { dismissOnBack = true, target = ScreenProps.target })
					end
				end, {
					Navigation,
					ScreenProps.initialPage,
					ScreenProps.initialScreen,
					ScreenProps.target
				})
				
				return nil
			end
		}
	},
	{
		[BuildOverflowMenuScreensModule.Screens.BuildPublish] = {
			screen = BuildOverflowMenuScreensModule.BuildPublishScreen
		}
	},
	{
		[BuildOverflowMenuScreensModule.Screens.BuildSettings] = {
			screen = BuildOverflowMenuScreensModule.BuildSettingsScreen
		}
	},
	{
		[BuildOverflowMenuScreensModule.Screens.BuildAudience] = {
			screen = BuildOverflowMenuScreensModule.BuildAudienceScreen
		}
	},
	{
		[BuildOverflowMenuScreensModule.Screens.BuildPrivateInvitesPicker] = {
			screen = BuildOverflowMenuScreensModule.BuildPrivateInvitesPickerScreen
		}
	},
	{
		[BuildOverflowMenuScreensModule.Screens.BuildPlaytestInviteManagement] = {
			screen = BuildOverflowMenuScreensModule.BuildPlaytestInviteManagementScreen
		}
	},
	{
		[BuildOverflowMenuScreensModule.Screens.BuildTitleDescription] = {
			screen = BuildOverflowMenuScreensModule.BuildTitleDescriptionScreen
		}
	},
	{
		[BuildOverflowMenuScreensModule.Screens.BuildVersionTitleDescription] = {
			screen = BuildOverflowMenuScreensModule.BuildVersionTitleDescriptionScreen
		}
	},
	{
		BuildPillMenuAgents = {
			screen = function(p2)
				-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), SubagentStatusModule (copy), OverflowMenuPageShellModule (copy)
				local Navigation = p2.navigation
				local ScreenProps = p2.screenProps
				local SubagentTaskState = ScreenProps.subagentTaskState
				
				return ReactModule.createElement(OverflowMenuPageShellModule, {
					scrollPerformanceIntervalName = "LuaApp_Build_Agents_Scroll",
					testId = "BuildPillMenu.AgentsPage",
					title = UseLocalizationFunction({
						agents = LocalizationStringsModule.SUBAGENT_STATUS_AGENTS
					}).agents,
					onClose = ScreenProps.onClose,
					content = ReactModule.createElement(SubagentStatusModule.AgentsList, {
						testId = "BuildPillMenu.AgentsList",
						groups = if SubagentTaskState == nil then {} else SubagentTaskState.groups,
						onAgentActivated = ReactModule.useCallback(function(p3)
							-- upvalues: Navigation (copy), ScreenProps (copy)
							Navigation.navigate("BuildPillMenuAgentDetails", {
								target = ScreenProps.target,
								subagentTaskGroupName = p3.name
							})
						end, { Navigation, ScreenProps.target })
					})
				})
			end
		}
	},
	{
		BuildPillMenuAgentDetails = {
			screen = function(p2)
				-- upvalues: BuildNavigationParamsModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), SubagentStatusModule (copy), View (copy), OverflowMenuPageShellModule (copy)
				local Navigation = p2.navigation
				local ScreenProps = p2.screenProps
				local SubagentTaskState = BuildNavigationParamsModule.getSubagentTaskState(Navigation) or ScreenProps.subagentTaskState
				local SubagentTaskGroupName = BuildNavigationParamsModule.getSubagentTaskGroupName(Navigation)
				local Group = nil
				
				if SubagentTaskState == nil or SubagentTaskGroupName == nil then
					Group = nil
				else
					Group = nil
					
					for _, group in SubagentTaskState.groups do
						if group.name == SubagentTaskGroupName then
							Group = group
							break
						end
					end
				end
				local Agents = UseLocalizationFunction({
					agents = LocalizationStringsModule.SUBAGENT_STATUS_AGENTS
				}).agents
				
				return ReactModule.createElement(OverflowMenuPageShellModule, {
					scrollPerformanceIntervalName = "LuaApp_Build_AgentDetails_Scroll",
					testId = "BuildPillMenu.AgentDetailsPage",
					title = SubagentTaskGroupName or Agents,
					onClose = ReactModule.useCallback(function()
						-- upvalues: Navigation (copy)
						Navigation.goBack()
					end, { Navigation }),
					content = if Group == nil then ReactModule.createElement(View, { tag = "size-full" }) else ReactModule.createElement(SubagentStatusModule.AgentDetailsList, { testId = "BuildPillMenu.AgentDetailsList", group = Group })
				})
			end
		}
	},
	{
		BuildPillMenuCreatorCredit = {
			screen = function(p3)
				-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), CreatorCreditPageContainerModule (copy), OverflowMenuPageShellModule (copy), CreatorCreditBalanceChipContainerModule (copy)
				local ScreenProps = p3.screenProps
				
				return ReactModule.createElement(OverflowMenuPageShellModule, {
					scrollPerformanceIntervalName = "LuaApp_Build_CreatorCredit_Scroll",
					testId = "BuildPillMenu.CreatorCreditPage",
					title = UseLocalizationFunction({
						pageTitle = LocalizationStringsModule.CREATOR_CREDIT_PAGE_TITLE
					}).pageTitle,
					onClose = ReactModule.useCallback(function()
						-- upvalues: ScreenProps (copy)
						ScreenProps.onClose()
					end, { ScreenProps.onClose }),
					content = ReactModule.createElement(CreatorCreditPageContainerModule, nil),
					headerTrailing = ReactModule.createElement(CreatorCreditBalanceChipContainerModule)
				})
			end
		}
	}
}

if require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI) then
	table.insert(List, {
		[BuildOverflowMenuScreensModule.Screens.BuildMonetization] = {
			screen = BuildOverflowMenuScreensModule.BuildMonetizationScreen
		}
	})
end
if FFlagBuildExperienceAnalytics then
	table.insert(List, {
		[BuildOverflowMenuScreensModule.Screens.BuildStats] = { screen = BuildOverflowMenuScreensModule.BuildStatsScreen }
	})
end
if FFlagMyStatsMediaSelector then
	table.insert(List, {
		[BuildOverflowMenuScreensModule.Screens.BuildMediaSelection] = {
			screen = BuildOverflowMenuScreensModule.BuildMediaSelectionScreen
		}
	})
end
local AppContainer = RoactNavigationModule.createAppContainer(RoactNavigationModule.createRobloxStackNavigator(List, { initialRouteName = "BuildPillMenuLauncher" }))

local _ = function(ScreenGui)
	return if ScreenGui:IsA("ScreenGui") then ScreenGui else ScreenGui:FindFirstAncestorOfClass("ScreenGui")
end

local _ = function(p3)
	return if p3 == nil or p3.type ~= "overflow" then nil else p3.page
end

local _ = function(p3)
	-- upvalues: BuildOverflowMenuScreensModule (copy)
	return if p3 == nil then nil elseif p3.type == "agents" then "BuildPillMenuAgents" elseif p3.type == "invitePicker" then BuildOverflowMenuScreensModule.Screens.BuildPrivateInvitesPicker elseif p3.type == "creator-credit" then "BuildPillMenuCreatorCredit" elseif p3.type == "screen" then p3.screen else nil
end

local _ = function(p3)
	return if p3 == nil or p3.type ~= "screen" then nil else p3.target
end

return ReactModule.memo(function(p3)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseOverlayFunction (copy), ReactModule (copy), config (copy), BuildOverflowMenuScreensModule (copy), FFlagBuildExperienceModelPickerModule (copy), SignalsReactModule (copy), LocalUserIdStore (copy), CreatorAgentChatModule (copy), UseSessionSummaryModule (copy), PrivateInvitesPickerContainerModule (copy), View (copy), OverflowMenuPageShellModule (copy), PrivateInvitesManagementContainerModule (copy), AppContainer (copy), ReactRobloxModule (copy), BuildExperienceCompositionStyleSheetModule (copy), OverlayProvider (copy)
	local PrivateInvitesPageTitle = UseLocalizationFunction({
		privateInvitesPageTitle = LocalizationStringsModule.PRIVATE_INVITES_PAGE_TITLE
	}).privateInvitesPageTitle
	local UseOverlayResult = UseOverlayFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local ActivePage = p3.activePage
	local Page = if ActivePage == nil or ActivePage.type ~= "overflow" then nil else ActivePage.page
	local ActivePage1 = p3.activePage
	local BuildAgents = if ActivePage1 == nil then nil elseif ActivePage1.type == "agents" then config.BuildAgents elseif ActivePage1.type == "invitePicker" then BuildOverflowMenuScreensModule.Screens.BuildPrivateInvitesPicker elseif ActivePage1.type == "creator-credit" then config.BuildCreatorCredit elseif ActivePage1.type == "screen" then ActivePage1.screen else nil
	local ActivePage2 = p3.activePage
	local Target = if ActivePage2 == nil or ActivePage2.type ~= "screen" then nil else ActivePage2.target
	local SubagentTaskState = UseSessionSummaryModule((ReactModule.useMemo(function()
		-- upvalues: CreatorAgentChatModule (upval), p3 (copy)
		return CreatorAgentChatModule.getCreatorAgentChatStore().getSessionForProject(p3.target.universeId, p3.target.placeId, p3.target.sessionId)
	end, {
		p3.target.universeId,
		p3.target.placeId,
		p3.target.sessionId,
		if FFlagBuildExperienceModelPickerModule then SignalsReactModule.useSignalState(LocalUserIdStore.getCurrentUserId) else nil
	}))).subagentTaskState
	local UseOverlayResult1 = if UseOverlayResult == nil then nil elseif UseOverlayResult:IsA("ScreenGui") then UseOverlayResult else UseOverlayResult:FindFirstAncestorOfClass("ScreenGui")
	local UseOverlayResult2 = if UseOverlayResult1 == nil or UseOverlayResult1.Parent == nil then UseOverlayResult else UseOverlayResult1.Parent
	local DisplayOrder = if UseOverlayResult1 == nil then 0 else UseOverlayResult1.DisplayOrder
	ReactModule.useEffect(function()
		-- upvalues: p3 (copy), UseStateResult2 (copy)
		if p3.activePage == nil then
			UseStateResult2(nil)
		end
	end, { p3.activePage })
	
	if p3.activePage == nil or UseOverlayResult == nil then
		return nil
	else
		local Element = if p3.activePage.type == "invitePicker" then ReactModule.createElement(PrivateInvitesPickerContainerModule, {
			universeId = p3.target.universeId,
			onClose = p3.onClose,
			onInvitesSent = p3.onInvitesSent or p3.onClose
		}) elseif p3.activePage.type == "playtestManagement" then ReactModule.createElement(View, {
			ZIndex = 10,
			tag = "size-full bg-surface-0",
			testId = "build-pill-menu-playtest-management"
		}, {
			Content = ReactModule.createElement(View, { tag = "size-full margin-top-large" }, {
				Management = ReactModule.createElement(OverflowMenuPageShellModule, {
					testId = "BuildPillMenu.playtestInviteManagement.Page",
					title = PrivateInvitesPageTitle,
					onClose = p3.onClose,
					content = ReactModule.createElement(PrivateInvitesManagementContainerModule, {
						universeId = p3.target.universeId,
						onOpenInvitePicker = p3.onOpenInvitePicker or p3.onClose
					})
				})
			})
		}) else ReactModule.createElement(View, {
			ZIndex = 10,
			tag = "size-full bg-surface-0",
			testId = "build-pill-menu-page-view"
		}, {
			Content = ReactModule.createElement(View, { tag = "size-full margin-top-large" }, {
				Navigator = ReactModule.createElement(AppContainer, {
					screenProps = {
						showPreviewButton = false,
						isPillMenu = true,
						initialPage = Page,
						initialScreen = BuildAgents,
						target = Target or p3.target,
						subagentTaskState = SubagentTaskState,
						onClose = p3.onClose,
						onOpenChat = p3.onOpenChat
					}
				})
			})
		})
		
		return ReactRobloxModule.createPortal(ReactModule.createElement("ScreenGui", {
			ClipToDeviceSafeArea = false,
			IgnoreGuiInset = true,
			Name = "BuildExperiencePillMenuPage",
			DisplayOrder = DisplayOrder,
			ref = UseStateResult2,
			ScreenInsets = Enum.ScreenInsets.None,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			CompositionStyleSheet = ReactModule.createElement(BuildExperienceCompositionStyleSheetModule),
			Page = if UseStateResult == nil then if p3.activePage.type == "invitePicker" then nil else Element else ReactModule.createElement(OverlayProvider, { gui = UseStateResult }, { Page = Element })
		}), UseOverlayResult2)
	end
end)