local useAssetFetchStatus = require(script:FindFirstAncestor("MomentsCommon").Parent.RoactUtils).Hooks.useAssetFetchStatus

return function(p0) --[[ line: 21 | named "useImageLoadingState" ]]
	-- upvalues: useAssetFetchStatus (ref)
	return useAssetFetchStatus(p0) == Enum.AssetFetchStatus.Success
end