return require(script.Parent.Parent.Parent.Rodux).makeActionCreator(script.Name, function(AssetIds)
	return { assetIds = AssetIds }
end)