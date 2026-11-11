local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local RoactNavigationModule = require(Parent.RoactNavigation)
local View = FoundationModule.View
local OverlayProvider = FoundationModule.OverlayProvider
local UseOverlayFunction = FoundationModule.Hooks.useOverlay
local UseStyleSheetFunction = FoundationModule.Hooks.useStyleSheet
local IconName = FoundationModule.Enums.IconName
local BuildOverflowMenuScreensModule = require(script.Parent.BuildOverflowMenuScreens)
local OverflowMenuPageShellModule = require(script.Parent.OverflowMenuPageShell)
local SubagentStatusModule = require(BuildExperience.Components.SubagentStatus)
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local BuildNavigationParamsModule = require(BuildExperience.utils.BuildNavigationParams)
local UseSessionSummaryModule = require(BuildExperience.Chat.useSessionSummary)
local config = {
	Launcher = "BuildPillMenuLauncher",
	BuildAgents = "BuildPillMenuAgents",
	BuildAgentDetails = "BuildPillMenuAgentDetails"
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

local AppContainer = RoactNavigationModule.createAppContainer(RoactNavigationModule.createRobloxStackNavigator({
	{
		BuildPillMenuLauncher = {
			screen = function(p2)
				-- upvalues: ReactModule (copy), BuildOverflowMenuScreensModule (copy)
				local Navigation = p2.navigation
				local ScreenProps = p2.screenProps
				ReactModule.useEffect(function()
					-- upvalues: ScreenProps (copy), Navigation (copy), BuildOverflowMenuScreensModule (upval)
					if ScreenProps.initialPage ~= nil then
						Navigation.navigate(BuildOverflowMenuScreensModule.SCREEN_BY_PAGE[ScreenProps.initialPage], { target = ScreenProps.target })
						
						return
					end
					if ScreenProps.initialScreen ~= nil then
						Navigation.navigate(ScreenProps.initialScreen, { target = ScreenProps.target })
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
		[BuildOverflowMenuScreensModule.Screens.BuildTitleDescription] = {
			screen = BuildOverflowMenuScreensModule.BuildTitleDescriptionScreen
		}
	},
	{
		BuildPillMenuAgents = {
			screen = function(p2)
				-- upvalues: ReactModule (copy), SubagentStatusModule (copy), OverflowMenuPageShellModule (copy)
				local Navigation = p2.navigation
				local ScreenProps = p2.screenProps
				local SubagentTaskState = ScreenProps.subagentTaskState
				
				return ReactModule.createElement(OverflowMenuPageShellModule, {
					title = "Agents",
					testId = "BuildPillMenu.AgentsPage",
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
				-- upvalues: BuildNavigationParamsModule (copy), ReactModule (copy), SubagentStatusModule (copy), View (copy), OverflowMenuPageShellModule (copy), IconName (copy)
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
				return ReactModule.createElement(OverflowMenuPageShellModule, {
					testId = "BuildPillMenu.AgentDetailsPage",
					title = SubagentTaskGroupName or "Agents",
					onClose = ReactModule.useCallback(function()
						-- upvalues: Navigation (copy)
						Navigation.goBack()
					end, { Navigation }),
					content = if Group == nil then ReactModule.createElement(View, { tag = "size-full" }) else ReactModule.createElement(SubagentStatusModule.AgentDetailsList, { testId = "BuildPillMenu.AgentDetailsList", group = Group }),
					closeIcon = IconName.ChevronLargeLeft
				})
			end
		}
	}
}, { initialRouteName = "BuildPillMenuLauncher" }))

local _ = function(ScreenGui)
	return if ScreenGui:IsA("ScreenGui") then ScreenGui else ScreenGui:FindFirstAncestorOfClass("ScreenGui")
end

local _ = function(p3)
	return if p3 == nil or p3.type ~= "overflow" then nil else p3.page
end

local _ = function(p3)
	return if p3 == nil or p3.type ~= "agents" then nil else "BuildPillMenuAgents"
end

return ReactModule.memo(function(p3)
	-- upvalues: UseOverlayFunction (copy), UseStyleSheetFunction (copy), ReactModule (copy), config (copy), CreatorAgentChatModule (copy), UseSessionSummaryModule (copy), View (copy), AppContainer (copy), ReactRobloxModule (copy), OverlayProvider (copy)
	local UseOverlayResult = UseOverlayFunction()
	local UseStyleSheetResult = UseStyleSheetFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local ActivePage = p3.activePage
	local Page = if ActivePage == nil or ActivePage.type ~= "overflow" then nil else ActivePage.page
	local ActivePage1 = p3.activePage
	local BuildAgents = if ActivePage1 == nil or ActivePage1.type ~= "agents" then nil else config.BuildAgents
	local SubagentTaskState = UseSessionSummaryModule((ReactModule.useMemo(function()
		-- upvalues: CreatorAgentChatModule (upval), p3 (copy)
		return CreatorAgentChatModule.getCreatorAgentChatStore().getSessionForProject(p3.target.universeId, p3.target.placeId, p3.target.sessionId)
	end, {
		p3.target.universeId,
		p3.target.placeId,
		p3.target.sessionId
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
		local Element = ReactModule.createElement(View, {
			ZIndex = 10,
			tag = "bg-surface-0",
			testId = "build-pill-menu-page-view",
			Position = UDim2.fromScale(0, 0),
			Size = UDim2.fromScale(1, 1)
		}, {
			Content = ReactModule.createElement(View, { tag = "size-full margin-top-large" }, {
				Navigator = ReactModule.createElement(AppContainer, {
					screenProps = {
						showPreviewButton = false,
						initialPage = Page,
						initialScreen = BuildAgents,
						target = p3.target,
						subagentTaskState = SubagentTaskState,
						onClose = p3.onClose
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
			StyleLink = ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetResult }),
			Page = if UseStateResult == nil then Element else ReactModule.createElement(OverlayProvider, { gui = UseStateResult }, { Page = Element })
		}), UseOverlayResult2)
	end
end)