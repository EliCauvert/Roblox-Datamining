local Parent = script:FindFirstAncestor("Moments").Parent
local MomentsGetMomentsStoreModule = require(Parent.DataHydration.MomentsGetMomentsStore)
local FFlagMomentsPassFeedItemIdToBackendApis = require(Parent.SharedFlags).FFlagMomentsPassFeedItemIdToBackendApis

return function(p1, p2) --[[ Line: 9 | Named "fetchMomentsByIds" ]]
	-- upvalues: FFlagMomentsPassFeedItemIdToBackendApis (copy), MomentsGetMomentsStoreModule (copy)
	return if FFlagMomentsPassFeedItemIdToBackendApis then MomentsGetMomentsStoreModule(false).getMomentsByIds(p1, p2) else MomentsGetMomentsStoreModule(false).getMomentsByIds(p1)
end