local MomentsGetMomentsStoreModule = require(script:FindFirstAncestor("Moments").Parent.DataHydration.MomentsGetMomentsStore)

return function(p1)
	-- upvalues: MomentsGetMomentsStoreModule (copy)
	return MomentsGetMomentsStoreModule(false).getMomentsByIds(p1)
end