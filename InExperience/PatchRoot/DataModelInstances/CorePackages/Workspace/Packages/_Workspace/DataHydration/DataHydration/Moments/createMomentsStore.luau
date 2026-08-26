local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(script.Parent.MomentsStoreTypes)
local fetchMomentsByIdsModule = require(script.Parent.Requests.fetchMomentsByIds)
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis

return function(p1)
	-- upvalues: httpClientModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), fetchMomentsByIdsModule (ref)
	p1 = p1 or {}
	
	return {
		getMomentsByIds = function(p2, p3)
			-- upvalues: httpClientModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), fetchMomentsByIdsModule (copy), p1 (ref)
			return httpClientModule.asPromise(if fFlagMomentsPassFeedItemIdToBackendApis then fetchMomentsByIdsModule(p2, p1.network, p3) else fetchMomentsByIdsModule(p2, p1.network))
		end
	}
end