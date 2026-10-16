return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(TryingOn, AssetId, AssetTypeId) --[[ Line: 4 ]]
	return {
		tryingOn = TryingOn,
		assetId = AssetId,
		assetTypeId = AssetTypeId
	}
end)