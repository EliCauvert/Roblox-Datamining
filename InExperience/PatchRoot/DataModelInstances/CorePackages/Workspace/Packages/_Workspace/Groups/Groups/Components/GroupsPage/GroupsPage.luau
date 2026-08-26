local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local reactModule = require(parent.React)
local useEffectOnce = require(parent.RoactUtils).Hooks.useEffectOnce
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local groupsListModule = require(groups.Components.GroupsList)
local useGroupsWrapperContextModule = require(groups.Contexts.useGroupsWrapperContext)
local useGroupsListData = require(groups.Hooks).useGroupsListData
local useGroupsAnalyticsModule = require(groups.Hooks.useGroupsAnalytics)
local eventNamesModule = require(groups.Analytics.EventNames)

return function(_)
	-- upvalues: useGroupsWrapperContextModule (ref), useTokens (ref), useGroupsListData (ref), useGroupsAnalyticsModule (ref), useEffectOnce (ref), eventNamesModule (ref), reactModule (ref), fullscreenPageWithSafeArea (ref), view (ref), groupsListModule (ref)
	local var1 = useTokens()
	local var2 = useGroupsListData(useGroupsWrapperContextModule().userId)
	local var3 = useGroupsAnalyticsModule()
	useEffectOnce(function()
		-- upvalues: var3 (ref), eventNamesModule (copy)
		var3.fireAnalyticsEvent(eventNamesModule.GroupsListPageExposure)
	end, not var2.isLoading and not var2.loadFailure)
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var1.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var1.Color.Surface.Surface_0.Transparency
	}, {
		GroupsPageContent = reactModule.createElement(view, {
			tag = "col size-full-full padding-x-xlarge padding-y-xxlarge"
		}, {
			Content = reactModule.createElement(groupsListModule, {
				layoutOrder = 1,
				groupsList = var2.groupsList,
				canCreateGroup = var2.canCreateGroup,
				isLoading = var2.isLoading,
				loadFailure = var2.loadFailure
			})
		})
	})
end