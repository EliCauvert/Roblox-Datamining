local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local openSearchResultsWithQueryDeeplink = require(parent.DiscoveryAnalytics).Events.openSearchResultsWithQueryDeeplink
local _ = require(parent.SduiCoreSystem)
local openSearchResultsWithQueryParamsModule = require(serverDrivenUi.Actions.openSearchResultsWithQueryParams)

return function(p1, _, p2)
	-- upvalues: openSearchResultsWithQueryParamsModule (ref), openSearchResultsWithQueryDeeplink (ref)
	local var1 = openSearchResultsWithQueryParamsModule.resolveSearchQuery(p1)
	local var2 = openSearchResultsWithQueryParamsModule.resolveSearchType(p1)
	
	if var1 == nil or var2 == nil then
		return
	end
	openSearchResultsWithQueryDeeplink(p2.appPage, { kwd = var1, searchType = var2 })
end