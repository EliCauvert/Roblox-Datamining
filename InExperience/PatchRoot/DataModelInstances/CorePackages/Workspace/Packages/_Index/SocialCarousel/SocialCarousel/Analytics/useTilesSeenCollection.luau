local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local UseSocialCarouselAnalyticsModule = require(SocialCarousel.Analytics.useSocialCarouselAnalytics)
local Tile = require(SocialCarousel.Common.Enums).Tile
local BuildUserSeenCollectionPayloadFunction = require(Parent.SocialLuaAnalytics).Analytics.buildUserSeenCollectionPayload
local UseBatchedImpressionsFunction = require(Parent.Impressions).useBatchedImpressions
local FIntUserSeenCollectionBatchTimeMs = SharedFlagsModule.FIntUserSeenCollectionBatchTimeMs
local FFlagLuaAppPYMKSendUserSeenCollection = SharedFlagsModule.FFlagLuaAppPYMKSendUserSeenCollection
local FFlagLuaAppUserSeenCollectionUnifiedFields = SharedFlagsModule.FFlagLuaAppUserSeenCollectionUnifiedFields

return function() --[[ Line: 49 | Named "useTilesSeenCollection" ]]
	-- upvalues: UseSocialCarouselAnalyticsModule (copy), FFlagLuaAppPYMKSendUserSeenCollection (copy), ReactModule (copy), Tile (copy), BuildUserSeenCollectionPayloadFunction (copy), UseBatchedImpressionsFunction (copy), FIntUserSeenCollectionBatchTimeMs (copy), FFlagLuaAppUserSeenCollectionUnifiedFields (copy)
	local UseSocialCarouselAnalyticsModuleResult = UseSocialCarouselAnalyticsModule()
	
	if FFlagLuaAppPYMKSendUserSeenCollection then
		local TilesSeenCollectionFunction = UseSocialCarouselAnalyticsModuleResult.tilesSeenCollection
		local UseResult = ReactModule.useCallback(function(p1, p2) --[[ Line: 83 ]]
			-- upvalues: TilesSeenCollectionFunction (copy), BuildUserSeenCollectionPayloadFunction (upval)
			if TilesSeenCollectionFunction then
				TilesSeenCollectionFunction(BuildUserSeenCollectionPayloadFunction(p1, p2))
				
				return
			end
		end, { TilesSeenCollectionFunction })
		local UseBatchedImpressionsResult = UseBatchedImpressionsFunction({
			batchTimeMs = FIntUserSeenCollectionBatchTimeMs,
			mapItem = ReactModule.useCallback(function(UserId, Index, p1) --[[ Line: 54 ]]
				-- upvalues: Tile (upval)
				return {
					userId = UserId,
					index = Index,
					presence = if p1 and p1.presence then p1.presence.userPresenceType else "Offline",
					friendStatus = if p1 and p1.tileType == Tile.Friend then "Friend" else "NotFriend",
					recommendationContextType = if p1 and p1.recommendationContextType then p1.recommendationContextType else "None",
					recommendationRank = if p1 and p1.recommendationRank then p1.recommendationRank else -1,
					isRecommendation = p1 and p1.tileType == Tile.Recommendation,
					universeId = if p1 and p1.presence and p1.presence.universeId and p1.presence.universeId ~= "" then p1.presence.universeId else -1
				}
			end, {}),
			onFlush = if TilesSeenCollectionFunction then UseResult else nil
		})
		
		return ReactModule.useMemo(function() --[[ Line: 97 ]]
			-- upvalues: UseBatchedImpressionsResult (copy)
			return {
				addTileToCollection = UseBatchedImpressionsResult.addImpression
			}
		end, { UseBatchedImpressionsResult.addImpression })
	else
		local UseRefResult = ReactModule.useRef({})
		local UseRefResult1 = ReactModule.useRef(nil)
		local UseRefResult2 = ReactModule.useRef({})
		local UseRefResult3 = ReactModule.useRef({})
		local UseRefResult4 = ReactModule.useRef(0)
		local UseResult = ReactModule.useCallback(function() --[[ Line: 111 ]]
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
		local UseResult1 = ReactModule.useCallback(function(UserId, Index, p1) --[[ Line: 170 ]]
			-- upvalues: UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult (copy), Tile (upval), UseRefResult1 (copy), FIntUserSeenCollectionBatchTimeMs (upval), UseResult (copy)
			if not UserId or not Index or UseRefResult2.current[UserId] or UseRefResult3.current[UserId] then return end
			UseRefResult3.current[UserId] = true
			table.insert(UseRefResult.current, {
				userId = UserId,
				index = Index,
				presence = if p1 and p1.presence then p1.presence.userPresenceType else "Offline",
				friendStatus = if p1 and p1.tileType == Tile.Friend then "Friend" else "NotFriend",
				recommendationContextType = if p1 and p1.recommendationContextType then p1.recommendationContextType else "None",
				recommendationRank = if p1 and p1.recommendationRank then p1.recommendationRank else -1,
				isRecommendation = p1 and p1.tileType == Tile.Recommendation,
				universeId = if p1 and p1.presence and p1.presence.universeId and p1.presence.universeId ~= "" then p1.presence.universeId else -1
			})
			
			if UseRefResult1.current then
				pcall(task.cancel, UseRefResult1.current)
			end
			UseRefResult1.current = task.delay(FIntUserSeenCollectionBatchTimeMs * 0.001, UseResult)
		end, { UseResult })
		ReactModule.useEffect(function() --[[ Line: 210 ]]
			-- upvalues: UseRefResult1 (copy), UseResult (copy)
			return function() --[[ Line: 211 ]]
				-- upvalues: UseRefResult1 (upval), UseResult (upval)
				if UseRefResult1.current then
					pcall(task.cancel, UseRefResult1.current)
				end
				UseRefResult1.current = nil
				UseResult()
			end
		end, {})
		
		return { addTileToCollection = UseResult1 }
	end
end