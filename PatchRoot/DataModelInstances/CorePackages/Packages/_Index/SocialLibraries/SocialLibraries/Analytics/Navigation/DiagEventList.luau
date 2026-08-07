-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:23 2026 Pacific Standard Time.

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