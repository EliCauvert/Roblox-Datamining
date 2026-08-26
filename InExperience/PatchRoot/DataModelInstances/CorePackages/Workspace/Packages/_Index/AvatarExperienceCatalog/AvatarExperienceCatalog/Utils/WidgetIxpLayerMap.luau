local appUserLayers = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.ExperimentLayers).AppUserLayers

return {
	TrendingWidget = appUserLayers.AvatarMarketplaceALGOONLYTrendingWidget,
	ThemedAvatarItemsWidget = appUserLayers.AvatarMarketplaceALGOONLYThematicWidget,
	PersonalizedAvatarLooksWidget = appUserLayers.AvatarMarketplaceALGOONLYAvatarWidget,
	PopularAmongFriendsWidget = appUserLayers.AvatarMarketplaceALGOONLYFriendsWidget,
	CurationWidget = appUserLayers.AvatarMarketplaceALGOONLYCurationWidget
}