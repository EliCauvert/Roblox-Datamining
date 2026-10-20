local HttpService = game:GetService("HttpService")
local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local UseSocialCarouselContextModule = require(SocialCarousel.Contexts.useSocialCarouselContext)
local InitializeSocialCarouselAnalyticsModule = require(SocialCarousel.Analytics.initializeSocialCarouselAnalytics)
local EventNamesModule = require(SocialCarousel.Analytics.EventNames)
local Tile = require(SocialCarousel.Common.Enums).Tile
local _ = require(SocialCarousel.Common.Types)
local RetrievalStatus = require(Parent.UIBlox).App.Loading.Enum.RetrievalStatus
local FFlagSocialCarouselEnableUserSeenEvents = require(SocialCarousel.Flags).FFlagSocialCarouselEnableUserSeenEvents
local FFlagSocialCarouselShareQREnabled = SharedFlagsModule.FFlagSocialCarouselShareQREnabled
local FFlagLuaAppUserSeenCollectionUnifiedFields = SharedFlagsModule.FFlagLuaAppUserSeenCollectionUnifiedFields
local RepeatValueFunction = require(Parent.SocialLuaAnalytics).Analytics.Formatters.repeatValue

return function()
	-- upvalues: UseSocialCarouselContextModule (copy), ReactModule (copy), InitializeSocialCarouselAnalyticsModule (copy), EventNamesModule (copy), Tile (copy), HttpService (copy), FFlagSocialCarouselEnableUserSeenEvents (copy), FFlagLuaAppUserSeenCollectionUnifiedFields (copy), RepeatValueFunction (copy), FFlagSocialCarouselShareQREnabled (copy), RetrievalStatus (copy)
	local UseSocialCarouselContextModuleResult = UseSocialCarouselContextModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSocialCarouselContextModuleResult (copy), InitializeSocialCarouselAnalyticsModule (upval)
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
	local Source = UseSocialCarouselContextModuleResult.source or ""
	local UseResult = if FFlagSocialCarouselEnableUserSeenEvents then ReactModule.useCallback(function(p1, p2)
		-- upvalues: UseMemoResult (copy), EventNamesModule (upval), Tile (upval), Source (copy)
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
		-- upvalues: UseMemoResult (copy), EventNamesModule (upval), Source (copy)
		UseMemoResult.fireAnalyticsEvent(EventNamesModule.ShareQRPressed, { absolutePosition = AbsolutePosition, source = Source })
	end, { Source, UseMemoResult }) else nil
	
	return {
		userPressed = ReactModule.useCallback(function(p1, p2)
			-- upvalues: UseMemoResult (copy), EventNamesModule (upval), Tile (upval), Source (copy), HttpService (upval)
			UseMemoResult.fireAnalyticsEvent(EventNamesModule.UserPressed, {
				presence = if p1.presence then p1.presence.userPresenceType else "Offline",
				absolutePosition = p2.absolutePosition,
				positionInRow = p2.absolutePosition,
				friendId = p1.id,
				friendStatus = if p1.tileType == Tile.Friend then Enum.FriendStatus.Friend else Enum.FriendStatus.NotFriend,
				recommendationContextType = p1.contextType,
				recommendationRank = p1.rank,
				isRecommendation = if p1.contextType then true else false,
				universeId = if p1.presence then p1.presence.universeId else nil,
				source = Source,
				interactionUuid = HttpService:GenerateGUID(false)
			})
		end, { Source, UseMemoResult }),
		userSeen = if FFlagSocialCarouselEnableUserSeenEvents then UseResult else nil,
		tilesSeenCollection = ReactModule.useCallback(function(p1)
			-- upvalues: FFlagLuaAppUserSeenCollectionUnifiedFields (upval), UseSocialCarouselContextModuleResult (copy), UseMemoResult (copy), EventNamesModule (upval), Source (copy), HttpService (upval), RepeatValueFunction (upval)
			local SortAnalyticsData = if FFlagLuaAppUserSeenCollectionUnifiedFields then UseSocialCarouselContextModuleResult.sortAnalyticsData else nil
			local StartRow = if FFlagLuaAppUserSeenCollectionUnifiedFields and SortAnalyticsData then SortAnalyticsData.startRow else nil
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
				sessionEventCount = p1.sessionEventCount,
				contentType = if FFlagLuaAppUserSeenCollectionUnifiedFields then p1.contentType else nil,
				interactionUuid = if FFlagLuaAppUserSeenCollectionUnifiedFields then HttpService:GenerateGUID(false) else nil,
				collectionId = if FFlagLuaAppUserSeenCollectionUnifiedFields and SortAnalyticsData then SortAnalyticsData.sortId else nil,
				collectionPosition = if FFlagLuaAppUserSeenCollectionUnifiedFields and SortAnalyticsData then SortAnalyticsData.sortIndex else nil,
				positionsInRow = if FFlagLuaAppUserSeenCollectionUnifiedFields then p1.absolutePositions else nil,
				rowNumbers = if FFlagLuaAppUserSeenCollectionUnifiedFields then RepeatValueFunction(1, p1.tileCount) else nil,
				feedRowNumbers = if FFlagLuaAppUserSeenCollectionUnifiedFields and StartRow then RepeatValueFunction(StartRow, p1.tileCount) else nil,
				totalNumberOfItems = if FFlagLuaAppUserSeenCollectionUnifiedFields then #UseSocialCarouselContextModuleResult.tiles else nil
			})
		end, {
			Source,
			UseMemoResult,
			UseSocialCarouselContextModuleResult.sortAnalyticsData,
			UseSocialCarouselContextModuleResult.tiles
		}),
		addFriendsPressed = ReactModule.useCallback(function(AbsolutePosition)
			-- upvalues: UseMemoResult (copy), EventNamesModule (upval), UseSocialCarouselContextModuleResult (copy), Source (copy), HttpService (upval)
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
			UseMemoResult
		}),
		friendsHeaderPressed = ReactModule.useCallback(function()
			-- upvalues: UseMemoResult (copy), EventNamesModule (upval), UseSocialCarouselContextModuleResult (copy), Source (copy)
			UseMemoResult.fireAnalyticsEvent(EventNamesModule.ViewAllFriends, {
				friendCount = UseSocialCarouselContextModuleResult.friendCount,
				recommendationCount = UseSocialCarouselContextModuleResult.recommendationCount,
				source = Source
			})
		end, {
			UseSocialCarouselContextModuleResult.friendCount,
			UseSocialCarouselContextModuleResult.recommendationCount,
			Source,
			UseMemoResult
		}),
		reportLoadingEvent = ReactModule.useCallback(function(Fetch, p1: number)
			-- upvalues: UseMemoResult (copy), EventNamesModule (upval), RetrievalStatus (upval), Source (copy)
			UseMemoResult.fireAnalyticsEvent(EventNamesModule.FriendsCarouselUILoadingTime, {
				loadingTime = if p1 and typeof(p1) == "number" and p1 >= 0 then p1 else 0,
				fetch = Fetch,
				status = RetrievalStatus.Done.rawValue(),
				source = Source
			})
		end, { Source, UseMemoResult }),
		startSquadPressed = ReactModule.useCallback(function(AbsolutePosition)
			-- upvalues: UseMemoResult (copy), EventNamesModule (upval), Source (copy)
			UseMemoResult.fireAnalyticsEvent(EventNamesModule.StartSquadPressed, { absolutePosition = AbsolutePosition, source = Source })
		end, { Source, UseMemoResult }),
		shareQRPressed = if FFlagSocialCarouselShareQREnabled then UseResult1 else nil
	}
end