local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local linkingProtocol = require(parent.LinkingProtocol).LinkingProtocol
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local localizationRoactContext = require(parent.Localization).LocalizationRoactContext
local useNavigation = require(parent.Navigation).useNavigation
local foundationModule = require(parent.Foundation)
local useCursor = foundationModule.Hooks.useCursor
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactServiceTagsModule = require(parent.RoactServiceTags)
local appEventIngestService = roactServiceTagsModule.AppEventIngestService
local appSessionService = roactServiceTagsModule.AppSessionService
local roactAnalyticsCommonGameEvents = roactServiceTagsModule.RoactAnalyticsCommonGameEvents
local roactAnalytics = roactServiceTagsModule.RoactAnalytics
local roactNetworking = roactServiceTagsModule.RoactNetworking
local sduiLogger = require(parent.SduiCoreSystem).SduiLogger

return function(p0) --[[ line: 27 | named "useSduiDependencies" ]]
	-- upvalues: useDispatch (ref), useNavigation (ref), useRoactService (ref), roactAnalytics (ref), roactAnalyticsCommonGameEvents (ref), appEventIngestService (ref), appSessionService (ref), reactModule (ref), roactNetworking (ref), localizationRoactContext (ref), useCursor (ref), foundationModule (ref), linkingProtocol (ref), sduiLogger (ref)
	local var3 = useDispatch()
	local var4 = useNavigation()
	local var5 = useRoactService(roactAnalytics)
	local var6 = useRoactService(roactAnalyticsCommonGameEvents)
	local var7 = useRoactService(appEventIngestService)
	local var8 = useRoactService(appSessionService)
	local var9 = reactModule.useRef(var4)
	var9.current = var4
	local var10 = reactModule.useCallback(function() --[[ line: 38 ]]
		-- upvalues: var9 (ref)
		return var9.current
	end, { var9 })
	local var11 = useRoactService(roactNetworking)
	local var12 = reactModule.useContext(localizationRoactContext)
	local var13 = useCursor(foundationModule.Enums.CursorType.RoundedRect)
	local var14 = reactModule.useMemo(function() --[[ line: 45 ]]
		-- upvalues: var13 (ref)
		return { tileCursor = var13 }
	end, { var13 })
	
	return reactModule.useMemo(function() --[[ line: 52 ]]
		-- upvalues: var3 (ref), var10 (ref), var5 (ref), var6 (ref), var7 (ref), var8 (ref), linkingProtocol (copy), sduiLogger (copy), var14 (ref), p0 (ref), var12 (ref), var11 (ref)
		return {
			dispatch = var3,
			getNavigation = var10,
			appAnalytics = var5,
			gameAnalytics = var6,
			eventIngest = var7,
			sessionService = var8,
			linkingProtocol = linkingProtocol.default,
			logger = sduiLogger,
			cursors = var14,
			instrumentation = p0,
			localization = var12,
			networking = var11
		}
	end, {
		var3, var10, var5, var6, var7, p0, var8, var12, var11, var14
	})
end