local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local LinkingProtocol = require(Parent.LinkingProtocol).LinkingProtocol
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local LocalizationRoactContext = require(Parent.Localization).LocalizationRoactContext
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local FoundationModule = require(Parent.Foundation)
local UseCursorFunction = FoundationModule.Hooks.useCursor
local FeedbackManagerInjectionContext = require(Parent.UIBlox).Core.Control.FeedbackManagerInjectionContext
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local AppSessionService = RoactServiceTagsModule.AppSessionService
local RoactAnalyticsCommonGameEvents = RoactServiceTagsModule.RoactAnalyticsCommonGameEvents
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local SduiLogger = require(Parent.SduiCoreSystem).SduiLogger
local FFlagLuaAppSduiGameTileFeedback = require(Parent.SharedFlags).FFlagLuaAppSduiGameTileFeedback

return function(Instrumentation)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseRoactServiceFunction (copy), RoactAnalytics (copy), RoactAnalyticsCommonGameEvents (copy), AppEventIngestService (copy), AppSessionService (copy), ReactModule (copy), RoactNetworking (copy), LocalizationRoactContext (copy), UseCursorFunction (copy), FoundationModule (copy), FFlagLuaAppSduiGameTileFeedback (copy), FeedbackManagerInjectionContext (copy), LinkingProtocol (copy), SduiLogger (copy)
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
	local UseResult1 = nil
	
	if FFlagLuaAppSduiGameTileFeedback then
		local UseContextResult1 = ReactModule.useContext(FeedbackManagerInjectionContext)
		local UseRefResult1 = ReactModule.useRef(UseContextResult1)
		UseRefResult1.current = UseContextResult1
		UseResult1 = ReactModule.useCallback(function(p1, p2, p3, p4)
			-- upvalues: UseRefResult1 (copy)
			return UseRefResult1.current(p1, p2, p3, p4)
		end, { UseRefResult1 })
	end
	return (ReactModule.useMemo(function()
		-- upvalues: UseDispatchResult (copy), UseResult (copy), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), UseRoactServiceResult2 (copy), UseRoactServiceResult3 (copy), LinkingProtocol (upval), SduiLogger (upval), UseMemoResult (copy), Instrumentation (copy), UseContextResult (copy), UseRoactServiceResult4 (copy), FFlagLuaAppSduiGameTileFeedback (upval), UseResult1 (ref)
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
			networking = UseRoactServiceResult4,
			triggerFeedback = if FFlagLuaAppSduiGameTileFeedback then UseResult1 else nil
		}
	end, {
		UseDispatchResult, UseResult, UseRoactServiceResult, UseRoactServiceResult1,
		UseRoactServiceResult2, Instrumentation, UseRoactServiceResult3,
		UseContextResult, UseRoactServiceResult4, UseMemoResult,
		if FFlagLuaAppSduiGameTileFeedback then UseResult1 else nil
	}))
end