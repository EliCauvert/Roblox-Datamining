return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ViewingDetails, AssetId) --[[ Line: 4 ]]
	return { viewingDetails = ViewingDetails, assetId = AssetId }
end)