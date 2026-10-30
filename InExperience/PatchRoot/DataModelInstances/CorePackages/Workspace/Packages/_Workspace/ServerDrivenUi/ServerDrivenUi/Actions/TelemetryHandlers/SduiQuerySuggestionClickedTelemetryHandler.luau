local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local QuerySuggestionClickedFunction = require(Parent.DiscoveryAnalytics).Events.querySuggestionClicked
local GetActionTelemetryFieldValueFunction = require(Parent.SduiCoreSystem).getActionTelemetryFieldValue
local OpenSearchResultsWithQueryParamsModule = require(ServerDrivenUi.Actions.openSearchResultsWithQueryParams)

return function(p1, p2, p3)
	-- upvalues: GetActionTelemetryFieldValueFunction (copy), OpenSearchResultsWithQueryParamsModule (copy), QuerySuggestionClickedFunction (copy)
	local QueryText = GetActionTelemetryFieldValueFunction(p1, p2, "queryText") or OpenSearchResultsWithQueryParamsModule.resolveSearchQuery(p1)
	
	if typeof(QueryText) == "string" and QueryText ~= "" then
		local ItemPosition = GetActionTelemetryFieldValueFunction(p1, p2, "itemPosition")
		local CollectionPosition = GetActionTelemetryFieldValueFunction(p1, p2, "collectionPosition")
		local CollectionId = GetActionTelemetryFieldValueFunction(p1, p2, "collectionId")
		QuerySuggestionClickedFunction(p3.appPage, {
			componentType = "Pill",
			pos = if typeof(ItemPosition) == "number" then ItemPosition else nil,
			sortPos = tonumber(CollectionPosition),
			sortId = if CollectionId == nil then nil else tostring(CollectionId),
			queryText = QueryText
		})
		
		return
	end
end