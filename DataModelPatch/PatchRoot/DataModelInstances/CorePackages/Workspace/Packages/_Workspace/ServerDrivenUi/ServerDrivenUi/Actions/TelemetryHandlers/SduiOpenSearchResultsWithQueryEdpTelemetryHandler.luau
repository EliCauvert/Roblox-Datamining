local Players = game:GetService("Players")
local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local GameDetailsSubpageFunction = require(Parent.DiscoveryAnalytics).Events.gameDetailsSubpage
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue
local FFlagLuaAppAddUniverseIdToGameDetailsEvents = require(Parent.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents
local OpenSearchResultsWithQueryParamsModule = require(ServerDrivenUi.Actions.openSearchResultsWithQueryParams)
local SduiOpenSearchResultsWithQueryTelemetryHandlerModule = require(ServerDrivenUi.Actions.TelemetryHandlers.SduiOpenSearchResultsWithQueryTelemetryHandler)

return function(p1, p2, p3)
	-- upvalues: OpenSearchResultsWithQueryParamsModule (copy), GetActionTelemetryFieldValueFunction (copy), SduiErrorType (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy), SduiOpenSearchResultsWithQueryTelemetryHandlerModule (copy), GameDetailsSubpageFunction (copy), Players (copy)
	local ResolveSearchQueryResult = OpenSearchResultsWithQueryParamsModule.resolveSearchQuery(p1)
	local ResolveSearchTypeResult = OpenSearchResultsWithQueryParamsModule.resolveSearchType(p1)
	
	if ResolveSearchQueryResult == nil or ResolveSearchTypeResult == nil then return end
	local Subpage = GetActionTelemetryFieldValueFunction(p1, p2, "subpage")
	local UniverseId = GetActionTelemetryFieldValueFunction(p1, p2, "universeId")
	local PlaceId = GetActionTelemetryFieldValueFunction(p1, p2, "placeId")
	local EventContext = GetActionTelemetryFieldValueFunction(p1, p2, "eventContext")
	local v1 = nil
	
	if typeof(EventContext) == "string" and EventContext ~= "" then
		v1 = EventContext
	else
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "SduiOpenSearchResultsWithQueryEdpTelemetryHandler",
			message = "Missing or non-string `eventContext` (set on analyticsData for EDP subpage taps)",
			propName = "eventContext"
		}, p3.appPage)
		v1 = ""
	end
	if typeof(Subpage) ~= "string" or Subpage == "" then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "SduiOpenSearchResultsWithQueryEdpTelemetryHandler",
			message = "Missing or non-string `subpage` (set on analyticsData for EDP subpage taps)",
			propName = "subpage"
		}, p3.appPage)
		
		return
	end
	if typeof(PlaceId) ~= "string" and typeof(PlaceId) ~= "number" or PlaceId == "" then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "SduiOpenSearchResultsWithQueryEdpTelemetryHandler",
			propName = "placeId",
			message = `Invalid placeId (expected string or number, got {typeof(PlaceId)})`
		}, p3.appPage)
		PlaceId = ""
	end
	if FFlagLuaAppAddUniverseIdToGameDetailsEvents and (typeof(UniverseId) ~= "string" and typeof(UniverseId) ~= "number" or UniverseId == "") then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "SduiOpenSearchResultsWithQueryEdpTelemetryHandler",
			propName = "universeId",
			message = `Invalid universeId (expected string or number, got {typeof(UniverseId)})`
		}, p3.appPage)
		UniverseId = ""
	end
	SduiOpenSearchResultsWithQueryTelemetryHandlerModule(p1, p2, p3)
	GameDetailsSubpageFunction({
		ctx = "OpenSearchResultsWithQuery",
		uid = tostring(if Players.LocalPlayer then Players.LocalPlayer.UserId else ""),
		placeId = tostring(PlaceId),
		subpage = Subpage,
		universeId = if FFlagLuaAppAddUniverseIdToGameDetailsEvents then tostring(UniverseId) else "",
		action = ResolveSearchQueryResult
	}, v1)
end