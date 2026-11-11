local AppUserLayers = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.ExperimentLayers).AppUserLayers

return {
	TrendingWidget = AppUserLayers.AvatarMarketplaceALGOONLYTrendingWidget,
	ThemedAvatarItemsWidget = AppUserLayers.AvatarMarketplaceALGOONLYThematicWidget,
	PersonalizedAvatarLooksWidget = AppUserLayers.AvatarMarketplaceALGOONLYAvatarWidget,
	PopularAmongFriendsWidget = AppUserLayers.AvatarMarketplaceALGOONLYFriendsWidget,
	CurationWidget = AppUserLayers.AvatarMarketplaceALGOONLYCurationWidget
}