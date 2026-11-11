return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(PromptType, AssetInstance, AssetType, Guid, Scopes)
	return {
		promptInfo = {
			promptType = PromptType,
			assetInstance = AssetInstance,
			assetType = AssetType,
			guid = Guid,
			scopes = Scopes
		}
	}
end)