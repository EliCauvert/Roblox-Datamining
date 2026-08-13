local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local querySuggestionClicked = require(parent.DiscoveryAnalytics).Events.querySuggestionClicked
local getActionTelemetryFieldValue = require(parent.SduiCoreSystem).getActionTelemetryFieldValue
local openSearchResultsWithQueryParamsModule = require(serverDrivenUi.Actions.openSearchResultsWithQueryParams)

return function(p0, p1, p2) --[[ line: 20 ]]
	-- upvalues: getActionTelemetryFieldValue (ref), openSearchResultsWithQueryParamsModule (ref), querySuggestionClicked (ref)
	local var2 = getActionTelemetryFieldValue(p0, p1, "queryText") or openSearchResultsWithQueryParamsModule.resolveSearchQuery(p0)
	
	if typeof(var2) == "string" and var2 ~= "" then
		local var3 = getActionTelemetryFieldValue(p0, p1, "itemPosition")
		local var4 = getActionTelemetryFieldValue(p0, p1, "collectionPosition")
		local var5 = getActionTelemetryFieldValue(p0, p1, "collectionId")
		querySuggestionClicked(p2.appPage, {
			componentType = "Pill",
			pos = if typeof(var3) == "number" then var3 else nil,
			sortPos = if typeof(var4) == "number" then var4 else nil,
			sortId = if var5 ~= nil then nil else tostring(var5),
			queryText = var2
		})
		
		return
	end
end