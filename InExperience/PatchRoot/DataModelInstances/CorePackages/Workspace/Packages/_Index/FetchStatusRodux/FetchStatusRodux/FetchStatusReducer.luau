local fetchStatusRodux = script:FindFirstAncestor("FetchStatusRodux")
local setFetchStatusModule = require(fetchStatusRodux.SetFetchStatus)
local fetchStatusNamespaceModule = require(fetchStatusRodux.FetchStatusNamespace)
local parent = fetchStatusRodux.Parent
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local _ = require(parent.DiscoveryTypes)
local fFlagLuaAppSortDeeplinkFix = require(parent.SharedFlags).FFlagLuaAppSortDeeplinkFix

local function initializeFetchStatus()
	-- upvalues: fetchStatusNamespaceModule (ref), retrievalStatus (ref), fFlagLuaAppSortDeeplinkFix (ref)
	return {
		[fetchStatusNamespaceModule.GameSortToken] = {
			Games = retrievalStatus.NotStarted,
			HomeGames = retrievalStatus.NotStarted,
			GamesSeeAll = retrievalStatus.NotStarted,
			GamesList = if fFlagLuaAppSortDeeplinkFix then retrievalStatus.NotStarted else nil
		},
		[fetchStatusNamespaceModule.GameSorts] = {},
		[fetchStatusNamespaceModule.OmniRecommendations] = {},
		[fetchStatusNamespaceModule.SearchLandingPage] = {}
	}
end

return {
	key = "FetchStatusKey",
	reducer = function(p1, p2)
		-- upvalues: initializeFetchStatus (ref), setFetchStatusModule (ref)
		p1 = p1 or initializeFetchStatus()
		
		if p2.type ~= setFetchStatusModule.name then
			return p1
		end
		assert(p1, "state should always exist, assert for linter")
		local fetchNamespace = p2.fetchNamespace
		local fetchKey = p2.fetchKey
		assert(fetchNamespace, "SetFetchStatus does not have a valid fetch namespace")
		assert(fetchKey, `SetFetchStatus does not have a valid fetch key for namespace {fetchNamespace}`)
		local var1 = p1[fetchNamespace]
		
		if var1 then
			assert(var1, "namespaceState should always exist, assert for linter")
			local cloned = table.clone(var1)
			cloned[fetchKey] = p2.fetchStatus
			local cloned_1 = table.clone(p1)
			cloned_1[fetchNamespace] = cloned
			
			return cloned_1
		end
		warn(`No namespace {fetchNamespace} defined in FetchStatusReducer for action`)
		
		return p1
	end
}