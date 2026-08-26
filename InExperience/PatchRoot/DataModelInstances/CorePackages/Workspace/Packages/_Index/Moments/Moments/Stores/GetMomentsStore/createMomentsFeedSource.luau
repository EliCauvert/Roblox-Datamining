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
local getFFlagMomentsFilterUnavailableFeedItemsModule = require(moments.Flags.GetFFlagMomentsFilterUnavailableFeedItems)
local getFFlagMomentsFixUnavailableDeeplinkModule = require(moments.Flags.GetFFlagMomentsFixUnavailableDeeplink)
local getFFlagMomentsShareDeeplinkReliableOpenModule = require(moments.Flags.GetFFlagMomentsShareDeeplinkReliableOpen)
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis

local function defaultFetchDeepLinkedMoments(p1, p2)
	-- upvalues: promiseModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), fetchMomentsByIdsModule (ref)
	return promiseModule.resolve():andThen(function()
		-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (copy), fetchMomentsByIdsModule (copy), p1 (ref), p2 (ref)
		return if fFlagMomentsPassFeedItemIdToBackendApis then fetchMomentsByIdsModule({ p1 }, p2) else fetchMomentsByIdsModule({ p1 })
	end)
end

local function _(p1, p2)
	if p1.momentId == p2 then
		return true
	end
	local recommendationMetadata = p1.recommendationMetadata
	
	return recommendationMetadata ~= nil and recommendationMetadata.feedItemId == p2
end

local function loadDeepLinkedMoments(p1, p2, p3, p4)
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), promiseModule (ref)
	local var1, var2 = promiseModule.race({
		(if fFlagMomentsPassFeedItemIdToBackendApis then p1(p2, p3) else p1(p2)):catch(function()
			return nil
		end),
		promiseModule.delay(p4):andThen(function()
			return nil
		end)
	}):await()
	
	return if var1 and type(var2) == "table" then var2 else {
		reactionsByMomentId = nil,
		shareInfoByMomentId = nil,
		moments = {}
	}
end

local function loadDeepLinkedMomentsForUnavailableDialog(p1, p2, p3, p4)
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), promiseModule (ref)
	local var1, var2 = promiseModule.race({
		(if fFlagMomentsPassFeedItemIdToBackendApis then p1(p2, p3) else p1(p2)):catch(function()
			return nil
		end),
		promiseModule.delay(p4):andThen(function()
			return nil
		end)
	}):await()
	
	return if var1 and type(var2) == "table" then var2 else nil
end

return function(p1, p2)
	-- upvalues: momentsGetMomentsTrendingStoreModule (ref), getDeepLinkStoreModule (ref), defaultFetchDeepLinkedMoments (ref), getFFlagMomentsFixUnavailableDeeplinkModule (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (ref), recommendationSource (ref), getReactionsStoreModule (ref), getShareCountsStoreModule (ref), getFFlagMomentsShareDeeplinkReliableOpenModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), shouldShowMomentInFeedModule (ref), loadDeepLinkedMomentsForUnavailableDialog (ref), loadDeepLinkedMoments (ref), fFlagMomentsContentStatsTelemetry (ref), analytics (ref), reportUnavailableFeedItemModule (ref)
	p2 = p2 or {}
	local var1 = if p2.trendingStore ~= nil then momentsGetMomentsTrendingStoreModule(false) else p2.trendingStore
	local deepLinkStore = p2.deepLinkStore or getDeepLinkStoreModule()
	local fetchDeepLinkedMoments = p2.fetchDeepLinkedMoments or defaultFetchDeepLinkedMoments
	local deepLinkFetchTimeoutSeconds = p2.deepLinkFetchTimeoutSeconds or 20
	local var2 = getFFlagMomentsFixUnavailableDeeplinkModule() and getFFlagMomentsFilterUnavailableFeedItemsModule()
	local var3 = nil
	
	return {
		id = "trending",
		recommendationSource = recommendationSource.Trending,
		fetchAsync = function(p3)
			-- upvalues: var3 (write), p2 (ref), var1 (ref), p1 (ref), getReactionsStoreModule (copy), getShareCountsStoreModule (copy), getFFlagMomentsShareDeeplinkReliableOpenModule (copy), deepLinkStore (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), getFFlagMomentsFilterUnavailableFeedItemsModule (copy), shouldShowMomentInFeedModule (copy), var2 (ref), loadDeepLinkedMomentsForUnavailableDialog (copy), fetchDeepLinkedMoments (ref), deepLinkFetchTimeoutSeconds (ref), loadDeepLinkedMoments (copy), fFlagMomentsContentStatsTelemetry (copy), analytics (copy), recommendationSource (copy), reportUnavailableFeedItemModule (copy)
			local signalTracker = p2.signalTracker
			local var4, var5 = var1.getTrending(p1(false), p3 or var3, if signalTracker then signalTracker:getSignalsPayload() else nil):await()
			
			if not var4 then
				error(var5)
			end
			var3 = var5.nextCursor or var3
			
			if p3 == nil then
				getReactionsStoreModule(false).clear()
				getShareCountsStoreModule(false).clear()
			end
			local var6
			getReactionsStoreModule(false).setBatchReactionCounts(var5.reactionsByMomentId or {})
			getShareCountsStoreModule(false).setBatchShareCounts(var5.shareInfoByMomentId or {})
			local t = {}
			local var7 = nil
			local momentId = nil
			
			if p3 == nil then
				if getFFlagMomentsShareDeeplinkReliableOpenModule() then
					local deepLinkedMomentId = deepLinkStore.getDeepLinkedMomentId(false)
					local var8 = if fFlagMomentsPassFeedItemIdToBackendApis then deepLinkStore.getDeepLinkedMomentTargetIdType(false) else nil
					
					if deepLinkedMomentId ~= nil then
						local t_1 = {}
						local var9 = nil
						
						for i, v in var5.moments do
							t_1[v.momentId] = true
							
							if var9 == nil then
								local var10
								if v.momentId == deepLinkedMomentId then
									var10 = true
								else
									local recommendationMetadata = v.recommendationMetadata
									var10 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == deepLinkedMomentId
								end
								if var10 then
									var9 = v
								end
							end
						end
						var6 = false
						local var11 = false
						
						if var9 ~= nil and (not getFFlagMomentsFilterUnavailableFeedItemsModule() or shouldShowMomentInFeedModule(var9)) then
							table.insert(t, { kind = "moment", moment = var9 })
							momentId = var9.momentId
							var6 = true
						elseif var9 == nil or var2 then
							local var12 = if var2 then loadDeepLinkedMomentsForUnavailableDialog(fetchDeepLinkedMoments, deepLinkedMomentId, var8, deepLinkFetchTimeoutSeconds) else loadDeepLinkedMoments(fetchDeepLinkedMoments, deepLinkedMomentId, var8, deepLinkFetchTimeoutSeconds)
							
							if var12 ~= nil then
								if var12.reactionsByMomentId then
									getReactionsStoreModule(false).setBatchReactionCounts(var12.reactionsByMomentId)
								end
								if var12.shareInfoByMomentId then
									getShareCountsStoreModule(false).setBatchShareCounts(var12.shareInfoByMomentId)
								end
								for i_1, v_1 in var12.moments do
									local var13
									if v_1.momentId == deepLinkedMomentId then
										var13 = true
									else
										local recommendationMetadata = v_1.recommendationMetadata
										var13 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == deepLinkedMomentId
									end
									if (not getFFlagMomentsFilterUnavailableFeedItemsModule() or shouldShowMomentInFeedModule(v_1)) and (not var2 or var13) and (var13 or not t_1[v_1.momentId]) then
										table.insert(t, { kind = "moment", moment = v_1 })
										
										if var13 then
											var6 = true
										end
									end
								end
								var11 = var2 and not var6
							end
						end
						if var6 or var11 then
							local var14 = var11
							
							var7 = function()
								-- upvalues: deepLinkStore (copy), deepLinkedMomentId (ref), var14 (ref), p2 (copy)
								if deepLinkStore.getDeepLinkedMomentId(false) == deepLinkedMomentId then
									deepLinkStore.setDeepLinkedMomentId(nil)
									
									if var14 and p2.onDeepLinkedMomentUnavailable ~= nil then
										p2.onDeepLinkedMomentUnavailable()
									end
								end
							end
						end
					end
				else
					local var15 = if fFlagMomentsPassFeedItemIdToBackendApis then deepLinkStore.consumeDeepLinkedMoment() else nil
					
					if not fFlagMomentsPassFeedItemIdToBackendApis then
						local var16 = deepLinkStore.consumeDeepLinkedMomentId()
						
						if var16 ~= nil then
							var15 = { targetIdType = nil, targetId = var16 }
						end
					end
					if var15 ~= nil then
						local targetId = var15.targetId
						local targetIdType = var15.targetIdType
						local t_1 = {}
						local var17 = false
						
						for i, v in var5.moments do
							t_1[v.momentId] = true
							
							if var2 then
								local var18
								if v.momentId == targetId then
									var18 = true
								else
									local recommendationMetadata = v.recommendationMetadata
									var18 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == targetId
								end
								if var18 and shouldShowMomentInFeedModule(v) then
									var17 = true
								end
							end
						end
						local var19 = if var2 then loadDeepLinkedMomentsForUnavailableDialog(fetchDeepLinkedMoments, targetId, targetIdType, deepLinkFetchTimeoutSeconds) else loadDeepLinkedMoments(fetchDeepLinkedMoments, targetId, targetIdType, deepLinkFetchTimeoutSeconds)
						
						if var19 ~= nil then
							if var19.reactionsByMomentId then
								getReactionsStoreModule(false).setBatchReactionCounts(var19.reactionsByMomentId)
							end
							if var19.shareInfoByMomentId then
								getShareCountsStoreModule(false).setBatchShareCounts(var19.shareInfoByMomentId)
							end
							for i_1, v_1 in var19.moments do
								local var20 = not getFFlagMomentsFilterUnavailableFeedItemsModule() or shouldShowMomentInFeedModule(v_1)
								local var21 = not var2
								
								if not var21 then
									if v_1.momentId == targetId then
										var21 = true
									else
										local recommendationMetadata = v_1.recommendationMetadata
										var21 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == targetId
									end
								end
								if var2 and var21 and var20 then
									var17 = true
								end
								if var20 and var21 and not t_1[v_1.momentId] then
									table.insert(t, { kind = "moment", moment = v_1 })
								end
							end
							if var2 and not var17 and p2.onDeepLinkedMomentUnavailable ~= nil then
								p2.onDeepLinkedMomentUnavailable()
							end
						end
					end
				end
			end
			for var9, var6 in var5.moments do
				if fFlagMomentsContentStatsTelemetry then
					analytics.reportMomentsFeedItemsReceived(recommendationSource.Trending)
				end
				if not (getFFlagMomentsShareDeeplinkReliableOpenModule() and (momentId ~= nil and var6.momentId == momentId)) then
					if if getFFlagMomentsFilterUnavailableFeedItemsModule() then shouldShowMomentInFeedModule(var6) else not var6.isModerated then
						table.insert(t, { kind = "moment", moment = var6 })
					elseif fFlagMomentsContentStatsTelemetry then
						reportUnavailableFeedItemModule(var6, recommendationSource.Trending)
					end
				end
			end
			return {
				items = t,
				nextCursor = var5.nextCursor,
				onAccepted = var7
			}
		end
	}
end