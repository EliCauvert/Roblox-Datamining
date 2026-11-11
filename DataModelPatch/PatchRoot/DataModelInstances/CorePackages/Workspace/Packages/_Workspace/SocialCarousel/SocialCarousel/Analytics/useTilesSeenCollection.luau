local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local ReactModule = require(SocialCarousel.Parent.React)
local UseSocialCarouselAnalyticsModule = require(SocialCarousel.Analytics.useSocialCarouselAnalytics)
local Tile = require(SocialCarousel.Common.Enums).Tile
local UserSeenCollectionBatchTimeMs = game:DefineFastInt("UserSeenCollectionBatchTimeMs", 200)

return function()
	-- upvalues: UseSocialCarouselAnalyticsModule (copy), ReactModule (copy), Tile (copy), UserSeenCollectionBatchTimeMs (copy)
	local UseSocialCarouselAnalyticsModuleResult = UseSocialCarouselAnalyticsModule()
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef({})
	local UseRefResult3 = ReactModule.useRef({})
	local UseRefResult4 = ReactModule.useRef(0)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult2 (copy), UseSocialCarouselAnalyticsModuleResult (copy), UseRefResult4 (copy), UseRefResult3 (copy)
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
			UseSocialCarouselAnalyticsModuleResult.tilesSeenCollection({
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
	local UseResult1 = ReactModule.useCallback(function(UserId, Index, p1)
		-- upvalues: UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult (copy), Tile (upval), UseRefResult1 (copy), UserSeenCollectionBatchTimeMs (upval), UseResult (copy)
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
		UseRefResult1.current = task.delay(UserSeenCollectionBatchTimeMs * 0.001, UseResult)
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseResult (copy)
		return function()
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