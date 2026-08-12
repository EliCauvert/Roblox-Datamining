local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.Signals)
local promiseModule = require(parent.Promise)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(moments.Components.Feed)
local recommendationSource = momentsCommonModule.Analytics.RecommendationSource
local _ = require(moments.SignalTracker)
local momentsGetMomentsTrendingStoreModule = require(parent.DataHydration.MomentsGetMomentsTrendingStore)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local fetchMomentsByIdsModule = require(script.Parent.fetchMomentsByIds)
local shouldShowMomentInFeedModule = require(script.Parent.shouldShowMomentInFeed)
local getDeepLinkStoreModule = require(moments.Stores.GetDeepLinkStore)
local _ = require(moments.Stores.GetDeepLinkStore.createDeepLinkStore)
local getReactionsStoreModule = require(moments.Stores.GetReactionsStore)
local getShareCountsStoreModule = require(moments.Stores.GetShareCountsStore)
local getFFlagMomentsFilterUnavailableFeedItemsModule = require(moments.Flags.GetFFlagMomentsFilterUnavailableFeedItems)
local getFFlagMomentsFixUnavailableDeeplinkModule = require(moments.Flags.GetFFlagMomentsFixUnavailableDeeplink)
local getFFlagMomentsShareDeeplinkReliableOpenModule = require(moments.Flags.GetFFlagMomentsShareDeeplinkReliableOpen)
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis

local function defaultFetchDeepLinkedMoments(p0, p1) --[[ line: 58 ]]
	-- upvalues: promiseModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), fetchMomentsByIdsModule (ref)
	return promiseModule.resolve():andThen(function() --[[ line: 59 ]]
		-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (copy), fetchMomentsByIdsModule (copy), p0 (ref), p1 (ref)
		return if fFlagMomentsPassFeedItemIdToBackendApis then fetchMomentsByIdsModule({ p0 }, p1) else fetchMomentsByIdsModule({ p0 })
	end)
end

local function _(p2, p3) --[[ line: 72 | named "hasDeepLinkIdentity" ]]
	if p2.momentId == p3 then
		return true
	end
	local recommendationMetadata = p2.recommendationMetadata
	
	return recommendationMetadata ~= nil and recommendationMetadata.feedItemId == p3
end

local function loadDeepLinkedMoments(p4, p5, p6, p7) --[[ line: 82 ]]
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), promiseModule (ref)
	local var16, var17 = promiseModule.race({
		(if fFlagMomentsPassFeedItemIdToBackendApis then p4(p5, p6) else p4(p5)):catch(function() --[[ line: 92 ]]
			return nil
		end),
		promiseModule.delay(p7):andThen(function() --[[ line: 95 ]]
			return nil
		end)
	}):await()
	
	return if var16 and type(var17) == "table" then var17 else {
		reactionsByMomentId = nil,
		shareInfoByMomentId = nil,
		moments = {}
	}
end

local function loadDeepLinkedMomentsForUnavailableDialog(p8, p9, p10, p11) --[[ line: 108 ]]
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), promiseModule (ref)
	local var18, var19 = promiseModule.race({
		(if fFlagMomentsPassFeedItemIdToBackendApis then p8(p9, p10) else p8(p9)):catch(function() --[[ line: 117 ]]
			return nil
		end),
		promiseModule.delay(p11):andThen(function() --[[ line: 120 ]]
			return nil
		end)
	}):await()
	
	return if var18 and type(var19) == "table" then var19 else nil
end

return function(p12, p13) --[[ line: 131 | named "createMomentsFeedSource" ]]
	-- upvalues: momentsGetMomentsTrendingStoreModule (ref), getDeepLinkStoreModule (ref), defaultFetchDeepLinkedMoments (ref), getFFlagMomentsFixUnavailableDeeplinkModule (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (ref), recommendationSource (ref), getReactionsStoreModule (ref), getShareCountsStoreModule (ref), getFFlagMomentsShareDeeplinkReliableOpenModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), shouldShowMomentInFeedModule (ref), loadDeepLinkedMomentsForUnavailableDialog (ref), loadDeepLinkedMoments (ref)
	p13 = p13 or {}
	local var21 = if p13.trendingStore ~= nil then momentsGetMomentsTrendingStoreModule(false) else p13.trendingStore
	local deepLinkStore = p13.deepLinkStore or getDeepLinkStoreModule()
	local fetchDeepLinkedMoments = p13.fetchDeepLinkedMoments or defaultFetchDeepLinkedMoments
	local deepLinkFetchTimeoutSeconds = p13.deepLinkFetchTimeoutSeconds or 20
	local var25 = getFFlagMomentsFixUnavailableDeeplinkModule() and getFFlagMomentsFilterUnavailableFeedItemsModule()
	local var26 = nil
	
	return {
		id = "trending",
		recommendationSource = recommendationSource.Trending,
		fetchAsync = function(p14) --[[ line: 151 ]]
			-- upvalues: var26 (write), p13 (ref), var21 (ref), p12 (ref), getReactionsStoreModule (copy), getShareCountsStoreModule (copy), getFFlagMomentsShareDeeplinkReliableOpenModule (copy), deepLinkStore (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), getFFlagMomentsFilterUnavailableFeedItemsModule (copy), shouldShowMomentInFeedModule (copy), var25 (ref), loadDeepLinkedMomentsForUnavailableDialog (copy), fetchDeepLinkedMoments (ref), deepLinkFetchTimeoutSeconds (ref), loadDeepLinkedMoments (copy)
			local signalTracker = p13.signalTracker
			local var27, var28 = var21.getTrending(p12(false), p14 or var26, if signalTracker then signalTracker:getSignalsPayload() else nil):await()
			
			if not var27 then
				error(var28)
			end
			var26 = var28.nextCursor or var26
			
			if p14 == nil then
				getReactionsStoreModule(false).clear()
				getShareCountsStoreModule(false).clear()
			end
			local var35
			getReactionsStoreModule(false).setBatchReactionCounts(var28.reactionsByMomentId or {})
			getShareCountsStoreModule(false).setBatchShareCounts(var28.shareInfoByMomentId or {})
			local t = {}
			local var30 = nil
			local momentId = nil
			
			if p14 == nil then
				if getFFlagMomentsShareDeeplinkReliableOpenModule() then
					local deepLinkedMomentId = deepLinkStore.getDeepLinkedMomentId(false)
					local var32 = if fFlagMomentsPassFeedItemIdToBackendApis then deepLinkStore.getDeepLinkedMomentTargetIdType(false) else nil
					
					if deepLinkedMomentId ~= nil then
						local t_1 = {}
						local var34 = nil
						
						for i, v in var28.moments do
							t_1[v.momentId] = true
							
							if var34 == nil then
								local var40
								if v.momentId == deepLinkedMomentId then
									var40 = true
								else
									local recommendationMetadata = v.recommendationMetadata
									var40 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == deepLinkedMomentId
								end
								if var40 then
									var34 = v
								end
							end
						end
						var35 = false
						local var36 = false
						
						if var34 ~= nil and (not getFFlagMomentsFilterUnavailableFeedItemsModule() or shouldShowMomentInFeedModule(var34)) then
							table.insert(t, { kind = "moment", moment = var34 })
							momentId = var34.momentId
							var35 = true
						elseif var34 == nil or var25 then
							local var37 = if var25 then loadDeepLinkedMomentsForUnavailableDialog(fetchDeepLinkedMoments, deepLinkedMomentId, var32, deepLinkFetchTimeoutSeconds) else loadDeepLinkedMoments(fetchDeepLinkedMoments, deepLinkedMomentId, var32, deepLinkFetchTimeoutSeconds)
							
							if var37 ~= nil then
								if var37.reactionsByMomentId then
									getReactionsStoreModule(false).setBatchReactionCounts(var37.reactionsByMomentId)
								end
								if var37.shareInfoByMomentId then
									getShareCountsStoreModule(false).setBatchShareCounts(var37.shareInfoByMomentId)
								end
								for i_1, v_1 in var37.moments do
									local var38
									if v_1.momentId == deepLinkedMomentId then
										var38 = true
									else
										local recommendationMetadata = v_1.recommendationMetadata
										var38 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == deepLinkedMomentId
									end
									if (not getFFlagMomentsFilterUnavailableFeedItemsModule() or shouldShowMomentInFeedModule(v_1)) and (not var25 or var38) and (var38 or not t_1[v_1.momentId]) then
										table.insert(t, { kind = "moment", moment = v_1 })
										
										if var38 then
											var35 = true
										end
									end
								end
								var36 = var25 and not var35
							end
						end
						if var35 or var36 then
							local var39 = var36
							
							var30 = function() --[[ line: 270 ]]
								-- upvalues: deepLinkStore (copy), deepLinkedMomentId (ref), var39 (ref), p13 (copy)
								if deepLinkStore.getDeepLinkedMomentId(false) == deepLinkedMomentId then
									deepLinkStore.setDeepLinkedMomentId(nil)
									
									if var39 and p13.onDeepLinkedMomentUnavailable ~= nil then
										p13.onDeepLinkedMomentUnavailable()
									end
								end
							end
						end
					end
				else
					local var41 = if fFlagMomentsPassFeedItemIdToBackendApis then deepLinkStore.consumeDeepLinkedMoment() else nil
					
					if not fFlagMomentsPassFeedItemIdToBackendApis then
						local var42 = deepLinkStore.consumeDeepLinkedMomentId()
						
						if var42 ~= nil then
							var41 = { targetIdType = nil, targetId = var42 }
						end
					end
					if var41 ~= nil then
						local targetId = var41.targetId
						local targetIdType = var41.targetIdType
						local t_1 = {}
						local var44 = false
						
						for i, v in var28.moments do
							t_1[v.momentId] = true
							
							if var25 then
								local var48
								if v.momentId == targetId then
									var48 = true
								else
									local recommendationMetadata = v.recommendationMetadata
									var48 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == targetId
								end
								if var48 and shouldShowMomentInFeedModule(v) then
									var44 = true
								end
							end
						end
						local var45 = if var25 then loadDeepLinkedMomentsForUnavailableDialog(fetchDeepLinkedMoments, targetId, targetIdType, deepLinkFetchTimeoutSeconds) else loadDeepLinkedMoments(fetchDeepLinkedMoments, targetId, targetIdType, deepLinkFetchTimeoutSeconds)
						
						if var45 ~= nil then
							if var45.reactionsByMomentId then
								getReactionsStoreModule(false).setBatchReactionCounts(var45.reactionsByMomentId)
							end
							if var45.shareInfoByMomentId then
								getShareCountsStoreModule(false).setBatchShareCounts(var45.shareInfoByMomentId)
							end
							for i_1, v_1 in var45.moments do
								local var46 = not getFFlagMomentsFilterUnavailableFeedItemsModule() or shouldShowMomentInFeedModule(v_1)
								local var47 = not var25
								
								if not var47 then
									if v_1.momentId == targetId then
										var47 = true
									else
										local recommendationMetadata = v_1.recommendationMetadata
										var47 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == targetId
									end
								end
								if var25 and var47 and var46 then
									var44 = true
								end
								if var46 and var47 and not t_1[v_1.momentId] then
									table.insert(t, { kind = "moment", moment = v_1 })
								end
							end
							if var25 and not var44 and p13.onDeepLinkedMomentUnavailable ~= nil then
								p13.onDeepLinkedMomentUnavailable()
							end
						end
					end
				end
			end
			for var34, var35 in var28.moments do
				if not (getFFlagMomentsShareDeeplinkReliableOpenModule() and (momentId ~= nil and var35.momentId == momentId)) and (if getFFlagMomentsFilterUnavailableFeedItemsModule() then shouldShowMomentInFeedModule(var35) else not var35.isModerated) then
					table.insert(t, { kind = "moment", moment = var35 })
				end
			end
			return {
				items = t,
				nextCursor = var28.nextCursor,
				onAccepted = var30
			}
		end
	}
end