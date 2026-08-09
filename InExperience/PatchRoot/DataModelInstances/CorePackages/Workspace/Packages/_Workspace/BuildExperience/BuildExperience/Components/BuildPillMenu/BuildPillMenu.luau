local coreGuiService = game:GetService("CoreGui")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local roactNavigationModule = require(parent.RoactNavigation)
local signalsReactModule = require(parent.SignalsReact)
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local agentDetailMenuModule = require(script.Parent.AgentDetailMenu)
local buildOverflowMenuButtonModule = require(script.Parent.BuildOverflowMenuButton)
local buildOverflowMenuScreensModule = require(script.Parent.BuildOverflowMenuScreens)
local overflowMenuPageShellModule = require(script.Parent.OverflowMenuPageShell)
local subagentStatusModule = require(buildExperience.Components.SubagentStatus)
local getBuildOverflowMenuStoreModule = require(buildExperience.Stores.GetBuildOverflowMenuStore)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local buildNavigationParamsModule = require(buildExperience.utils.BuildNavigationParams)
local _ = {
	Launcher = "BuildPillMenuLauncher",
	BuildAgents = "BuildPillMenuAgents",
	BuildAgentDetails = "BuildPillMenuAgentDetails"
}

local function _(p0, p1) --[[ line: 60 | named "findGroup" ]]
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

local var15 = roactNavigationModule.createAppContainer(roactNavigationModule.createRobloxStackNavigator({
	{
		BuildPillMenuLauncher = {
			screen = function(p2) --[[ line: 74 ]]
				-- upvalues: reactModule (ref), buildOverflowMenuScreensModule (ref)
				local navigation = p2.navigation
				local screenProps = p2.screenProps
				reactModule.useEffect(function() --[[ line: 78 ]]
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
		[buildOverflowMenuScreensModule.Screens.BuildTitleDescription] = {
			screen = buildOverflowMenuScreensModule.BuildTitleDescriptionScreen
		}
	},
	{
		BuildPillMenuAgents = {
			screen = function(p3) --[[ line: 93 ]]
				-- upvalues: reactModule (ref), subagentStatusModule (ref), overflowMenuPageShellModule (ref)
				local navigation = p3.navigation
				local screenProps = p3.screenProps
				local subagentTaskState = screenProps.subagentTaskState
				
				return reactModule.createElement(overflowMenuPageShellModule, {
					title = "Agents",
					testId = "BuildPillMenu.AgentsPage",
					onClose = screenProps.onClose,
					content = reactModule.createElement(subagentStatusModule.AgentsList, {
						testId = "BuildPillMenu.AgentsList",
						groups = if subagentTaskState ~= nil then {} else subagentTaskState.groups,
						onAgentActivated = reactModule.useCallback(function(p4) --[[ line: 98 ]]
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
			screen = function(p5) --[[ line: 119 ]]
				-- upvalues: buildNavigationParamsModule (ref), reactModule (ref), subagentStatusModule (ref), view (ref), overflowMenuPageShellModule (ref), iconName (ref)
				local var18
				local navigation = p5.navigation
				local var16 = buildNavigationParamsModule.getSubagentTaskState(navigation) or p5.screenProps.subagentTaskState
				local subagentTaskGroupName = buildNavigationParamsModule.getSubagentTaskGroupName(navigation)
				
				if var16 == nil or subagentTaskGroupName == nil then
					var18 = nil
				else
					for i, v in var16.groups do
						if v.name == subagentTaskGroupName then
							var18 = v
						end
					end
					var18 = nil
				end
				return reactModule.createElement(overflowMenuPageShellModule, {
					testId = "BuildPillMenu.AgentDetailsPage",
					title = subagentTaskGroupName or "Agents",
					onClose = reactModule.useCallback(function() --[[ line: 126 ]]
						-- upvalues: navigation (ref)
						navigation.goBack()
					end, { navigation }),
					content = if var18 ~= nil then reactModule.createElement(view, { tag = "size-full" }) else reactModule.createElement(subagentStatusModule.AgentDetailsList, { testId = "BuildPillMenu.AgentDetailsList", group = var18 }),
					closeIcon = iconName.ChevronLargeLeft
				})
			end
		}
	}
}, { initialRouteName = "BuildPillMenuLauncher" }))

return function(p6) --[[ line: 191 | named "BuildPillMenu" ]]
	-- upvalues: getBuildOverflowMenuStoreModule (ref), reactModule (ref), creatorAgentChatModule (ref), signalsReactModule (ref), view (ref), var15 (ref), reactRobloxModule (ref), foundationModule (ref), coreGuiService (ref), agentDetailMenuModule (ref), buildOverflowMenuButtonModule (ref), iconName (ref)
	local createPortal
	local store = p6.store or getBuildOverflowMenuStoreModule()
	local var20, var21 = reactModule.useState(nil)
	local var22, var23 = reactModule.useState(nil)
	local var24 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 195 ]]
		-- upvalues: creatorAgentChatModule (copy), p6 (ref)
		return creatorAgentChatModule.getCreatorAgentChatStore().getSessionForProject(p6.target.universeId, p6.target.placeId, p6.target.sessionId)
	end, {
		p6.target.universeId,
		p6.target.placeId,
		p6.target.sessionId
	}).getSubagentTaskState)
	local var25 = var24 ~= nil and #var24.groups > 0
	local var26 = reactModule.useCallback(function() --[[ line: 202 ]]
		-- upvalues: var21 (ref), var23 (ref)
		var21(nil)
		var23(nil)
	end, {})
	local var27 = reactModule.useCallback(function(p7) --[[ line: 207 ]]
		-- upvalues: var21 (ref), var23 (ref), p6 (ref)
		if p7.type == "openPage" then
			var21(p7.page)
			var23(nil)
			
			return
		elseif p6.onAction then
			p6.onAction(p7)
		end
	end, { p6.onAction })
	local var28 = reactModule.useCallback(function() --[[ line: 216 ]]
		-- upvalues: var25 (ref), var21 (ref), var23 (ref)
		if var25 then
			var21(nil)
			var23("BuildPillMenuAgents")
			
			return
		end
	end, { var25 })
	local var29 = if var20 == nil and var22 == nil then nil else reactModule.createElement(view, {
		ZIndex = 10,
		tag = "bg-surface-0",
		testId = "build-pill-menu-page-view",
		Position = UDim2.fromScale(0, 0),
		Size = UDim2.fromScale(1, 1)
	}, {
		Content = reactModule.createElement(view, { tag = "size-full margin-top-large" }, {
			Navigator = reactModule.createElement(var15, {
				screenProps = {
					showPreviewButton = false,
					initialPage = var20,
					initialScreen = var22,
					target = p6.target,
					subagentTaskState = var24,
					onClose = var26
				}
			})
		})
	})
	
	if var29 == nil then
		createPortal = nil
	else
		createPortal = reactRobloxModule.createPortal
		createPortal = createPortal(reactModule.createElement("ScreenGui", {
			DisplayOrder = 10,
			IgnoreGuiInset = true,
			Name = "BuildExperiencePillMenuPage",
			ScreenInsets = Enum.ScreenInsets.None,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			Provider = reactModule.createElement(foundationModule.FoundationProvider, { theme = foundationModule.Enums.Theme.Dark }, { Page = var29 })
		}), p6.pageHost or coreGuiService)
	end
	return reactModule.createElement(reactModule.Fragment, nil, {
		Pill = reactModule.createElement(view, {
			tag = "row align-y-center gap-xsmall size-0-1100 auto-x padding-x-xsmall radius-circle clip bg-over-media-0",
			Position = p6.position,
			AnchorPoint = p6.anchorPoint,
			LayoutOrder = p6.layoutOrder,
			testId = p6.testId
		}, {
			AgentDetail = reactModule.createElement(agentDetailMenuModule, {
				layoutOrder = 1,
				isDisabled = not var25,
				onActivated = var28
			}),
			Overflow = reactModule.createElement(buildOverflowMenuButtonModule, {
				layoutOrder = 2,
				icon = iconName.ThreeDotsHorizontal,
				store = store,
				target = p6.target,
				onAction = var27
			})
		}),
		Page = createPortal
	})
end