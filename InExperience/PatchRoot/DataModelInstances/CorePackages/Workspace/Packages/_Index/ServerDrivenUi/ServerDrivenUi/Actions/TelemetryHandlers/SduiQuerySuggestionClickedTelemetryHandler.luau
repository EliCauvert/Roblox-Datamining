local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local querySuggestionClicked = require(parent.DiscoveryAnalytics).Events.querySuggestionClicked
local getActionTelemetryFieldValue = require(parent.SduiCoreSystem).getActionTelemetryFieldValue
local openSearchResultsWithQueryParamsModule = require(serverDrivenUi.Actions.openSearchResultsWithQueryParams)
local luaAppSduiQuerySuggestionClickedSortPos = game:DefineFastFlag("LuaAppSduiQuerySuggestionClickedSortPos", false)

return function(p0, p1, p2)
	-- upvalues: getActionTelemetryFieldValue (ref), openSearchResultsWithQueryParamsModule (ref), querySuggestionClicked (ref), luaAppSduiQuerySuggestionClickedSortPos (ref)
	local var3 = getActionTelemetryFieldValue(p0, p1, "queryText") or openSearchResultsWithQueryParamsModule.resolveSearchQuery(p0)
	
	if typeof(var3) == "string" and var3 ~= "" then
		local var4 = getActionTelemetryFieldValue(p0, p1, "itemPosition")
		local var5 = getActionTelemetryFieldValue(p0, p1, "collectionPosition")
		local var6 = getActionTelemetryFieldValue(p0, p1, "collectionId")
		querySuggestionClicked(p2.appPage, {
			componentType = "Pill",
			pos = if typeof(var4) == "number" then var4 else nil,
			sortPos = if luaAppSduiQuerySuggestionClickedSortPos then tonumber(var5) elseif typeof(var5) == "number" then var5 else nil,
			sortId = if var6 ~= nil then nil else tostring(var6),
			queryText = var3
		})
		
		return
	end
end