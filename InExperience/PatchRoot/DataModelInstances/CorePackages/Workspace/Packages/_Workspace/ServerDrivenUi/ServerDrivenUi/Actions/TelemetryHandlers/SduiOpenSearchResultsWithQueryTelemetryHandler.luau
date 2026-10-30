local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local OpenSearchResultsWithQueryDeeplinkFunction = require(Parent.DiscoveryAnalytics).Events.openSearchResultsWithQueryDeeplink
local _ = require(Parent.SduiCoreSystem)
local OpenSearchResultsWithQueryParamsModule = require(ServerDrivenUi.Actions.openSearchResultsWithQueryParams)
local FFlagLuaAppSduiSearchAutocomplete = require(Parent.SharedFlags).FFlagLuaAppSduiSearchAutocomplete

return function(p1, _, p2)
	-- upvalues: OpenSearchResultsWithQueryParamsModule (copy), FFlagLuaAppSduiSearchAutocomplete (copy), OpenSearchResultsWithQueryDeeplinkFunction (copy)
	local ResolveSearchQueryResult = OpenSearchResultsWithQueryParamsModule.resolveSearchQuery(p1)
	local ResolveSearchTypeResult = OpenSearchResultsWithQueryParamsModule.resolveSearchType(p1)
	
	if ResolveSearchQueryResult == nil or ResolveSearchTypeResult == nil then return end
	if not FFlagLuaAppSduiSearchAutocomplete or not OpenSearchResultsWithQueryParamsModule.resolveIsAutocompleteSuggestion(p1) then
		OpenSearchResultsWithQueryDeeplinkFunction(p2.appPage, {
			kwd = ResolveSearchQueryResult,
			searchType = ResolveSearchTypeResult
		})
		
		return
	end
end