return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(AssetTypeId, IsFinished)
	return { assetTypeId = AssetTypeId, isFinished = IsFinished }
end)