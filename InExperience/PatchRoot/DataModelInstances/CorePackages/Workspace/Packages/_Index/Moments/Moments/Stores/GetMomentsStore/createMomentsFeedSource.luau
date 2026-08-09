local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.Signals)
local promiseModule = require(parent.Promise)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
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

local function defaultFetchDeepLinkedMoments(p0) --[[ line: 52 ]]
	-- upvalues: promiseModule (ref), fetchMomentsByIdsModule (ref)
	return promiseModule.resolve():andThen(function() --[[ line: 53 ]]
		-- upvalues: fetchMomentsByIdsModule (copy), p0 (ref)
		return fetchMomentsByIdsModule({ p0 })
	end)
end

local function loadDeepLinkedMoments(p1, p2, p3) --[[ line: 66 ]]
	-- upvalues: promiseModule (ref)
	local var12, var13 = promiseModule.race({
		p1(p2):catch(function() --[[ line: 72 ]]
			return nil
		end),
		promiseModule.delay(p3):andThen(function() --[[ line: 75 ]]
			return nil
		end)
	}):await()
	
	return if var12 and type(var13) == "table" then var13 else {
		reactionsByMomentId = nil,
		shareInfoByMomentId = nil,
		moments = {}
	}
end

return function(p4, p5) --[[ line: 86 | named "createMomentsFeedSource" ]]
	-- upvalues: momentsGetMomentsTrendingStoreModule (ref), getDeepLinkStoreModule (ref), defaultFetchDeepLinkedMoments (ref), recommendationSource (ref), getReactionsStoreModule (ref), getShareCountsStoreModule (ref), loadDeepLinkedMoments (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (ref), shouldShowMomentInFeedModule (ref)
	p5 = p5 or {}
	local var15 = if p5.trendingStore ~= nil then momentsGetMomentsTrendingStoreModule(false) else p5.trendingStore
	local deepLinkStore = p5.deepLinkStore or getDeepLinkStoreModule()
	local fetchDeepLinkedMoments = p5.fetchDeepLinkedMoments or defaultFetchDeepLinkedMoments
	local deepLinkFetchTimeoutSeconds = p5.deepLinkFetchTimeoutSeconds or 20
	local var19 = nil
	
	return {
		id = "trending",
		recommendationSource = recommendationSource.Trending,
		fetchAsync = function(p6) --[[ line: 104 ]]
			-- upvalues: var19 (write), p5 (ref), var15 (ref), p4 (ref), getReactionsStoreModule (copy), getShareCountsStoreModule (copy), deepLinkStore (ref), loadDeepLinkedMoments (copy), fetchDeepLinkedMoments (ref), deepLinkFetchTimeoutSeconds (ref), getFFlagMomentsFilterUnavailableFeedItemsModule (copy), shouldShowMomentInFeedModule (copy)
			local signalTracker = p5.signalTracker
			local var20, var21 = var15.getTrending(p4(false), p6 or var19, if signalTracker then signalTracker:getSignalsPayload() else nil):await()
			
			if not var20 then
				error(var21)
			end
			var19 = var21.nextCursor or var19
			
			if p6 == nil then
				getReactionsStoreModule(false).clear()
				getShareCountsStoreModule(false).clear()
			end
			getReactionsStoreModule(false).setBatchReactionCounts(var21.reactionsByMomentId or {})
			getShareCountsStoreModule(false).setBatchShareCounts(var21.shareInfoByMomentId or {})
			local t = {}
			
			if p6 == nil then
				local var23 = deepLinkStore.consumeDeepLinkedMomentId()
				
				if var23 ~= nil then
					local t_1 = {}
					
					for i, v in var21.moments do
						t_1[v.momentId] = true
					end
					local var25 = loadDeepLinkedMoments(fetchDeepLinkedMoments, var23, deepLinkFetchTimeoutSeconds)
					
					if var25.reactionsByMomentId then
						getReactionsStoreModule(false).setBatchReactionCounts(var25.reactionsByMomentId)
					end
					if var25.shareInfoByMomentId then
						getShareCountsStoreModule(false).setBatchShareCounts(var25.shareInfoByMomentId)
					end
					for i_1, v_1 in var25.moments do
						if (not getFFlagMomentsFilterUnavailableFeedItemsModule() or shouldShowMomentInFeedModule(v_1)) and not t_1[v_1.momentId] then
							table.insert(t, { kind = "moment", moment = v_1 })
						end
					end
				end
			end
			for i, v in var21.moments do
				if if getFFlagMomentsFilterUnavailableFeedItemsModule() then shouldShowMomentInFeedModule(v) else not v.isModerated then
					table.insert(t, { kind = "moment", moment = v })
				end
			end
			return { items = t, nextCursor = var21.nextCursor }
		end
	}
end