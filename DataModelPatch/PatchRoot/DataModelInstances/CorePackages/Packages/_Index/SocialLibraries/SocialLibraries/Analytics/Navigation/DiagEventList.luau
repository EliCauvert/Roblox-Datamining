local EventNamesModule = require(script.Parent.EventNames)
local _ = require(script.Parent.Parent.FireEvent.Types)

return {
	[EventNamesModule.HomePage_AddFriends] = {
		name = game:DefineFastString("SocialNavigationHomePageAddFriends", "HomePageAddFriends")
	},
	[EventNamesModule.HomePage_Carousel_LuaProfile] = {
		name = game:DefineFastString("SocialNavigationHomePageCarouselLuaProfile", "LuaProfileEntryHomePageFriendsCarousel")
	},
	[EventNamesModule.HomePage_Carousel_FriendsLanding] = {
		name = game:DefineFastString("SocialNavigationHomePageFriendsLanding", "HomePageNavigationFriendsLanding")
	},
	[EventNamesModule.MorePage_FriendsLanding] = {
		name = game:DefineFastString("SocialNavigationMorePageFriendsLanding", "MorePageNavigationFriendsLanding")
	}
}