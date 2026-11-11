return {
	Game = "Game",
	CatalogAsset = "CatalogAsset",
	CatalogBundle = "CatalogBundle",
	RecommendedFriend = "RecommendedFriend",
	GameCoPlay = "GameCoPlay",
	TrendingSearches = "TrendingSearches",
	Song = "Song",
	AdLink = if require(script:FindFirstAncestor("DiscoveryTypes").Parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile then "AdLink" else nil
}