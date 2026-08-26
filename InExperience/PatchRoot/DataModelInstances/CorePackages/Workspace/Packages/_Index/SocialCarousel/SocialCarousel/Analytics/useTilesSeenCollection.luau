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

return function()
	-- upvalues: useSocialCarouselAnalyticsModule (ref), fFlagLuaAppPYMKSendUserSeenCollection (ref), reactModule (ref), tile (ref), buildUserSeenCollectionPayload (ref), useBatchedImpressions (ref), fIntUserSeenCollectionBatchTimeMs (ref), fFlagLuaAppUserSeenCollectionUnifiedFields (ref)
	local var1 = useSocialCarouselAnalyticsModule()
	
	if fFlagLuaAppPYMKSendUserSeenCollection then
		local tilesSeenCollection = var1.tilesSeenCollection
		local var2 = useBatchedImpressions({
			batchTimeMs = fIntUserSeenCollectionBatchTimeMs,
			mapItem = reactModule.useCallback(function(p1, p2, p3)
				-- upvalues: tile (copy)
				return {
					userId = p1,
					index = p2,
					presence = if p3 and p3.presence then p3.presence.userPresenceType else "Offline",
					friendStatus = if p3 and p3.tileType == tile.Friend then "Friend" else "NotFriend",
					recommendationContextType = if p3 and p3.recommendationContextType then p3.recommendationContextType else "None",
					recommendationRank = if p3 and p3.recommendationRank then p3.recommendationRank else -1,
					isRecommendation = p3 and p3.tileType == tile.Recommendation,
					universeId = if p3 and p3.presence and (p3.presence.universeId and p3.presence.universeId ~= "") then p3.presence.universeId else -1
				}
			end, {}),
			onFlush = if tilesSeenCollection then reactModule.useCallback(function(p1, p2)
				-- upvalues: tilesSeenCollection (ref), buildUserSeenCollectionPayload (copy)
				if tilesSeenCollection then
					tilesSeenCollection(buildUserSeenCollectionPayload(p1, p2))
					
					return
				end
			end, { tilesSeenCollection }) else nil
		})
		
		return reactModule.useMemo(function()
			-- upvalues: var2 (ref)
			return { addTileToCollection = var2.addImpression }
		end, { var2.addImpression })
	end
	local var3 = reactModule.useRef({})
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef({})
	local var6 = reactModule.useRef({})
	local var7 = reactModule.useRef(0)
	local var8 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var5 (ref), var1 (ref), var7 (ref), fFlagLuaAppUserSeenCollectionUnifiedFields (copy), buildUserSeenCollectionPayload (copy), var6 (ref)
		local current = var3.current
		
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
				var5.current[v.userId] = true
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
		if var1.tilesSeenCollection then
			var7.current += 1
			var1.tilesSeenCollection(if fFlagLuaAppUserSeenCollectionUnifiedFields then buildUserSeenCollectionPayload(current, var7.current) else {
				userIds = table.concat(t, ","),
				absolutePositions = table.concat(t_1, ","),
				presences = table.concat(t_2, ","),
				recommendationRanks = table.concat(t_3, ","),
				friendStatuses = table.concat(t_4, ","),
				recommendationContextTypes = table.concat(t_5, ","),
				isRecommendations = table.concat(t_6, ","),
				universeIds = table.concat(t_7, ","),
				tileCount = #t,
				sessionEventCount = var7.current
			})
		end
		var3.current = {}
		var6.current = {}
	end, { var1 })
	local var9 = reactModule.useCallback(function(p1, p2, p3)
		-- upvalues: var5 (ref), var6 (ref), var3 (ref), tile (copy), var4 (ref), fIntUserSeenCollectionBatchTimeMs (copy), var8 (ref)
		if not p1 or not p2 or (var5.current[p1] or var6.current[p1]) then return end
		var6.current[p1] = true
		table.insert(var3.current, {
			userId = p1,
			index = p2,
			presence = if p3 and p3.presence then p3.presence.userPresenceType else "Offline",
			friendStatus = if p3 and p3.tileType == tile.Friend then "Friend" else "NotFriend",
			recommendationContextType = if p3 and p3.recommendationContextType then p3.recommendationContextType else "None",
			recommendationRank = if p3 and p3.recommendationRank then p3.recommendationRank else -1,
			isRecommendation = p3 and p3.tileType == tile.Recommendation,
			universeId = if p3 and p3.presence and (p3.presence.universeId and p3.presence.universeId ~= "") then p3.presence.universeId else -1
		})
		
		if var4.current then
			pcall(task.cancel, var4.current)
		end
		var4.current = task.delay(fIntUserSeenCollectionBatchTimeMs * 0.001, var8)
	end, { var8 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var8 (ref)
		return function()
			-- upvalues: var4 (copy), var8 (copy)
			if var4.current then
				pcall(task.cancel, var4.current)
			end
			var4.current = nil
			var8()
		end
	end, {})
	
	return { addTileToCollection = var9 }
end