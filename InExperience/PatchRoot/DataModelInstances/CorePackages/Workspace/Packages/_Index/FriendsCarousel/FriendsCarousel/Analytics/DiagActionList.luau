local diagEventTypes = require(script:FindFirstAncestor("FriendsCarousel").Parent.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes
local eventNamesModule = require(script.Parent.EventNames)
local fetchNamesModule = require(script.Parent.FetchNames)
local t = {
	Done = game:DefineFastString("AllFriendsCarouselLoadingTimeDoneStats", "AllFriendsCarouselLoadingTimeDone"),
	Failed = game:DefineFastString("AllFriendsCarouselLoadingTimeFailedStats", "AllFriendsCarouselLoadingTimeFailed")
}
local t_1 = {
	Done = game:DefineFastString("AllFriendsNextPageCarouselLoadingTimeDoneStats", "AllFriendsNextPageCarouselLoadingTimeDone"),
	Failed = game:DefineFastString("AllFriendsNextPageCarouselLoadingTimeFailedStats", "AllFriendsNextPageCarouselLoadingTimeFailed")
}
local t_2 = {
	Done = game:DefineFastString("OnlineFriendsCarouselLoadingTimeDoneStats", "OnlineFriendsCarouselLoadingTimeDone"),
	Failed = game:DefineFastString("OnlineFriendsCarouselLoadingTimeFailedStats", "OnlineFriendsCarouselLoadingTimeFailed")
}
local t_3 = {
	Done = game:DefineFastString("OldAllFriendsCarouselLoadingTimeDoneStats", "OldAllFriendsCarouselLoadingTimeDone"),
	Failed = game:DefineFastString("OldAllFriendsCarouselLoadingTimeFailedStats", "OldAllFriendsCarouselLoadingTimeFailed")
}
local friendsCarouselUILoadingTimeStats = game:DefineFastString("FriendsCarouselUILoadingTimeStats", "FriendsCarouselUILoadingTime")

return {
	[eventNamesModule.CarouselLoadedWithUsers] = {
		name = game:DefineFastString("FriendsCarouselLoadedWithUsers", "FriendsCarouselLoadedWithUsers")
	},
	[eventNamesModule.UserPressed] = {
		name = game:DefineFastString("FriendsCarouselUserPressed", "FriendsCarouselUserPressed")
	},
	[eventNamesModule.RequestFriendship] = {
		name = game:DefineFastString("FriendsCarouselRequestFriendship", "FriendsCarouselRequestFriendship")
	},
	[eventNamesModule.RevokeFriendRequest] = {
		name = game:DefineFastString("FriendsCarouselRevokeFriendRequest", "FriendsCarouselRevokeFriendRequest")
	},
	[eventNamesModule.ViewAllFriends] = {
		name = game:DefineFastString("HomePageNavigationViewAllFriends", "HomePageNavigationFriendsLanding")
	},
	[eventNamesModule.ViewAddFriends] = {
		name = game:DefineFastString("HomePageNavigationViewAddFriends", "AddFriendsHomeEntry")
	},
	[eventNamesModule.PaginatedFriendsCarouselLoadingTime] = {
		type = diagEventTypes.Stats,
		name = function(p0)
			-- upvalues: fetchNamesModule (ref), t_1 (ref), t (ref), t_2 (ref)
			return if p0.fetch == fetchNamesModule.AllFriends then if p0.nextPage then t_1[p0.status] else t[p0.status] else t_2[p0.status]
		end,
		stats = function(p1)
			return p1.loadingTime or 0
		end
	},
	[eventNamesModule.FriendsEndpointLoadingTime] = {
		type = diagEventTypes.Stats,
		name = function(p2)
			-- upvalues: t_3 (ref)
			return t_3[p2.status]
		end,
		stats = function(p3)
			return p3.loadingTime or 0
		end
	},
	[eventNamesModule.FriendsCarouselUILoadingTime] = {
		type = diagEventTypes.Stats,
		name = function(p4)
			-- upvalues: friendsCarouselUILoadingTimeStats (ref)
			return `{friendsCarouselUILoadingTimeStats}_{p4.fetch}`
		end,
		stats = function(p5)
			return p5.loadingTime or 0
		end
	},
	[eventNamesModule.OnlineFriendsRefetchOnPresenceUpdate] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("OnlineFriendsRefetchOnPresenceUpdateCounter", "OnlineFriendsRefetchOnPresenceUpdate")
	},
	[eventNamesModule.OnlineFriendsRefetchOnFriendshipUpdate] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("OnlineFriendsRefetchOnFriendshipUpdateCounter", "OnlineFriendsRefetchOnFriendshipUpdate")
	}
}