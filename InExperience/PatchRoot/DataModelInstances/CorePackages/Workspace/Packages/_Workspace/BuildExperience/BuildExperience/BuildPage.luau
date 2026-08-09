local parent = script:FindFirstAncestor("BuildExperience").Parent
local localizationService = game:GetService("LocalizationService")
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local localization = require(parent.RobloxAppLocales).Localization
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local view = foundationModule.View
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local iconName = foundationModule.Enums.IconName
local buildPageHeaderModule = require(script.Parent.Components.BuildPageHeader.BuildPageHeader)
local buildChatPageModule = require(script.Parent.Components.BuildChatPage.BuildChatPage)
local buildSearchBarModule = require(script.Parent.Components.BuildSearchBar.BuildSearchBar)
local subagentStatusModule = require(script.Parent.Components.SubagentStatus)
local myCreationsTabModule = require(script.Parent.Components.MyCreationsTab.MyCreationsTab)
local buildOverflowMenuScreensModule = require(script.Parent.Components.BuildPillMenu.BuildOverflowMenuScreens)
local overflowMenuPageShellModule = require(script.Parent.Components.BuildPillMenu.OverflowMenuPageShell)
local publishSheetModule = require(script.Parent.Components.PublishSheet.PublishSheet)
local _ = require(script.Parent.Chat.chatTypes)
local _ = require(script.Parent.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local _ = require(script.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local buildNavigationParamsModule = require(script.Parent.utils.BuildNavigationParams)
local buildLiveActivityProtocolModule = require(script.Parent.BuildLiveActivityProtocol)
local useBuildPageLayoutModule = require(script.Parent.utils.useBuildPageLayout)
local useOnScreenKeyboardVisibleModule = require(script.Parent.utils.useOnScreenKeyboardVisible)
local buildLiveActivity = game:DefineFastFlag("BuildLiveActivity", false)
local var18 = localization.new(localizationService.RobloxLocaleId):Format("CommonUI.Features.NavBar.Build")
local _ = {
	BuildHome = "BuildHome",
	BuildChat = "BuildChat",
	BuildAgents = "BuildAgents",
	BuildAgentDetails = "BuildAgentDetails"
}

local function _(p0, p1) --[[ line: 68 | named "findGroup" ]]
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

local var19 = roactNavigationModule.createAppContainer(roactNavigationModule.createRobloxStackNavigator({
	{
		BuildHome = {
			screen = function(p2) --[[ line: 82 ]]
				-- upvalues: useBuildPageLayoutModule (ref), reactModule (ref), buildLiveActivity (ref), var18 (ref), creatorAgentChatModule (ref), buildLiveActivityProtocolModule (ref), fullscreenPageWithSafeArea (ref), view (ref), buildPageHeaderModule (ref), buildSearchBarModule (ref), myCreationsTabModule (ref), publishSheetModule (ref)
				local screenProps = p2.screenProps or {}
				local navigation = p2.navigation
				local var21 = useBuildPageLayoutModule()
				local tokens = var21.tokens
				local var22, var23 = reactModule.useState(false)
				local var24, var25 = reactModule.useState(nil)
				local var26 = if buildLiveActivity then reactModule.useRef(nil) else { current = nil }
				local var27 = reactModule.useCallback(function(p3) --[[ line: 95 ]]
					-- upvalues: navigation (ref)
					navigation.navigate("BuildChat", { target = p3 })
				end, { navigation })
				reactModule.useEffect(function() --[[ line: 101 ]]
					-- upvalues: screenProps (ref), buildLiveActivity (copy), var27 (ref), var18 (copy), var26 (ref), creatorAgentChatModule (copy), buildLiveActivityProtocolModule (copy)
					if screenProps.universeId == nil and (screenProps.sessionId == nil or screenProps.sessionId == "") then return end
					if not buildLiveActivity then
						var27({
							universeId = screenProps.universeId or 0,
							sessionId = screenProps.sessionId,
							experienceName = var18
						})
						
						return
					elseif screenProps.sessionId == nil then
						var27({
							universeId = screenProps.universeId or 0,
							experienceName = var18
						})
						
						return
					elseif var26.current == screenProps.sessionId then
						return
					end
					local var28 = false
					task.spawn(function() --[[ line: 125 ]]
						-- upvalues: screenProps (copy), creatorAgentChatModule (copy), var28 (write), buildLiveActivityProtocolModule (copy), var26 (copy), var27 (copy), var18 (copy)
						local var29 = (screenProps.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()).sessionLoad(screenProps.sessionId, nil)
						while var29.state(false).status == "pending" and not var28 do
							task.wait()
						end
						local var30 = var29.state(false)
						
						if var28 or var30.status ~= "succeeded" or typeof(var30.result) ~= "table" then
							if not var28 then
								buildLiveActivityProtocolModule.deepLinkResult("inaccessible")
							end
							return
						else
							local result = var30.result
							local var31 = if typeof(result._meta) == "table" then result._meta._roblox else nil
							local var32 = if typeof(var31) == "table" then var31.universeId else nil
							
							if typeof(var32) == "number" and var32 > 0 then
								var26.current = screenProps.sessionId
								buildLiveActivityProtocolModule.deepLinkResult("succeeded")
								var27({
									universeId = var32,
									sessionId = screenProps.sessionId,
									experienceName = var18
								})
								
								return
							end
							buildLiveActivityProtocolModule.deepLinkResult("inaccessible")
						end
					end)
					
					return function() --[[ line: 153 ]]
						-- upvalues: var28 (write)
						var28 = true
					end
				end, {
					var27,
					screenProps.universeId,
					screenProps.sessionId,
					screenProps.creatorAgentChatStore
				})
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var21.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(view, { tag = "col size-full bg-surface-0" }, {
						Header = reactModule.createElement(buildPageHeaderModule, {
							LayoutOrder = 1,
							height = var21.topBarHeight,
							sideMargin = var21.sideMargin
						}),
						Content = reactModule.createElement(view, { LayoutOrder = 2, tag = "col fill size-full-0" }, {
							SearchBarContainer = reactModule.createElement(view, {
								LayoutOrder = 1,
								ZIndex = 2,
								tag = "size-full-0 auto-y bg-surface-0",
								padding = {
									left = UDim.new(0, var21.sideMargin),
									right = UDim.new(0, var21.sideMargin),
									bottom = UDim.new(0, tokens.Padding.Small)
								}
							}, {
								SearchBar = reactModule.createElement(buildSearchBarModule, { store = screenProps.searchQueryStore })
							}),
							MyCreations = reactModule.createElement(myCreationsTabModule, {
								LayoutOrder = 3,
								creatorAgentChatStore = screenProps.creatorAgentChatStore,
								searchStore = screenProps.searchStore,
								createStore = screenProps.createStore,
								configurationStore = screenProps.configurationStore,
								searchQueryStore = screenProps.searchQueryStore,
								userId = screenProps.userId,
								onOpenChat = var27,
								onPublishExperience = reactModule.useCallback(function(p4, p5) --[[ line: 158 ]]
									-- upvalues: var25 (ref), var23 (ref)
									var25({ experienceName = p4, gameIcon = p5 })
									var23(true)
								end, {})
							})
						}),
						PublishSheet = reactModule.createElement(publishSheetModule, {
							isOpen = var22,
							experienceName = if var24 then var24.experienceName else nil,
							gameIcon = if var24 then var24.gameIcon else nil,
							onClose = function() --[[ line: 214 ]]
								-- upvalues: var23 (ref)
								var23(false)
							end
						})
					})
				})
			end
		}
	},
	{
		BuildChat = {
			screen = function(p6) --[[ line: 222 ]]
				-- upvalues: buildNavigationParamsModule (ref), useBuildPageLayoutModule (ref), useOnScreenKeyboardVisibleModule (ref), reactModule (ref), buildOverflowMenuScreensModule (ref), buildChatPageModule (ref), fullscreenPageWithSafeArea (ref)
				local navigation = p6.navigation
				local target = buildNavigationParamsModule.getTarget(navigation)
				local var34 = useBuildPageLayoutModule()
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var34.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var34.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var34.shouldIncludeBottomBar and not useOnScreenKeyboardVisibleModule()
				}, {
					Page = if target ~= nil then nil else reactModule.createElement(buildChatPageModule, {
						target = target,
						onClose = reactModule.useCallback(function() --[[ line: 228 ]]
							-- upvalues: navigation (ref)
							navigation.goBack()
						end, { navigation }),
						onOpenAgentsPage = reactModule.useCallback(function(p7) --[[ line: 237 ]]
							-- upvalues: navigation (ref), target (ref)
							navigation.navigate("BuildAgents", { target = target, subagentTaskState = p7 })
						end, { navigation, target }),
						onOpenConfigurationPage = reactModule.useCallback(function(p8) --[[ line: 232 ]]
							-- upvalues: navigation (ref), buildOverflowMenuScreensModule (copy), target (ref)
							navigation.navigate(buildOverflowMenuScreensModule.SCREEN_BY_PAGE[p8], { target = target })
						end, { navigation, target })
					})
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
		[buildOverflowMenuScreensModule.Screens.BuildTitleDescription] = {
			screen = buildOverflowMenuScreensModule.BuildTitleDescriptionScreen
		}
	},
	{
		[buildOverflowMenuScreensModule.Screens.BuildMediaSelection] = {
			screen = buildOverflowMenuScreensModule.BuildMediaSelectionScreen
		}
	},
	{
		BuildAgents = {
			screen = function(p9) --[[ line: 263 ]]
				-- upvalues: useBuildPageLayoutModule (ref), buildNavigationParamsModule (ref), reactModule (ref), subagentStatusModule (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), iconName (ref)
				local navigation = p9.navigation
				local var35 = useBuildPageLayoutModule()
				local subagentTaskState = buildNavigationParamsModule.getSubagentTaskState(navigation)
				
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var35.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var35.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var35.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(overflowMenuPageShellModule, {
						title = "Agents",
						testId = "BuildPage.AgentsPage",
						onClose = reactModule.useCallback(function() --[[ line: 268 ]]
							-- upvalues: navigation (ref)
							navigation.goBack()
						end, { navigation }),
						content = reactModule.createElement(subagentStatusModule.AgentsList, {
							testId = "BuildPage.AgentsList",
							groups = if subagentTaskState ~= nil then {} else subagentTaskState.groups,
							onAgentActivated = reactModule.useCallback(function(p10) --[[ line: 271 ]]
								-- upvalues: navigation (ref), buildNavigationParamsModule (copy), subagentTaskState (ref)
								navigation.navigate("BuildAgentDetails", {
									target = buildNavigationParamsModule.getTarget(navigation),
									subagentTaskState = subagentTaskState,
									subagentTaskGroupName = p10.name
								})
							end, { navigation, subagentTaskState })
						}),
						closeIcon = iconName.ChevronLargeLeft
					})
				})
			end
		}
	},
	{
		BuildAgentDetails = {
			screen = function(p11) --[[ line: 301 ]]
				-- upvalues: useBuildPageLayoutModule (ref), buildNavigationParamsModule (ref), reactModule (ref), subagentStatusModule (ref), view (ref), fullscreenPageWithSafeArea (ref), overflowMenuPageShellModule (ref), iconName (ref)
				local var40
				local navigation = p11.navigation
				local var37 = useBuildPageLayoutModule()
				local subagentTaskState = buildNavigationParamsModule.getSubagentTaskState(navigation)
				local subagentTaskGroupName = buildNavigationParamsModule.getSubagentTaskGroupName(navigation)
				
				if subagentTaskState == nil or subagentTaskGroupName == nil then
					var40 = nil
				else
					for i, v in subagentTaskState.groups do
						if v.name == subagentTaskGroupName then
							var40 = v
						end
					end
					var40 = nil
				end
				return reactModule.createElement(fullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = var37.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = var37.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = var37.shouldIncludeBottomBar
				}, {
					Page = reactModule.createElement(overflowMenuPageShellModule, {
						testId = "BuildPage.AgentDetailsPage",
						title = subagentTaskGroupName or "Agents",
						onClose = reactModule.useCallback(function() --[[ line: 308 ]]
							-- upvalues: navigation (ref)
							navigation.goBack()
						end, { navigation }),
						content = if var40 ~= nil then reactModule.createElement(view, { tag = "size-full" }) else reactModule.createElement(subagentStatusModule.AgentDetailsList, { testId = "BuildPage.AgentDetailsList", group = var40 }),
						closeIcon = iconName.ChevronLargeLeft
					})
				})
			end
		}
	}
}, { initialRouteName = "BuildHome" }))

return function(p12) --[[ line: 392 | named "BuildPage" ]]
	-- upvalues: reactModule (ref), var19 (ref)
	return reactModule.createElement(var19, { screenProps = p12 or {} })
end