local FetchStatusRodux = script:FindFirstAncestor("FetchStatusRodux")
local SetFetchStatusModule = require(FetchStatusRodux.SetFetchStatus)
local FetchStatusNamespaceModule = require(FetchStatusRodux.FetchStatusNamespace)
local Parent = FetchStatusRodux.Parent
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local _ = require(Parent.DiscoveryTypes)
local FFlagLuaAppSortDeeplinkFix = require(Parent.SharedFlags).FFlagLuaAppSortDeeplinkFix

local function initializeFetchStatus() --[[ Line: 11 ]]
	-- upvalues: FetchStatusNamespaceModule (copy), RetrievalStatus (copy), FFlagLuaAppSortDeeplinkFix (copy)
	return {
		[FetchStatusNamespaceModule.GameSortToken] = {
			Games = RetrievalStatus.NotStarted,
			HomeGames = RetrievalStatus.NotStarted,
			GamesSeeAll = RetrievalStatus.NotStarted,
			GamesList = if FFlagLuaAppSortDeeplinkFix then RetrievalStatus.NotStarted else nil
		},
		[FetchStatusNamespaceModule.GameSorts] = {},
		[FetchStatusNamespaceModule.OmniRecommendations] = {},
		[FetchStatusNamespaceModule.SearchLandingPage] = {}
	}
end

return {
	key = "FetchStatusKey",
	reducer = function(p1, p2) --[[ Line: 25 ]]
		-- upvalues: initializeFetchStatus (copy), SetFetchStatusModule (copy)
		local Tbl1 = p1 or initializeFetchStatus()
		
		if p2.type ~= SetFetchStatusModule.name then
			return Tbl1
		end
		assert(Tbl1, "state should always exist, assert for linter")
		local FetchNamespace = p2.fetchNamespace
		local FetchKey = p2.fetchKey
		assert(FetchNamespace, "SetFetchStatus does not have a valid fetch namespace")
		assert(FetchKey, `SetFetchStatus does not have a valid fetch key for namespace {FetchNamespace}`)
		local Tbl = Tbl1[FetchNamespace]
		
		if Tbl then
			assert(Tbl, "namespaceState should always exist, assert for linter")
			local Copy = table.clone(Tbl)
			Copy[FetchKey] = p2.fetchStatus
			local Copy1 = table.clone(Tbl1)
			Copy1[FetchNamespace] = Copy
			
			return Copy1
		else
			warn(`No namespace {FetchNamespace} defined in FetchStatusReducer for action`)
			
			return Tbl1
		end
	end
}