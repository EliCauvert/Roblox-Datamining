local socialLuaAnalyticsModule = require(script:FindFirstAncestor("UserSearch").Parent.SocialLuaAnalytics)
local diagEventTypes = socialLuaAnalyticsModule.Analytics.Enums.DiagEventTypes
local eventNamesModule = require(script.Parent.EventNames)
local t = {
	Done = game:DefineFastString("UserSearchLoadingTimeDoneStats", "UserSearchLoadingTimeDone"),
	Failed = game:DefineFastString("UserSearchLoadingTimeFailedStats", "UserSearchLoadingTimeFailed")
}
local t_1 = {
	Done = game:DefineFastString("UserSearchLoadingTimeNextPageDoneStats", "UserSearchLoadingTimeNextPageDone"),
	Failed = game:DefineFastString("UserSearchLoadingTimeNextPageFailedStats", "UserSearchLoadingTimeNextPageFailed")
}
local t_2 = {
	Done = "UserSearchLoadedDone",
	Failed = "UserSearchLoadedFailed"
}
local t_3 = {
	Done = "UserSearchLoadedNextPageDone",
	Failed = "UserSearchLoadedNextPageFailed"
}

return {
	[eventNamesModule.PlayerFriendRequest] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("UserSearchPlayerFriendRequestCounter", "UserSearchPlayerFriendRequest")
	},
	[eventNamesModule.PlayerFriendAccept] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("UserSearchPlayerFriendAcceptCounter", "UserSearchPlayerFriendAccept")
	},
	[eventNamesModule.PlayerTileClick] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("UserSearchPlayerTileClickCounter", "UserSearchPlayerTileClick")
	},
	[eventNamesModule.PlayerTileImpressions] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("UserSearchPlayerTileImpressionsCounter", "UserSearchPlayerTileImpressions"),
		count = function(p1)
			return if p1 and p1.playerId then #p1.playerId else 0
		end
	},
	[eventNamesModule.UserSearchLoadingTime] = {
		type = diagEventTypes.Stats,
		name = function(p1)
			-- upvalues: t_1 (ref), t (ref)
			return if p1.nextPage then t_1[p1.status] else t[p1.status]
		end,
		stats = function(p1)
			return p1.loadingTime or 0
		end
	},
	[eventNamesModule.UserSearchLoaded] = {
		type = diagEventTypes.Counter,
		name = function(p1)
			-- upvalues: t_3 (ref), t_2 (ref)
			return if p1.nextPage then t_3[p1.status] else t_2[p1.status]
		end,
		platformSpecificity = socialLuaAnalyticsModule.Analytics.Enums.PlatformSpecificity.BucketsOnly
	}
}