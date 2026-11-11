local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(LookId, TotalPrice, TotalPremiumPrice, LookAssetInfos, LookBundleInfos, LookType, TotalValue, Curator, Description, ModerationStatus, Name, DisplayProperties, FavoriteCount, IsFavorited, LookDiscounts)
	return {
		lookAssetInfos = LookAssetInfos,
		lookBundleInfos = LookBundleInfos,
		lookId = LookId,
		lookType = LookType,
		totalValue = TotalValue,
		totalPrice = TotalPrice,
		totalPremiumPrice = TotalPremiumPrice,
		curator = Curator,
		description = Description,
		moderationStatus = ModerationStatus,
		name = Name,
		displayProperties = DisplayProperties,
		favoriteCount = FavoriteCount,
		isFavorited = IsFavorited,
		lookDiscounts = LookDiscounts
	}
end)