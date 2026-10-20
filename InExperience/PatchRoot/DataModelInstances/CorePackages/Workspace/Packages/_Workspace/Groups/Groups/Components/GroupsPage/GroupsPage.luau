local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local UseEffectOnceFunction = require(Parent.RoactUtils).Hooks.useEffectOnce
local FFlagEnableGroupDetailPane = require(Parent.SharedFlags).FFlagEnableGroupDetailPane
local UseIsCompactTouchModule = if FFlagEnableGroupDetailPane then require(Groups.Hooks.useIsCompactTouch) else nil
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local GroupDetailPaneModule = if FFlagEnableGroupDetailPane then require(Groups.Components.GroupDetailPane) else nil
local GroupsListModule = require(Groups.Components.GroupsList)
local UseGroupsWrapperContextModule = require(Groups.Contexts.useGroupsWrapperContext)
local UseGroupsListDataFunction = require(Groups.Hooks).useGroupsListData
local UseGroupsAnalyticsModule = require(Groups.Hooks.useGroupsAnalytics)
local EventNamesModule = require(Groups.Analytics.EventNames)

return function(_)
	-- upvalues: UseGroupsWrapperContextModule (copy), UseTokensFunction (copy), UseGroupsListDataFunction (copy), UseGroupsAnalyticsModule (copy), FFlagEnableGroupDetailPane (copy), UseIsCompactTouchModule (copy), UseEffectOnceFunction (copy), EventNamesModule (copy), ReactModule (copy), GroupsListModule (copy), View (copy), GroupDetailPaneModule (copy), FullscreenPageWithSafeArea (copy)
	local UseGroupsWrapperContextModuleResult = UseGroupsWrapperContextModule()
	local UseTokensResult = UseTokensFunction()
	local UseGroupsListDataResult = UseGroupsListDataFunction(UseGroupsWrapperContextModuleResult.userId)
	local UseGroupsAnalyticsModuleResult = UseGroupsAnalyticsModule()
	local UseIsCompactTouchModuleResult = if FFlagEnableGroupDetailPane then UseIsCompactTouchModule() else false
	UseEffectOnceFunction(function()
		-- upvalues: UseGroupsAnalyticsModuleResult (copy), EventNamesModule (upval)
		UseGroupsAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.GroupsListPageExposure)
	end, not UseGroupsListDataResult.isLoading and not UseGroupsListDataResult.loadFailure)
	local Element = ReactModule.createElement(GroupsListModule, {
		layoutOrder = 1,
		groupsList = UseGroupsListDataResult.groupsList,
		canCreateGroup = UseGroupsListDataResult.canCreateGroup,
		isLoading = UseGroupsListDataResult.isLoading,
		loadFailure = UseGroupsListDataResult.loadFailure
	})
	
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = UseTokensResult.Color.Surface.Surface_0.Transparency
	}, {
		GroupsPageContent = if FFlagEnableGroupDetailPane and not UseIsCompactTouchModuleResult then ReactModule.createElement(View, {
			testId = "GroupsPage.DesktopLayout",
			tag = "row size-full-full"
		}, {
			Sidebar = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "col padding-xlarge",
				testId = "GroupsPage.Sidebar",
				Size = UDim2.new(0, 327, 1, 0)
			}, { GroupsList = Element }),
			Divider = ReactModule.createElement(View, {
				LayoutOrder = 2,
				testId = "GroupsPage.Divider",
				Size = UDim2.new(0, 1, 1, 0),
				backgroundStyle = UseTokensResult.Color.Surface.Surface_300
			}),
			MainPage = ReactModule.createElement(View, {
				LayoutOrder = 3,
				tag = "fill size-0-full clip",
				testId = "GroupsPage.MainPane"
			}, {
				GroupDetailPane = ReactModule.createElement(GroupDetailPaneModule, {
					groupId = UseGroupsWrapperContextModuleResult.groupId,
					source = UseGroupsWrapperContextModuleResult.groupDetailPaneSource
				})
			})
		}) else ReactModule.createElement(View, {
			tag = "col size-full-full padding-x-xlarge padding-y-xxlarge",
			testId = "GroupsPage.SinglePane"
		}, { Content = Element })
	})
end