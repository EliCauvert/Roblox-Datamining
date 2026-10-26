local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local OpenSearchResultsWithQueryBridge = require(Parent.ServerDrivenUi).OpenSearchResultsWithQueryBridge
local OpenSearchResultsWithQueryParamsModule = require(ServerDrivenUi.Actions.openSearchResultsWithQueryParams)
local FFlagLuaAppSduiSearchAutocomplete = require(Parent.SharedFlags).FFlagLuaAppSduiSearchAutocomplete
local IsAutocompleteSelectionFreshModule = require(ServerDrivenUi.Actions.isAutocompleteSelectionFresh)
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue

local function _(p1, Message, PropName)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy)
	p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
		name = SduiActionType.OpenSearchResultsWithQuery,
		message = Message,
		propName = PropName
	}, p1.appPage)
end

return function(p1, p2, p3, _)
	-- upvalues: OpenSearchResultsWithQueryParamsModule (copy), SduiErrorType (copy), SduiActionType (copy), FFlagLuaAppSduiSearchAutocomplete (copy), GetActionTelemetryFieldValueFunction (copy), IsAutocompleteSelectionFreshModule (copy), OpenSearchResultsWithQueryBridge (copy)
	local ResolveSearchQueryResult = OpenSearchResultsWithQueryParamsModule.resolveSearchQuery(p1)
	
	if ResolveSearchQueryResult == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Invalid or missing searchQuery",
			propName = "searchQuery",
			name = SduiActionType.OpenSearchResultsWithQuery
		}, p3.appPage)
		
		return
	end
	local ResolveSearchTypeResult = OpenSearchResultsWithQueryParamsModule.resolveSearchType(p1)
	
	if ResolveSearchTypeResult == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Invalid, unknown, or unsupported searchType",
			propName = "searchType",
			name = SduiActionType.OpenSearchResultsWithQuery
		}, p3.appPage)
		
		return
	end
	if not FFlagLuaAppSduiSearchAutocomplete or not OpenSearchResultsWithQueryParamsModule.resolveIsAutocompleteSuggestion(p1) then
		OpenSearchResultsWithQueryBridge.run(ResolveSearchQueryResult, ResolveSearchTypeResult)
		
		return
	end
	local Prefix = GetActionTelemetryFieldValueFunction(p1, p2, "prefix")
	local Position = GetActionTelemetryFieldValueFunction(p1, p2, "position")
	
	if typeof(Prefix) == "string" and typeof(Position) == "number" and IsAutocompleteSelectionFreshModule(p3.configKey, Prefix, Position, ResolveSearchQueryResult) then
		OpenSearchResultsWithQueryBridge.run(ResolveSearchQueryResult, ResolveSearchTypeResult, true, p3.configKey)
		
		return
	end
end