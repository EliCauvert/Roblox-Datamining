local playersService = game:GetService("Players")
local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local gameDetailsSubpage = require(parent.DiscoveryAnalytics).Events.gameDetailsSubpage
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getActionTelemetryFieldValue = sduiCoreSystemModule.getActionTelemetryFieldValue
local fFlagLuaAppAddUniverseIdToGameDetailsEvents = require(parent.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents
local openSearchResultsWithQueryParamsModule = require(serverDrivenUi.Actions.openSearchResultsWithQueryParams)
local sduiOpenSearchResultsWithQueryTelemetryHandlerModule = require(serverDrivenUi.Actions.TelemetryHandlers.SduiOpenSearchResultsWithQueryTelemetryHandler)

return function(p1, p2, p3)
	-- upvalues: openSearchResultsWithQueryParamsModule (ref), getActionTelemetryFieldValue (ref), sduiErrorType (ref), fFlagLuaAppAddUniverseIdToGameDetailsEvents (ref), sduiOpenSearchResultsWithQueryTelemetryHandlerModule (ref), gameDetailsSubpage (ref), playersService (ref)
	local var1 = openSearchResultsWithQueryParamsModule.resolveSearchQuery(p1)
	
	if var1 == nil or openSearchResultsWithQueryParamsModule.resolveSearchType(p1) == nil then return end
	local var2
	local var3 = getActionTelemetryFieldValue(p1, p2, "subpage")
	local var4 = getActionTelemetryFieldValue(p1, p2, "universeId")
	local var5 = getActionTelemetryFieldValue(p1, p2, "placeId")
	local var6 = getActionTelemetryFieldValue(p1, p2, "eventContext")
	local _ = nil
	
	if typeof(var6) == "string" and var6 ~= "" then
		var2 = var6
	else
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "SduiOpenSearchResultsWithQueryEdpTelemetryHandler",
			message = "Missing or non-string `eventContext` (set on analyticsData for EDP subpage taps)",
			propName = "eventContext"
		}, p3.appPage)
		var2 = ""
	end
	if typeof(var3) ~= "string" or var3 == "" then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "SduiOpenSearchResultsWithQueryEdpTelemetryHandler",
			message = "Missing or non-string `subpage` (set on analyticsData for EDP subpage taps)",
			propName = "subpage"
		}, p3.appPage)
		
		return
	elseif typeof(var5) ~= "string" and typeof(var5) ~= "number" or var5 == "" then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "SduiOpenSearchResultsWithQueryEdpTelemetryHandler",
			propName = "placeId",
			message = `Invalid placeId (expected string or number, got {typeof(var5)})`
		}, p3.appPage)
		var5 = ""
	end
	if fFlagLuaAppAddUniverseIdToGameDetailsEvents and (typeof(var4) ~= "string" and typeof(var4) ~= "number" or var4 == "") then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "SduiOpenSearchResultsWithQueryEdpTelemetryHandler",
			propName = "universeId",
			message = `Invalid universeId (expected string or number, got {typeof(var4)})`
		}, p3.appPage)
		var4 = ""
	end
	sduiOpenSearchResultsWithQueryTelemetryHandlerModule(p1, p2, p3)
	gameDetailsSubpage({
		ctx = "OpenSearchResultsWithQuery",
		uid = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else ""),
		placeId = tostring(var5),
		subpage = var3,
		universeId = if fFlagLuaAppAddUniverseIdToGameDetailsEvents then tostring(var4) else "",
		action = var1
	}, var2)
end