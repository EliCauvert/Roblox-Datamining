local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local CompositionTags = require(Parent.AppComposition).CompositionTags
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local BuildInspirationConstantsModule = require(script.Parent.BuildInspirationConstants)
local CreateBuildInspirationPageTimerModule = require(script.Parent.createBuildInspirationPageTimer)
local FetchBuildInspirationSeeMorePageModule = require(script.Parent.fetchBuildInspirationSeeMorePage)
local GetBuildInspirationSeeMorePageKeyModule = require(script.Parent.getBuildInspirationSeeMorePageKey)
local UseBuildInspirationPageScopeModule = require(script.Parent.useBuildInspirationPageScope)
local SduiPageEntryPoint = SduiSharedUtilitiesModule.SduiPageEntryPoint

return ReactModule.memo(function(p1)
	-- upvalues: GetBuildInspirationSeeMorePageKeyModule (copy), UseBuildInspirationPageScopeModule (copy), ReactModule (copy), CreateBuildInspirationPageTimerModule (copy), BuildInspirationConstantsModule (copy), FetchBuildInspirationSeeMorePageModule (copy), SduiPageEntryPoint (copy), AppPage (copy), CompositionTags (copy)
	local Sort = p1.sort
	local BuildInspirationSeeMorePageKeyModule = GetBuildInspirationSeeMorePageKeyModule(Sort)
	UseBuildInspirationPageScopeModule(BuildInspirationSeeMorePageKeyModule, { onOpenChat = p1.onOpenChat })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreateBuildInspirationPageTimerModule (upval), BuildInspirationSeeMorePageKeyModule (copy), BuildInspirationConstantsModule (upval)
		return CreateBuildInspirationPageTimerModule(BuildInspirationSeeMorePageKeyModule, BuildInspirationConstantsModule.SeeMoreSurfaceLoadTimeEventName, "mount")
	end, { BuildInspirationSeeMorePageKeyModule })
	ReactModule.useEffect(function()
		-- upvalues: FetchBuildInspirationSeeMorePageModule (upval), Sort (copy), UseMemoResult (copy)
		FetchBuildInspirationSeeMorePageModule(Sort, UseMemoResult)
	end, { Sort, UseMemoResult })
	
	return ReactModule.createElement(SduiPageEntryPoint, {
		includeNavigationHeaderBar = true,
		appPage = AppPage.Build,
		routeName = BuildInspirationConstantsModule.SeeMoreScreen,
		configKey = BuildInspirationSeeMorePageKeyModule,
		pageTimer = UseMemoResult,
		refresh = ReactModule.useCallback(function()
			-- upvalues: CreateBuildInspirationPageTimerModule (upval), BuildInspirationSeeMorePageKeyModule (copy), BuildInspirationConstantsModule (upval), FetchBuildInspirationSeeMorePageModule (upval), Sort (copy)
			local Refresh = CreateBuildInspirationPageTimerModule(BuildInspirationSeeMorePageKeyModule, BuildInspirationConstantsModule.SeeMoreSurfaceLoadTimeEventName, "refresh")
			
			return FetchBuildInspirationSeeMorePageModule(Sort, Refresh, true):finally(Refresh.logRefreshComplete)
		end, { BuildInspirationSeeMorePageKeyModule, Sort }),
		onCloseActivated = p1.onClose,
		layoutTag = CompositionTags.Layout.Detail,
		contentTag = CompositionTags.ContentRegion.Body,
		scrollPerformanceIntervalName = BuildInspirationConstantsModule.SeeMoreScrollPerformanceIntervalName
	})
end)