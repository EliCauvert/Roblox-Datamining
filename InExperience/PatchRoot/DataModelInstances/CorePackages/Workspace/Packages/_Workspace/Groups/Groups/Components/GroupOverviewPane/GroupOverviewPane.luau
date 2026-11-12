local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local CompositionTags = require(Parent.AppComposition).CompositionTags
local NavigationModule = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local UseGroupsWrapperContextModule = require(Groups.Contexts.useGroupsWrapperContext)
local GetGroupOverviewPaneConfigModule = require(Groups.Common.getGroupOverviewPaneConfig)
local FetchGroupOverviewPaneModule = require(Groups.Common.fetchGroupOverviewPane)
local View = require(Parent.Foundation).View
local SduiPageEntryPoint = SduiSharedUtilitiesModule.SduiPageEntryPoint
local SduiPageNavigationHeader = SduiSharedUtilitiesModule.SduiPageNavigationHeader
local SduiPageAnalytics = SduiSharedUtilitiesModule.SduiPageAnalytics
local SduiSurfaceLoadTimeTracker = SduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local UiStatus = SduiSharedUtilitiesModule.UiStatus
local UseComponentConfigFunction = SduiSharedUtilitiesModule.useComponentConfig
local UsePageScopeRefFunction = SduiSharedUtilitiesModule.usePageScopeRef
local UseUiStatusFunction = SduiSharedUtilitiesModule.useUiStatus

local function createPageTimer(p1, Page)
	-- upvalues: SduiSurfaceLoadTimeTracker (copy), SduiPageAnalytics (copy)
	local LoadTimerWithSurfaceLoadTime = SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(p1.configKey, {
		eventName = "GroupOverviewPane_SurfaceLoadTime",
		metadata = { page = Page }
	}, function(Tbl)
		-- upvalues: p1 (copy), SduiPageAnalytics (upval)
		local Copy = table.clone(Tbl)
		Copy.pageKey = p1.surfaceKey
		SduiPageAnalytics.sendLoadTimerEvent(Copy)
	end)
	LoadTimerWithSurfaceLoadTime.start(Page)
	
	return LoadTimerWithSurfaceLoadTime
end

local function useFinishPageTimerWhenEmpty(ConfigKey, PageTimer)
	-- upvalues: UseUiStatusFunction (copy), UseComponentConfigFunction (copy), UiStatus (copy), ReactModule (copy)
	local UseUiStatusResult = UseUiStatusFunction(ConfigKey)
	local HasUseComponentConfigResult = UseComponentConfigFunction(ConfigKey, nil) ~= nil
	local NoHasUseComponentConfigResult: boolean = UseUiStatusResult == UiStatus.Resolved and not HasUseComponentConfigResult
	ReactModule.useEffect(function()
		-- upvalues: NoHasUseComponentConfigResult (copy), PageTimer (copy)
		if NoHasUseComponentConfigResult then
			PageTimer.logComponentReady()
		end
	end, { PageTimer, NoHasUseComponentConfigResult })
end

local function GroupOverviewPaneContent(p1)
	-- upvalues: NavigationModule (copy), UsePageScopeRefFunction (copy), ReactModule (copy), createPageTimer (copy), FetchGroupOverviewPaneModule (copy), useFinishPageTimerWhenEmpty (copy), SduiPageEntryPoint (copy), AppPage (copy)
	local Config = p1.config
	local UseRouteNameResult = NavigationModule.useRouteName()
	UsePageScopeRefFunction(Config.configKey)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: createPageTimer (upval), Config (copy)
		return (createPageTimer(Config, "mount"))
	end, { Config })
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1 = UseStateResult or UseMemoResult
	ReactModule.useEffect(function()
		-- upvalues: FetchGroupOverviewPaneModule (upval), Config (copy), UseMemoResult (copy)
		FetchGroupOverviewPaneModule(Config, UseMemoResult)
	end, { Config, UseMemoResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: createPageTimer (upval), Config (copy), UseStateResult2 (copy), FetchGroupOverviewPaneModule (upval)
		local Refresh = createPageTimer(Config, "refresh")
		UseStateResult2(Refresh)
		FetchGroupOverviewPaneModule(Config, Refresh, true)
	end, { Config })
	useFinishPageTimerWhenEmpty(Config.configKey, UseStateResult1)
	
	return ReactModule.createElement(SduiPageEntryPoint, {
		disableRootPadding = true,
		appPage = AppPage.Groups,
		routeName = UseRouteNameResult,
		configKey = Config.configKey,
		pageTimer = UseStateResult1,
		includeNavigationHeaderBar = p1.includeNavigationHeaderBar,
		onCloseActivated = p1.onCloseActivated,
		refresh = UseResult,
		additionalAnalyticsData = ReactModule.useMemo(function()
			-- upvalues: p1 (copy)
			return { source = p1.source }
		end, { p1.source })
	})
end

local function GroupOverviewPaneEmpty(p1)
	-- upvalues: ReactModule (copy), View (copy), SduiPageNavigationHeader (copy), CompositionTags (copy)
	return ReactModule.createElement(View, {
		testId = "GroupOverviewPane.Empty",
		tag = "col size-full"
	}, {
		Header = if p1.onBackActivated then ReactModule.createElement(SduiPageNavigationHeader, {
			layoutOrder = 1,
			navButtonType = "back",
			contentTag = CompositionTags.ContentRegion.Header,
			closeCallback = p1.onBackActivated
		}) else nil
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: UseGroupsWrapperContextModule (copy), ReactModule (copy), GetGroupOverviewPaneConfigModule (copy), View (copy), GroupOverviewPaneContent (copy), GroupOverviewPaneEmpty (copy)
	local Navigation = p1.navigation
	local GroupIdParam = if p1.groupId == nil then if Navigation then Navigation.getParam("groupId", nil) else nil else p1.groupId
	local SourceParam = if p1.source == nil then if Navigation then Navigation.getParam("source", nil) else nil else p1.source
	local GoBack = if Navigation then Navigation.goBack else nil
	local UseGroupsWrapperContextModuleResult = UseGroupsWrapperContextModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetGroupOverviewPaneConfigModule (upval), UseGroupsWrapperContextModuleResult (copy), GroupIdParam (copy)
		return GetGroupOverviewPaneConfigModule(UseGroupsWrapperContextModuleResult.userId, GroupIdParam)
	end, { UseGroupsWrapperContextModuleResult.userId, GroupIdParam })
	
	return ReactModule.createElement(View, {
		testId = "GroupOverviewPane",
		tag = "size-full clip bg-surface-0"
	}, {
		Content = if UseMemoResult then ReactModule.createElement(GroupOverviewPaneContent, {
			key = UseMemoResult.configKey,
			config = UseMemoResult,
			includeNavigationHeaderBar = Navigation ~= nil,
			onCloseActivated = GoBack,
			source = SourceParam
		}) else ReactModule.createElement(GroupOverviewPaneEmpty, { onBackActivated = GoBack })
	})
end)