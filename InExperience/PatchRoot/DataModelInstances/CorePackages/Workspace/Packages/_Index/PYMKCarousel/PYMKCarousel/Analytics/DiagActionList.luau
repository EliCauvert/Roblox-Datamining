local parent = script.Parent.Parent
local parent_1 = parent.Parent
local dependenciesModule = require(parent.dependencies)
local eventNamesModule = require(script.Parent.EventNames)
local socialLuaAnalyticsModule = require(parent_1.SocialLuaAnalytics)
local t = {
	[eventNamesModule.CarouselLoadedWithUsers] = {
		name = game:DefineFastString("PYMKCarouselLoadedWithUsers", "PYMKCarouselLoadedWithUsers")
	},
	[eventNamesModule.UserPressed] = {
		name = game:DefineFastString("PYMKCarouselUserPressed", "PYMKCarouselUserPressed")
	},
	[eventNamesModule.RequestFriendship] = {
		name = game:DefineFastString("PYMKCarouselRequestFriendship", "PYMKCarouselRequestFriendship")
	},
	[eventNamesModule.PYMKCarouselLoadingTime] = {
		type = socialLuaAnalyticsModule.Analytics.Enums.DiagEventTypes.Stats,
		name = eventNamesModule.PYMKCarouselLoadingTime.rawValue(),
		stats = function(p1)
			return p1.loadingTime or 0
		end,
		platformSpecificity = socialLuaAnalyticsModule.Analytics.Enums.PlatformSpecificity.BucketsOnly
	}
}

if dependenciesModule.getFFlagPYMKAddFriendsEntry() then
	t[eventNamesModule.CarouselGenericTileClicked] = {
		name = game:DefineFastString("PYMKCarouselGenericTileClicked", "PYMKCarouselGenericTileClicked")
	}
end
return t