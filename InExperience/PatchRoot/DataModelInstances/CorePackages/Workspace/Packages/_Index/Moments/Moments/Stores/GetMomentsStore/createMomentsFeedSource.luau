local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.Signals)
local promiseModule = require(parent.Promise)
local momentsCommonModule = require(parent.MomentsCommon)
local momentsTypesModule = require(parent.MomentsTypes)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(moments.Components.Feed)
local analytics = momentsCommonModule.Analytics
local recommendationSource = momentsCommonModule.Analytics.RecommendationSource
local fFlagMomentsContentStatsTelemetry = momentsCommonModule.Flags.FFlagMomentsContentStatsTelemetry
local _ = require(moments.SignalTracker)
local momentsGetMomentsTrendingStoreModule = require(parent.DataHydration.MomentsGetMomentsTrendingStore)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local createPendingFeedGetterModule = require(script.Parent.createPendingFeedGetter)
local momentsGetMomentsUserStoreModule = require(parent.DataHydration.MomentsGetMomentsUserStore)
local getLocalUserIdModule = require(moments.Utils.getLocalUserId)
local fetchMomentsByIdsModule = require(script.Parent.fetchMomentsByIds)
local shouldShowMomentInFeedModule = require(script.Parent.shouldShowMomentInFeed)
local reportUnavailableFeedItemModule = require(script.Parent.reportUnavailableFeedItem)
local getDeepLinkStoreModule = require(moments.Stores.GetDeepLinkStore)
local _ = require(moments.Stores.GetDeepLinkStore.createDeepLinkStore)
local getReactionsStoreModule = require(moments.Stores.GetReactionsStore)
local getShareCountsStoreModule = require(moments.Stores.GetShareCountsStore)
local getFFlagMomentsShareDeeplinkReliableOpenModule = require(moments.Flags.GetFFlagMomentsShareDeeplinkReliableOpen)
local fFlagMomentsOptimisticProfilePending = sharedFlagsModule.FFlagMomentsOptimisticProfilePending
local fFlagMomentsModeratedMomentPageModule = require(moments.Flags.FFlagMomentsModeratedMomentPage)
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments
local var1 = if fFlagMomentsComments then require(parent.DataHydration.MomentsGetMomentsCommentsStore) else nil
local momentStatus = momentsTypesModule.Enums.MomentStatus

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

local _ = function(p3, p4)
	for i, v in p3 do
		local var2
		if v.momentId == p4 then
			var2 = true
		else
			local recommendationMetadata = v.recommendationMetadata
			var2 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == p4
		end
		if var2 then
			return v
		end
	end
	return nil
end

local function makeUnavailableMomentItem(p5, p6, p7)
	-- upvalues: momentStatus (ref)
	local var3
	for i, v in p6 do
		local var4
		if v.momentId == p5 then
			var4 = true
		else
			local recommendationMetadata = v.recommendationMetadata
			var4 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == p5
		end
		if var4 then
			var3 = v
			if not var3 then
				for i, v_1 in p7 do
					local var5
					if v_1.momentId == p5 then
						var5 = true
					else
						local recommendationMetadata = v_1.recommendationMetadata
						var5 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == p5
					end
					if var5 then
						var3 = v_1
					end
				end
				var3 = nil
			end
			return {
				kind = "unavailableMoment",
				targetId = p5,
				isModerated = var3 ~= nil and (var3.status ~= momentStatus.Deleted and var3.isModerated == true)
			}
		end
	end
	var3 = nil
end

local function loadDeepLinkedMomentsForUnavailableDialog(p8, p9, p10, p11)
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), promiseModule (ref)
	local var6, var7 = promiseModule.race({
		(if fFlagMomentsPassFeedItemIdToBackendApis then p8(p9, p10) else p8(p9)):catch(function()
			return nil
		end),
		promiseModule.delay(p11):andThen(function()
			return nil
		end)
	}):await()
	
	return if var6 and type(var7) == "table" then var7 else nil
end

return function(p8, p9)
	-- upvalues: momentsGetMomentsTrendingStoreModule (ref), fFlagMomentsComments (ref), var1 (ref), getDeepLinkStoreModule (ref), defaultFetchDeepLinkedMoments (ref), fFlagMomentsOptimisticProfilePending (ref), getLocalUserIdModule (ref), createPendingFeedGetterModule (ref), momentsGetMomentsUserStoreModule (ref), recommendationSource (ref), getReactionsStoreModule (ref), getShareCountsStoreModule (ref), getFFlagMomentsShareDeeplinkReliableOpenModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), shouldShowMomentInFeedModule (ref), loadDeepLinkedMomentsForUnavailableDialog (ref), fFlagMomentsModeratedMomentPageModule (ref), makeUnavailableMomentItem (ref), fFlagMomentsContentStatsTelemetry (ref), analytics (ref), reportUnavailableFeedItemModule (ref)
	p9 = p9 or {}
	local var6 = if p9.trendingStore ~= nil then momentsGetMomentsTrendingStoreModule(false) else p9.trendingStore
	local var7 = nil
	
	if fFlagMomentsComments then
		var7 = p9.commentsStore
		
		if var7 == nil and var1 ~= nil then
			var7 = var1(false)
		end
	end
	local deepLinkStore = p9.deepLinkStore or getDeepLinkStoreModule()
	local fetchDeepLinkedMoments = p9.fetchDeepLinkedMoments or defaultFetchDeepLinkedMoments
	local deepLinkFetchTimeoutSeconds = p9.deepLinkFetchTimeoutSeconds or 20
	local var8 = nil
	local var9 = nil
	
	if fFlagMomentsOptimisticProfilePending then
		local localUserId = p9.localUserId or getLocalUserIdModule()
		
		if localUserId ~= nil then
			var9 = createPendingFeedGetterModule(localUserId, p9.userStore or momentsGetMomentsUserStoreModule(false))
		end
	end
	return {
		id = "trending",
		getPendingItems = var9,
		recommendationSource = recommendationSource.Trending,
		fetchAsync = function(p10)
			-- upvalues: var7 (write), var8 (write), p9 (ref), var6 (ref), p8 (ref), getReactionsStoreModule (copy), getShareCountsStoreModule (copy), getFFlagMomentsShareDeeplinkReliableOpenModule (copy), deepLinkStore (ref), fFlagMomentsPassFeedItemIdToBackendApis (copy), shouldShowMomentInFeedModule (copy), loadDeepLinkedMomentsForUnavailableDialog (copy), fetchDeepLinkedMoments (ref), deepLinkFetchTimeoutSeconds (ref), fFlagMomentsModeratedMomentPageModule (copy), makeUnavailableMomentItem (copy), fFlagMomentsComments (copy), fFlagMomentsOptimisticProfilePending (copy), fFlagMomentsContentStatsTelemetry (copy), analytics (copy), recommendationSource (copy), reportUnavailableFeedItemModule (copy)
			local var10 = if var7 ~= nil then nil else var7.getOwnerGeneration(false)
			local signalTracker = p9.signalTracker
			local var11, var12 = var6.getTrending(p8(false), p10 or var8, if signalTracker then signalTracker:getSignalsPayload() else nil):await()
			
			if not var11 then
				error(var12)
			end
			local var13
			local commentsByFeedItemId = var12.commentsByFeedItemId
			
			if commentsByFeedItemId == nil then
				var13 = nil
			else
				local t = {}
				
				for i, v in commentsByFeedItemId do
					t[i] = v
				end
				var13 = t
			end
			var8 = var12.nextCursor or var8
			
			if p10 == nil then
				getReactionsStoreModule(false).clear()
				getShareCountsStoreModule(false).clear()
			end
			getReactionsStoreModule(false).setBatchReactionCounts(var12.reactionsByMomentId or {})
			getShareCountsStoreModule(false).setBatchShareCounts(var12.shareInfoByMomentId or {})
			local t = {}
			local var14 = nil
			local momentId = nil
			local targetId = nil
			
			if p10 == nil then
				if getFFlagMomentsShareDeeplinkReliableOpenModule() then
					local deepLinkedMomentId = deepLinkStore.getDeepLinkedMomentId(false)
					local var15 = if fFlagMomentsPassFeedItemIdToBackendApis then deepLinkStore.getDeepLinkedMomentTargetIdType(false) else nil
					
					if deepLinkedMomentId ~= nil then
						local t_1 = {}
						local var16 = nil
						
						for i, v in var12.moments do
							t_1[v.momentId] = true
							
							if var16 == nil then
								local var17
								if v.momentId == deepLinkedMomentId then
									var17 = true
								else
									local recommendationMetadata = v.recommendationMetadata
									var17 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == deepLinkedMomentId
								end
								if var17 then
									var16 = v
								end
							end
						end
						local var18 = false
						local var19 = false
						
						if var16 ~= nil and shouldShowMomentInFeedModule(var16) then
							table.insert(t, { kind = "moment", moment = var16 })
							momentId = var16.momentId
							var18 = true
						else
							local var20 = loadDeepLinkedMomentsForUnavailableDialog(fetchDeepLinkedMoments, deepLinkedMomentId, var15, deepLinkFetchTimeoutSeconds)
							
							if var20 ~= nil then
								local commentsByFeedItemId_1 = var20.commentsByFeedItemId
								
								if commentsByFeedItemId_1 == nil then
									var13 = var13
								else
									local var21 = var13 or {}
									
									for i_1, v_1 in commentsByFeedItemId_1 do
										var21[i_1] = v_1
									end
									var13 = var21
								end
								if var20.reactionsByMomentId then
									getReactionsStoreModule(false).setBatchReactionCounts(var20.reactionsByMomentId)
								end
								if var20.shareInfoByMomentId then
									getShareCountsStoreModule(false).setBatchShareCounts(var20.shareInfoByMomentId)
								end
								for i_1, v_1 in var20.moments do
									local var22
									if v_1.momentId == deepLinkedMomentId then
										var22 = true
									else
										local recommendationMetadata = v_1.recommendationMetadata
										var22 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == deepLinkedMomentId
									end
									if shouldShowMomentInFeedModule(v_1) and var22 then
										table.insert(t, { kind = "moment", moment = v_1 })
										var18 = true
									end
								end
								var19 = not var18
								
								if fFlagMomentsModeratedMomentPageModule and var19 then
									table.insert(t, makeUnavailableMomentItem(deepLinkedMomentId, var20.moments, var12.moments))
								end
							end
						end
						if var18 or var19 then
							local var23 = var19 and not fFlagMomentsModeratedMomentPageModule
							
							var14 = function()
								-- upvalues: deepLinkStore (copy), deepLinkedMomentId (ref), var23 (ref), p9 (copy)
								if deepLinkStore.getDeepLinkedMomentId(false) == deepLinkedMomentId then
									deepLinkStore.setDeepLinkedMomentId(nil)
									
									if var23 and p9.onDeepLinkedMomentUnavailable ~= nil then
										p9.onDeepLinkedMomentUnavailable()
									end
								end
							end
						end
					end
				else
					local var24 = if fFlagMomentsPassFeedItemIdToBackendApis then deepLinkStore.consumeDeepLinkedMoment() else nil
					
					if not fFlagMomentsPassFeedItemIdToBackendApis then
						local var25 = deepLinkStore.consumeDeepLinkedMomentId()
						
						if var25 ~= nil then
							var24 = { targetIdType = nil, targetId = var25 }
						end
					end
					if var24 ~= nil then
						local targetId_1 = var24.targetId
						local targetIdType = var24.targetIdType
						local t_1 = {}
						local var26 = false
						
						for i, v in var12.moments do
							local var27
							t_1[v.momentId] = true
							
							if v.momentId == targetId_1 then
								var27 = true
							else
								local recommendationMetadata = v.recommendationMetadata
								var27 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == targetId_1
							end
							if var27 and shouldShowMomentInFeedModule(v) then
								var26 = true
							end
						end
						local var28 = loadDeepLinkedMomentsForUnavailableDialog(fetchDeepLinkedMoments, targetId_1, targetIdType, deepLinkFetchTimeoutSeconds)
						
						if var28 ~= nil then
							local commentsByFeedItemId_1 = var28.commentsByFeedItemId
							
							if commentsByFeedItemId_1 == nil then
								var13 = var13
							else
								local var21 = var13 or {}
								
								for i_1, v_1 in commentsByFeedItemId_1 do
									var21[i_1] = v_1
								end
								var13 = var21
							end
							if var28.reactionsByMomentId then
								getReactionsStoreModule(false).setBatchReactionCounts(var28.reactionsByMomentId)
							end
							if var28.shareInfoByMomentId then
								getShareCountsStoreModule(false).setBatchShareCounts(var28.shareInfoByMomentId)
							end
							for i_1, v_1 in var28.moments do
								local var29
								local var30 = shouldShowMomentInFeedModule(v_1)
								
								if v_1.momentId == targetId_1 then
									var29 = true
								else
									local recommendationMetadata = v_1.recommendationMetadata
									var29 = recommendationMetadata ~= nil and recommendationMetadata.feedItemId == targetId_1
								end
								if var29 and var30 then
									var26 = true
								end
								if var30 and var29 and not t_1[v_1.momentId] then
									table.insert(t, { kind = "moment", moment = v_1 })
								end
							end
							if fFlagMomentsModeratedMomentPageModule then
								if not var26 then
									table.insert(t, 1, makeUnavailableMomentItem(targetId_1, var28.moments, var12.moments))
								end
							elseif not var26 and p9.onDeepLinkedMomentUnavailable ~= nil then
								p9.onDeepLinkedMomentUnavailable()
							end
						end
					end
				end
			end
			if fFlagMomentsComments then
				local var31 = var14
				local var32 = var7
				local var33 = var13
				var14 = if var32 == nil or var10 == nil or var33 == nil then var31 else function()
					-- upvalues: var31 (ref), var32 (ref), var33 (ref), var10 (ref)
					if var31 ~= nil then
						var31()
					end
					var32.upsertMomentComments(var33, var10)
				end
			end
			local var34 = t[1]
			
			if fFlagMomentsOptimisticProfilePending and p10 == nil and var34 ~= nil then
				if var34.kind == "moment" then
					targetId = var34.moment.momentId
				elseif var34.kind == "unavailableMoment" then
					targetId = var34.targetId
				end
			end
			for var18, v in var12.moments do
				if fFlagMomentsContentStatsTelemetry then
					analytics.reportMomentsFeedItemsReceived(recommendationSource.Trending)
				end
				if not (getFFlagMomentsShareDeeplinkReliableOpenModule() and (momentId ~= nil and v.momentId == momentId)) then
					if shouldShowMomentInFeedModule(v) then
						table.insert(t, { kind = "moment", moment = v })
					elseif fFlagMomentsContentStatsTelemetry then
						reportUnavailableFeedItemModule(v, recommendationSource.Trending)
					end
				end
			end
			return {
				items = t,
				initialMomentId = targetId,
				nextCursor = var12.nextCursor,
				onAccepted = var14
			}
		end
	}
end