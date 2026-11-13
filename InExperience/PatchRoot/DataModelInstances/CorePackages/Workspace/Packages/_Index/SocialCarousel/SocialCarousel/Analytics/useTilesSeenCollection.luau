local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local ImpressionsModule = require(Parent.Impressions)
local SharedFlagsModule = require(Parent.SharedFlags)
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local GetFriendStatusFromTileTypeModule = require(SocialCarousel.Analytics.getFriendStatusFromTileType)
local UseSocialCarouselAnalyticsModule = require(SocialCarousel.Analytics.useSocialCarouselAnalytics)
local Tile = require(SocialCarousel.Common.Enums).Tile
local BuildUserSeenCollectionPayloadFunction = SocialLuaAnalyticsModule.Analytics.buildUserSeenCollectionPayload
local UseBatchedImpressionsFunction = ImpressionsModule.useBatchedImpressions
local FIntUserSeenCollectionBatchTimeMs = SharedFlagsModule.FIntUserSeenCollectionBatchTimeMs
local FFlagLuaAppPYMKSendUserSeenCollection = SharedFlagsModule.FFlagLuaAppPYMKSendUserSeenCollection
local FFlagLuaAppUserSeenCollectionUnifiedFields = SharedFlagsModule.FFlagLuaAppUserSeenCollectionUnifiedFields
local FFlagShowRequestsInCarouselForAllUsers = SharedFlagsModule.FFlagShowRequestsInCarouselForAllUsers

return function()
	-- upvalues: UseSocialCarouselAnalyticsModule (copy), FFlagLuaAppPYMKSendUserSeenCollection (copy), ReactModule (copy), GetFriendStatusFromTileTypeModule (copy), Tile (copy), BuildUserSeenCollectionPayloadFunction (copy), UseBatchedImpressionsFunction (copy), FIntUserSeenCollectionBatchTimeMs (copy), FFlagShowRequestsInCarouselForAllUsers (copy), FFlagLuaAppUserSeenCollectionUnifiedFields (copy)
	local UseSocialCarouselAnalyticsModuleResult = UseSocialCarouselAnalyticsModule()
	
	if FFlagLuaAppPYMKSendUserSeenCollection then
		local TilesSeenCollectionFunction = UseSocialCarouselAnalyticsModuleResult.tilesSeenCollection
		local UseResult = ReactModule.useCallback(function(p1, p2)
			-- upvalues: TilesSeenCollectionFunction (copy), BuildUserSeenCollectionPayloadFunction (upval)
			if TilesSeenCollectionFunction then
				TilesSeenCollectionFunction(BuildUserSeenCollectionPayloadFunction(p1, p2))
				
				return
			end
		end, { TilesSeenCollectionFunction })
		local UseBatchedImpressionsResult = UseBatchedImpressionsFunction({
			batchTimeMs = FIntUserSeenCollectionBatchTimeMs,
			mapItem = ReactModule.useCallback(function(UserId, Index, p1)
				-- upvalues: GetFriendStatusFromTileTypeModule (upval), Tile (upval)
				return {
					userId = UserId,
					index = Index,
					presence = if p1 and p1.presence then p1.presence.userPresenceType else "Offline",
					friendStatus = GetFriendStatusFromTileTypeModule(p1 and p1.tileType).Name,
					recommendationContextType = if p1 and p1.recommendationContextType then p1.recommendationContextType else "None",
					recommendationRank = if p1 and p1.recommendationRank then p1.recommendationRank else -1,
					isRecommendation = p1 and p1.tileType == Tile.Recommendation,
					universeId = if p1 and p1.presence and p1.presence.universeId and p1.presence.universeId ~= "" then p1.presence.universeId else -1
				}
			end, {}),
			onFlush = if TilesSeenCollectionFunction then UseResult else nil
		})
		local UseResult1 = ReactModule.useCallback(function(p1, p2, p3)
			-- upvalues: FFlagShowRequestsInCarouselForAllUsers (upval), Tile (upval), UseBatchedImpressionsResult (copy)
			if not FFlagShowRequestsInCarouselForAllUsers or not p3 or p3.tileType ~= Tile.FriendRequest or p3.presence then
				UseBatchedImpressionsResult.addImpression(p1, p2, p3)
				
				return
			end
		end, { UseBatchedImpressionsResult.addImpression })
		
		return ReactModule.useMemo(function()
			-- upvalues: UseResult1 (copy)
			return { addTileToCollection = UseResult1 }
		end, { UseResult1 })
	else
		local UseRefResult = ReactModule.useRef({})
		local UseRefResult1 = ReactModule.useRef(nil)
		local UseRefResult2 = ReactModule.useRef({})
		local UseRefResult3 = ReactModule.useRef({})
		local UseRefResult4 = ReactModule.useRef(0)
		local UseResult1 = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), UseRefResult2 (copy), UseSocialCarouselAnalyticsModuleResult (copy), UseRefResult4 (copy), FFlagLuaAppUserSeenCollectionUnifiedFields (upval), BuildUserSeenCollectionPayloadFunction (upval), UseRefResult3 (copy)
			local Current = UseRefResult.current
			
			if #Current == 0 then return end
			local List = {}
			local List1 = {}
			local List2 = {}
			local List3 = {}
			local List4 = {}
			local List5 = {}
			local List6 = {}
			local List7 = {}
			
			for _, value in Current do
				if value and value.userId and value.index then
					UseRefResult2.current[value.userId] = true
					table.insert(List, (tostring(value.userId)))
					table.insert(List1, (tostring(value.index)))
					table.insert(List4, value.friendStatus)
					table.insert(List6, (tostring(value.isRecommendation)))
					table.insert(List2, (tostring(value.presence)))
					table.insert(List7, (tostring(value.universeId)))
					table.insert(List5, (tostring(value.recommendationContextType)))
					table.insert(List3, (tostring(value.recommendationRank)))
				end
			end
			if UseSocialCarouselAnalyticsModuleResult.tilesSeenCollection then
				UseRefResult4.current += 1
				UseSocialCarouselAnalyticsModuleResult.tilesSeenCollection(if FFlagLuaAppUserSeenCollectionUnifiedFields then BuildUserSeenCollectionPayloadFunction(Current, UseRefResult4.current) else {
					userIds = table.concat(List, ","),
					absolutePositions = table.concat(List1, ","),
					presences = table.concat(List2, ","),
					recommendationRanks = table.concat(List3, ","),
					friendStatuses = table.concat(List4, ","),
					recommendationContextTypes = table.concat(List5, ","),
					isRecommendations = table.concat(List6, ","),
					universeIds = table.concat(List7, ","),
					tileCount = #List,
					sessionEventCount = UseRefResult4.current
				})
			end
			UseRefResult.current = {}
			UseRefResult3.current = {}
		end, { UseSocialCarouselAnalyticsModuleResult })
		local UseResult2 = ReactModule.useCallback(function(UserId, Index, p1)
			-- upvalues: UseRefResult2 (copy), UseRefResult3 (copy), FFlagShowRequestsInCarouselForAllUsers (upval), Tile (upval), UseRefResult (copy), GetFriendStatusFromTileTypeModule (upval), UseRefResult1 (copy), FIntUserSeenCollectionBatchTimeMs (upval), UseResult1 (copy)
			if not UserId or not Index or UseRefResult2.current[UserId] or UseRefResult3.current[UserId] then return end
			if FFlagShowRequestsInCarouselForAllUsers and p1 and p1.tileType == Tile.FriendRequest and not p1.presence then return end
			UseRefResult3.current[UserId] = true
			table.insert(UseRefResult.current, {
				userId = UserId,
				index = Index,
				presence = if p1 and p1.presence then p1.presence.userPresenceType else "Offline",
				friendStatus = GetFriendStatusFromTileTypeModule(p1 and p1.tileType).Name,
				recommendationContextType = if p1 and p1.recommendationContextType then p1.recommendationContextType else "None",
				recommendationRank = if p1 and p1.recommendationRank then p1.recommendationRank else -1,
				isRecommendation = p1 and p1.tileType == Tile.Recommendation,
				universeId = if p1 and p1.presence and p1.presence.universeId and p1.presence.universeId ~= "" then p1.presence.universeId else -1
			})
			
			if UseRefResult1.current then
				pcall(task.cancel, UseRefResult1.current)
			end
			UseRefResult1.current = task.delay(FIntUserSeenCollectionBatchTimeMs * 0.001, UseResult1)
		end, { UseResult1 })
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult1 (copy), UseResult1 (copy)
			return function()
				-- upvalues: UseRefResult1 (upval), UseResult1 (upval)
				if UseRefResult1.current then
					pcall(task.cancel, UseRefResult1.current)
				end
				UseRefResult1.current = nil
				UseResult1()
			end
		end, {})
		
		return { addTileToCollection = UseResult2 }
	end
end