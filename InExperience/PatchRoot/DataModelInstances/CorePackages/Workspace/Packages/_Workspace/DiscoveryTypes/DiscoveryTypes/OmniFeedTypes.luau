local Parent = script:FindFirstAncestor("DiscoveryTypes").Parent
local FFlagEnableTopSongsSort = require(Parent.SharedFlags).FFlagEnableTopSongsSort

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
	SearchPillCarousel = if require(Parent.SharedFlags).FFlagSearchOmniAutocompletePage then "SearchPillCarousel" else nil,
	SongCarousel = if FFlagEnableTopSongsSort then "SongCarousel" else nil
}