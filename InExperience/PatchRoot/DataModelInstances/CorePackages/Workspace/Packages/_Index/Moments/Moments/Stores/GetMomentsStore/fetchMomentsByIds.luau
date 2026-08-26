local parent = script:FindFirstAncestor("Moments").Parent
local momentsGetMomentsStoreModule = require(parent.DataHydration.MomentsGetMomentsStore)
local fFlagMomentsPassFeedItemIdToBackendApis = require(parent.SharedFlags).FFlagMomentsPassFeedItemIdToBackendApis

return function(p1, p2)
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), momentsGetMomentsStoreModule (ref)
	return if fFlagMomentsPassFeedItemIdToBackendApis then momentsGetMomentsStoreModule(false).getMomentsByIds(p1, p2) else momentsGetMomentsStoreModule(false).getMomentsByIds(p1)
end