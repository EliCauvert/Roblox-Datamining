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
	ServerDrivenUiV2 = "SduiV2",
	SearchGameGrid = "SearchGameGrid",
	SearchText = "SearchText",
	UpsellCard = "UpsellCard",
	Prompts = "Prompts",
	UserSearchGrid = "UserSearchGrid",
	Pills = "Pills",
	SearchPillCarousel = if require(parent.SharedFlags).FFlagSearchOmniAutocompletePage then "SearchPillCarousel" else nil,
	SongCarousel = if require(parent.SharedFlags).FFlagEnableTopSongsSort then "SongCarousel" else nil
}