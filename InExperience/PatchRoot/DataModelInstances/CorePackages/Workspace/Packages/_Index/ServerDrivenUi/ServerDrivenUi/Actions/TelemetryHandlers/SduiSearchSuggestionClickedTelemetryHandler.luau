local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local SduiCoreSystemModule = require(ServerDrivenUi.Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue
local IsAutocompleteSelectionFreshModule = require(ServerDrivenUi.Actions.isAutocompleteSelectionFresh)
local OpenSearchResultsWithQueryBridgeModule = require(ServerDrivenUi.System.OpenSearchResultsWithQueryBridge)

return function(p1, p2, p3)
	-- upvalues: GetActionTelemetryFieldValueFunction (copy), SduiErrorType (copy), IsAutocompleteSelectionFreshModule (copy), OpenSearchResultsWithQueryBridgeModule (copy)
	local Prefix = GetActionTelemetryFieldValueFunction(p1, p2, "prefix")
	local SearchQuery = GetActionTelemetryFieldValueFunction(p1, p2, "searchQuery")
	local Position = GetActionTelemetryFieldValueFunction(p1, p2, "position")
	
	if typeof(p3.configKey) ~= "string" or typeof(Prefix) ~= "string" or typeof(SearchQuery) ~= "string" or typeof(Position) ~= "number" then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "SearchSuggestionClickedTelemetryHandler",
			message = "Expected string configKey, prefix and searchQuery and numeric position"
		}, p3.appPage)
		
		return
	end
	if IsAutocompleteSelectionFreshModule(p3.configKey, Prefix, Position, SearchQuery) then
		OpenSearchResultsWithQueryBridgeModule.runSuggestionClicked(p3.configKey, Prefix, SearchQuery, Position)
		
		return
	end
end