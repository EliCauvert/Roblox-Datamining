local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("UserSearch").Parent.SocialLuaAnalytics)
local DiagEventTypes = SocialLuaAnalyticsModule.Analytics.Enums.DiagEventTypes
local EventNamesModule = require(script.Parent.EventNames)
local config = {
	Done = game:DefineFastString("UserSearchLoadingTimeDoneStats", "UserSearchLoadingTimeDone"),
	Failed = game:DefineFastString("UserSearchLoadingTimeFailedStats", "UserSearchLoadingTimeFailed")
}
local config1 = {
	Done = game:DefineFastString("UserSearchLoadingTimeNextPageDoneStats", "UserSearchLoadingTimeNextPageDone"),
	Failed = game:DefineFastString("UserSearchLoadingTimeNextPageFailedStats", "UserSearchLoadingTimeNextPageFailed")
}
local config2 = {
	Done = "UserSearchLoadedDone",
	Failed = "UserSearchLoadedFailed"
}
local config3 = {
	Done = "UserSearchLoadedNextPageDone",
	Failed = "UserSearchLoadedNextPageFailed"
}

return {
	[EventNamesModule.PlayerFriendRequest] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("UserSearchPlayerFriendRequestCounter", "UserSearchPlayerFriendRequest")
	},
	[EventNamesModule.PlayerFriendAccept] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("UserSearchPlayerFriendAcceptCounter", "UserSearchPlayerFriendAccept")
	},
	[EventNamesModule.PlayerTileClick] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("UserSearchPlayerTileClickCounter", "UserSearchPlayerTileClick")
	},
	[EventNamesModule.PlayerTileImpressions] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("UserSearchPlayerTileImpressionsCounter", "UserSearchPlayerTileImpressions"),
		count = function(p1): number
			return if p1 and p1.playerId then #p1.playerId else 0
		end
	},
	[EventNamesModule.UserSearchLoadingTime] = {
		type = DiagEventTypes.Stats,
		name = function(p1)
			-- upvalues: config1 (copy), config (copy)
			return if p1.nextPage then config1[p1.status] else config[p1.status]
		end,
		stats = function(p1)
			return p1.loadingTime or 0
		end
	},
	[EventNamesModule.UserSearchLoaded] = {
		type = DiagEventTypes.Counter,
		name = function(p1)
			-- upvalues: config3 (copy), config2 (copy)
			return if p1.nextPage then config3[p1.status] else config2[p1.status]
		end,
		platformSpecificity = SocialLuaAnalyticsModule.Analytics.Enums.PlatformSpecificity.BucketsOnly
	}
}