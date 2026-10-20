local Parent = script.Parent.Parent
local EventNamesModule = require(script.Parent.EventNames)
local SocialLuaAnalyticsModule = require(Parent.Parent.SocialLuaAnalytics)
local DiagActionListModule = {
	[EventNamesModule.CarouselLoadedWithUsers] = {
		name = game:DefineFastString("PYMKCarouselLoadedWithUsers", "PYMKCarouselLoadedWithUsers")
	},
	[EventNamesModule.UserPressed] = {
		name = game:DefineFastString("PYMKCarouselUserPressed", "PYMKCarouselUserPressed")
	},
	[EventNamesModule.RequestFriendship] = {
		name = game:DefineFastString("PYMKCarouselRequestFriendship", "PYMKCarouselRequestFriendship")
	},
	[EventNamesModule.PYMKCarouselLoadingTime] = {
		type = SocialLuaAnalyticsModule.Analytics.Enums.DiagEventTypes.Stats,
		name = EventNamesModule.PYMKCarouselLoadingTime.rawValue(),
		stats = function(p1)
			return p1.loadingTime or 0
		end,
		platformSpecificity = SocialLuaAnalyticsModule.Analytics.Enums.PlatformSpecificity.BucketsOnly
	}
}

if require(Parent.dependencies).getFFlagPYMKAddFriendsEntry() then
	DiagActionListModule[EventNamesModule.CarouselGenericTileClicked] = {
		name = game:DefineFastString("PYMKCarouselGenericTileClicked", "PYMKCarouselGenericTileClicked")
	}
end
return DiagActionListModule