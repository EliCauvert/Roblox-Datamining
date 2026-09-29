local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.Signals)
local promiseModule = require(parent.Promise)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(moments.Components.Feed)
local analytics = momentsCommonModule.Analytics
local recommendationSource = momentsCommonModule.Analytics.RecommendationSource
local fFlagMomentsContentStatsTelemetry = momentsCommonModule.Flags.FFlagMomentsContentStatsTelemetry
local _ = require(moments.SignalTracker)
local momentsGetMomentsTrendingStoreModule = require(parent.DataHydration.MomentsGetMomentsTrendingStore)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local fetchMomentsByIdsModule = require(script.Parent.fetchMomentsByIds)
local shouldShowMomentInFeedModule = require(script.Parent.shouldShowMomentInFeed)
local reportUnavailableFeedItemModule = require(script.Parent.reportUnavailableFeedItem)
local getDeepLinkStoreModule = require(moments.Stores.GetDeepLinkStore)
local _ = require(moments.Stores.GetDeepLinkStore.createDeepLinkStore)
local getReactionsStoreModule = require(moments.Stores.GetReactionsStore)
local getShareCountsStoreModule = require(moments.Stores.GetShareCountsStore)
local getFFlagMomentsShareDeeplinkReliableOpenModule = require(moments.Flags.GetFFlagMomentsShareDeeplinkReliableOpen)
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments
local var1 = if fFlagMomentsComments then require(parent.DataHydration.MomentsGetMomentsCommentsStore) else nil

local function _(p1, p2, p3, p4)
	return if p2 == nil or p3 == nil or p4 == nil then p1 else function()
		-- upvalues: p1 (ref), p2 (ref), p4 (ref), p3 (ref)
		if p1 ~= nil then
			p1()
		end
		p2.upsertMomentComments(p4, p3)
	end
end

local function defaultFetchDeepLinkedMoments(p1, p2)
	-- upvalues: promiseModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), fetchMomentsByIdsModule (ref)
	return promiseModule.resolve():andThen(function()
		-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (copy), fetchMomentsByIdsModule (copy), p1 (ref), p2 (ref)
		return if fFlagMomentsPassFeedItemIdToBackendApis then fetchMomentsByIdsModule({ p1 }, p2) else fetchMomentsByIdsModule({ p1 })
	end)
end

local _ = function(p1, p2)
	if p2 == nil then
		return p1
	end
	p1 = p1 or {}
	
	for i, v in p2 do
		p1[i] = v
	end
	return p1
end

local _ = function(p3, p4)
	if p3.momentId == p4 then
		return true
	end
	local recommendationMetadata = p3.recommendationMetadata
	
	return recommendationMetadata ~= nil and recommendationMetadata.feedItemId == p4
end

local function loadDeepLinkedMomentsForUnavailableDialog(p3, p4, p5, p6)
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), promiseModule (ref)
	local var2, var3 = promiseModule.race({
		(if fFlagMomentsPassFeedItemIdToBackendApis then p3(p4, p5) else p3(p4)):catch(function()
			return nil
		end),
		promiseModule.delay(p6):andThen(function()
			return nil
		end)
	}):await()
	
	return if var2 and type(var3) == "table" then var3 else nil
end

return function(p3, p4)
	-- upvalues: momentsGetMomentsTrendingStoreModule (ref), fFlagMomentsComments (ref), var1 (ref), getDeepLinkStoreModule (ref), defaultFetchDeepLinkedMoments (ref), recommendationSource (ref), getReactionsStoreModule (ref), getShareCountsStoreModule (ref), getFFlagMomentsShareDeeplinkReliableOpenModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), shouldShowMomentInFeedModule (ref), loadDeepLinkedMomentsForUnavailableDialog (ref), fFlagMomentsContentStatsTelemetry (ref), analytics (ref), reportUnavailableFeedItemModule (ref)
	p4 = p4 or {}
	local var2 = if p4.trendingStore ~= nil then momentsGetMomentsTrendingStoreModule(false) else p4.trendingStore
	local var3 = nil
	
	if fFlagMomentsComments then
		var3 = p4.commentsStore
		
		if var3 == nil and var1 ~= nil then
			var3 = var1(false)
		end
	end
	local deepLinkStore = p4.deepLinkStore or getDeepLinkStoreModule()
	local fetchDeepLinkedMoments = p4.fetchDeepLinkedMoments or defaultFetchDeepLinkedMoments
	local deepLinkFetchTimeoutSeconds = p4.deepLinkFetchTimeoutSeconds or 20
	local var4 = nil
	
	return {
		id = "trending",
		recommendationSource = recommendationSource.Trending,
		fetchAsync = function(p5)
			-- upvalues: var3 (write), var4 (write), p4 (ref), var2 (ref), p3 (ref), getReactionsStoreModule (copy), getShareCountsStoreModule (copy), getFFlagMomentsShareDeeplinkReliableOpenModule (copy), deepLinkStore (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), shouldShowMomentInFeedModule (copy), loadDeepLinkedMomentsForUnavailableDialog (copy), fetchDeepLinkedMoments (ref), deepLinkFetchTimeoutSeconds (ref), fFlagMomentsComments (copy), fFlagMomentsContentStatsTelemetry (copy), analytics (copy), recommendationSource (copy), reportUnavailableFeedItemModule (copy)
			local var5 = if var3 ~= nil then nil else var3.getOwnerGeneration(false)
			local signalTracker = p4.signalTracker
			local var6, var7 = var2.getTrending(p3(false), p5 or var4, if signalTracker then signalTracker:getSignalsPayload() else nil):await()
			
			if not var6 then
				error(var7)
			end
			local var8
			local commentsByFeedItemId = var7.commentsByFeedItemId
			
			if commentsByFeedItemId == nil then
				var8 = nil
			else
				local t = {}
				
				for i, v in commentsByFeedItemId do
					t[i] = v
				end
				var8 = t
			end
			var4 = var7.nextCursor or var4
			
			if p5 == nil then
				getReactionsStoreModule(false).clear()
				getShareCountsStoreModule(false).clear()
			end
			local var9
			getReactionsStoreModule(false).setBatchReactionCounts(var7.reactionsByMomentId or {})
			getShareCountsStoreModule(false).setBatchShareCounts(var7.shareInfoByMomentId or {})
			local t = {}
			local var10 = nil
			local momentId = nil
			
			if p5 == nil then
				if getFFlagMomentsShareDeeplinkReliableOpenModule() then
					local deepLinkedMomentId = deepLinkStore.getDeepLinkedMomentId(false)
					local var11 = if fFlagMomentsPassFeedItemIdToBackendApis then deepLinkStore.getDeepLinkedMomentTargetIdType(false) else nil
					
					if deepLinkedMomentId ~= nil then
						local t_1 = {}
						local var12 = nil
						
						for i, v in var7.moments do
							t_1[v.momentId] = true
							
							if var12 == nil then
								local var13
								if v.momentId == deepLinkedMomentId then
									var13 = true
								else
									local recommendationMetadata = v.recommendationMetadata
									var13 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == deepLinkedMomentId
								end
								if var13 then
									var12 = v
								end
							end
						end
						var9 = false
						local var14 = false
						
						if var12 ~= nil and shouldShowMomentInFeedModule(var12) then
							table.insert(t, { kind = "moment", moment = var12 })
							momentId = var12.momentId
							var9 = true
						else
							local var15 = loadDeepLinkedMomentsForUnavailableDialog(fetchDeepLinkedMoments, deepLinkedMomentId, var11, deepLinkFetchTimeoutSeconds)
							
							if var15 ~= nil then
								local commentsByFeedItemId_1 = var15.commentsByFeedItemId
								
								if commentsByFeedItemId_1 == nil then
									var8 = var8
								else
									local var16 = var8 or {}
									
									for i_1, v_1 in commentsByFeedItemId_1 do
										var16[i_1] = v_1
									end
									var8 = var16
								end
								if var15.reactionsByMomentId then
									getReactionsStoreModule(false).setBatchReactionCounts(var15.reactionsByMomentId)
								end
								if var15.shareInfoByMomentId then
									getShareCountsStoreModule(false).setBatchShareCounts(var15.shareInfoByMomentId)
								end
								for i_1, v_1 in var15.moments do
									local var17
									if v_1.momentId == deepLinkedMomentId then
										var17 = true
									else
										local recommendationMetadata = v_1.recommendationMetadata
										var17 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == deepLinkedMomentId
									end
									if shouldShowMomentInFeedModule(v_1) and var17 then
										table.insert(t, { kind = "moment", moment = v_1 })
										var9 = true
									end
								end
								var14 = not var9
							end
						end
						if var9 or var14 then
							local var18 = var14
							
							var10 = function()
								-- upvalues: deepLinkStore (copy), deepLinkedMomentId (ref), var18 (ref), p4 (copy)
								if deepLinkStore.getDeepLinkedMomentId(false) == deepLinkedMomentId then
									deepLinkStore.setDeepLinkedMomentId(nil)
									
									if var18 and p4.onDeepLinkedMomentUnavailable ~= nil then
										p4.onDeepLinkedMomentUnavailable()
									end
								end
							end
						end
					end
				else
					local var19 = if fFlagMomentsPassFeedItemIdToBackendApis then deepLinkStore.consumeDeepLinkedMoment() else nil
					
					if not fFlagMomentsPassFeedItemIdToBackendApis then
						local var20 = deepLinkStore.consumeDeepLinkedMomentId()
						
						if var20 ~= nil then
							var19 = { targetIdType = nil, targetId = var20 }
						end
					end
					if var19 ~= nil then
						local targetId = var19.targetId
						local targetIdType = var19.targetIdType
						local t_1 = {}
						local var21 = false
						
						for i, v in var7.moments do
							local var22
							t_1[v.momentId] = true
							
							if v.momentId == targetId then
								var22 = true
							else
								local recommendationMetadata = v.recommendationMetadata
								var22 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == targetId
							end
							if var22 and shouldShowMomentInFeedModule(v) then
								var21 = true
							end
						end
						local var23 = loadDeepLinkedMomentsForUnavailableDialog(fetchDeepLinkedMoments, targetId, targetIdType, deepLinkFetchTimeoutSeconds)
						
						if var23 ~= nil then
							local commentsByFeedItemId_1 = var23.commentsByFeedItemId
							
							if commentsByFeedItemId_1 == nil then
								var8 = var8
							else
								local var16 = var8 or {}
								
								for i_1, v_1 in commentsByFeedItemId_1 do
									var16[i_1] = v_1
								end
								var8 = var16
							end
							if var23.reactionsByMomentId then
								getReactionsStoreModule(false).setBatchReactionCounts(var23.reactionsByMomentId)
							end
							if var23.shareInfoByMomentId then
								getShareCountsStoreModule(false).setBatchShareCounts(var23.shareInfoByMomentId)
							end
							for i_1, v_1 in var23.moments do
								local var24
								local var25 = shouldShowMomentInFeedModule(v_1)
								
								if v_1.momentId == targetId then
									var24 = true
								else
									local recommendationMetadata = v_1.recommendationMetadata
									var24 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == targetId
								end
								if var24 and var25 then
									var21 = true
								end
								if var25 and var24 and not t_1[v_1.momentId] then
									table.insert(t, { kind = "moment", moment = v_1 })
								end
							end
							if not var21 and p4.onDeepLinkedMomentUnavailable ~= nil then
								p4.onDeepLinkedMomentUnavailable()
							end
						end
					end
				end
			end
			if fFlagMomentsComments then
				local var26 = var10
				local var27 = var3
				local var28 = var8
				var10 = if var27 == nil or var5 == nil or var28 == nil then var26 else function()
					-- upvalues: var26 (ref), var27 (ref), var28 (ref), var5 (ref)
					if var26 ~= nil then
						var26()
					end
					var27.upsertMomentComments(var28, var5)
				end
			end
			for var12, var9 in var7.moments do
				if fFlagMomentsContentStatsTelemetry then
					analytics.reportMomentsFeedItemsReceived(recommendationSource.Trending)
				end
				if not (getFFlagMomentsShareDeeplinkReliableOpenModule() and (momentId ~= nil and var9.momentId == momentId)) then
					if shouldShowMomentInFeedModule(var9) then
						table.insert(t, { kind = "moment", moment = var9 })
					elseif fFlagMomentsContentStatsTelemetry then
						reportUnavailableFeedItemModule(var9, recommendationSource.Trending)
					end
				end
			end
			return {
				items = t,
				nextCursor = var7.nextCursor,
				onAccepted = var10
			}
		end
	}
end