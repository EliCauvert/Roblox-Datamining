local MomentsGetMomentsStoreModule = require(script:FindFirstAncestor("Moments").Parent.DataHydration.MomentsGetMomentsStore)

return function(p1, p2)
	-- upvalues: MomentsGetMomentsStoreModule (copy)
	return MomentsGetMomentsStoreModule(false).getMomentsByIds(p1, p2)
end