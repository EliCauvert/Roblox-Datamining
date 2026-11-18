local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local CompositionTags = require(Parent.AppComposition).CompositionTags
local FoundationModule = require(Parent.Foundation)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local BuildNavigationParamsModule = require(BuildExperience.utils.BuildNavigationParams)
local BuildInspirationConstantsModule = require(script.Parent.BuildInspirationConstants)
local FetchBuildInspirationPageModule = require(script.Parent.fetchBuildInspirationPage)
local CreateBuildInspirationPageTimerModule = require(script.Parent.createBuildInspirationPageTimer)
local UseBuildInspirationPageScopeModule = require(script.Parent.useBuildInspirationPageScope)
local SduiPageEntryPoint = SduiSharedUtilitiesModule.SduiPageEntryPoint
local UseTokensFunction = FoundationModule.Hooks.useTokens

return ReactModule.memo(function(p1)
	-- upvalues: BuildInspirationConstantsModule (copy), UseTokensFunction (copy), ReactModule (copy), UseBuildInspirationPageScopeModule (copy), CreateBuildInspirationPageTimerModule (copy), FetchBuildInspirationPageModule (copy), SduiPageEntryPoint (copy), AppPage (copy), BuildNavigationParamsModule (copy), CompositionTags (copy)
	local ConfigKey = BuildInspirationConstantsModule.ConfigKey
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.isActive)
	UseBuildInspirationPageScopeModule(ConfigKey, {
		onOpenChat = p1.onOpenChat,
		onOpenSeeMore = p1.onOpenSeeMore
	})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult (copy), UseStateResult2 (copy)
		if p1.isActive and not UseStateResult then
			UseStateResult2(true)
		end
	end, { p1.isActive, UseStateResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), CreateBuildInspirationPageTimerModule (upval), ConfigKey (copy), BuildInspirationConstantsModule (upval)
		return if UseStateResult then CreateBuildInspirationPageTimerModule(ConfigKey, BuildInspirationConstantsModule.SurfaceLoadTimeEventName, "mount") else nil
	end, { ConfigKey, UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), FetchBuildInspirationPageModule (upval)
		if UseMemoResult then
			FetchBuildInspirationPageModule(UseMemoResult)
		end
	end, { UseMemoResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: CreateBuildInspirationPageTimerModule (upval), ConfigKey (copy), BuildInspirationConstantsModule (upval), FetchBuildInspirationPageModule (upval)
		local Refresh = CreateBuildInspirationPageTimerModule(ConfigKey, BuildInspirationConstantsModule.SurfaceLoadTimeEventName, "refresh")
		
		return FetchBuildInspirationPageModule(Refresh, true):finally(Refresh.logRefreshComplete)
	end, { ConfigKey })
	
	return if UseMemoResult == nil then nil else ReactModule.createElement(SduiPageEntryPoint, {
		includeNavigationHeaderBar = false,
		appPage = AppPage.Build,
		routeName = BuildNavigationParamsModule.BUILD_HOME_SCREEN,
		configKey = ConfigKey,
		pageTimer = UseMemoResult,
		refresh = UseResult,
		feedTopMargin = UseTokensResult.Gap.XLarge,
		layoutTag = CompositionTags.Layout.Detail,
		contentTag = CompositionTags.ContentRegion.Body,
		scrollPerformanceIntervalName = BuildInspirationConstantsModule.ScrollPerformanceIntervalName
	})
end)