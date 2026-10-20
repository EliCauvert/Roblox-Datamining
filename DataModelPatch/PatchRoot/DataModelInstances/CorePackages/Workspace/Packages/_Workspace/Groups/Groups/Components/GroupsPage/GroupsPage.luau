local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local UseEffectOnceFunction = require(Parent.RoactUtils).Hooks.useEffectOnce
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local GroupsListModule = require(Groups.Components.GroupsList)
local UseGroupsWrapperContextModule = require(Groups.Contexts.useGroupsWrapperContext)
local UseGroupsListDataFunction = require(Groups.Hooks).useGroupsListData
local UseGroupsAnalyticsModule = require(Groups.Hooks.useGroupsAnalytics)
local EventNamesModule = require(Groups.Analytics.EventNames)

return function(_)
	-- upvalues: UseGroupsWrapperContextModule (copy), UseTokensFunction (copy), UseGroupsListDataFunction (copy), UseGroupsAnalyticsModule (copy), UseEffectOnceFunction (copy), EventNamesModule (copy), ReactModule (copy), FullscreenPageWithSafeArea (copy), View (copy), GroupsListModule (copy)
	local UseGroupsWrapperContextModuleResult = UseGroupsWrapperContextModule()
	local UseTokensResult = UseTokensFunction()
	local UseGroupsListDataResult = UseGroupsListDataFunction(UseGroupsWrapperContextModuleResult.userId)
	local UseGroupsAnalyticsModuleResult = UseGroupsAnalyticsModule()
	UseEffectOnceFunction(function()
		-- upvalues: UseGroupsAnalyticsModuleResult (copy), EventNamesModule (upval)
		UseGroupsAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.GroupsListPageExposure)
	end, not UseGroupsListDataResult.isLoading and not UseGroupsListDataResult.loadFailure)
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = UseTokensResult.Color.Surface.Surface_0.Transparency
	}, {
		GroupsPageContent = ReactModule.createElement(View, {
			tag = "col size-full-full padding-x-xlarge padding-y-xxlarge"
		}, {
			Content = ReactModule.createElement(GroupsListModule, {
				layoutOrder = 1,
				groupsList = UseGroupsListDataResult.groupsList,
				canCreateGroup = UseGroupsListDataResult.canCreateGroup,
				isLoading = UseGroupsListDataResult.isLoading,
				loadFailure = UseGroupsListDataResult.loadFailure
			})
		})
	})
end