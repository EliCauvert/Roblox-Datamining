local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local reactModule = require(socialCarousel.Parent.React)
local useSocialCarouselAnalyticsModule = require(socialCarousel.Analytics.useSocialCarouselAnalytics)
local tile = require(socialCarousel.Common.Enums).Tile
local userSeenCollectionBatchTimeMs = game:DefineFastInt("UserSeenCollectionBatchTimeMs", 200)
local _ = { Friend = "Friend", NotFriend = "NotFriend" }

return function() --[[ line: 42 | named "useTilesSeenCollection" ]]
	-- upvalues: useSocialCarouselAnalyticsModule (ref), reactModule (ref), tile (ref), userSeenCollectionBatchTimeMs (ref)
	local var4 = useSocialCarouselAnalyticsModule()
	local var5 = reactModule.useRef({})
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef({})
	local var8 = reactModule.useRef({})
	local var9 = reactModule.useRef(0)
	local var10 = reactModule.useCallback(function() --[[ line: 52 ]]
		-- upvalues: var5 (ref), var7 (ref), var4 (ref), var9 (ref), var8 (ref)
		local current = var5.current
		
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
				var7.current[v.userId] = true
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
		if var4.tilesSeenCollection then
			var9.current += 1
			var4.tilesSeenCollection({
				userIds = table.concat(t, ","),
				absolutePositions = table.concat(t_1, ","),
				presences = table.concat(t_2, ","),
				recommendationRanks = table.concat(t_3, ","),
				friendStatuses = table.concat(t_4, ","),
				recommendationContextTypes = table.concat(t_5, ","),
				isRecommendations = table.concat(t_6, ","),
				universeIds = table.concat(t_7, ","),
				tileCount = #t,
				sessionEventCount = var9.current
			})
		end
		var5.current = {}
		var8.current = {}
	end, { var4 })
	local var11 = reactModule.useCallback(function(p0, p1, p2) --[[ line: 108 ]]
		-- upvalues: var7 (ref), var8 (ref), var5 (ref), tile (copy), var6 (ref), userSeenCollectionBatchTimeMs (copy), var10 (ref)
		if not p0 or not p1 or (var7.current[p0] or var8.current[p0]) then return end
		var8.current[p0] = true
		table.insert(var5.current, {
			userId = p0,
			index = p1,
			presence = if p2 and p2.presence then p2.presence.userPresenceType else "Offline",
			friendStatus = if p2 and p2.tileType == tile.Friend then "Friend" else "NotFriend",
			recommendationContextType = if p2 and p2.recommendationContextType then p2.recommendationContextType else "None",
			recommendationRank = if p2 and p2.recommendationRank then p2.recommendationRank else -1,
			isRecommendation = p2 and p2.tileType == tile.Recommendation,
			universeId = if p2 and p2.presence and (p2.presence.universeId and p2.presence.universeId ~= "") then p2.presence.universeId else -1
		})
		
		if var6.current then
			pcall(task.cancel, var6.current)
		end
		var6.current = task.delay(userSeenCollectionBatchTimeMs * 0.001, var10)
	end, { var10 })
	reactModule.useEffect(function() --[[ line: 148 ]]
		-- upvalues: var6 (ref), var10 (ref)
		return function() --[[ line: 149 ]]
			-- upvalues: var6 (copy), var10 (copy)
			if var6.current then
				pcall(task.cancel, var6.current)
			end
			var6.current = nil
			var10()
		end
	end, {})
	
	return { addTileToCollection = var11 }
end