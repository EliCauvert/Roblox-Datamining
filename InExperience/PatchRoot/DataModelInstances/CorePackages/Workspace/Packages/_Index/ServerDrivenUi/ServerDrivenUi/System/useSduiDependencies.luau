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

return function(p1)
	-- upvalues: useDispatch (ref), useNavigation (ref), useRoactService (ref), roactAnalytics (ref), roactAnalyticsCommonGameEvents (ref), appEventIngestService (ref), appSessionService (ref), reactModule (ref), roactNetworking (ref), localizationRoactContext (ref), useCursor (ref), foundationModule (ref), linkingProtocol (ref), sduiLogger (ref)
	local var1 = useDispatch()
	local var2 = useNavigation()
	local var3 = useRoactService(roactAnalytics)
	local var4 = useRoactService(roactAnalyticsCommonGameEvents)
	local var5 = useRoactService(appEventIngestService)
	local var6 = useRoactService(appSessionService)
	local var7 = reactModule.useRef(var2)
	var7.current = var2
	local var8 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		return var7.current
	end, { var7 })
	local var9 = useRoactService(roactNetworking)
	local var10 = reactModule.useContext(localizationRoactContext)
	local var11 = useCursor(foundationModule.Enums.CursorType.RoundedRect)
	local var12 = reactModule.useMemo(function()
		-- upvalues: var11 (ref)
		return { tileCursor = var11 }
	end, { var11 })
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), var8 (ref), var3 (ref), var4 (ref), var5 (ref), var6 (ref), linkingProtocol (copy), sduiLogger (copy), var12 (ref), p1 (ref), var10 (ref), var9 (ref)
		return {
			dispatch = var1,
			getNavigation = var8,
			appAnalytics = var3,
			gameAnalytics = var4,
			eventIngest = var5,
			sessionService = var6,
			linkingProtocol = linkingProtocol.default,
			logger = sduiLogger,
			cursors = var12,
			instrumentation = p1,
			localization = var10,
			networking = var9
		}
	end, {
		var1, var8, var3, var4, var5, p1, var6, var10, var9, var12
	})
end