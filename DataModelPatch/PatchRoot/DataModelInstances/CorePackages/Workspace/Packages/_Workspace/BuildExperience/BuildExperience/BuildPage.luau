local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local View = FoundationModule.View
local _ = require(Parent.DataHydration.CreatorAgentChat)
local IconName = FoundationModule.Enums.IconName
local BuildPageHeaderModule = require(script.Parent.Components.BuildPageHeader.BuildPageHeader)
local BuildChatPageModule = require(script.Parent.Components.BuildChatPage.BuildChatPage)
local BuildSearchBarModule = require(script.Parent.Components.BuildSearchBar.BuildSearchBar)
local SubagentStatusModule = require(script.Parent.Components.SubagentStatus)
local MyCreationsTabModule = require(script.Parent.Components.MyCreationsTab.MyCreationsTab)
local BuildOverflowMenuScreensModule = require(script.Parent.Components.BuildPillMenu.BuildOverflowMenuScreens)
local OverflowMenuPageShellModule = require(script.Parent.Components.BuildPillMenu.OverflowMenuPageShell)
local PublishSheetModule = require(script.Parent.Components.PublishSheet.PublishSheet)
local _ = require(script.Parent.Chat.chatTypes)
local _ = require(script.Parent.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local GetBuildExperienceRefreshStoreModule = require(script.Parent.Stores.GetBuildExperienceRefreshStore)
local _ = require(script.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local BuildNavigationParamsModule = require(script.Parent.utils.BuildNavigationParams)
local ResumeBuildChatModule = require(script.Parent.utils.resumeBuildChat)
local UseBuildPageLayoutModule = require(script.Parent.utils.useBuildPageLayout)
local UseOnScreenKeyboardVisibleModule = require(script.Parent.utils.useOnScreenKeyboardVisible)

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

local AppContainer = RoactNavigationModule.createAppContainer((RoactNavigationModule.createRobloxStackNavigator({
	{
		BuildHome = {
			screen = function(p2)
				-- upvalues: UseBuildPageLayoutModule (copy), ReactModule (copy), ResumeBuildChatModule (copy), FullscreenPageWithSafeArea (copy), View (copy), BuildPageHeaderModule (copy), BuildSearchBarModule (copy), MyCreationsTabModule (copy), PublishSheetModule (copy)
				local ScreenProps = p2.screenProps or {}
				local Navigation = p2.navigation
				local UseBuildPageLayoutModuleResult = UseBuildPageLayoutModule()
				local Tokens = UseBuildPageLayoutModuleResult.tokens
				local UseStateResult, UseStateResult2 = ReactModule.useState(false)
				local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
				local UseResult = ReactModule.useCallback(function(Target)
					-- upvalues: Navigation (copy)
					Navigation.navigate("BuildChat", { target = Target })
				end, { Navigation })
				ReactModule.useEffect(function()
					-- upvalues: ResumeBuildChatModule (upval), ScreenProps (copy), UseResult (copy)
					return ResumeBuildChatModule({
						universeId = ScreenProps.universeId,
						sessionId = ScreenProps.sessionId,
						creatorAgentChatStore = ScreenProps.creatorAgentChatStore,
						configurationStore = ScreenProps.configurationStore,
						onOpenChat = UseResult
					})
				end, {
					UseResult, ScreenProps.universeId, ScreenProps.sessionId,
					ScreenProps.resumeRequestId, ScreenProps.creatorAgentChatStore,
					ScreenProps.configurationStore
				})
				
				return ReactModule.createElement(FullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = Tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = Tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = UseBuildPageLayoutModuleResult.shouldIncludeBottomBar
				}, {
					Page = ReactModule.createElement(View, { tag = "col align-x-center size-full bg-surface-0" }, {
						Header = ReactModule.createElement(BuildPageHeaderModule, {
							LayoutOrder = 1,
							height = UseBuildPageLayoutModuleResult.topBarHeight
						}),
						Content = ReactModule.createElement(View, {
							LayoutOrder = 2,
							ZIndex = 4,
							tag = "col align-x-center fill gap-small size-full-0"
						}, {
							SearchBarContainer = ReactModule.createElement(View, {
								LayoutOrder = 1,
								ZIndex = 2,
								tag = "composition-content-header size-full-0 auto-y bg-surface-0",
								testId = "BuildPage.SearchBarContainer"
							}, {
								SearchBar = ReactModule.createElement(BuildSearchBarModule, { store = ScreenProps.searchQueryStore })
							}),
							MyCreations = ReactModule.createElement(MyCreationsTabModule, {
								LayoutOrder = 3,
								creatorAgentChatStore = ScreenProps.creatorAgentChatStore,
								configurationStore = ScreenProps.configurationStore,
								searchQueryStore = ScreenProps.searchQueryStore,
								onOpenChat = UseResult,
								onPublishExperience = ReactModule.useCallback(function(ExperienceName, GameIcon)
									-- upvalues: UseStateResult2_1 (copy), UseStateResult2 (copy)
									UseStateResult2_1({ experienceName = ExperienceName, gameIcon = GameIcon })
									UseStateResult2(true)
								end, {})
							})
						}),
						PublishSheet = ReactModule.createElement(PublishSheetModule, {
							isOpen = UseStateResult,
							experienceName = if UseStateResult1 then UseStateResult1.experienceName else nil,
							gameIcon = if UseStateResult1 then UseStateResult1.gameIcon else nil,
							onClose = function()
								-- upvalues: UseStateResult2 (copy)
								UseStateResult2(false)
							end
						})
					})
				})
			end
		}
	},
	{
		BuildChat = {
			screen = function(p2)
				-- upvalues: BuildNavigationParamsModule (copy), GetBuildExperienceRefreshStoreModule (copy), UseBuildPageLayoutModule (copy), UseOnScreenKeyboardVisibleModule (copy), ReactModule (copy), BuildOverflowMenuScreensModule (copy), BuildChatPageModule (copy), FullscreenPageWithSafeArea (copy)
				local Navigation = p2.navigation
				local Target = BuildNavigationParamsModule.getTarget(Navigation)
				local BuildExperienceRefreshStoreModule = GetBuildExperienceRefreshStoreModule()
				local UseBuildPageLayoutModuleResult = UseBuildPageLayoutModule()
				local UseOnScreenKeyboardVisibleModuleResult = UseOnScreenKeyboardVisibleModule()
				local UseResult = ReactModule.useCallback(function()
					-- upvalues: Navigation (copy)
					Navigation.goBack()
				end, { Navigation })
				local UseResult1 = ReactModule.useCallback(function(p3)
					-- upvalues: Navigation (copy), BuildOverflowMenuScreensModule (upval), Target (copy)
					Navigation.navigate(BuildOverflowMenuScreensModule.SCREEN_BY_PAGE[p3], { target = Target })
				end, { Navigation, Target })
				local UseResult2 = ReactModule.useCallback(function(SubagentTaskState)
					-- upvalues: Navigation (copy), Target (copy)
					Navigation.navigate("BuildAgents", { target = Target, subagentTaskState = SubagentTaskState })
				end, { Navigation, Target })
				local UseResult3 = ReactModule.useCallback(function(Target)
					-- upvalues: Navigation (copy), BuildExperienceRefreshStoreModule (copy)
					Navigation.setParams({ target = Target })
					BuildExperienceRefreshStoreModule.bumpRefreshTick()
				end, { Navigation, BuildExperienceRefreshStoreModule })
				
				return ReactModule.createElement(FullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = UseBuildPageLayoutModuleResult.shouldIncludeBottomBar and not UseOnScreenKeyboardVisibleModuleResult
				}, {
					Page = if Target == nil then nil else ReactModule.createElement(BuildChatPageModule, {
						target = Target,
						onClose = UseResult,
						onOpenAgentsPage = UseResult2,
						onOpenConfigurationPage = UseResult1,
						onNavigateToResolvedTarget = UseResult3
					})
				})
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
		[BuildOverflowMenuScreensModule.Screens.BuildMediaSelection] = {
			screen = BuildOverflowMenuScreensModule.BuildMediaSelectionScreen
		}
	},
	{
		BuildAgents = {
			screen = function(p2)
				-- upvalues: UseBuildPageLayoutModule (copy), BuildNavigationParamsModule (copy), ReactModule (copy), SubagentStatusModule (copy), FullscreenPageWithSafeArea (copy), OverflowMenuPageShellModule (copy), IconName (copy)
				local Navigation = p2.navigation
				local UseBuildPageLayoutModuleResult = UseBuildPageLayoutModule()
				local SubagentTaskState = BuildNavigationParamsModule.getSubagentTaskState(Navigation)
				
				return ReactModule.createElement(FullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = UseBuildPageLayoutModuleResult.shouldIncludeBottomBar
				}, {
					Page = ReactModule.createElement(OverflowMenuPageShellModule, {
						title = "Agents",
						testId = "BuildPage.AgentsPage",
						onClose = ReactModule.useCallback(function()
							-- upvalues: Navigation (copy)
							Navigation.goBack()
						end, { Navigation }),
						content = ReactModule.createElement(SubagentStatusModule.AgentsList, {
							testId = "BuildPage.AgentsList",
							groups = if SubagentTaskState == nil then {} else SubagentTaskState.groups,
							onAgentActivated = ReactModule.useCallback(function(p3)
								-- upvalues: Navigation (copy), BuildNavigationParamsModule (upval), SubagentTaskState (copy)
								Navigation.navigate("BuildAgentDetails", {
									target = BuildNavigationParamsModule.getTarget(Navigation),
									subagentTaskState = SubagentTaskState,
									subagentTaskGroupName = p3.name
								})
							end, { Navigation, SubagentTaskState })
						}),
						closeIcon = IconName.ChevronLargeLeft
					})
				})
			end
		}
	},
	{
		BuildAgentDetails = {
			screen = function(p2)
				-- upvalues: UseBuildPageLayoutModule (copy), BuildNavigationParamsModule (copy), ReactModule (copy), SubagentStatusModule (copy), View (copy), FullscreenPageWithSafeArea (copy), OverflowMenuPageShellModule (copy), IconName (copy)
				local Navigation = p2.navigation
				local UseBuildPageLayoutModuleResult = UseBuildPageLayoutModule()
				local SubagentTaskState = BuildNavigationParamsModule.getSubagentTaskState(Navigation)
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
				return ReactModule.createElement(FullscreenPageWithSafeArea, {
					includeStatusBar = true,
					BackgroundColor3 = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = UseBuildPageLayoutModuleResult.tokens.Color.Surface.Surface_0.Transparency,
					includeBottomBar = UseBuildPageLayoutModuleResult.shouldIncludeBottomBar
				}, {
					Page = ReactModule.createElement(OverflowMenuPageShellModule, {
						testId = "BuildPage.AgentDetailsPage",
						title = SubagentTaskGroupName or "Agents",
						onClose = ReactModule.useCallback(function()
							-- upvalues: Navigation (copy)
							Navigation.goBack()
						end, { Navigation }),
						content = if Group == nil then ReactModule.createElement(View, { tag = "size-full" }) else ReactModule.createElement(SubagentStatusModule.AgentDetailsList, { testId = "BuildPage.AgentDetailsList", group = Group }),
						closeIcon = IconName.ChevronLargeLeft
					})
				})
			end
		}
	}
}, { initialRouteName = "BuildHome" })))

return function(p3)
	-- upvalues: ReactModule (copy), AppContainer (copy)
	return ReactModule.createElement(AppContainer, { screenProps = p3 or {} })
end