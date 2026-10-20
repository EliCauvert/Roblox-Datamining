local DiagEventTypes = require(script:FindFirstAncestor("FriendsCarousel").Parent.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes
local EventNamesModule = require(script.Parent.EventNames)
local FetchNamesModule = require(script.Parent.FetchNames)
local config = {
	Done = game:DefineFastString("AllFriendsCarouselLoadingTimeDoneStats", "AllFriendsCarouselLoadingTimeDone"),
	Failed = game:DefineFastString("AllFriendsCarouselLoadingTimeFailedStats", "AllFriendsCarouselLoadingTimeFailed")
}
local config1 = {
	Done = game:DefineFastString("AllFriendsNextPageCarouselLoadingTimeDoneStats", "AllFriendsNextPageCarouselLoadingTimeDone"),
	Failed = game:DefineFastString("AllFriendsNextPageCarouselLoadingTimeFailedStats", "AllFriendsNextPageCarouselLoadingTimeFailed")
}
local config2 = {
	Done = game:DefineFastString("OnlineFriendsCarouselLoadingTimeDoneStats", "OnlineFriendsCarouselLoadingTimeDone"),
	Failed = game:DefineFastString("OnlineFriendsCarouselLoadingTimeFailedStats", "OnlineFriendsCarouselLoadingTimeFailed")
}
local config3 = {
	Done = game:DefineFastString("OldAllFriendsCarouselLoadingTimeDoneStats", "OldAllFriendsCarouselLoadingTimeDone"),
	Failed = game:DefineFastString("OldAllFriendsCarouselLoadingTimeFailedStats", "OldAllFriendsCarouselLoadingTimeFailed")
}
local FriendsCarouselUILoadingTimeStats = game:DefineFastString("FriendsCarouselUILoadingTimeStats", "FriendsCarouselUILoadingTime")

return {
	[EventNamesModule.CarouselLoadedWithUsers] = {
		name = game:DefineFastString("FriendsCarouselLoadedWithUsers", "FriendsCarouselLoadedWithUsers")
	},
	[EventNamesModule.UserPressed] = {
		name = game:DefineFastString("FriendsCarouselUserPressed", "FriendsCarouselUserPressed")
	},
	[EventNamesModule.RequestFriendship] = {
		name = game:DefineFastString("FriendsCarouselRequestFriendship", "FriendsCarouselRequestFriendship")
	},
	[EventNamesModule.RevokeFriendRequest] = {
		name = game:DefineFastString("FriendsCarouselRevokeFriendRequest", "FriendsCarouselRevokeFriendRequest")
	},
	[EventNamesModule.ViewAllFriends] = {
		name = game:DefineFastString("HomePageNavigationViewAllFriends", "HomePageNavigationFriendsLanding")
	},
	[EventNamesModule.ViewAddFriends] = {
		name = game:DefineFastString("HomePageNavigationViewAddFriends", "AddFriendsHomeEntry")
	},
	[EventNamesModule.PaginatedFriendsCarouselLoadingTime] = {
		type = DiagEventTypes.Stats,
		name = function(p1)
			-- upvalues: FetchNamesModule (copy), config1 (copy), config (copy), config2 (copy)
			return if p1.fetch == FetchNamesModule.AllFriends then if p1.nextPage then config1[p1.status] else config[p1.status] else config2[p1.status]
		end,
		stats = function(p1)
			return p1.loadingTime or 0
		end
	},
	[EventNamesModule.FriendsEndpointLoadingTime] = {
		type = DiagEventTypes.Stats,
		name = function(p1)
			-- upvalues: config3 (copy)
			return config3[p1.status]
		end,
		stats = function(p1)
			return p1.loadingTime or 0
		end
	},
	[EventNamesModule.FriendsCarouselUILoadingTime] = {
		type = DiagEventTypes.Stats,
		name = function(p1): string
			-- upvalues: FriendsCarouselUILoadingTimeStats (copy)
			return `{FriendsCarouselUILoadingTimeStats}_{p1.fetch}`
		end,
		stats = function(p1)
			return p1.loadingTime or 0
		end
	},
	[EventNamesModule.OnlineFriendsRefetchOnPresenceUpdate] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("OnlineFriendsRefetchOnPresenceUpdateCounter", "OnlineFriendsRefetchOnPresenceUpdate")
	},
	[EventNamesModule.OnlineFriendsRefetchOnFriendshipUpdate] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("OnlineFriendsRefetchOnFriendshipUpdateCounter", "OnlineFriendsRefetchOnFriendshipUpdate")
	}
}