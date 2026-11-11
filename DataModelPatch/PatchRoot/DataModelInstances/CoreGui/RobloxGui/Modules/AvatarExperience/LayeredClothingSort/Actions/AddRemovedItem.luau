return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(RemovedAssetId, RemovedAssetTypeId)
	return {
		removedAssetId = RemovedAssetId,
		removedAssetTypeId = RemovedAssetTypeId
	}
end)