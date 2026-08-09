local momentsGetMomentsStoreModule = require(script:FindFirstAncestor("Moments").Parent.DataHydration.MomentsGetMomentsStore)

return function(p0) --[[ line: 7 | named "fetchMomentsByIds" ]]
	-- upvalues: momentsGetMomentsStoreModule (ref)
	return momentsGetMomentsStoreModule(false).getMomentsByIds(p0)
end