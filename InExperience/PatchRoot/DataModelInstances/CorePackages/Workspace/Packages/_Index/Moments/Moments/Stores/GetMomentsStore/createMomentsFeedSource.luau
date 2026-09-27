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
local getFFlagMomentsFixUnavailableDeeplinkModule = require(moments.Flags.GetFFlagMomentsFixUnavailableDeeplink)
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

local function loadDeepLinkedMoments(p3, p4, p5, p6)
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), promiseModule (ref)
	local var2, var3 = promiseModule.race({
		(if fFlagMomentsPassFeedItemIdToBackendApis then p3(p4, p5) else p3(p4)):catch(function()
			return nil
		end),
		promiseModule.delay(p6):andThen(function()
			return nil
		end)
	}):await()
	
	return if var2 and type(var3) == "table" then var3 else {
		reactionsByMomentId = nil,
		shareInfoByMomentId = nil,
		commentsByFeedItemId = nil,
		moments = {}
	}
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
	-- upvalues: momentsGetMomentsTrendingStoreModule (ref), fFlagMomentsComments (ref), var1 (ref), getDeepLinkStoreModule (ref), defaultFetchDeepLinkedMoments (ref), getFFlagMomentsFixUnavailableDeeplinkModule (ref), recommendationSource (ref), getReactionsStoreModule (ref), getShareCountsStoreModule (ref), getFFlagMomentsShareDeeplinkReliableOpenModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), shouldShowMomentInFeedModule (ref), loadDeepLinkedMomentsForUnavailableDialog (ref), loadDeepLinkedMoments (ref), fFlagMomentsContentStatsTelemetry (ref), analytics (ref), reportUnavailableFeedItemModule (ref)
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
	local var4 = getFFlagMomentsFixUnavailableDeeplinkModule()
	local var5 = nil
	
	return {
		id = "trending",
		recommendationSource = recommendationSource.Trending,
		fetchAsync = function(p5)
			-- upvalues: var3 (write), var5 (write), p4 (ref), var2 (ref), p3 (ref), getReactionsStoreModule (copy), getShareCountsStoreModule (copy), getFFlagMomentsShareDeeplinkReliableOpenModule (copy), deepLinkStore (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), shouldShowMomentInFeedModule (copy), var4 (ref), loadDeepLinkedMomentsForUnavailableDialog (copy), fetchDeepLinkedMoments (ref), deepLinkFetchTimeoutSeconds (ref), loadDeepLinkedMoments (copy), fFlagMomentsComments (copy), fFlagMomentsContentStatsTelemetry (copy), analytics (copy), recommendationSource (copy), reportUnavailableFeedItemModule (copy)
			local var6 = if var3 ~= nil then nil else var3.getOwnerGeneration(false)
			local signalTracker = p4.signalTracker
			local var7, var8 = var2.getTrending(p3(false), p5 or var5, if signalTracker then signalTracker:getSignalsPayload() else nil):await()
			
			if not var7 then
				error(var8)
			end
			local var9
			local commentsByFeedItemId = var8.commentsByFeedItemId
			
			if commentsByFeedItemId == nil then
				var9 = nil
			else
				local t = {}
				
				for i, v in commentsByFeedItemId do
					t[i] = v
				end
				var9 = t
			end
			var5 = var8.nextCursor or var5
			
			if p5 == nil then
				getReactionsStoreModule(false).clear()
				getShareCountsStoreModule(false).clear()
			end
			local var10
			getReactionsStoreModule(false).setBatchReactionCounts(var8.reactionsByMomentId or {})
			getShareCountsStoreModule(false).setBatchShareCounts(var8.shareInfoByMomentId or {})
			local t = {}
			local var11 = nil
			local momentId = nil
			
			if p5 == nil then
				if getFFlagMomentsShareDeeplinkReliableOpenModule() then
					local deepLinkedMomentId = deepLinkStore.getDeepLinkedMomentId(false)
					local var12 = if fFlagMomentsPassFeedItemIdToBackendApis then deepLinkStore.getDeepLinkedMomentTargetIdType(false) else nil
					
					if deepLinkedMomentId ~= nil then
						local t_1 = {}
						local var13 = nil
						
						for i, v in var8.moments do
							t_1[v.momentId] = true
							
							if var13 == nil then
								local var14
								if v.momentId == deepLinkedMomentId then
									var14 = true
								else
									local recommendationMetadata = v.recommendationMetadata
									var14 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == deepLinkedMomentId
								end
								if var14 then
									var13 = v
								end
							end
						end
						var10 = false
						local var15 = false
						
						if var13 ~= nil and shouldShowMomentInFeedModule(var13) then
							table.insert(t, { kind = "moment", moment = var13 })
							momentId = var13.momentId
							var10 = true
						elseif var13 == nil or var4 then
							local var16 = if var4 then loadDeepLinkedMomentsForUnavailableDialog(fetchDeepLinkedMoments, deepLinkedMomentId, var12, deepLinkFetchTimeoutSeconds) else loadDeepLinkedMoments(fetchDeepLinkedMoments, deepLinkedMomentId, var12, deepLinkFetchTimeoutSeconds)
							
							if var16 ~= nil then
								local commentsByFeedItemId_1 = var16.commentsByFeedItemId
								
								if commentsByFeedItemId_1 == nil then
									var9 = var9
								else
									local var17 = var9 or {}
									
									for i_1, v_1 in commentsByFeedItemId_1 do
										var17[i_1] = v_1
									end
									var9 = var17
								end
								if var16.reactionsByMomentId then
									getReactionsStoreModule(false).setBatchReactionCounts(var16.reactionsByMomentId)
								end
								if var16.shareInfoByMomentId then
									getShareCountsStoreModule(false).setBatchShareCounts(var16.shareInfoByMomentId)
								end
								for i_1, v_1 in var16.moments do
									local var18
									if v_1.momentId == deepLinkedMomentId then
										var18 = true
									else
										local recommendationMetadata = v_1.recommendationMetadata
										var18 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == deepLinkedMomentId
									end
									if shouldShowMomentInFeedModule(v_1) and (not var4 or var18) and (var18 or not t_1[v_1.momentId]) then
										table.insert(t, { kind = "moment", moment = v_1 })
										
										if var18 then
											var10 = true
										end
									end
								end
								var15 = var4 and not var10
							end
						end
						if var10 or var15 then
							local var19 = var15
							
							var11 = function()
								-- upvalues: deepLinkStore (copy), deepLinkedMomentId (ref), var19 (ref), p4 (copy)
								if deepLinkStore.getDeepLinkedMomentId(false) == deepLinkedMomentId then
									deepLinkStore.setDeepLinkedMomentId(nil)
									
									if var19 and p4.onDeepLinkedMomentUnavailable ~= nil then
										p4.onDeepLinkedMomentUnavailable()
									end
								end
							end
						end
					end
				else
					local var20 = if fFlagMomentsPassFeedItemIdToBackendApis then deepLinkStore.consumeDeepLinkedMoment() else nil
					
					if not fFlagMomentsPassFeedItemIdToBackendApis then
						local var21 = deepLinkStore.consumeDeepLinkedMomentId()
						
						if var21 ~= nil then
							var20 = { targetIdType = nil, targetId = var21 }
						end
					end
					if var20 ~= nil then
						local targetId = var20.targetId
						local targetIdType = var20.targetIdType
						local t_1 = {}
						local var22 = false
						
						for i, v in var8.moments do
							t_1[v.momentId] = true
							
							if var4 then
								local var23
								if v.momentId == targetId then
									var23 = true
								else
									local recommendationMetadata = v.recommendationMetadata
									var23 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == targetId
								end
								if var23 and shouldShowMomentInFeedModule(v) then
									var22 = true
								end
							end
						end
						local var24 = if var4 then loadDeepLinkedMomentsForUnavailableDialog(fetchDeepLinkedMoments, targetId, targetIdType, deepLinkFetchTimeoutSeconds) else loadDeepLinkedMoments(fetchDeepLinkedMoments, targetId, targetIdType, deepLinkFetchTimeoutSeconds)
						
						if var24 ~= nil then
							local commentsByFeedItemId_1 = var24.commentsByFeedItemId
							
							if commentsByFeedItemId_1 == nil then
								var9 = var9
							else
								local var17 = var9 or {}
								
								for i_1, v_1 in commentsByFeedItemId_1 do
									var17[i_1] = v_1
								end
								var9 = var17
							end
							if var24.reactionsByMomentId then
								getReactionsStoreModule(false).setBatchReactionCounts(var24.reactionsByMomentId)
							end
							if var24.shareInfoByMomentId then
								getShareCountsStoreModule(false).setBatchShareCounts(var24.shareInfoByMomentId)
							end
							for i_1, v_1 in var24.moments do
								local var25 = shouldShowMomentInFeedModule(v_1)
								local var26 = not var4
								
								if not var26 then
									if v_1.momentId == targetId then
										var26 = true
									else
										local recommendationMetadata = v_1.recommendationMetadata
										var26 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == targetId
									end
								end
								if var4 and var26 and var25 then
									var22 = true
								end
								if var25 and var26 and not t_1[v_1.momentId] then
									table.insert(t, { kind = "moment", moment = v_1 })
								end
							end
							if var4 and not var22 and p4.onDeepLinkedMomentUnavailable ~= nil then
								p4.onDeepLinkedMomentUnavailable()
							end
						end
					end
				end
			end
			if fFlagMomentsComments then
				local var27 = var11
				local var28 = var3
				local var29 = var9
				var11 = if var28 == nil or var6 == nil or var29 == nil then var27 else function()
					-- upvalues: var27 (ref), var28 (ref), var29 (ref), var6 (ref)
					if var27 ~= nil then
						var27()
					end
					var28.upsertMomentComments(var29, var6)
				end
			end
			for var13, var10 in var8.moments do
				if fFlagMomentsContentStatsTelemetry then
					analytics.reportMomentsFeedItemsReceived(recommendationSource.Trending)
				end
				if not (getFFlagMomentsShareDeeplinkReliableOpenModule() and (momentId ~= nil and var10.momentId == momentId)) then
					if shouldShowMomentInFeedModule(var10) then
						table.insert(t, { kind = "moment", moment = var10 })
					elseif fFlagMomentsContentStatsTelemetry then
						reportUnavailableFeedItemModule(var10, recommendationSource.Trending)
					end
				end
			end
			return {
				items = t,
				nextCursor = var8.nextCursor,
				onAccepted = var11
			}
		end
	}
end