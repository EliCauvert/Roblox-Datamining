local UseAssetFetchStatusFunction = require(script:FindFirstAncestor("MomentsCommon").Parent.RoactUtils).Hooks.useAssetFetchStatus

return function(p1): boolean
	-- upvalues: UseAssetFetchStatusFunction (copy)
	return UseAssetFetchStatusFunction(p1) == Enum.AssetFetchStatus.Success
end