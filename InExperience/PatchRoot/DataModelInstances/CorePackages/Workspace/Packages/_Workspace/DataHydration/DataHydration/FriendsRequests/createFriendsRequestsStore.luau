local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local dataStatus = require(dataHydration.DataHydrationTypes).DataStatus
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local mergeListsWithoutDuplicates = require(dataHydration.DataHydrationUtils).mergeListsWithoutDuplicates
local _ = require(parent.Signals)
local localUserIdStore = require(parent.LocalUserIdStore).LocalUserIdStore
local fFlagAddFriendsPageTrustedFriendRequestSection = require(parent.SharedFlags).FFlagAddFriendsPageTrustedFriendRequestSection
local fFlagFriendsRequestsMergeListsWithoutDuplicates = require(parent.SharedFlags).FFlagFriendsRequestsMergeListsWithoutDuplicates
local fFlagEnableGetFriendshipStatus = require(parent.SharedFlags).FFlagEnableGetFriendshipStatus
local requestsModule = require(script.Parent.Requests)
local _ = require(script.Parent.FriendsRequestsStoreTypes)
local friendsStoreModule = require(dataHydration.Friends.FriendsStore)
local friendsRequestsPageSize = game:DefineFastInt("FriendsRequestsPageSize", 25)
local friendsRequestsCacheTtlSec = game:DefineFastInt("FriendsRequestsCacheTtlSec", 0)

local function _(p1)
	return if p1 > 0 then p1 else 1e999
end

local _ = function(p1)
	return if p1 == nil then nil else tostring(p1)
end

local _ = function(p1)
	return if p1 == nil or p1 == "" then nil else p1
end

local function normalizeFriendRequest(p1)
	local id = p1.id
	local var1 = if id == nil then nil else tostring(id)
	
	if not var1 then
		return nil
	end
	local friendRequest = p1.friendRequest
	local var2 = nil
	
	if p1.mutualFriendsList then
		local t = {}
		
		for i, v in p1.mutualFriendsList do
			table.insert(t, tostring(v))
		end
		var2 = t
	end
	return {
		id = var1,
		isUnseen = p1.isUnseen,
		sentAt = if friendRequest and friendRequest.sentAt then DateTime.fromIsoDate(friendRequest.sentAt) else nil,
		sourceUniverseId = if friendRequest then friendRequest.sourceUniverseId else nil,
		originSourceType = if friendRequest then friendRequest.originSourceType else nil,
		contactName = if friendRequest then friendRequest.contactName else nil,
		mutualFriendsIds = var2
	}
end

local function normalizeGetFriendRequestsResponse(p2)
	-- upvalues: normalizeFriendRequest (ref)
	local t = {}
	
	for i, v in if p2 and p2.data then p2.data else {} do
		local var3 = normalizeFriendRequest(v)
		
		if var3 then
			table.insert(t, var3)
		end
	end
	local var4 = if p2 then p2.nextPageCursor else nil
	local var5 = if var4 == nil or var4 == "" then nil else var4
	
	return {
		requests = t,
		nextPageCursor = var5,
		hasMore = var5 ~= nil
	}
end

local _ = function(p3, p4)
	-- upvalues: fFlagAddFriendsPageTrustedFriendRequestSection (ref), fFlagFriendsRequestsMergeListsWithoutDuplicates (ref), mergeListsWithoutDuplicates (ref)
	if not fFlagAddFriendsPageTrustedFriendRequestSection and not fFlagFriendsRequestsMergeListsWithoutDuplicates then
		error("mergeRequestsWithoutDuplicates requires FFlagAddFriendsPageTrustedFriendRequestSection or FFlagFriendsRequestsMergeListsWithoutDuplicates to be enabled")
	end
	return mergeListsWithoutDuplicates(p3, p4, "id")
end

local function updateFriendshipStatusesForPage(p3)
	-- upvalues: fFlagEnableGetFriendshipStatus (ref), friendsStoreModule (ref)
	if not fFlagEnableGetFriendshipStatus then return end
	local var6 = friendsStoreModule.get()
	
	for i, v in p3.requests do
		var6.UpdateFriendshipStatus(v.id, Enum.FriendStatus.FriendRequestReceived)
	end
end

local function mergeFriendsRequestsPage(p4, p5, p6)
	-- upvalues: fFlagAddFriendsPageTrustedFriendRequestSection (ref), fFlagFriendsRequestsMergeListsWithoutDuplicates (ref), mergeListsWithoutDuplicates (ref)
	if not p4 then
		return {
			requests = p5.requests,
			nextPageCursor = p5.nextPageCursor,
			hasMore = p5.hasMore
		}
	elseif p4.nextPageCursor ~= p6 then
		return p4
	end
	local t = {}
	local requests = p4.requests
	local requests_1 = p5.requests
	
	if not fFlagAddFriendsPageTrustedFriendRequestSection and not fFlagFriendsRequestsMergeListsWithoutDuplicates then
		error("mergeRequestsWithoutDuplicates requires FFlagAddFriendsPageTrustedFriendRequestSection or FFlagFriendsRequestsMergeListsWithoutDuplicates to be enabled")
	end
	t.requests = mergeListsWithoutDuplicates(requests, requests_1, "id")
	t.nextPageCursor = p5.nextPageCursor
	t.hasMore = p5.hasMore
	
	return t
end

local _ = function(p4)
	-- upvalues: localUserIdStore (ref), getLocalPlayerUserId (ref)
	local currentUserId = localUserIdStore.getCurrentUserId(p4)
	
	if currentUserId ~= "" then
		return currentUserId
	end
	local var7 = getLocalPlayerUserId()
	
	return if var7 then tostring(var7) else ""
end

return function()
	-- upvalues: createDataCacheModule (ref), friendsRequestsCacheTtlSec (ref), createDataResolverModule (ref), requestsModule (ref), friendsRequestsPageSize (ref), normalizeGetFriendRequestsResponse (ref), updateFriendshipStatusesForPage (ref), mergeFriendsRequestsPage (ref), localUserIdStore (ref), getLocalPlayerUserId (ref), dataStatus (ref)
	local var7 = createDataCacheModule(if friendsRequestsCacheTtlSec > 0 then friendsRequestsCacheTtlSec else 1e999)
	local var8 = createDataCacheModule()
	local var9 = createDataCacheModule()
	local var10 = false
	local var11 = nil
	
	local function _(p4)
		-- upvalues: var11 (write)
		var11 = if p4 ~= "" then nil else p4
	end
	
	local var12 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var7,
		fetchFn = function(_, p4)
			-- upvalues: var10 (write), requestsModule (copy), friendsRequestsPageSize (copy), var11 (write), normalizeGetFriendRequestsResponse (copy), updateFriendshipStatusesForPage (copy), mergeFriendsRequestsPage (copy)
			local var13 = if var10 then nil else p4.data(false)
			var10 = false
			local var14 = if var13 then var13.nextPageCursor else nil
			
			return requestsModule.GetFriendsRequests(var14, friendsRequestsPageSize, var11):andThen(function(p5)
				-- upvalues: normalizeGetFriendRequestsResponse (copy), updateFriendshipStatusesForPage (copy), mergeFriendsRequestsPage (copy), var13 (ref), var14 (ref)
				local var15 = normalizeGetFriendRequestsResponse(p5)
				updateFriendshipStatusesForPage(var15)
				
				return mergeFriendsRequestsPage(var13, var15, var14)
			end):catch(function(p5)
				error(p5)
			end)
		end
	})
	local var13 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var8,
		fetchFn = function(_)
			-- upvalues: requestsModule (copy)
			return requestsModule.GetFriendRequestsCount():andThen(function(p4)
				return if p4 and p4.count then p4.count else 0
			end)
		end
	})
	local var14 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var9,
		fetchFn = function(_)
			-- upvalues: requestsModule (copy)
			return requestsModule.GetNewFriendRequestsCount():andThen(function(p4)
				return if p4 and p4.count then p4.count else 0
			end)
		end
	})
	
	return {
		getFriendsRequests = function(p4)
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var12 (ref), var11 (write), var10 (write)
			local var15
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var16 = getLocalPlayerUserId()
				var15 = if var16 then tostring(var16) else ""
			else
				var15 = currentUserId
			end
			if p4 and p4.skipFetch then
				return var12.getCachedItem(var15)
			elseif p4 and p4.forceFetch then
				local var17
				local var18 = if p4 then p4.sessionId else nil
				local currentUserId_1 = localUserIdStore.getCurrentUserId(false)
				
				if currentUserId_1 == "" then
					local var19 = getLocalPlayerUserId()
					var17 = if var19 then tostring(var19) else ""
				else
					var17 = currentUserId_1
				end
				if not var12.isRequestInQueueOrInFlight(var17) then
					var11 = if var18 ~= "" then nil else var18
					var10 = true
					var12.fetchItem(var17)
				end
			end
			local var20 = if p4 then p4.sessionId else nil
			var11 = if var20 ~= "" then nil else var20
			
			return var12.getAndFetchItem(var15)
		end,
		fetchMoreFriendsRequests = function(p4)
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var12 (ref), dataStatus (copy), var11 (write)
			local var15
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var16 = getLocalPlayerUserId()
				var15 = if var16 then tostring(var16) else ""
			else
				var15 = currentUserId
			end
			local cachedItem = var12.getCachedItem(var15)
			local var17 = cachedItem.data(false)
			
			if var17 == nil or not var17.hasMore or var17.nextPageCursor == nil then return end
			if cachedItem.status(false) == dataStatus.NotReady then return end
			if var12.isRequestInQueueOrInFlight(var15) then
				return
			end
			var11 = if p4 ~= "" then nil else p4
			var12.fetchItem(var15)
		end,
		refetchFriendRequests = function(p4)
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var12 (ref), var11 (write), var10 (write)
			local var15
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var16 = getLocalPlayerUserId()
				var15 = if var16 then tostring(var16) else ""
			else
				var15 = currentUserId
			end
			if var12.isRequestInQueueOrInFlight(var15) then
				return
			end
			var11 = if p4 ~= "" then nil else p4
			var10 = true
			var12.fetchItem(var15)
		end,
		declineAllFriendRequests = function()
			-- upvalues: requestsModule (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), var7 (ref), var8 (ref)
			return requestsModule.DeclineAllFriendRequests():andThen(function(p4)
				-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var7 (copy), var8 (copy)
				local var15
				local currentUserId = localUserIdStore.getCurrentUserId(false)
				
				if currentUserId == "" then
					local var16 = getLocalPlayerUserId()
					var15 = if var16 then tostring(var16) else ""
				else
					var15 = currentUserId
				end
				var7.replaceItem(var15, { nextPageCursor = nil, hasMore = false, requests = {} })
				var8.replaceItem(var15, 0)
				
				return p4
			end)
		end,
		removeFriendRequestByUserId = function(p4)
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var12 (ref), var7 (ref)
			local var15
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var16 = getLocalPlayerUserId()
				var15 = if var16 then tostring(var16) else ""
			else
				var15 = currentUserId
			end
			local var17 = var12.getCachedItem(var15).data(false)
			
			if var17 == nil then return end
			local t = {}
			
			for i, v in var17.requests do
				if v.id ~= p4 then
					table.insert(t, v)
				end
			end
			var7.replaceItem(var15, {
				requests = t,
				nextPageCursor = var17.nextPageCursor,
				hasMore = var17.hasMore
			})
		end,
		appendNewUserId = function(p5)
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var12 (ref), var7 (ref)
			local var18 = if p5 == nil then nil else tostring(p5)
			
			if not var18 then return end
			local var19
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var20 = getLocalPlayerUserId()
				var19 = if var20 then tostring(var20) else ""
			else
				var19 = currentUserId
			end
			local var21 = var12.getCachedItem(var19).data(false)
			local t = { isUnseen = true, id = var18 }
			
			if var21 == nil then
				var7.replaceItem(var19, { nextPageCursor = nil, hasMore = false, requests = { t } })
				
				return
			end
			local list = { t }
			
			for i, v in var21.requests do
				if v.id ~= var18 then
					table.insert(list, v)
				end
			end
			var7.replaceItem(var19, {
				requests = list,
				nextPageCursor = var21.nextPageCursor,
				hasMore = var21.hasMore
			})
		end,
		getFriendsRequestCount = function(p6)
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var13 (ref)
			local var22
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var23 = getLocalPlayerUserId()
				var22 = if var23 then tostring(var23) else ""
			else
				var22 = currentUserId
			end
			if p6 and p6.skipFetch then
				return var13.getCachedItem(var22)
			elseif p6 and p6.forceFetch then
				local var24
				local fetchItem = var13.fetchItem
				local currentUserId_1 = localUserIdStore.getCurrentUserId(false)
				
				if currentUserId_1 == "" then
					local var25 = getLocalPlayerUserId()
					var24 = if var25 then tostring(var25) else ""
				else
					var24 = currentUserId_1
				end
				fetchItem(var24)
			end
			return var13.getAndFetchItem(var22)
		end,
		refetchFriendRequestCount = function()
			-- upvalues: var13 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			local var22
			local fetchItem = var13.fetchItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var23 = getLocalPlayerUserId()
				var22 = if var23 then tostring(var23) else ""
			else
				var22 = currentUserId
			end
			fetchItem(var22)
		end,
		getNewFriendsRequestCount = function(p6)
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var14 (ref)
			local var22
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var23 = getLocalPlayerUserId()
				var22 = if var23 then tostring(var23) else ""
			else
				var22 = currentUserId
			end
			return if p6 and p6.skipFetch then var14.getCachedItem(var22) else var14.getAndFetchItem(var22)
		end,
		refetchNewFriendRequestCount = function()
			-- upvalues: var14 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			local var22
			local fetchItem = var14.fetchItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var23 = getLocalPlayerUserId()
				var22 = if var23 then tostring(var23) else ""
			else
				var22 = currentUserId
			end
			fetchItem(var22)
		end,
		clearNewFriendRequest = function()
			-- upvalues: requestsModule (copy), var9 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			return requestsModule.ClearNewFriendRequests():andThen(function()
				-- upvalues: var9 (copy), localUserIdStore (copy), getLocalPlayerUserId (copy)
				local var22
				local replaceItem = var9.replaceItem
				local currentUserId = localUserIdStore.getCurrentUserId(false)
				
				if currentUserId == "" then
					local var23 = getLocalPlayerUserId()
					var22 = if var23 then tostring(var23) else ""
				else
					var22 = currentUserId
				end
				replaceItem(var22, 0)
			end)
		end,
		clearNewFriendRequestCount = function()
			-- upvalues: var9 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			local var22
			local replaceItem = var9.replaceItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var23 = getLocalPlayerUserId()
				var22 = if var23 then tostring(var23) else ""
			else
				var22 = currentUserId
			end
			replaceItem(var22, 0)
		end,
		clear = function()
			-- upvalues: var12 (ref), var13 (ref), var14 (ref)
			var12.clear()
			var13.clear()
			var14.clear()
		end,
		dispose = function()
			-- upvalues: var12 (ref), var13 (ref), var14 (ref)
			var12.dispose()
			var13.dispose()
			var14.dispose()
		end
	}
end