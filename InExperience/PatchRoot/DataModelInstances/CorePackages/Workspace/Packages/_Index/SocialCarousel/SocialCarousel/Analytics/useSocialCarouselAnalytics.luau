local httpService = game:GetService("HttpService")
local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useSocialCarouselContextModule = require(socialCarousel.Contexts.useSocialCarouselContext)
local initializeSocialCarouselAnalyticsModule = require(socialCarousel.Analytics.initializeSocialCarouselAnalytics)
local eventNamesModule = require(socialCarousel.Analytics.EventNames)
local tile = require(socialCarousel.Common.Enums).Tile
local _ = require(socialCarousel.Common.Types)
local retrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local fFlagSocialCarouselEnableUserSeenEvents = require(socialCarousel.Flags).FFlagSocialCarouselEnableUserSeenEvents
local fFlagLuaAppAddSortDataToSocialCarouselClicks = require(parent.SharedFlags).FFlagLuaAppAddSortDataToSocialCarouselClicks
local fFlagSocialCarouselShareQREnabled = require(parent.SharedFlags).FFlagSocialCarouselShareQREnabled

return function() --[[ line: 22 ]]
	-- upvalues: fFlagLuaAppAddSortDataToSocialCarouselClicks (ref), useSocialCarouselContextModule (ref), reactModule (ref), initializeSocialCarouselAnalyticsModule (ref), eventNamesModule (ref), tile (ref), httpService (ref), fFlagSocialCarouselEnableUserSeenEvents (ref), fFlagSocialCarouselShareQREnabled (ref), retrievalStatus (ref)
	local var7, var8
	local _ = nil
	local _ = nil
	
	if fFlagLuaAppAddSortDataToSocialCarouselClicks then
		var7 = useSocialCarouselContextModule()
		var8 = reactModule.useMemo(function() --[[ line: 28 ]]
			-- upvalues: var7 (write), initializeSocialCarouselAnalyticsModule (copy)
			local sortAnalyticsData = var7.sortAnalyticsData
			
			return initializeSocialCarouselAnalyticsModule({
				infoForAllEvents = {
					rowNumber = 1,
					sortIndex = if sortAnalyticsData then sortAnalyticsData.sortIndex else nil,
					sortId = if sortAnalyticsData then sortAnalyticsData.sortId else nil,
					appPage = if sortAnalyticsData then sortAnalyticsData.appPage else nil,
					feedRowNumber = if sortAnalyticsData then sortAnalyticsData.startRow else nil
				}
			})
		end, { var7.sortAnalyticsData })
	else
		var8 = initializeSocialCarouselAnalyticsModule()
		var7 = useSocialCarouselContextModule()
	end
	local source = var7.source or ""
	
	return {
		userPressed = reactModule.useCallback(function(p0, p1) --[[ line: 53 ]]
			-- upvalues: var8 (write), eventNamesModule (copy), fFlagLuaAppAddSortDataToSocialCarouselClicks (copy), tile (copy), source (ref), httpService (copy)
			var8.fireAnalyticsEvent(eventNamesModule.UserPressed, {
				presence = if p0.presence then p0.presence.userPresenceType else "Offline",
				absolutePosition = p1.absolutePosition,
				positionInRow = if fFlagLuaAppAddSortDataToSocialCarouselClicks then p1.absolutePosition else nil,
				friendId = p0.id,
				friendStatus = if p0.tileType == tile.Friend then Enum.FriendStatus.Friend else Enum.FriendStatus.NotFriend,
				recommendationContextType = p0.contextType,
				recommendationRank = p0.rank,
				isRecommendation = if p0.contextType then true else false,
				universeId = if p0.presence then p0.presence.universeId else nil,
				source = source,
				interactionUuid = httpService:GenerateGUID(false)
			})
		end, {
			source,
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var8 else nil
		}),
		userSeen = if fFlagSocialCarouselEnableUserSeenEvents then if fFlagSocialCarouselEnableUserSeenEvents then reactModule.useCallback(function(p2, p3) --[[ line: 79 ]]
			-- upvalues: var8 (write), eventNamesModule (copy), tile (copy), source (ref)
			var8.fireAnalyticsEvent(eventNamesModule.UserSeen, {
				userId = p2.id,
				presence = if p2.presence then p2.presence.userPresenceType else "Offline",
				absolutePosition = p3.absolutePosition,
				friendStatus = if p2.tileType == tile.Friend then Enum.FriendStatus.Friend else Enum.FriendStatus.NotFriend,
				recommendationContextType = p2.contextType,
				recommendationRank = if p2.contextType then p2.rank else nil,
				isRecommendation = if p2.contextType then true else false,
				source = source,
				universeId = if p2.presence then p2.presence.universeId else nil
			})
		end, { source }) else nil else nil,
		tilesSeenCollection = reactModule.useCallback(function(p4) --[[ line: 97 ]]
			-- upvalues: var8 (write), eventNamesModule (copy), source (ref)
			var8.fireAnalyticsEvent(eventNamesModule.TilesSeenCollection, {
				userId = p4.userIds,
				absolutePosition = p4.absolutePositions,
				presence = p4.presences,
				recommendationRank = p4.recommendationRanks,
				friendStatus = p4.friendStatuses,
				recommendationContextType = p4.recommendationContextTypes,
				isRecommendation = p4.isRecommendations,
				universeId = p4.universeIds,
				tileCount = p4.tileCount,
				source = source,
				sessionEventCount = p4.sessionEventCount
			})
		end, {
			source,
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var8 else nil
		}),
		addFriendsPressed = reactModule.useCallback(function(p5) --[[ line: 158 ]]
			-- upvalues: var8 (write), eventNamesModule (copy), var7 (write), source (ref), httpService (copy)
			var8.fireAnalyticsEvent(eventNamesModule.ViewAddFriends, {
				friendCount = var7.friendCount,
				absolutePosition = p5,
				positionInRow = p5,
				recommendationCount = var7.recommendationCount,
				requestCount = var7.friendRequestCount,
				source = source,
				interactionUuid = httpService:GenerateGUID(false)
			})
		end, {
			var7.friendCount,
			var7.recommendationCount,
			var7.friendRequestCount,
			source,
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var8 else nil
		}),
		friendsHeaderPressed = reactModule.useCallback(function() --[[ line: 179 ]]
			-- upvalues: var8 (write), eventNamesModule (copy), var7 (write), source (ref)
			var8.fireAnalyticsEvent(eventNamesModule.ViewAllFriends, {
				friendCount = var7.friendCount,
				recommendationCount = var7.recommendationCount,
				source = source
			})
		end, {
			var7.friendCount,
			var7.recommendationCount,
			source,
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var8 else nil
		}),
		reportLoadingEvent = reactModule.useCallback(function(p6, p7) --[[ line: 195 ]]
			-- upvalues: var8 (write), eventNamesModule (copy), retrievalStatus (copy), source (ref)
			var8.fireAnalyticsEvent(eventNamesModule.FriendsCarouselUILoadingTime, {
				loadingTime = if p7 and typeof(p7) == "number" and p7 >= 0 then p7 else 0,
				fetch = p6,
				status = retrievalStatus.Done.rawValue(),
				source = source
			})
		end, {
			source,
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var8 else nil
		}),
		startSquadPressed = reactModule.useCallback(function(p8) --[[ line: 130 ]]
			-- upvalues: var8 (write), eventNamesModule (copy), source (ref)
			var8.fireAnalyticsEvent(eventNamesModule.StartSquadPressed, { absolutePosition = p8, source = source })
		end, {
			source,
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var8 else nil
		}),
		shareQRPressed = if fFlagSocialCarouselShareQREnabled then if fFlagSocialCarouselShareQREnabled then reactModule.useCallback(function(p9) --[[ line: 144 ]]
			-- upvalues: var8 (write), eventNamesModule (copy), source (ref)
			var8.fireAnalyticsEvent(eventNamesModule.ShareQRPressed, { absolutePosition = p9, source = source })
		end, { source, var8 }) else nil else nil
	}
end