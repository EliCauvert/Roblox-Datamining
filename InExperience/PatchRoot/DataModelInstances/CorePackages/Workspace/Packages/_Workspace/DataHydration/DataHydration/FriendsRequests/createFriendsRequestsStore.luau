local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local DataStatus = require(DataHydration.DataHydrationTypes).DataStatus
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local MergeListsWithoutDuplicatesFunction = require(DataHydration.DataHydrationUtils).mergeListsWithoutDuplicates
local _ = require(Parent.Signals)
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local FFlagAddFriendsPageTrustedFriendRequestSection = require(Parent.SharedFlags).FFlagAddFriendsPageTrustedFriendRequestSection
local FFlagFriendsRequestsMergeListsWithoutDuplicates = require(Parent.SharedFlags).FFlagFriendsRequestsMergeListsWithoutDuplicates
local FFlagEnableGetFriendshipStatus = require(Parent.SharedFlags).FFlagEnableGetFriendshipStatus
local RequestsModule = require(script.Parent.Requests)
local _ = require(script.Parent.FriendsRequestsStoreTypes)
local FriendsStoreModule = require(DataHydration.Friends.FriendsStore)
local FriendsRequestsPageSize = game:DefineFastInt("FriendsRequestsPageSize", 25)
local FriendsRequestsCacheTtlSec = game:DefineFastInt("FriendsRequestsCacheTtlSec", 0)

local function _(p1: number): number --[[ Line: 48 | Named "getCacheTTL" ]]
	return if p1 > 0 then p1 else 1e999
end

local _ = function(p1) --[[ Line: 52 | Named "normalizeId" ]]
	return if p1 == nil then nil else tostring(p1)
end

local _ = function(p1) --[[ Line: 59 | Named "normalizeCursor" ]]
	return if p1 == nil or p1 == "" then nil else p1
end

local function normalizeFriendRequest(p1) --[[ Line: 66 ]]
	local Id = p1.id
	local Text = if Id == nil then nil else tostring(Id)
	
	if not Text then
		return nil
	end
	local FriendRequest = p1.friendRequest
	local MutualFriendsIds = nil
	
	if p1.mutualFriendsList then
		local List = {}
		
		for _, value in p1.mutualFriendsList do
			table.insert(List, (tostring(value)))
		end
		MutualFriendsIds = List
	end
	return {
		id = Text,
		isUnseen = p1.isUnseen,
		sentAt = if FriendRequest and FriendRequest.sentAt then DateTime.fromIsoDate(FriendRequest.sentAt) else nil,
		sourceUniverseId = if FriendRequest then FriendRequest.sourceUniverseId else nil,
		originSourceType = if FriendRequest then FriendRequest.originSourceType else nil,
		contactName = if FriendRequest then FriendRequest.contactName else nil,
		mutualFriendsIds = MutualFriendsIds
	}
end

local function normalizeGetFriendRequestsResponse(p2) --[[ Line: 96 ]]
	-- upvalues: normalizeFriendRequest (copy)
	local Requests = {}
	local Data = if p2 and p2.data then p2.data else {}
	for _, entry in Data do
		local NormalizeFriendRequestResult = normalizeFriendRequest(entry)
		
		if NormalizeFriendRequestResult then
			table.insert(Requests, NormalizeFriendRequestResult)
		end
	end
	local NextPageCursor = if p2 then p2.nextPageCursor else nil
	local NextPageCursor1 = if NextPageCursor == nil or NextPageCursor == "" then nil else NextPageCursor
	
	return {
		requests = Requests,
		nextPageCursor = NextPageCursor1,
		hasMore = NextPageCursor1 ~= nil
	}
end

local _ = function(p3, p4) --[[ Line: 116 | Named "mergeRequestsWithoutDuplicates" ]]
	-- upvalues: FFlagAddFriendsPageTrustedFriendRequestSection (copy), FFlagFriendsRequestsMergeListsWithoutDuplicates (copy), MergeListsWithoutDuplicatesFunction (copy)
	if not FFlagAddFriendsPageTrustedFriendRequestSection and not FFlagFriendsRequestsMergeListsWithoutDuplicates then
		error("mergeRequestsWithoutDuplicates requires FFlagAddFriendsPageTrustedFriendRequestSection or FFlagFriendsRequestsMergeListsWithoutDuplicates to be enabled")
	end
	return MergeListsWithoutDuplicatesFunction(p3, p4, "id")
end

local function updateFriendshipStatusesForPage(p3) --[[ Line: 133 ]]
	-- upvalues: FFlagEnableGetFriendshipStatus (copy), FriendsStoreModule (copy)
	if not FFlagEnableGetFriendshipStatus then return end
	local GetResult = FriendsStoreModule.get()
	
	for _, request in p3.requests do
		GetResult.UpdateFriendshipStatus(request.id, Enum.FriendStatus.FriendRequestReceived)
	end
end

local function mergeFriendsRequestsPage(DataResult, p4, NextPageCursor) --[[ Line: 144 ]]
	-- upvalues: FFlagAddFriendsPageTrustedFriendRequestSection (copy), FFlagFriendsRequestsMergeListsWithoutDuplicates (copy), MergeListsWithoutDuplicatesFunction (copy)
	if not DataResult then
		return {
			requests = p4.requests,
			nextPageCursor = p4.nextPageCursor,
			hasMore = p4.hasMore
		}
	end
	if DataResult.nextPageCursor ~= NextPageCursor then
		return DataResult
	end
	local t = {}
	local Requests = DataResult.requests
	local Requests1 = p4.requests
	
	if not FFlagAddFriendsPageTrustedFriendRequestSection and not FFlagFriendsRequestsMergeListsWithoutDuplicates then
		error("mergeRequestsWithoutDuplicates requires FFlagAddFriendsPageTrustedFriendRequestSection or FFlagFriendsRequestsMergeListsWithoutDuplicates to be enabled")
	end
	t.requests = MergeListsWithoutDuplicatesFunction(Requests, Requests1, "id")
	t.nextPageCursor = p4.nextPageCursor
	t.hasMore = p4.hasMore
	
	return t
end

local _ = function(p4) --[[ Line: 172 | Named "resolveLocalUserId" ]]
	-- upvalues: LocalUserIdStore (copy), GetLocalPlayerUserIdFunction (copy)
	local CurrentUserId = LocalUserIdStore.getCurrentUserId(p4)
	
	if CurrentUserId == "" then
		local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
		
		return if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
	else
		return CurrentUserId
	end
end

return function() --[[ Line: 181 | Named "createFriendsRequestsStore" ]]
	-- upvalues: CreateDataCacheModule (copy), FriendsRequestsCacheTtlSec (copy), CreateDataResolverModule (copy), RequestsModule (copy), FriendsRequestsPageSize (copy), normalizeGetFriendRequestsResponse (copy), updateFriendshipStatusesForPage (copy), mergeFriendsRequestsPage (copy), LocalUserIdStore (copy), GetLocalPlayerUserIdFunction (copy), DataStatus (copy), FriendsStoreModule (copy)
	local DataCacheModule = CreateDataCacheModule(if FriendsRequestsCacheTtlSec > 0 then FriendsRequestsCacheTtlSec else 1e999)
	local DataCacheModule1 = CreateDataCacheModule()
	local DataCacheModule2 = CreateDataCacheModule()
	local Flag = false
	local v1 = nil
	
	local function _(p4) --[[ Line: 217 | Named "stageSessionId" ]]
		-- upvalues: v1 (ref)
		v1 = if p4 == "" then nil else p4
	end
	
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule,
		fetchFn = function(_, p4) --[[ Line: 225 ]]
			-- upvalues: Flag (ref), RequestsModule (upval), FriendsRequestsPageSize (upval), v1 (ref), normalizeGetFriendRequestsResponse (upval), updateFriendshipStatusesForPage (upval), mergeFriendsRequestsPage (upval)
			local DataResult = if Flag then nil else p4.data(false)
			Flag = false
			local NextPageCursor = if DataResult then DataResult.nextPageCursor else nil
			
			return RequestsModule.GetFriendsRequests(NextPageCursor, FriendsRequestsPageSize, v1):andThen(function(Result) --[[ Line: 232 ]]
				-- upvalues: normalizeGetFriendRequestsResponse (upval), updateFriendshipStatusesForPage (upval), mergeFriendsRequestsPage (upval), DataResult (copy), NextPageCursor (copy)
				local NormalizeGetFriendRequestsResponseResult = normalizeGetFriendRequestsResponse(Result)
				updateFriendshipStatusesForPage(NormalizeGetFriendRequestsResponseResult)
				
				return (mergeFriendsRequestsPage(DataResult, NormalizeGetFriendRequestsResponseResult, NextPageCursor))
			end):catch(function(Err) --[[ Line: 239 ]]
				error(Err)
			end)
		end
	})
	local DataResolverModule1 = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule1,
		fetchFn = function(_) --[[ Line: 249 ]]
			-- upvalues: RequestsModule (upval)
			return RequestsModule.GetFriendRequestsCount():andThen(function(Result) --[[ Line: 250 ]]
				return if Result and Result.count then Result.count else 0
			end)
		end
	})
	local DataResolverModule2 = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule2,
		fetchFn = function(_) --[[ Line: 260 ]]
			-- upvalues: RequestsModule (upval)
			return RequestsModule.GetNewFriendRequestsCount():andThen(function(Result) --[[ Line: 261 ]]
				return if Result and Result.count then Result.count else 0
			end)
		end
	})
	
	return {
		getFriendsRequests = function(p4) --[[ Line: 315 ]]
			-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy), v1 (ref), Flag (ref)
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			if p4 and p4.skipFetch then
				return DataResolverModule.getCachedItem(CurrentUserId1)
			end
			if p4 and p4.forceFetch then
				local SessionId = if p4 then p4.sessionId else nil
				local CurrentUserId2 = LocalUserIdStore.getCurrentUserId(false)
				local CurrentUserId21 = nil
				
				if CurrentUserId2 == "" then
					local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
					CurrentUserId21 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
				else
					CurrentUserId21 = CurrentUserId2
				end
				if not DataResolverModule.isRequestInQueueOrInFlight(CurrentUserId21) then
					v1 = if SessionId == "" then nil else SessionId
					Flag = true
					DataResolverModule.fetchItem(CurrentUserId21)
				end
			end
			local SessionId = if p4 then p4.sessionId else nil
			v1 = if SessionId == "" then nil else SessionId
			
			return DataResolverModule.getAndFetchItem(CurrentUserId1)
		end,
		fetchMoreFriendsRequests = function(p4) --[[ Line: 267 ]]
			-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy), DataStatus (upval), v1 (ref)
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			local CachedItem = DataResolverModule.getCachedItem(CurrentUserId1)
			local DataResult = CachedItem.data(false)
			
			if DataResult == nil or not DataResult.hasMore or DataResult.nextPageCursor == nil then return end
			if CachedItem.status(false) == DataStatus.NotReady then return end
			if not DataResolverModule.isRequestInQueueOrInFlight(CurrentUserId1) then
				v1 = if p4 == "" then nil else p4
				DataResolverModule.fetchItem(CurrentUserId1)
				
				return
			end
		end,
		refetchFriendRequests = function(p4) --[[ Line: 288 ]]
			-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy), v1 (ref), Flag (ref)
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			if not DataResolverModule.isRequestInQueueOrInFlight(CurrentUserId1) then
				v1 = if p4 == "" then nil else p4
				Flag = true
				DataResolverModule.fetchItem(CurrentUserId1)
				
				return
			end
		end,
		declineAllFriendRequests = function() --[[ Line: 300 ]]
			-- upvalues: RequestsModule (upval), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataCacheModule (copy), DataCacheModule1 (copy)
			return RequestsModule.DeclineAllFriendRequests():andThen(function(Result) --[[ Line: 301 ]]
				-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataCacheModule (upval), DataCacheModule1 (upval)
				local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
				local CurrentUserId1 = nil
				
				if CurrentUserId == "" then
					local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
					CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
				else
					CurrentUserId1 = CurrentUserId
				end
				DataCacheModule.replaceItem(CurrentUserId1, { nextPageCursor = nil, hasMore = false, requests = {} })
				DataCacheModule1.replaceItem(CurrentUserId1, 0)
				
				return Result
			end)
		end,
		removeFriendRequestByUserId = function(Id) --[[ Line: 376 ]]
			-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy), DataCacheModule (copy)
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			local DataResult = DataResolverModule.getCachedItem(CurrentUserId1).data(false)
			
			if DataResult == nil then return end
			local Requests = {}
			local Flag = false
			
			for _, request in DataResult.requests do
				if request.id == Id then
					Flag = true
				else
					table.insert(Requests, request)
				end
			end
			if Flag then
				DataCacheModule.replaceItem(CurrentUserId1, {
					requests = Requests,
					nextPageCursor = DataResult.nextPageCursor,
					hasMore = DataResult.hasMore
				})
				
				return
			end
		end,
		appendNewUserId = function(p4) --[[ Line: 401 ]]
			-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy), DataCacheModule (copy), FriendsStoreModule (upval)
			local Text = if p4 == nil then nil else tostring(p4)
			
			if not Text then return end
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			local DataResult = DataResolverModule.getCachedItem(CurrentUserId1).data(false)
			local config = { isUnseen = true, id = Text }
			
			if DataResult == nil then
				DataCacheModule.replaceItem(CurrentUserId1, {
					nextPageCursor = nil,
					hasMore = false,
					requests = { config }
				})
			else
				local Requests = { config }
				
				for _, request in DataResult.requests do
					if request.id ~= Text then
						table.insert(Requests, request)
					end
				end
				DataCacheModule.replaceItem(CurrentUserId1, {
					requests = Requests,
					nextPageCursor = DataResult.nextPageCursor,
					hasMore = DataResult.hasMore
				})
			end
			FriendsStoreModule.get().UpdateFriendshipStatus(Text, Enum.FriendStatus.FriendRequestReceived)
		end,
		getFriendsRequestCount = function(p5) --[[ Line: 336 ]]
			-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule1 (copy)
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			if p5 and p5.skipFetch then
				return DataResolverModule1.getCachedItem(CurrentUserId1)
			end
			if p5 and p5.forceFetch then
				local FetchItemFunction: (any) -> () = DataResolverModule1.fetchItem
				local CurrentUserId2 = LocalUserIdStore.getCurrentUserId(false)
				local CurrentUserId21 = nil
				
				if CurrentUserId2 == "" then
					local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
					CurrentUserId21 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
				else
					CurrentUserId21 = CurrentUserId2
				end
				FetchItemFunction(CurrentUserId21)
			end
			return DataResolverModule1.getAndFetchItem(CurrentUserId1)
		end,
		refetchFriendRequestCount = function() --[[ Line: 332 ]]
			-- upvalues: DataResolverModule1 (copy), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval)
			local FetchItemFunction: (any) -> () = DataResolverModule1.fetchItem
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			FetchItemFunction(CurrentUserId1)
		end,
		getNewFriendsRequestCount = function(p5) --[[ Line: 352 ]]
			-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule2 (copy)
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			return if p5 and p5.skipFetch then DataResolverModule2.getCachedItem(CurrentUserId1) else DataResolverModule2.getAndFetchItem(CurrentUserId1)
		end,
		refetchNewFriendRequestCount = function() --[[ Line: 362 ]]
			-- upvalues: DataResolverModule2 (copy), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval)
			local FetchItemFunction: (any) -> () = DataResolverModule2.fetchItem
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			FetchItemFunction(CurrentUserId1)
		end,
		clearNewFriendRequest = function() --[[ Line: 370 ]]
			-- upvalues: RequestsModule (upval), DataCacheModule2 (copy), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval)
			return RequestsModule.ClearNewFriendRequests():andThen(function() --[[ Line: 371 ]]
				-- upvalues: DataCacheModule2 (upval), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval)
				local ReplaceItemFunction: (any, any) -> () = DataCacheModule2.replaceItem
				local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
				local CurrentUserId1 = nil
				
				if CurrentUserId == "" then
					local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
					CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
				else
					CurrentUserId1 = CurrentUserId
				end
				ReplaceItemFunction(CurrentUserId1, 0)
			end)
		end,
		clearNewFriendRequestCount = function() --[[ Line: 366 ]]
			-- upvalues: DataCacheModule2 (copy), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval)
			local ReplaceItemFunction: (any, any) -> () = DataCacheModule2.replaceItem
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			ReplaceItemFunction(CurrentUserId1, 0)
		end,
		clear = function() --[[ Line: 440 ]]
			-- upvalues: DataResolverModule (copy), DataResolverModule1 (copy), DataResolverModule2 (copy)
			DataResolverModule.clear()
			DataResolverModule1.clear()
			DataResolverModule2.clear()
		end,
		dispose = function() --[[ Line: 446 ]]
			-- upvalues: DataResolverModule (copy), DataResolverModule1 (copy), DataResolverModule2 (copy)
			DataResolverModule.dispose()
			DataResolverModule1.dispose()
			DataResolverModule2.dispose()
		end
	}
end