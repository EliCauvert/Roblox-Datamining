local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local querySuggestionClicked = require(parent.DiscoveryAnalytics).Events.querySuggestionClicked
local getActionTelemetryFieldValue = require(parent.SduiCoreSystem).getActionTelemetryFieldValue
local openSearchResultsWithQueryParamsModule = require(serverDrivenUi.Actions.openSearchResultsWithQueryParams)
local luaAppSduiQuerySuggestionClickedSortPos = game:DefineFastFlag("LuaAppSduiQuerySuggestionClickedSortPos", false)

return function(p1, p2, p3)
	-- upvalues: getActionTelemetryFieldValue (ref), openSearchResultsWithQueryParamsModule (ref), querySuggestionClicked (ref), luaAppSduiQuerySuggestionClickedSortPos (ref)
	local var1 = getActionTelemetryFieldValue(p1, p2, "queryText") or openSearchResultsWithQueryParamsModule.resolveSearchQuery(p1)
	
	if typeof(var1) == "string" and var1 ~= "" then
		local var2 = getActionTelemetryFieldValue(p1, p2, "itemPosition")
		local var3 = getActionTelemetryFieldValue(p1, p2, "collectionPosition")
		local var4 = getActionTelemetryFieldValue(p1, p2, "collectionId")
		querySuggestionClicked(p3.appPage, {
			componentType = "Pill",
			pos = if typeof(var2) == "number" then var2 else nil,
			sortPos = if luaAppSduiQuerySuggestionClickedSortPos then tonumber(var3) elseif typeof(var3) == "number" then var3 else nil,
			sortId = if var4 ~= nil then nil else tostring(var4),
			queryText = var1
		})
		
		return
	end
end