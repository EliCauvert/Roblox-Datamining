local parent = script:FindFirstAncestor("Moments").Parent
local momentsGetMomentsStoreModule = require(parent.DataHydration.MomentsGetMomentsStore)
local fFlagMomentsPassFeedItemIdToBackendApis = require(parent.SharedFlags).FFlagMomentsPassFeedItemIdToBackendApis

return function(p0, p1) --[[ line: 9 | named "fetchMomentsByIds" ]]
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), momentsGetMomentsStoreModule (ref)
	return if fFlagMomentsPassFeedItemIdToBackendApis then momentsGetMomentsStoreModule(false).getMomentsByIds(p0, p1) else momentsGetMomentsStoreModule(false).getMomentsByIds(p0)
end