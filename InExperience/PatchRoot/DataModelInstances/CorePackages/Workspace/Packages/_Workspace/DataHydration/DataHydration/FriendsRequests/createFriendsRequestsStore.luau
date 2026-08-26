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
	local var11 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var7,
		fetchFn = function(_, p4)
			-- upvalues: var10 (write), requestsModule (copy), friendsRequestsPageSize (copy), normalizeGetFriendRequestsResponse (copy), updateFriendshipStatusesForPage (copy), mergeFriendsRequestsPage (copy)
			local var12 = if var10 then nil else p4.data(false)
			var10 = false
			local var13 = if var12 then var12.nextPageCursor else nil
			
			return requestsModule.GetFriendsRequests(var13, friendsRequestsPageSize):andThen(function(p5)
				-- upvalues: normalizeGetFriendRequestsResponse (copy), updateFriendshipStatusesForPage (copy), mergeFriendsRequestsPage (copy), var12 (ref), var13 (ref)
				local var14 = normalizeGetFriendRequestsResponse(p5)
				updateFriendshipStatusesForPage(var14)
				
				return mergeFriendsRequestsPage(var12, var14, var13)
			end):catch(function(p5)
				error(p5)
			end)
		end
	})
	local var12 = createDataResolverModule({
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
	local var13 = createDataResolverModule({
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
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var11 (ref)
			local var14
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var15 = getLocalPlayerUserId()
				var14 = if var15 then tostring(var15) else ""
			else
				var14 = currentUserId
			end
			return if p4 and p4.skipFetch then var11.getCachedItem(var14) else var11.getAndFetchItem(var14)
		end,
		fetchMoreFriendsRequests = function()
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var11 (ref), dataStatus (copy)
			local var14
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var15 = getLocalPlayerUserId()
				var14 = if var15 then tostring(var15) else ""
			else
				var14 = currentUserId
			end
			local cachedItem = var11.getCachedItem(var14)
			local var16 = cachedItem.data(false)
			
			if var16 == nil or not var16.hasMore or var16.nextPageCursor == nil then return end
			if cachedItem.status(false) == dataStatus.NotReady then return end
			if var11.isRequestInQueueOrInFlight(var14) then
				return
			end
			var11.fetchItem(var14)
		end,
		refetchFriendRequests = function()
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var11 (ref), var10 (write)
			local var14
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var15 = getLocalPlayerUserId()
				var14 = if var15 then tostring(var15) else ""
			else
				var14 = currentUserId
			end
			if var11.isRequestInQueueOrInFlight(var14) then
				return
			end
			var10 = true
			var11.fetchItem(var14)
		end,
		declineAllFriendRequests = function()
			-- upvalues: requestsModule (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), var7 (ref), var8 (ref)
			return requestsModule.DeclineAllFriendRequests():andThen(function()
				-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var7 (copy), var8 (copy)
				local var14
				local currentUserId = localUserIdStore.getCurrentUserId(false)
				
				if currentUserId == "" then
					local var15 = getLocalPlayerUserId()
					var14 = if var15 then tostring(var15) else ""
				else
					var14 = currentUserId
				end
				var7.replaceItem(var14, { nextPageCursor = nil, hasMore = false, requests = {} })
				var8.replaceItem(var14, 0)
			end)
		end,
		getFriendsRequestCount = function(p4)
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var12 (ref)
			local var14
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var15 = getLocalPlayerUserId()
				var14 = if var15 then tostring(var15) else ""
			else
				var14 = currentUserId
			end
			return if p4 and p4.skipFetch then var12.getCachedItem(var14) else var12.getAndFetchItem(var14)
		end,
		refetchFriendRequestCount = function()
			-- upvalues: var12 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			local var14
			local fetchItem = var12.fetchItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var15 = getLocalPlayerUserId()
				var14 = if var15 then tostring(var15) else ""
			else
				var14 = currentUserId
			end
			fetchItem(var14)
		end,
		getNewFriendsRequestCount = function(p4)
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var13 (ref)
			local var14
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var15 = getLocalPlayerUserId()
				var14 = if var15 then tostring(var15) else ""
			else
				var14 = currentUserId
			end
			return if p4 and p4.skipFetch then var13.getCachedItem(var14) else var13.getAndFetchItem(var14)
		end,
		refetchNewFriendRequestCount = function()
			-- upvalues: var13 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			local var14
			local fetchItem = var13.fetchItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var15 = getLocalPlayerUserId()
				var14 = if var15 then tostring(var15) else ""
			else
				var14 = currentUserId
			end
			fetchItem(var14)
		end,
		clearNewFriendRequest = function()
			-- upvalues: requestsModule (copy), var9 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			return requestsModule.ClearNewFriendRequests():andThen(function()
				-- upvalues: var9 (copy), localUserIdStore (copy), getLocalPlayerUserId (copy)
				local var14
				local replaceItem = var9.replaceItem
				local currentUserId = localUserIdStore.getCurrentUserId(false)
				
				if currentUserId == "" then
					local var15 = getLocalPlayerUserId()
					var14 = if var15 then tostring(var15) else ""
				else
					var14 = currentUserId
				end
				replaceItem(var14, 0)
			end)
		end,
		clearNewFriendRequestCount = function()
			-- upvalues: var9 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			local var14
			local replaceItem = var9.replaceItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var15 = getLocalPlayerUserId()
				var14 = if var15 then tostring(var15) else ""
			else
				var14 = currentUserId
			end
			replaceItem(var14, 0)
		end,
		clear = function()
			-- upvalues: var11 (ref), var12 (ref), var13 (ref)
			var11.clear()
			var12.clear()
			var13.clear()
		end,
		dispose = function()
			-- upvalues: var11 (ref), var12 (ref), var13 (ref)
			var11.dispose()
			var12.dispose()
			var13.dispose()
		end
	}
end