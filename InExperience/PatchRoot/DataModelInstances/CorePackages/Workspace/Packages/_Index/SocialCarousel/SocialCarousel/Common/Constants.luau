local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local FFlagSocialCarouselUpdateVerticalSpacingModule = require(SocialCarousel.Flags.FFlagSocialCarouselUpdateVerticalSpacing)
local FFlagSocialCarouselShareQREnabled = require(SocialCarousel.Parent.SharedFlags).FFlagSocialCarouselShareQREnabled

return {
	RODUX_KEY = "FriendsCarousel",
	LOCALIZATION = {
		FRIENDS_LABEL = "Feature.Friends.Label.Friends",
		FRIENDS_LABEL_WITH_COUNT = "Feature.Home.HeadingFriends",
		ADD_FRIENDS_HEADING = "Feature.Friends.Feature.Friends.Heading.AddFriends",
		FRIENDS_HINT_TITLE = "Feature.SocialTab.Label.AddFriendHintBody",
		FRIENDS_HINT_BODY = "Feature.Friends.Label.FindFriendsHintBody",
		NEW_FRIEND_REQUESTS_MAX = "Feature.Friends.Label.NewFriendRequestsMax",
		FRIENDS_ARE_NOW_CONNECTIONS = "Feature.Friends.Label.FriendsAreNowConnections",
		START_SQUAD_TEXT = "Feature.Squads.Label.StartParty",
		SHARE_QR_HEADING = "Feature.Friends.Action.ShareQR",
		FRIENDS_HINT_BOLD = if FFlagSocialCarouselShareQREnabled then "Feature.Friends.Label.FriendsHintBold" else nil,
		FRIENDS_HINT_PLAIN = if FFlagSocialCarouselShareQREnabled then "Feature.Friends.Label.FriendsHintPlain" else nil
	},
	ANALYTICS = {
		CONTENT_TYPE = "User",
		ACTION_TYPES = {
			OPEN_CONTEXTUAL_MENU = "OpenContextualMenu",
			OPEN_PROFILE = "OpenProfile",
			OPEN_CONSOLE_CONTEXTUAL_MENU = "OpenConsoleContextualMenu",
			OPEN_ADD_FRIENDS = "OpenAddFriends",
			OPEN_SHARE_QR = "OpenShareQR"
		},
		BTN_VALUES = {
			OPEN_PEOPLE_LIST = "openPeopleList",
			ADD_FRIENDS = "AddFriendsButton",
			VIEW_ALL_FRIENDS = "friendsLanding",
			START_SQUAD = "StartSquadButton",
			SHARE_QR = "ShareQRButton"
		},
		SRC = {
			HOMEPAGE_FRIENDS_CAROUSEL = "HomepageFriendsCarousel",
			PARTY_PAGE_UA = "PartyPageUA",
			PARTY_PAGE_IN_EXP = "PartyPageInExp"
		},
		UI_LOADING_EVENTS = {
			EMPTY_HINT = "EmptyHint",
			CAROUSEL_FRIEND = "CarouselFriend",
			ADD_FRIENDS = "AddFriendsBtn",
			START_SQUAD = "StartSquadBtn",
			SHARE_QR = "ShareQRBtn"
		}
	},
	TILE_TEXT_HEIGHT = if FFlagSocialCarouselUpdateVerticalSpacingModule then 38 else 45,
	TILE_TEXT_WIDTH = if FFlagSocialCarouselShareQREnabled then 30 else 125
}