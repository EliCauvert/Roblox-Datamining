local Parent = script:FindFirstAncestor("DiscoveryTypes").Parent
local FFlagSearchOmniAutocompletePage = require(Parent.SharedFlags).FFlagSearchOmniAutocompletePage
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
	SearchGameGrid = "SearchGameGrid",
	SearchText = "SearchText",
	UpsellCard = "UpsellCard",
	Prompts = "Prompts",
	UserSearchGrid = "UserSearchGrid",
	Pills = "Pills",
	ServerDrivenUiV2 = if require(Parent.SharedFlags).FFlagEnableSduiV2HomeInterleave then "SduiV2" else nil,
	SearchPillCarousel = if FFlagSearchOmniAutocompletePage then "SearchPillCarousel" else nil,
	SongCarousel = if FFlagEnableTopSongsSort then "SongCarousel" else nil
}