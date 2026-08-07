local fetchStatusRodux = script:FindFirstAncestor("FetchStatusRodux")
local setFetchStatusModule = require(fetchStatusRodux.SetFetchStatus)
local fetchStatusNamespaceModule = require(fetchStatusRodux.FetchStatusNamespace)
local parent = fetchStatusRodux.Parent
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local _ = require(parent.DiscoveryTypes)
local fFlagLuaAppSortDeeplinkFix = require(parent.SharedFlags).FFlagLuaAppSortDeeplinkFix

local function initializeFetchStatus() --[[ line: 11 ]]
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
	reducer = function(p0, p1) --[[ line: 25 ]]
		-- upvalues: initializeFetchStatus (ref), setFetchStatusModule (ref)
		p0 = p0 or initializeFetchStatus()
		
		if p1.type ~= setFetchStatusModule.name then
			return p0
		end
		assert(p0, "state should always exist, assert for linter")
		local fetchNamespace = p1.fetchNamespace
		local fetchKey = p1.fetchKey
		assert(fetchNamespace, "SetFetchStatus does not have a valid fetch namespace")
		assert(fetchKey, `SetFetchStatus does not have a valid fetch key for namespace {fetchNamespace}`)
		local var5 = p0[fetchNamespace]
		
		if var5 then
			assert(var5, "namespaceState should always exist, assert for linter")
			local cloned = table.clone(var5)
			cloned[fetchKey] = p1.fetchStatus
			local cloned_1 = table.clone(p0)
			cloned_1[fetchNamespace] = cloned
			
			return cloned_1
		end
		warn(`No namespace {fetchNamespace} defined in FetchStatusReducer for action`)
		
		return p0
	end
}