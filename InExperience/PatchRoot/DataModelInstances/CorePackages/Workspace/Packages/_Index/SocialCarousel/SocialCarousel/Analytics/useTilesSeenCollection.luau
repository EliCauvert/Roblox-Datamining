local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local reactModule = require(parent.React)
local impressionsModule = require(parent.Impressions)
local sharedFlagsModule = require(parent.SharedFlags)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local useSocialCarouselAnalyticsModule = require(socialCarousel.Analytics.useSocialCarouselAnalytics)
local tile = require(socialCarousel.Common.Enums).Tile
local buildUserSeenCollectionPayload = socialLuaAnalyticsModule.Analytics.buildUserSeenCollectionPayload
local useBatchedImpressions = impressionsModule.useBatchedImpressions
local fIntUserSeenCollectionBatchTimeMs = sharedFlagsModule.FIntUserSeenCollectionBatchTimeMs
local fFlagLuaAppPYMKSendUserSeenCollection = sharedFlagsModule.FFlagLuaAppPYMKSendUserSeenCollection
local fFlagLuaAppUserSeenCollectionUnifiedFields = sharedFlagsModule.FFlagLuaAppUserSeenCollectionUnifiedFields
local _ = { Friend = "Friend", NotFriend = "NotFriend" }

return function() --[[ line: 49 | named "useTilesSeenCollection" ]]
	-- upvalues: useSocialCarouselAnalyticsModule (ref), fFlagLuaAppPYMKSendUserSeenCollection (ref), reactModule (ref), tile (ref), buildUserSeenCollectionPayload (ref), useBatchedImpressions (ref), fIntUserSeenCollectionBatchTimeMs (ref), fFlagLuaAppUserSeenCollectionUnifiedFields (ref)
	local var6 = useSocialCarouselAnalyticsModule()
	
	if fFlagLuaAppPYMKSendUserSeenCollection then
		local tilesSeenCollection = var6.tilesSeenCollection
		local var7 = useBatchedImpressions({
			batchTimeMs = fIntUserSeenCollectionBatchTimeMs,
			mapItem = reactModule.useCallback(function(p0, p1, p2) --[[ line: 54 ]]
				-- upvalues: tile (copy)
				return {
					userId = p0,
					index = p1,
					presence = if p2 and p2.presence then p2.presence.userPresenceType else "Offline",
					friendStatus = if p2 and p2.tileType == tile.Friend then "Friend" else "NotFriend",
					recommendationContextType = if p2 and p2.recommendationContextType then p2.recommendationContextType else "None",
					recommendationRank = if p2 and p2.recommendationRank then p2.recommendationRank else -1,
					isRecommendation = p2 and p2.tileType == tile.Recommendation,
					universeId = if p2 and p2.presence and (p2.presence.universeId and p2.presence.universeId ~= "") then p2.presence.universeId else -1
				}
			end, {}),
			onFlush = if tilesSeenCollection then reactModule.useCallback(function(p3, p4) --[[ line: 83 ]]
				-- upvalues: tilesSeenCollection (ref), buildUserSeenCollectionPayload (copy)
				if tilesSeenCollection then
					tilesSeenCollection(buildUserSeenCollectionPayload(p3, p4))
					
					return
				end
			end, { tilesSeenCollection }) else nil
		})
		
		return reactModule.useMemo(function() --[[ line: 97 ]]
			-- upvalues: var7 (ref)
			return { addTileToCollection = var7.addImpression }
		end, { var7.addImpression })
	end
	local var8 = reactModule.useRef({})
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef({})
	local var11 = reactModule.useRef({})
	local var12 = reactModule.useRef(0)
	local var13 = reactModule.useCallback(function() --[[ line: 111 ]]
		-- upvalues: var8 (ref), var10 (ref), var6 (ref), var12 (ref), fFlagLuaAppUserSeenCollectionUnifiedFields (copy), buildUserSeenCollectionPayload (copy), var11 (ref)
		local current = var8.current
		
		if #current == 0 then return end
		local t = {}
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		local t_4 = {}
		local t_5 = {}
		local t_6 = {}
		local t_7 = {}
		
		for i, v in current do
			if v and v.userId and v.index then
				var10.current[v.userId] = true
				table.insert(t, tostring(v.userId))
				table.insert(t_1, tostring(v.index))
				table.insert(t_4, v.friendStatus)
				table.insert(t_6, tostring(v.isRecommendation))
				table.insert(t_2, tostring(v.presence))
				table.insert(t_7, tostring(v.universeId))
				table.insert(t_5, tostring(v.recommendationContextType))
				table.insert(t_3, tostring(v.recommendationRank))
			end
		end
		if var6.tilesSeenCollection then
			var12.current += 1
			var6.tilesSeenCollection(if fFlagLuaAppUserSeenCollectionUnifiedFields then buildUserSeenCollectionPayload(current, var12.current) else {
				userIds = table.concat(t, ","),
				absolutePositions = table.concat(t_1, ","),
				presences = table.concat(t_2, ","),
				recommendationRanks = table.concat(t_3, ","),
				friendStatuses = table.concat(t_4, ","),
				recommendationContextTypes = table.concat(t_5, ","),
				isRecommendations = table.concat(t_6, ","),
				universeIds = table.concat(t_7, ","),
				tileCount = #t,
				sessionEventCount = var12.current
			})
		end
		var8.current = {}
		var11.current = {}
	end, { var6 })
	local var14 = reactModule.useCallback(function(p5, p6, p7) --[[ line: 170 ]]
		-- upvalues: var10 (ref), var11 (ref), var8 (ref), tile (copy), var9 (ref), fIntUserSeenCollectionBatchTimeMs (copy), var13 (ref)
		if not p5 or not p6 or (var10.current[p5] or var11.current[p5]) then return end
		var11.current[p5] = true
		table.insert(var8.current, {
			userId = p5,
			index = p6,
			presence = if p7 and p7.presence then p7.presence.userPresenceType else "Offline",
			friendStatus = if p7 and p7.tileType == tile.Friend then "Friend" else "NotFriend",
			recommendationContextType = if p7 and p7.recommendationContextType then p7.recommendationContextType else "None",
			recommendationRank = if p7 and p7.recommendationRank then p7.recommendationRank else -1,
			isRecommendation = p7 and p7.tileType == tile.Recommendation,
			universeId = if p7 and p7.presence and (p7.presence.universeId and p7.presence.universeId ~= "") then p7.presence.universeId else -1
		})
		
		if var9.current then
			pcall(task.cancel, var9.current)
		end
		var9.current = task.delay(fIntUserSeenCollectionBatchTimeMs * 0.001, var13)
	end, { var13 })
	reactModule.useEffect(function() --[[ line: 210 ]]
		-- upvalues: var9 (ref), var13 (ref)
		return function() --[[ line: 211 ]]
			-- upvalues: var9 (copy), var13 (copy)
			if var9.current then
				pcall(task.cancel, var9.current)
			end
			var9.current = nil
			var13()
		end
	end, {})
	
	return { addTileToCollection = var14 }
end