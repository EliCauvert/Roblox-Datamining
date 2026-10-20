local Parent = script:FindFirstAncestor("SduiLandingPage").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local _ = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local CompositionTags = require(Parent.AppComposition).CompositionTags
local SduiPageEntryPoint = SduiSharedUtilitiesModule.SduiPageEntryPoint
local SduiSurfaceLoadTimeTracker = SduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local GetSduiClientPageScopeFunction = SduiSharedUtilitiesModule.getSduiClientPageScope
local UsePageScopeRefFunction = SduiSharedUtilitiesModule.usePageScopeRef
local FetchSduiLandingPageModule = require(script.Parent.fetchSduiLandingPage)
local GetSduiLandingPageKeyModule = require(script.Parent.getSduiLandingPageKey)
local SduiLandingPageConstantsModule = require(script.Parent.SduiLandingPageConstants)
local SduiLandingPageSessionModule = require(script.Parent.SduiLandingPageSession)

local function _(p1, p2)
	local ExtraPropsParam = p1.navigation and p1.navigation.getParam("extraProps")
	
	return p1[p2] or (ExtraPropsParam and ExtraPropsParam[p2] or p1.navigation and p1.navigation.getParam(p2))
end

return ReactModule.memo(function(p1)
	-- upvalues: GetSduiLandingPageKeyModule (copy), UsePageScopeRefFunction (copy), ReactModule (copy), SduiSurfaceLoadTimeTracker (copy), SduiLandingPageConstantsModule (copy), GetSduiClientPageScopeFunction (copy), FetchSduiLandingPageModule (copy), SduiLandingPageSessionModule (copy), SduiPageEntryPoint (copy), AppPage (copy), CompositionTags (copy)
	local ExtraPropsParam = p1.navigation and p1.navigation.getParam("extraProps")
	local PageIdentifier = p1.pageIdentifier or (ExtraPropsParam and ExtraPropsParam.pageIdentifier or p1.navigation and p1.navigation.getParam("pageIdentifier"))
	local SduiLandingPageKeyModule = GetSduiLandingPageKeyModule(PageIdentifier)
	local ExtraPropsParam1 = p1.navigation and p1.navigation.getParam("extraProps")
	local PageTimer = p1.pageTimer or (ExtraPropsParam1 and ExtraPropsParam1.pageTimer or p1.navigation and p1.navigation.getParam("pageTimer"))
	UsePageScopeRefFunction(SduiLandingPageKeyModule)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PageTimer (copy), SduiSurfaceLoadTimeTracker (upval), SduiLandingPageKeyModule (copy), SduiLandingPageConstantsModule (upval), GetSduiClientPageScopeFunction (upval)
		local LoadTimerWithSurfaceLoadTime = PageTimer
		
		if not LoadTimerWithSurfaceLoadTime then
			LoadTimerWithSurfaceLoadTime = SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(SduiLandingPageKeyModule, {
				eventName = SduiLandingPageConstantsModule.SurfaceLoadTimeEventName,
				metadata = { page = "mount" }
			})
			LoadTimerWithSurfaceLoadTime.start("mount")
		end
		GetSduiClientPageScopeFunction(SduiLandingPageKeyModule).set(SduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY, LoadTimerWithSurfaceLoadTime)
		
		return LoadTimerWithSurfaceLoadTime
	end, { SduiLandingPageKeyModule, PageTimer })
	ReactModule.useEffect(function()
		-- upvalues: PageIdentifier (copy), FetchSduiLandingPageModule (upval), SduiLandingPageSessionModule (upval), UseMemoResult (copy)
		if PageIdentifier then
			FetchSduiLandingPageModule(PageIdentifier, SduiLandingPageSessionModule:Get(), UseMemoResult)
		end
	end, { PageIdentifier, UseMemoResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: PageIdentifier (copy), SduiSurfaceLoadTimeTracker (upval), SduiLandingPageKeyModule (copy), SduiLandingPageConstantsModule (upval), FetchSduiLandingPageModule (upval), SduiLandingPageSessionModule (upval)
		if PageIdentifier then
			local LoadTimerWithSurfaceLoadTime = SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(SduiLandingPageKeyModule, {
				eventName = SduiLandingPageConstantsModule.SurfaceLoadTimeEventName,
				metadata = { page = "refresh" }
			})
			LoadTimerWithSurfaceLoadTime.start("refresh")
			FetchSduiLandingPageModule(PageIdentifier, SduiLandingPageSessionModule:Refresh(), LoadTimerWithSurfaceLoadTime, true)
		end
	end, { PageIdentifier, SduiLandingPageKeyModule })
	
	return if PageIdentifier == nil or PageIdentifier == "" then nil else ReactModule.createElement(SduiPageEntryPoint, {
		includeNavigationHeaderBar = true,
		appPage = AppPage.SduiLandingPage,
		configKey = SduiLandingPageKeyModule,
		pageTimer = UseMemoResult,
		refresh = UseResult,
		contentTag = CompositionTags.ContentRegion.Body
	})
end)