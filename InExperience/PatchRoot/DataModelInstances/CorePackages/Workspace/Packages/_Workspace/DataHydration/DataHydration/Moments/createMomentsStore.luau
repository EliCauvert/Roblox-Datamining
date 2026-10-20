local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local _ = require(script.Parent.MomentsStoreTypes)
local FetchMomentsByIdsModule = require(script.Parent.Requests.fetchMomentsByIds)
local FFlagMomentsPassFeedItemIdToBackendApis = require(Parent.SharedFlags).FFlagMomentsPassFeedItemIdToBackendApis

return function(p1)
	-- upvalues: HttpClientModule (copy), FFlagMomentsPassFeedItemIdToBackendApis (copy), FetchMomentsByIdsModule (copy)
	local P0 = p1 or {}
	
	return {
		getMomentsByIds = function(p2, p3)
			-- upvalues: HttpClientModule (upval), FFlagMomentsPassFeedItemIdToBackendApis (upval), FetchMomentsByIdsModule (upval), P0 (copy)
			return HttpClientModule.asPromise(if FFlagMomentsPassFeedItemIdToBackendApis then FetchMomentsByIdsModule(p2, P0.network, p3) else FetchMomentsByIdsModule(p2, P0.network))
		end
	}
end