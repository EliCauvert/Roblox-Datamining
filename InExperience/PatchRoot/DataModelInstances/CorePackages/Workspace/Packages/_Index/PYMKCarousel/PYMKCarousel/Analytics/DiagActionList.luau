local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local EventNamesModule = require(script.Parent.EventNames)
local SocialLuaAnalyticsModule = require(Parent1.SocialLuaAnalytics)
local GetFFlagPYMKAddFriendsEntryFunction = DependenciesModule.getFFlagPYMKAddFriendsEntry
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

if GetFFlagPYMKAddFriendsEntryFunction() then
	DiagActionListModule[EventNamesModule.CarouselGenericTileClicked] = {
		name = game:DefineFastString("PYMKCarouselGenericTileClicked", "PYMKCarouselGenericTileClicked")
	}
end
return DiagActionListModule