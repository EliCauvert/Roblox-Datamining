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
	local var1, var2
	local _ = nil
	local _ = nil
	
	if fFlagLuaAppAddSortDataToSocialCarouselClicks then
		var1 = useSocialCarouselContextModule()
		var2 = reactModule.useMemo(function()
			-- upvalues: var1 (write), initializeSocialCarouselAnalyticsModule (copy)
			local sortAnalyticsData = var1.sortAnalyticsData
			
			return initializeSocialCarouselAnalyticsModule({
				infoForAllEvents = {
					rowNumber = 1,
					sortIndex = if sortAnalyticsData then sortAnalyticsData.sortIndex else nil,
					sortId = if sortAnalyticsData then sortAnalyticsData.sortId else nil,
					appPage = if sortAnalyticsData then sortAnalyticsData.appPage else nil,
					feedRowNumber = if sortAnalyticsData then sortAnalyticsData.startRow else nil
				}
			})
		end, { var1.sortAnalyticsData })
	else
		var2 = initializeSocialCarouselAnalyticsModule()
		var1 = useSocialCarouselContextModule()
	end
	local source = var1.source or ""
	
	return {
		userPressed = reactModule.useCallback(function(p1, p2)
			-- upvalues: var2 (write), eventNamesModule (copy), fFlagLuaAppAddSortDataToSocialCarouselClicks (copy), tile (copy), source (ref), httpService (copy)
			var2.fireAnalyticsEvent(eventNamesModule.UserPressed, {
				presence = if p1.presence then p1.presence.userPresenceType else "Offline",
				absolutePosition = p2.absolutePosition,
				positionInRow = if fFlagLuaAppAddSortDataToSocialCarouselClicks then p2.absolutePosition else nil,
				friendId = p1.id,
				friendStatus = if p1.tileType == tile.Friend then Enum.FriendStatus.Friend else Enum.FriendStatus.NotFriend,
				recommendationContextType = p1.contextType,
				recommendationRank = p1.rank,
				isRecommendation = if p1.contextType then true else false,
				universeId = if p1.presence then p1.presence.universeId else nil,
				source = source,
				interactionUuid = httpService:GenerateGUID(false)
			})
		end, {
			source,
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var2 else nil
		}),
		userSeen = if fFlagSocialCarouselEnableUserSeenEvents then if fFlagSocialCarouselEnableUserSeenEvents then reactModule.useCallback(function(p1, p2)
			-- upvalues: var2 (write), eventNamesModule (copy), tile (copy), source (ref)
			var2.fireAnalyticsEvent(eventNamesModule.UserSeen, {
				userId = p1.id,
				presence = if p1.presence then p1.presence.userPresenceType else "Offline",
				absolutePosition = p2.absolutePosition,
				friendStatus = if p1.tileType == tile.Friend then Enum.FriendStatus.Friend else Enum.FriendStatus.NotFriend,
				recommendationContextType = p1.contextType,
				recommendationRank = if p1.contextType then p1.rank else nil,
				isRecommendation = if p1.contextType then true else false,
				source = source,
				universeId = if p1.presence then p1.presence.universeId else nil
			})
		end, { source }) else nil else nil,
		tilesSeenCollection = reactModule.useCallback(function(p1)
			-- upvalues: fFlagLuaAppUserSeenCollectionUnifiedFields (copy), var1 (write), var2 (write), eventNamesModule (copy), source (ref), httpService (copy), repeatValue (copy)
			local var3 = if fFlagLuaAppUserSeenCollectionUnifiedFields then var1.sortAnalyticsData else nil
			local var4 = if fFlagLuaAppUserSeenCollectionUnifiedFields and var3 then var3.startRow else nil
			var2.fireAnalyticsEvent(eventNamesModule.TilesSeenCollection, {
				userId = p1.userIds,
				absolutePosition = p1.absolutePositions,
				presence = p1.presences,
				recommendationRank = p1.recommendationRanks,
				friendStatus = p1.friendStatuses,
				recommendationContextType = p1.recommendationContextTypes,
				isRecommendation = p1.isRecommendations,
				universeId = p1.universeIds,
				tileCount = p1.tileCount,
				source = source,
				sessionEventCount = p1.sessionEventCount,
				contentType = if fFlagLuaAppUserSeenCollectionUnifiedFields then p1.contentType else nil,
				interactionUuid = if fFlagLuaAppUserSeenCollectionUnifiedFields then httpService:GenerateGUID(false) else nil,
				collectionId = if fFlagLuaAppUserSeenCollectionUnifiedFields and var3 then var3.sortId else nil,
				collectionPosition = if fFlagLuaAppUserSeenCollectionUnifiedFields and var3 then var3.sortIndex else nil,
				positionsInRow = if fFlagLuaAppUserSeenCollectionUnifiedFields then p1.absolutePositions else nil,
				rowNumbers = if fFlagLuaAppUserSeenCollectionUnifiedFields then repeatValue(1, p1.tileCount) else nil,
				feedRowNumbers = if fFlagLuaAppUserSeenCollectionUnifiedFields and var4 then repeatValue(var4, p1.tileCount) else nil,
				totalNumberOfItems = if fFlagLuaAppUserSeenCollectionUnifiedFields then #var1.tiles else nil
			})
		end, {
			source,
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var2 else nil,
			if fFlagLuaAppUserSeenCollectionUnifiedFields then var1.sortAnalyticsData else nil,
			if fFlagLuaAppUserSeenCollectionUnifiedFields then var1.tiles else nil
		}),
		addFriendsPressed = reactModule.useCallback(function(p1)
			-- upvalues: var2 (write), eventNamesModule (copy), var1 (write), source (ref), httpService (copy)
			var2.fireAnalyticsEvent(eventNamesModule.ViewAddFriends, {
				friendCount = var1.friendCount,
				absolutePosition = p1,
				positionInRow = p1,
				recommendationCount = var1.recommendationCount,
				requestCount = var1.friendRequestCount,
				source = source,
				interactionUuid = httpService:GenerateGUID(false)
			})
		end, {
			var1.friendCount,
			var1.recommendationCount,
			var1.friendRequestCount,
			source,
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var2 else nil
		}),
		friendsHeaderPressed = reactModule.useCallback(function()
			-- upvalues: var2 (write), eventNamesModule (copy), var1 (write), source (ref)
			var2.fireAnalyticsEvent(eventNamesModule.ViewAllFriends, {
				friendCount = var1.friendCount,
				recommendationCount = var1.recommendationCount,
				source = source
			})
		end, {
			var1.friendCount,
			var1.recommendationCount,
			source,
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var2 else nil
		}),
		reportLoadingEvent = reactModule.useCallback(function(p1, p2)
			-- upvalues: var2 (write), eventNamesModule (copy), retrievalStatus (copy), source (ref)
			var2.fireAnalyticsEvent(eventNamesModule.FriendsCarouselUILoadingTime, {
				loadingTime = if p2 and typeof(p2) == "number" and p2 >= 0 then p2 else 0,
				fetch = p1,
				status = retrievalStatus.Done.rawValue(),
				source = source
			})
		end, {
			source,
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var2 else nil
		}),
		startSquadPressed = reactModule.useCallback(function(p1)
			-- upvalues: var2 (write), eventNamesModule (copy), source (ref)
			var2.fireAnalyticsEvent(eventNamesModule.StartSquadPressed, { absolutePosition = p1, source = source })
		end, {
			source,
			if fFlagLuaAppAddSortDataToSocialCarouselClicks then var2 else nil
		}),
		shareQRPressed = if fFlagSocialCarouselShareQREnabled then if fFlagSocialCarouselShareQREnabled then reactModule.useCallback(function(p1)
			-- upvalues: var2 (write), eventNamesModule (copy), source (ref)
			var2.fireAnalyticsEvent(eventNamesModule.ShareQRPressed, { absolutePosition = p1, source = source })
		end, { source, var2 }) else nil else nil
	}
end