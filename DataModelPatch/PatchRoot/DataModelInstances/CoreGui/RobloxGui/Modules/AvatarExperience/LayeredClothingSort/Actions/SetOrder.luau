local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(AssetIdToOrderAndAssetTypeId)
	return {
		assetIdToOrderAndAssetTypeId = AssetIdToOrderAndAssetTypeId
	}
end)