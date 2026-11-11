local HttpService = game:GetService("HttpService")
local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local UseSocialCarouselContextModule = require(SocialCarousel.Contexts.useSocialCarouselContext)
local InitializeSocialCarouselAnalyticsModule = require(SocialCarousel.Analytics.initializeSocialCarouselAnalytics)
local EventNamesModule = require(SocialCarousel.Analytics.EventNames)
local Tile = require(SocialCarousel.Common.Enums).Tile
local _ = require(SocialCarousel.Common.Types)
local RetrievalStatus = require(Parent.UIBlox).App.Loading.Enum.RetrievalStatus
local FFlagSocialCarouselEnableUserSeenEvents = require(SocialCarousel.Flags).FFlagSocialCarouselEnableUserSeenEvents
local FFlagLuaAppAddSortDataToSocialCarouselClicks = require(Parent.SharedFlags).FFlagLuaAppAddSortDataToSocialCarouselClicks
local FFlagSocialCarouselShareQREnabled = require(Parent.SharedFlags).FFlagSocialCarouselShareQREnabled

return function()
	-- upvalues: FFlagLuaAppAddSortDataToSocialCarouselClicks (copy), UseSocialCarouselContextModule (copy), ReactModule (copy), InitializeSocialCarouselAnalyticsModule (copy), EventNamesModule (copy), Tile (copy), HttpService (copy), FFlagSocialCarouselEnableUserSeenEvents (copy), FFlagSocialCarouselShareQREnabled (copy), RetrievalStatus (copy)
	local UseSocialCarouselContextModuleResult = nil
	local UseMemoResult = nil
	
	if FFlagLuaAppAddSortDataToSocialCarouselClicks then
		UseSocialCarouselContextModuleResult = UseSocialCarouselContextModule()
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: UseSocialCarouselContextModuleResult (ref), InitializeSocialCarouselAnalyticsModule (upval)
			local SortAnalyticsData = UseSocialCarouselContextModuleResult.sortAnalyticsData
			
			return InitializeSocialCarouselAnalyticsModule({
				infoForAllEvents = {
					rowNumber = 1,
					sortIndex = SortAnalyticsData and SortAnalyticsData.sortIndex or nil,
					sortId = SortAnalyticsData and SortAnalyticsData.sortId or nil,
					appPage = SortAnalyticsData and SortAnalyticsData.appPage or nil,
					feedRowNumber = SortAnalyticsData and SortAnalyticsData.startRow or nil
				}
			})
		end, { UseSocialCarouselContextModuleResult.sortAnalyticsData })
	else
		UseMemoResult = InitializeSocialCarouselAnalyticsModule()
		UseSocialCarouselContextModuleResult = UseSocialCarouselContextModule()
	end
	local Source = UseSocialCarouselContextModuleResult.source or ""
	local UseResult = if FFlagSocialCarouselEnableUserSeenEvents then ReactModule.useCallback(function(p1, p2)
		-- upvalues: UseMemoResult (ref), EventNamesModule (upval), Tile (upval), Source (copy)
		UseMemoResult.fireAnalyticsEvent(EventNamesModule.UserSeen, {
			userId = p1.id,
			presence = if p1.presence then p1.presence.userPresenceType else "Offline",
			absolutePosition = p2.absolutePosition,
			friendStatus = if p1.tileType == Tile.Friend then Enum.FriendStatus.Friend else Enum.FriendStatus.NotFriend,
			recommendationContextType = p1.contextType,
			recommendationRank = if p1.contextType then p1.rank else nil,
			isRecommendation = if p1.contextType then true else false,
			source = Source,
			universeId = if p1.presence then p1.presence.universeId else nil
		})
	end, { Source }) else nil
	local UseResult1 = if FFlagSocialCarouselShareQREnabled then ReactModule.useCallback(function(AbsolutePosition)
		-- upvalues: UseMemoResult (ref), EventNamesModule (upval), Source (copy)
		UseMemoResult.fireAnalyticsEvent(EventNamesModule.ShareQRPressed, { absolutePosition = AbsolutePosition, source = Source })
	end, { Source, UseMemoResult }) else nil
	
	return {
		userPressed = ReactModule.useCallback(function(p1, p2)
			-- upvalues: UseMemoResult (ref), EventNamesModule (upval), FFlagLuaAppAddSortDataToSocialCarouselClicks (upval), Tile (upval), Source (copy), HttpService (upval)
			UseMemoResult.fireAnalyticsEvent(EventNamesModule.UserPressed, {
				presence = if p1.presence then p1.presence.userPresenceType else "Offline",
				absolutePosition = p2.absolutePosition,
				positionInRow = if FFlagLuaAppAddSortDataToSocialCarouselClicks then p2.absolutePosition else nil,
				friendId = p1.id,
				friendStatus = if p1.tileType == Tile.Friend then Enum.FriendStatus.Friend else Enum.FriendStatus.NotFriend,
				recommendationContextType = p1.contextType,
				recommendationRank = p1.rank,
				isRecommendation = if p1.contextType then true else false,
				universeId = if p1.presence then p1.presence.universeId else nil,
				source = Source,
				interactionUuid = HttpService:GenerateGUID(false)
			})
		end, {
			Source,
			if FFlagLuaAppAddSortDataToSocialCarouselClicks then UseMemoResult else nil
		}),
		userSeen = if FFlagSocialCarouselEnableUserSeenEvents then UseResult else nil,
		tilesSeenCollection = ReactModule.useCallback(function(p1)
			-- upvalues: UseMemoResult (ref), EventNamesModule (upval), Source (copy)
			UseMemoResult.fireAnalyticsEvent(EventNamesModule.TilesSeenCollection, {
				userId = p1.userIds,
				absolutePosition = p1.absolutePositions,
				presence = p1.presences,
				recommendationRank = p1.recommendationRanks,
				friendStatus = p1.friendStatuses,
				recommendationContextType = p1.recommendationContextTypes,
				isRecommendation = p1.isRecommendations,
				universeId = p1.universeIds,
				tileCount = p1.tileCount,
				source = Source,
				sessionEventCount = p1.sessionEventCount
			})
		end, {
			Source,
			if FFlagLuaAppAddSortDataToSocialCarouselClicks then UseMemoResult else nil
		}),
		addFriendsPressed = ReactModule.useCallback(function(AbsolutePosition)
			-- upvalues: UseMemoResult (ref), EventNamesModule (upval), UseSocialCarouselContextModuleResult (ref), Source (copy), HttpService (upval)
			UseMemoResult.fireAnalyticsEvent(EventNamesModule.ViewAddFriends, {
				friendCount = UseSocialCarouselContextModuleResult.friendCount,
				absolutePosition = AbsolutePosition,
				positionInRow = AbsolutePosition,
				recommendationCount = UseSocialCarouselContextModuleResult.recommendationCount,
				requestCount = UseSocialCarouselContextModuleResult.friendRequestCount,
				source = Source,
				interactionUuid = HttpService:GenerateGUID(false)
			})
		end, {
			UseSocialCarouselContextModuleResult.friendCount,
			UseSocialCarouselContextModuleResult.recommendationCount,
			UseSocialCarouselContextModuleResult.friendRequestCount,
			Source,
			if FFlagLuaAppAddSortDataToSocialCarouselClicks then UseMemoResult else nil
		}),
		friendsHeaderPressed = ReactModule.useCallback(function()
			-- upvalues: UseMemoResult (ref), EventNamesModule (upval), UseSocialCarouselContextModuleResult (ref), Source (copy)
			UseMemoResult.fireAnalyticsEvent(EventNamesModule.ViewAllFriends, {
				friendCount = UseSocialCarouselContextModuleResult.friendCount,
				recommendationCount = UseSocialCarouselContextModuleResult.recommendationCount,
				source = Source
			})
		end, {
			UseSocialCarouselContextModuleResult.friendCount,
			UseSocialCarouselContextModuleResult.recommendationCount,
			Source,
			if FFlagLuaAppAddSortDataToSocialCarouselClicks then UseMemoResult else nil
		}),
		reportLoadingEvent = ReactModule.useCallback(function(Fetch, p1: number)
			-- upvalues: UseMemoResult (ref), EventNamesModule (upval), RetrievalStatus (upval), Source (copy)
			UseMemoResult.fireAnalyticsEvent(EventNamesModule.FriendsCarouselUILoadingTime, {
				loadingTime = if p1 and typeof(p1) == "number" and p1 >= 0 then p1 else 0,
				fetch = Fetch,
				status = RetrievalStatus.Done.rawValue(),
				source = Source
			})
		end, {
			Source,
			if FFlagLuaAppAddSortDataToSocialCarouselClicks then UseMemoResult else nil
		}),
		startSquadPressed = ReactModule.useCallback(function(AbsolutePosition)
			-- upvalues: UseMemoResult (ref), EventNamesModule (upval), Source (copy)
			UseMemoResult.fireAnalyticsEvent(EventNamesModule.StartSquadPressed, { absolutePosition = AbsolutePosition, source = Source })
		end, {
			Source,
			if FFlagLuaAppAddSortDataToSocialCarouselClicks then UseMemoResult else nil
		}),
		shareQRPressed = if FFlagSocialCarouselShareQREnabled then UseResult1 else nil
	}
end