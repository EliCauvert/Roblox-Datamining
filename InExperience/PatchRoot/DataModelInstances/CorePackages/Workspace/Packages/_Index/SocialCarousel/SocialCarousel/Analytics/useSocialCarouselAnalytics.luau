local httpService = game:GetService("HttpService")
local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local UIBloxModule = require(parent.UIBlox)
local useSocialCarouselContextModule = require(socialCarousel.Contexts.useSocialCarouselContext)
local initializeSocialCarouselAnalyticsModule = require(socialCarousel.Analytics.initializeSocialCarouselAnalytics)
local eventNamesModule = require(socialCarousel.Analytics.EventNames)
local tile = require(socialCarousel.Common.Enums).Tile
local _ = require(socialCarousel.Common.Types)
local retrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local fFlagSocialCarouselEnableUserSeenEvents = require(socialCarousel.Flags).FFlagSocialCarouselEnableUserSeenEvents
local fFlagLuaAppAddSortDataToSocialCarouselClicks = sharedFlagsModule.FFlagLuaAppAddSortDataToSocialCarouselClicks
local fFlagSocialCarouselShareQREnabled = sharedFlagsModule.FFlagSocialCarouselShareQREnabled
local fFlagLuaAppUserSeenCollectionUnifiedFields = sharedFlagsModule.FFlagLuaAppUserSeenCollectionUnifiedFields
local repeatValue = socialLuaAnalyticsModule.Analytics.Formatters.repeatValue

return function()
	-- upvalues: fFlagLuaAppAddSortDataToSocialCarouselClicks (ref), useSocialCarouselContextModule (ref), reactModule (ref), initializeSocialCarouselAnalyticsModule (ref), eventNamesModule (ref), tile (ref), httpService (ref), fFlagSocialCarouselEnableUserSeenEvents (ref), fFlagLuaAppUserSeenCollectionUnifiedFields (ref), repeatValue (ref), fFlagSocialCarouselShareQREnabled (ref), retrievalStatus (ref)
	local var9, var10
	local _ = nil
	local _ = nil
	
	if fFlagLuaAppAddSortDataToSocialCarouselClicks then
		var9 = useSocialCarouselContextModule()
		var10 = reactModule.useMemo(function()
			-- upvalues: var9 (write), initializeSocialCarouselAnalyticsModule (copy)
			local sortAnalyticsData = var9.sortAnalyticsData
			
			return initializeSocialCarouselAnalyticsModule({
				infoForAllEvents = {
					rowNumber = 1,
					sortIndex = if sortAnalyticsData then sortAnalyticsData.sortIndex else nil,
					sortId = if sortAnalyticsData then sortAnalyticsData.sortId else nil,
					appPage = if sortAnalyticsData then sortAnalyticsData.appPage else nil,
					feedRowNumber = if sortAnalyticsData then sortAnalyticsData.startRow else nil
				}
			})
		end, { var9.sortAnalyticsData })
	else
		var10 = initializeSocialCarouselAnalyticsModule()
		var9 = useSocialCarouselContextModule()
	end
	local source = var9.source or ""
	
	return {
		userPressed = reactModule.useCallback(function(p0, p1)
			-- upvalues: var10 (write), eventNamesModule (copy), fFlagLuaAppAddSortDataToSocialCarouselClicks (copy), tile (copy), source (ref), httpService (copy)
			var10.fireAnalyticsEvent(eventNamesModule.UserPressed, {
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
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var10 else nil
		}),
		userSeen = if fFlagSocialCarouselEnableUserSeenEvents then if fFlagSocialCarouselEnableUserSeenEvents then reactModule.useCallback(function(p2, p3)
			-- upvalues: var10 (write), eventNamesModule (copy), tile (copy), source (ref)
			var10.fireAnalyticsEvent(eventNamesModule.UserSeen, {
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
		tilesSeenCollection = reactModule.useCallback(function(p4)
			-- upvalues: fFlagLuaAppUserSeenCollectionUnifiedFields (copy), var9 (write), var10 (write), eventNamesModule (copy), source (ref), httpService (copy), repeatValue (copy)
			local var12 = if fFlagLuaAppUserSeenCollectionUnifiedFields then var9.sortAnalyticsData else nil
			local var13 = if fFlagLuaAppUserSeenCollectionUnifiedFields and var12 then var12.startRow else nil
			var10.fireAnalyticsEvent(eventNamesModule.TilesSeenCollection, {
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
				sessionEventCount = p4.sessionEventCount,
				contentType = if fFlagLuaAppUserSeenCollectionUnifiedFields then p4.contentType else nil,
				interactionUuid = if fFlagLuaAppUserSeenCollectionUnifiedFields then httpService:GenerateGUID(false) else nil,
				collectionId = if fFlagLuaAppUserSeenCollectionUnifiedFields and var12 then var12.sortId else nil,
				collectionPosition = if fFlagLuaAppUserSeenCollectionUnifiedFields and var12 then var12.sortIndex else nil,
				positionsInRow = if fFlagLuaAppUserSeenCollectionUnifiedFields then p4.absolutePositions else nil,
				rowNumbers = if fFlagLuaAppUserSeenCollectionUnifiedFields then repeatValue(1, p4.tileCount) else nil,
				feedRowNumbers = if fFlagLuaAppUserSeenCollectionUnifiedFields and var13 then repeatValue(var13, p4.tileCount) else nil,
				totalNumberOfItems = if fFlagLuaAppUserSeenCollectionUnifiedFields then #var9.tiles else nil
			})
		end, {
			source,
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var10 else nil,
			if fFlagLuaAppUserSeenCollectionUnifiedFields then var9.sortAnalyticsData else nil,
			if fFlagLuaAppUserSeenCollectionUnifiedFields then var9.tiles else nil
		}),
		addFriendsPressed = reactModule.useCallback(function(p5)
			-- upvalues: var10 (write), eventNamesModule (copy), var9 (write), source (ref), httpService (copy)
			var10.fireAnalyticsEvent(eventNamesModule.ViewAddFriends, {
				friendCount = var9.friendCount,
				absolutePosition = p5,
				positionInRow = p5,
				recommendationCount = var9.recommendationCount,
				requestCount = var9.friendRequestCount,
				source = source,
				interactionUuid = httpService:GenerateGUID(false)
			})
		end, {
			var9.friendCount,
			var9.recommendationCount,
			var9.friendRequestCount,
			source,
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var10 else nil
		}),
		friendsHeaderPressed = reactModule.useCallback(function()
			-- upvalues: var10 (write), eventNamesModule (copy), var9 (write), source (ref)
			var10.fireAnalyticsEvent(eventNamesModule.ViewAllFriends, {
				friendCount = var9.friendCount,
				recommendationCount = var9.recommendationCount,
				source = source
			})
		end, {
			var9.friendCount,
			var9.recommendationCount,
			source,
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var10 else nil
		}),
		reportLoadingEvent = reactModule.useCallback(function(p6, p7)
			-- upvalues: var10 (write), eventNamesModule (copy), retrievalStatus (copy), source (ref)
			var10.fireAnalyticsEvent(eventNamesModule.FriendsCarouselUILoadingTime, {
				loadingTime = if p7 and typeof(p7) == "number" and p7 >= 0 then p7 else 0,
				fetch = p6,
				status = retrievalStatus.Done.rawValue(),
				source = source
			})
		end, {
			source,
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var10 else nil
		}),
		startSquadPressed = reactModule.useCallback(function(p8)
			-- upvalues: var10 (write), eventNamesModule (copy), source (ref)
			var10.fireAnalyticsEvent(eventNamesModule.StartSquadPressed, { absolutePosition = p8, source = source })
		end, {
			source,
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var10 else nil
		}),
		shareQRPressed = if fFlagSocialCarouselShareQREnabled then if fFlagSocialCarouselShareQREnabled then reactModule.useCallback(function(p9)
			-- upvalues: var10 (write), eventNamesModule (copy), source (ref)
			var10.fireAnalyticsEvent(eventNamesModule.ShareQRPressed, { absolutePosition = p9, source = source })
		end, { source, var10 }) else nil else nil
	}
end