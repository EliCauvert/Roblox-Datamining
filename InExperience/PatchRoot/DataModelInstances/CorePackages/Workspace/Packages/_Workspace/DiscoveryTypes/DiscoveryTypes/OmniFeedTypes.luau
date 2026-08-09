local parent = script:FindFirstAncestor("DiscoveryTypes").Parent

return {
	GenreExplorer = "GenreExplorerLabel",
	Carousel = "Carousel",
	AvatarCarousel = "AvatarCarousel",
	UserInfo = "UserInfo",
	FriendCarousel = "FriendCarousel",
	FriendRecommendationCarousel = "FriendRecommendationCarousel",
	HomeGameGrid = "SortlessGrid",
	JoinYourFriendsCarousel = "JoinYourFriendsCarousel",
	ServerDrivenUi = "sdui",
	SearchGameGrid = "SearchGameGrid",
	SearchText = "SearchText",
	UpsellCard = "UpsellCard",
	Prompts = "Prompts",
	UserSearchGrid = "UserSearchGrid",
	Pills = "Pills",
	ServerDrivenUiV2 = if require(parent.SharedFlags).FFlagEnableSduiV2HomeInterleave then "SduiV2" else nil,
	SearchPillCarousel = if require(parent.SharedFlags).FFlagSearchOmniAutocompletePage then "SearchPillCarousel" else nil,
	SongCarousel = if require(parent.SharedFlags).FFlagEnableTopSongsSort then "SongCarousel" else nil
}