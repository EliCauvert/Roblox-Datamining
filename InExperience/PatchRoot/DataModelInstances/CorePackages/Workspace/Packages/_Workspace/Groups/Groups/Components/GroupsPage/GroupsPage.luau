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

return function(_) --[[ line: 25 | named "GroupsPage" ]]
	-- upvalues: useGroupsWrapperContextModule (ref), useTokens (ref), useGroupsListData (ref), useGroupsAnalyticsModule (ref), useEffectOnce (ref), eventNamesModule (ref), reactModule (ref), fullscreenPageWithSafeArea (ref), view (ref), groupsListModule (ref)
	local var7 = useTokens()
	local var8 = useGroupsListData(useGroupsWrapperContextModule().userId)
	local var9 = useGroupsAnalyticsModule()
	useEffectOnce(function() --[[ line: 32 ]]
		-- upvalues: var9 (ref), eventNamesModule (copy)
		var9.fireAnalyticsEvent(eventNamesModule.GroupsListPageExposure)
	end, not var8.isLoading and not var8.loadFailure)
	
	return reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = var7.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = var7.Color.Surface.Surface_0.Transparency
	}, {
		GroupsPageContent = reactModule.createElement(view, {
			tag = "col size-full-full padding-x-xlarge padding-y-xxlarge"
		}, {
			Content = reactModule.createElement(groupsListModule, {
				layoutOrder = 1,
				groupsList = var8.groupsList,
				canCreateGroup = var8.canCreateGroup,
				isLoading = var8.isLoading,
				loadFailure = var8.loadFailure
			})
		})
	})
end