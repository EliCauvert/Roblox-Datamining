local useAssetFetchStatus = require(script:FindFirstAncestor("MomentsCommon").Parent.RoactUtils).Hooks.useAssetFetchStatus

return function(p1)
	-- upvalues: useAssetFetchStatus (ref)
	return useAssetFetchStatus(p1) == Enum.AssetFetchStatus.Success
end