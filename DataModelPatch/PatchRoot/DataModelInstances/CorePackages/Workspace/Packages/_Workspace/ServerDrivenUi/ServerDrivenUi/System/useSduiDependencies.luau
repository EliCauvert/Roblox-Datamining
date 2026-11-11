local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local LinkingProtocol = require(Parent.LinkingProtocol).LinkingProtocol
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local LocalizationRoactContext = require(Parent.Localization).LocalizationRoactContext
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local FoundationModule = require(Parent.Foundation)
local UseCursorFunction = FoundationModule.Hooks.useCursor
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local AppSessionService = RoactServiceTagsModule.AppSessionService
local RoactAnalyticsCommonGameEvents = RoactServiceTagsModule.RoactAnalyticsCommonGameEvents
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local SduiLogger = require(Parent.SduiCoreSystem).SduiLogger

return function(Instrumentation)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseRoactServiceFunction (copy), RoactAnalytics (copy), RoactAnalyticsCommonGameEvents (copy), AppEventIngestService (copy), AppSessionService (copy), ReactModule (copy), RoactNetworking (copy), LocalizationRoactContext (copy), UseCursorFunction (copy), FoundationModule (copy), LinkingProtocol (copy), SduiLogger (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalyticsCommonGameEvents)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult3 = UseRoactServiceFunction(AppSessionService)
	local UseRefResult = ReactModule.useRef(UseNavigationResult)
	UseRefResult.current = UseNavigationResult
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end, { UseRefResult })
	local UseRoactServiceResult4 = UseRoactServiceFunction(RoactNetworking)
	local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
	local UseCursorResult = UseCursorFunction(FoundationModule.Enums.CursorType.RoundedRect)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseCursorResult (copy)
		return { tileCursor = UseCursorResult }
	end, { UseCursorResult })
	
	return (ReactModule.useMemo(function()
		-- upvalues: UseDispatchResult (copy), UseResult (copy), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), UseRoactServiceResult2 (copy), UseRoactServiceResult3 (copy), LinkingProtocol (upval), SduiLogger (upval), UseMemoResult (copy), Instrumentation (copy), UseContextResult (copy), UseRoactServiceResult4 (copy)
		return {
			dispatch = UseDispatchResult,
			getNavigation = UseResult,
			appAnalytics = UseRoactServiceResult,
			gameAnalytics = UseRoactServiceResult1,
			eventIngest = UseRoactServiceResult2,
			sessionService = UseRoactServiceResult3,
			linkingProtocol = LinkingProtocol.default,
			logger = SduiLogger,
			cursors = UseMemoResult,
			instrumentation = Instrumentation,
			localization = UseContextResult,
			networking = UseRoactServiceResult4
		}
	end, {
		UseDispatchResult, UseResult, UseRoactServiceResult, UseRoactServiceResult1,
		UseRoactServiceResult2, Instrumentation, UseRoactServiceResult3,
		UseContextResult, UseRoactServiceResult4, UseMemoResult
	}))
end