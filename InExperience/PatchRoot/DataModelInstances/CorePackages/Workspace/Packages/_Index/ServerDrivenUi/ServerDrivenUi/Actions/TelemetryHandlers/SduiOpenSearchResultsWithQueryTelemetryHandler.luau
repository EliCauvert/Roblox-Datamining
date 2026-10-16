local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local OpenSearchResultsWithQueryDeeplinkFunction = require(Parent.DiscoveryAnalytics).Events.openSearchResultsWithQueryDeeplink
local _ = require(Parent.SduiCoreSystem)
local OpenSearchResultsWithQueryParamsModule = require(ServerDrivenUi.Actions.openSearchResultsWithQueryParams)

return function(p1, _, p2) --[[ Line: 18 ]]
	-- upvalues: OpenSearchResultsWithQueryParamsModule (copy), OpenSearchResultsWithQueryDeeplinkFunction (copy)
	local ResolveSearchQueryResult = OpenSearchResultsWithQueryParamsModule.resolveSearchQuery(p1)
	local ResolveSearchTypeResult = OpenSearchResultsWithQueryParamsModule.resolveSearchType(p1)
	
	if ResolveSearchQueryResult ~= nil and ResolveSearchTypeResult ~= nil then
		OpenSearchResultsWithQueryDeeplinkFunction(p2.appPage, {
			kwd = ResolveSearchQueryResult,
			searchType = ResolveSearchTypeResult
		})
		
		return
	end
end