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

return function(p0, p1, p2) --[[ line: 31 ]]
	-- upvalues: openSearchResultsWithQueryParamsModule (ref), getActionTelemetryFieldValue (ref), sduiErrorType (ref), fFlagLuaAppAddUniverseIdToGameDetailsEvents (ref), sduiOpenSearchResultsWithQueryTelemetryHandlerModule (ref), gameDetailsSubpage (ref), playersService (ref)
	local var5 = openSearchResultsWithQueryParamsModule.resolveSearchQuery(p0)
	
	if var5 == nil or openSearchResultsWithQueryParamsModule.resolveSearchType(p0) == nil then return end
	local var10
	local var6 = getActionTelemetryFieldValue(p0, p1, "subpage")
	local var7 = getActionTelemetryFieldValue(p0, p1, "universeId")
	local var8 = getActionTelemetryFieldValue(p0, p1, "placeId")
	local var9 = getActionTelemetryFieldValue(p0, p1, "eventContext")
	local _ = nil
	
	if typeof(var9) == "string" and var9 ~= "" then
		var10 = var9
	else
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "SduiOpenSearchResultsWithQueryEdpTelemetryHandler",
			message = "Missing or non-string `eventContext` (set on analyticsData for EDP subpage taps)",
			propName = "eventContext"
		}, p2.appPage)
		var10 = ""
	end
	if typeof(var6) ~= "string" or var6 == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "SduiOpenSearchResultsWithQueryEdpTelemetryHandler",
			message = "Missing or non-string `subpage` (set on analyticsData for EDP subpage taps)",
			propName = "subpage"
		}, p2.appPage)
		
		return
	elseif typeof(var8) ~= "string" and typeof(var8) ~= "number" or var8 == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "SduiOpenSearchResultsWithQueryEdpTelemetryHandler",
			propName = "placeId",
			message = `Invalid placeId (expected string or number, got {typeof(var8)})`
		}, p2.appPage)
		var8 = ""
	end
	if fFlagLuaAppAddUniverseIdToGameDetailsEvents and (typeof(var7) ~= "string" and typeof(var7) ~= "number" or var7 == "") then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "SduiOpenSearchResultsWithQueryEdpTelemetryHandler",
			propName = "universeId",
			message = `Invalid universeId (expected string or number, got {typeof(var7)})`
		}, p2.appPage)
		var7 = ""
	end
	sduiOpenSearchResultsWithQueryTelemetryHandlerModule(p0, p1, p2)
	gameDetailsSubpage({
		ctx = "OpenSearchResultsWithQuery",
		uid = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else ""),
		placeId = tostring(var8),
		subpage = var6,
		universeId = if fFlagLuaAppAddUniverseIdToGameDetailsEvents then tostring(var7) else "",
		action = var5
	}, var10)
end