local eventNamesModule = require(script.Parent.EventNames)
local _ = require(script.Parent.Parent.FireEvent.Types)

return {
	[eventNamesModule.HomePage_AddFriends] = {
		name = game:DefineFastString("SocialNavigationHomePageAddFriends", "HomePageAddFriends")
	},
	[eventNamesModule.HomePage_Carousel_LuaProfile] = {
		name = game:DefineFastString("SocialNavigationHomePageCarouselLuaProfile", "LuaProfileEntryHomePageFriendsCarousel")
	},
	[eventNamesModule.HomePage_Carousel_FriendsLanding] = {
		name = game:DefineFastString("SocialNavigationHomePageFriendsLanding", "HomePageNavigationFriendsLanding")
	},
	[eventNamesModule.MorePage_FriendsLanding] = {
		name = game:DefineFastString("SocialNavigationMorePageFriendsLanding", "MorePageNavigationFriendsLanding")
	}
}