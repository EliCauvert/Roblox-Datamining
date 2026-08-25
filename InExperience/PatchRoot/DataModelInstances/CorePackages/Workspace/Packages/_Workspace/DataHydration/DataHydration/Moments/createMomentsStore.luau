local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(script.Parent.MomentsStoreTypes)
local fetchMomentsByIdsModule = require(script.Parent.Requests.fetchMomentsByIds)
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis

return function(p0)
	-- upvalues: httpClientModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), fetchMomentsByIdsModule (ref)
	p0 = p0 or {}
	
	return {
		getMomentsByIds = function(p1, p2)
			-- upvalues: httpClientModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), fetchMomentsByIdsModule (copy), p0 (ref)
			return httpClientModule.asPromise(if fFlagMomentsPassFeedItemIdToBackendApis then fetchMomentsByIdsModule(p1, p0.network, p2) else fetchMomentsByIdsModule(p1, p0.network))
		end
	}
end