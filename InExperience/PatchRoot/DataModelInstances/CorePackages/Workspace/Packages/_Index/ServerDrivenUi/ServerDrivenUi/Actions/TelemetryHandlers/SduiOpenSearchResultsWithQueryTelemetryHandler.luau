local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local openSearchResultsWithQueryDeeplink = require(parent.DiscoveryAnalytics).Events.openSearchResultsWithQueryDeeplink
local _ = require(parent.SduiCoreSystem)
local openSearchResultsWithQueryParamsModule = require(serverDrivenUi.Actions.openSearchResultsWithQueryParams)

return function(p0, _, p1) --[[ line: 18 ]]
	-- upvalues: openSearchResultsWithQueryParamsModule (ref), openSearchResultsWithQueryDeeplink (ref)
	local var2 = openSearchResultsWithQueryParamsModule.resolveSearchQuery(p0)
	local var3 = openSearchResultsWithQueryParamsModule.resolveSearchType(p0)
	
	if var2 == nil or var3 == nil then
		return
	end
	openSearchResultsWithQueryDeeplink(p1.appPage, { kwd = var2, searchType = var3 })
end