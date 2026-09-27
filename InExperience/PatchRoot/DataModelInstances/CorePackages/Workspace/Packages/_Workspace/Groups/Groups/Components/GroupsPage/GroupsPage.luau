local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local reactModule = require(parent.React)
local useEffectOnce = require(parent.RoactUtils).Hooks.useEffectOnce
local fFlagEnableGroupDetailPane = require(parent.SharedFlags).FFlagEnableGroupDetailPane
local var1 = if fFlagEnableGroupDetailPane then require(groups.Hooks.useIsCompactTouch) else nil
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local var2 = if fFlagEnableGroupDetailPane then require(groups.Components.GroupDetailPane) else nil
local groupsListModule = require(groups.Components.GroupsList)
local useGroupsWrapperContextModule = require(groups.Contexts.useGroupsWrapperContext)
local useGroupsListData = require(groups.Hooks).useGroupsListData
local useGroupsAnalyticsModule = require(groups.Hooks.useGroupsAnalytics)
local eventNamesModule = require(groups.Analytics.EventNames)

return function(_)
	-- upvalues: useGroupsWrapperContextModule (ref), useTokens (ref), useGroupsListData (ref), useGroupsAnalyticsModule (ref), fFlagEnableGroupDetailPane (ref), var1 (ref), useEffectOnce (ref), eventNamesModule (ref), reactModule (ref), groupsListModule (ref), view (ref), var2 (ref), fullscreenPageWithSafeArea (ref)
	local var3 = useGroupsWrapperContextModule()
	local var4 = useTokens()
	local var5 = useGroupsListData(var3.userId)
	local var6 = useGroupsAnalyticsModule()
	local var7 = if fFlagEnableGroupDetailPane then var1() else false
	useEffectOnce(function()
		-- upvalues: var6 (ref), eventNamesModule (copy)
		var6.fireAnalyticsEvent(eventNamesModule.GroupsListPageExposure)
	end, not var5.isLoading and not var5.loadFailure)
	local var8 = reactModule.createElement(groupsListModule, {
		layoutOrder = 1,
		groupsList = var5.groupsList,
		canCreateGroup = var5.canCreateGroup,
		isLoading = var5.isLoading,
		loadFailure = var5.loadFailure
	})
	local _ = nil
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var4.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var4.Color.Surface.Surface_0.Transparency
	}, {
		GroupsPageContent = if fFlagEnableGroupDetailPane and not var7 then reactModule.createElement(view, {
			testId = "GroupsPage.DesktopLayout",
			tag = "row size-full-full"
		}, {
			Sidebar = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "col padding-xlarge",
				testId = "GroupsPage.Sidebar",
				Size = UDim2.new(0, 327, 1, 0)
			}, { GroupsList = var8 }),
			Divider = reactModule.createElement(view, {
				LayoutOrder = 2,
				testId = "GroupsPage.Divider",
				Size = UDim2.new(0, 1, 1, 0),
				backgroundStyle = var4.Color.Surface.Surface_300
			}),
			MainPage = reactModule.createElement(view, {
				LayoutOrder = 3,
				tag = "fill size-0-full clip",
				testId = "GroupsPage.MainPane"
			}, {
				GroupDetailPane = reactModule.createElement(var2, {
					groupId = var3.groupId,
					source = var3.groupDetailPaneSource
				})
			})
		}) else reactModule.createElement(view, {
			tag = "col size-full-full padding-x-xlarge padding-y-xxlarge",
			testId = "GroupsPage.SinglePane"
		}, { Content = var8 })
	})
end