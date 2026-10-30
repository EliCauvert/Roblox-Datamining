local CorePackages = game:GetService("CorePackages")
local EventIngestService = game:GetService("EventIngestService")
local HttpService = game:GetService("HttpService")
local SessionService = game:GetService("SessionService")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local SignalsModule = require(CorePackages.Packages.Signals)
local Analytics = require(CorePackages.Workspace.Packages.Analytics).Analytics
local EventIngest = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local RequestInternalWrapperFunction = require(CorePackages.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper
local LinkingProtocol = require(CorePackages.Workspace.Packages.LinkingProtocol).LinkingProtocol
local LocalizationRoactContext = require(CorePackages.Workspace.Packages.Localization).LocalizationRoactContext
local ServiceProvider = require(CorePackages.Workspace.Packages.RoactServices).RoactServices.ServiceProvider
local RoactServiceTagsModule = require(CorePackages.Workspace.Packages.RoactServiceTags)
local StoreContext = require(CorePackages.Packages.RoactRodux).StoreContext
local FeedbackManagerInjectionContext = require(CorePackages.Packages.UIBlox).Core.Control.FeedbackManagerInjectionContext
local GetAppPolicyStoreFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).GetAppPolicyStore
local SduiCoreSystemModule = require(CorePackages.Workspace.Packages.SduiCoreSystem)
local SduiInstrumentation = SduiCoreSystemModule.SduiInstrumentation
local SduiLogger = SduiCoreSystemModule.SduiLogger
local Config = nil

local function getServices()
	-- upvalues: Config (ref), Analytics (copy), EventIngest (copy), EventIngestService (copy), RequestInternalWrapperFunction (copy), HttpService (copy), SessionService (copy)
	if Config == nil then
		Config = {
			appAnalytics = Analytics.new(),
			eventIngest = EventIngest.new(EventIngestService),
			networking = RequestInternalWrapperFunction(HttpService),
			sessionService = SessionService
		}
	end
	return Config
end

local function reportRoduxUnavailable(p1)
	-- upvalues: SduiLogger (copy), SduiCoreSystemModule (copy)
	SduiLogger.reportError(SduiCoreSystemModule.SduiErrors.SduiErrorType.RoduxUnavailable, {
		message = "Dispatched without a Rodux store",
		name = if typeof(p1) == "table" then p1.type else typeof(p1)
	}, "unknown")
end

local function createUnavailableDependency(GameAnalyticsUnavailable, p1)
	-- upvalues: SduiLogger (copy)
	return (setmetatable({}, {
		__index = function(_, p2)
			-- upvalues: SduiLogger (upval), GameAnalyticsUnavailable (copy), p1 (copy)
			return function()
				-- upvalues: SduiLogger (upval), GameAnalyticsUnavailable (upval), p1 (upval), p2 (copy)
				SduiLogger.reportError(GameAnalyticsUnavailable, {
					message = `{p1} is unavailable in experience`,
					name = tostring(p2)
				}, "unknown")
				
				return nil
			end
		end
	}))
end

local Navigation = createUnavailableDependency(SduiCoreSystemModule.SduiErrors.SduiErrorType.NavigationUnavailable, "Navigation")
local GameAnalytics = createUnavailableDependency(SduiCoreSystemModule.SduiErrors.SduiErrorType.GameAnalyticsUnavailable, "GameAnalytics")

local function getNavigation()
	-- upvalues: Navigation (copy)
	return Navigation
end

local function useTriggerFeedback()
	-- upvalues: ReactModule (copy), FeedbackManagerInjectionContext (copy)
	local UseContextResult = ReactModule.useContext(FeedbackManagerInjectionContext)
	local UseRefResult = ReactModule.useRef(UseContextResult)
	UseRefResult.current = UseContextResult
	
	return ReactModule.useCallback(function(p1, p2, p3, p4)
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current(p1, p2, p3, p4)
	end, { UseRefResult })
end

local function useGlobalDependencies()
	-- upvalues: ReactModule (copy), SduiInstrumentation (copy), LocalizationRoactContext (copy), FoundationModule (copy), useTriggerFeedback (copy), getServices (copy), reportRoduxUnavailable (copy), getNavigation (copy), GameAnalytics (copy), LinkingProtocol (copy), SduiLogger (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SduiInstrumentation (upval)
		return SduiInstrumentation.new()
	end, {})
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local UseCursorResult = FoundationModule.Hooks.useCursor(FoundationModule.Enums.CursorType.RoundedRect)
	local UseTriggerFeedbackResult = useTriggerFeedback()
	
	return ReactModule.useMemo(function()
		-- upvalues: getServices (upval), reportRoduxUnavailable (upval), getNavigation (upval), GameAnalytics (upval), LinkingProtocol (upval), SduiLogger (upval), UseCursorResult (copy), UseMemoResult (copy), UseContextResult (copy), UseTriggerFeedbackResult (copy)
		local Services = getServices()
		
		return {
			dispatch = reportRoduxUnavailable,
			getNavigation = getNavigation,
			appAnalytics = Services.appAnalytics,
			gameAnalytics = GameAnalytics,
			eventIngest = Services.eventIngest,
			sessionService = Services.sessionService,
			linkingProtocol = LinkingProtocol.default,
			logger = SduiLogger,
			cursors = { tileCursor = UseCursorResult },
			instrumentation = UseMemoResult,
			localization = UseContextResult,
			networking = Services.networking,
			triggerFeedback = UseTriggerFeedbackResult
		}
	end, {
		UseMemoResult,
		UseContextResult,
		UseCursorResult,
		UseTriggerFeedbackResult
	})
end

local function useScopedDependencies()
	-- upvalues: ReactModule (copy), StoreContext (copy), reportRoduxUnavailable (copy)
	local UseContextResult = ReactModule.useContext(StoreContext)
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: UseContextResult (copy), reportRoduxUnavailable (upval)
		if UseContextResult then
			UseContextResult:dispatch(p1)
			
			return
		else
			reportRoduxUnavailable(p1)
		end
	end, { UseContextResult })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseResult (copy)
		return { dispatch = UseResult }
	end, { UseResult })
end

return ReactModule.memo(function(p1)
	-- upvalues: useGlobalDependencies (copy), useScopedDependencies (copy), ReactModule (copy), SduiCoreSystemModule (copy), FoundationModule (copy), GetAppPolicyStoreFunction (copy), SignalsModule (copy), getServices (copy), ServiceProvider (copy), RoactServiceTagsModule (copy)
	local UseGlobalDependenciesResult = useGlobalDependencies()
	local UseScopedDependenciesResult = useScopedDependencies()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useLayoutEffect(function()
		-- upvalues: SduiCoreSystemModule (upval), UseGlobalDependenciesResult (copy), p1 (copy), UseScopedDependenciesResult (copy), UseStateResult2 (copy)
		local SduiServiceDependenciesStore = SduiCoreSystemModule.getSduiServiceDependenciesStore()
		SduiServiceDependenciesStore.setDependencies(UseGlobalDependenciesResult)
		local SetScopedDependenciesResult = SduiServiceDependenciesStore.setScopedDependencies(p1.surfaceKey, UseScopedDependenciesResult)
		UseStateResult2(true)
		
		return SetScopedDependenciesResult
	end, {
		UseGlobalDependenciesResult,
		UseScopedDependenciesResult,
		p1.surfaceKey
	})
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	ReactModule.useEffect(function()
		-- upvalues: SduiCoreSystemModule (upval), UseTokensResult (copy)
		SduiCoreSystemModule.getSduiTokensStore().setTokens(UseTokensResult)
	end, { UseTokensResult })
	ReactModule.useEffect(function()
		-- upvalues: GetAppPolicyStoreFunction (upval), SignalsModule (upval), SduiCoreSystemModule (upval)
		local GetAppPolicyFunction = GetAppPolicyStoreFunction(false).getAppPolicy
		
		return SignalsModule.createEffect(function(p2)
			-- upvalues: SduiCoreSystemModule (upval), GetAppPolicyFunction (copy)
			SduiCoreSystemModule.getSduiPolicyStore().setAppPolicy(GetAppPolicyFunction(p2))
		end)
	end, {})
	
	if UseStateResult then
		local Services = getServices()
		
		return ReactModule.createElement(ServiceProvider, {
			services = {
				[RoactServiceTagsModule.RoactNetworking] = Services.networking,
				[RoactServiceTagsModule.AppEventIngestService] = Services.eventIngest,
				[RoactServiceTagsModule.RoactAnalytics] = Services.appAnalytics,
				[RoactServiceTagsModule.AppSessionService] = Services.sessionService
			}
		}, {
			Children = ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
		})
	else
		return nil
	end
end)