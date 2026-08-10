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

local function defaultFetchDeepLinkedMoments(p0, p1) --[[ line: 61 ]]
	-- upvalues: promiseModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), fetchMomentsByIdsModule (ref)
	return promiseModule.resolve():andThen(function() --[[ line: 62 ]]
		-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (copy), fetchMomentsByIdsModule (copy), p0 (ref), p1 (ref)
		return if fFlagMomentsPassFeedItemIdToBackendApis then fetchMomentsByIdsModule({ p0 }, p1) else fetchMomentsByIdsModule({ p0 })
	end)
end

local function _(p2, p3) --[[ line: 75 | named "hasDeepLinkIdentity" ]]
	if p2.momentId == p3 then
		return true
	end
	local recommendationMetadata = p2.recommendationMetadata
	
	return recommendationMetadata ~= nil and recommendationMetadata.feedItemId == p3
end

local function loadDeepLinkedMoments(p4, p5, p6, p7) --[[ line: 85 ]]
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), promiseModule (ref)
	local var17, var18 = promiseModule.race({
		(if fFlagMomentsPassFeedItemIdToBackendApis then p4(p5, p6) else p4(p5)):catch(function() --[[ line: 95 ]]
			return nil
		end),
		promiseModule.delay(p7):andThen(function() --[[ line: 98 ]]
			return nil
		end)
	}):await()
	
	return if var17 and type(var18) == "table" then var18 else {
		reactionsByMomentId = nil,
		shareInfoByMomentId = nil,
		moments = {}
	}
end

local function loadDeepLinkedMomentsForUnavailableDialog(p8, p9, p10, p11) --[[ line: 111 ]]
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), promiseModule (ref)
	local var19, var20 = promiseModule.race({
		(if fFlagMomentsPassFeedItemIdToBackendApis then p8(p9, p10) else p8(p9)):catch(function() --[[ line: 120 ]]
			return nil
		end),
		promiseModule.delay(p11):andThen(function() --[[ line: 123 ]]
			return nil
		end)
	}):await()
	
	return if var19 and type(var20) == "table" then var20 else nil
end

return function(p12, p13) --[[ line: 134 | named "createMomentsFeedSource" ]]
	-- upvalues: momentsGetMomentsTrendingStoreModule (ref), getDeepLinkStoreModule (ref), defaultFetchDeepLinkedMoments (ref), getFFlagMomentsFixUnavailableDeeplinkModule (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (ref), recommendationSource (ref), getReactionsStoreModule (ref), getShareCountsStoreModule (ref), getFFlagMomentsShareDeeplinkReliableOpenModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), shouldShowMomentInFeedModule (ref), loadDeepLinkedMomentsForUnavailableDialog (ref), loadDeepLinkedMoments (ref), fFlagMomentsContentStatsTelemetry (ref), analytics (ref), reportUnavailableFeedItemModule (ref)
	p13 = p13 or {}
	local var22 = if p13.trendingStore ~= nil then momentsGetMomentsTrendingStoreModule(false) else p13.trendingStore
	local deepLinkStore = p13.deepLinkStore or getDeepLinkStoreModule()
	local fetchDeepLinkedMoments = p13.fetchDeepLinkedMoments or defaultFetchDeepLinkedMoments
	local deepLinkFetchTimeoutSeconds = p13.deepLinkFetchTimeoutSeconds or 20
	local var26 = getFFlagMomentsFixUnavailableDeeplinkModule() and getFFlagMomentsFilterUnavailableFeedItemsModule()
	local var27 = nil
	
	return {
		id = "trending",
		recommendationSource = recommendationSource.Trending,
		fetchAsync = function(p14) --[[ line: 154 ]]
			-- upvalues: var27 (write), p13 (ref), var22 (ref), p12 (ref), getReactionsStoreModule (copy), getShareCountsStoreModule (copy), getFFlagMomentsShareDeeplinkReliableOpenModule (copy), deepLinkStore (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), getFFlagMomentsFilterUnavailableFeedItemsModule (copy), shouldShowMomentInFeedModule (copy), var26 (ref), loadDeepLinkedMomentsForUnavailableDialog (copy), fetchDeepLinkedMoments (ref), deepLinkFetchTimeoutSeconds (ref), loadDeepLinkedMoments (copy), fFlagMomentsContentStatsTelemetry (copy), analytics (copy), recommendationSource (copy), reportUnavailableFeedItemModule (copy)
			local signalTracker = p13.signalTracker
			local var28, var29 = var22.getTrending(p12(false), p14 or var27, if signalTracker then signalTracker:getSignalsPayload() else nil):await()
			
			if not var28 then
				error(var29)
			end
			var27 = var29.nextCursor or var27
			
			if p14 == nil then
				getReactionsStoreModule(false).clear()
				getShareCountsStoreModule(false).clear()
			end
			local var36
			getReactionsStoreModule(false).setBatchReactionCounts(var29.reactionsByMomentId or {})
			getShareCountsStoreModule(false).setBatchShareCounts(var29.shareInfoByMomentId or {})
			local t = {}
			local var31 = nil
			local momentId = nil
			
			if p14 == nil then
				if getFFlagMomentsShareDeeplinkReliableOpenModule() then
					local deepLinkedMomentId = deepLinkStore.getDeepLinkedMomentId(false)
					local var33 = if fFlagMomentsPassFeedItemIdToBackendApis then deepLinkStore.getDeepLinkedMomentTargetIdType(false) else nil
					
					if deepLinkedMomentId ~= nil then
						local t_1 = {}
						local var35 = nil
						
						for i, v in var29.moments do
							t_1[v.momentId] = true
							
							if var35 == nil then
								local var41
								if v.momentId == deepLinkedMomentId then
									var41 = true
								else
									local recommendationMetadata = v.recommendationMetadata
									var41 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == deepLinkedMomentId
								end
								if var41 then
									var35 = v
								end
							end
						end
						var36 = false
						local var37 = false
						
						if var35 ~= nil and (not getFFlagMomentsFilterUnavailableFeedItemsModule() or shouldShowMomentInFeedModule(var35)) then
							table.insert(t, { kind = "moment", moment = var35 })
							momentId = var35.momentId
							var36 = true
						elseif var35 == nil or var26 then
							local var38 = if var26 then loadDeepLinkedMomentsForUnavailableDialog(fetchDeepLinkedMoments, deepLinkedMomentId, var33, deepLinkFetchTimeoutSeconds) else loadDeepLinkedMoments(fetchDeepLinkedMoments, deepLinkedMomentId, var33, deepLinkFetchTimeoutSeconds)
							
							if var38 ~= nil then
								if var38.reactionsByMomentId then
									getReactionsStoreModule(false).setBatchReactionCounts(var38.reactionsByMomentId)
								end
								if var38.shareInfoByMomentId then
									getShareCountsStoreModule(false).setBatchShareCounts(var38.shareInfoByMomentId)
								end
								for i_1, v_1 in var38.moments do
									local var39
									if v_1.momentId == deepLinkedMomentId then
										var39 = true
									else
										local recommendationMetadata = v_1.recommendationMetadata
										var39 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == deepLinkedMomentId
									end
									if (not getFFlagMomentsFilterUnavailableFeedItemsModule() or shouldShowMomentInFeedModule(v_1)) and (not var26 or var39) and (var39 or not t_1[v_1.momentId]) then
										table.insert(t, { kind = "moment", moment = v_1 })
										
										if var39 then
											var36 = true
										end
									end
								end
								var37 = var26 and not var36
							end
						end
						if var36 or var37 then
							local var40 = var37
							
							var31 = function() --[[ line: 273 ]]
								-- upvalues: deepLinkStore (copy), deepLinkedMomentId (ref), var40 (ref), p13 (copy)
								if deepLinkStore.getDeepLinkedMomentId(false) == deepLinkedMomentId then
									deepLinkStore.setDeepLinkedMomentId(nil)
									
									if var40 and p13.onDeepLinkedMomentUnavailable ~= nil then
										p13.onDeepLinkedMomentUnavailable()
									end
								end
							end
						end
					end
				else
					local var42 = if fFlagMomentsPassFeedItemIdToBackendApis then deepLinkStore.consumeDeepLinkedMoment() else nil
					
					if not fFlagMomentsPassFeedItemIdToBackendApis then
						local var43 = deepLinkStore.consumeDeepLinkedMomentId()
						
						if var43 ~= nil then
							var42 = { targetIdType = nil, targetId = var43 }
						end
					end
					if var42 ~= nil then
						local targetId = var42.targetId
						local targetIdType = var42.targetIdType
						local t_1 = {}
						local var45 = false
						
						for i, v in var29.moments do
							t_1[v.momentId] = true
							
							if var26 then
								local var49
								if v.momentId == targetId then
									var49 = true
								else
									local recommendationMetadata = v.recommendationMetadata
									var49 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == targetId
								end
								if var49 and shouldShowMomentInFeedModule(v) then
									var45 = true
								end
							end
						end
						local var46 = if var26 then loadDeepLinkedMomentsForUnavailableDialog(fetchDeepLinkedMoments, targetId, targetIdType, deepLinkFetchTimeoutSeconds) else loadDeepLinkedMoments(fetchDeepLinkedMoments, targetId, targetIdType, deepLinkFetchTimeoutSeconds)
						
						if var46 ~= nil then
							if var46.reactionsByMomentId then
								getReactionsStoreModule(false).setBatchReactionCounts(var46.reactionsByMomentId)
							end
							if var46.shareInfoByMomentId then
								getShareCountsStoreModule(false).setBatchShareCounts(var46.shareInfoByMomentId)
							end
							for i_1, v_1 in var46.moments do
								local var47 = not getFFlagMomentsFilterUnavailableFeedItemsModule() or shouldShowMomentInFeedModule(v_1)
								local var48 = not var26
								
								if not var48 then
									if v_1.momentId == targetId then
										var48 = true
									else
										local recommendationMetadata = v_1.recommendationMetadata
										var48 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == targetId
									end
								end
								if var26 and var48 and var47 then
									var45 = true
								end
								if var47 and var48 and not t_1[v_1.momentId] then
									table.insert(t, { kind = "moment", moment = v_1 })
								end
							end
							if var26 and not var45 and p13.onDeepLinkedMomentUnavailable ~= nil then
								p13.onDeepLinkedMomentUnavailable()
							end
						end
					end
				end
			end
			for var35, var36 in var29.moments do
				if fFlagMomentsContentStatsTelemetry then
					analytics.reportMomentsFeedItemsReceived(recommendationSource.Trending)
				end
				if not (getFFlagMomentsShareDeeplinkReliableOpenModule() and (momentId ~= nil and var36.momentId == momentId)) then
					if if getFFlagMomentsFilterUnavailableFeedItemsModule() then shouldShowMomentInFeedModule(var36) else not var36.isModerated then
						table.insert(t, { kind = "moment", moment = var36 })
					elseif fFlagMomentsContentStatsTelemetry then
						reportUnavailableFeedItemModule(var36, recommendationSource.Trending)
					end
				end
			end
			return {
				items = t,
				nextCursor = var29.nextCursor,
				onAccepted = var31
			}
		end
	}
end