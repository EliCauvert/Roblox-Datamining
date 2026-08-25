local useAssetFetchStatus = require(script:FindFirstAncestor("MomentsCommon").Parent.RoactUtils).Hooks.useAssetFetchStatus

return function(p0)
	-- upvalues: useAssetFetchStatus (ref)
	return useAssetFetchStatus(p0) == Enum.AssetFetchStatus.Success
end