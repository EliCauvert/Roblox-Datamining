local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local PromiseModule = require(Parent.Promise)
local CryoModule = require(Parent.Cryo)
local RequestsModule = require(DataHydration.TrustedConnections.Requests)
local TrustedConnectionStatusModule = require(DataHydration.TrustedConnections.Enums.TrustedConnectionStatus)
local CreateTrustedConnectionEventListenerModule = require(DataHydration.TrustedConnections.createTrustedConnectionEventListener)
local CreateFriendshipEventListenerModule = require(DataHydration.TrustedConnections.createFriendshipEventListener)
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local MergeListsWithoutDuplicatesFunction = require(DataHydration.DataHydrationUtils).mergeListsWithoutDuplicates
local FFlagConnectionManagementChips = require(Parent.SharedFlags).FFlagConnectionManagementChips
local FFlagAddFriendsPageTrustedFriendRequestSection = require(Parent.SharedFlags).FFlagAddFriendsPageTrustedFriendRequestSection
local FFlagAddFriendsPageHighlightUnseenTrustedRequests = require(Parent.SharedFlags).FFlagAddFriendsPageHighlightUnseenTrustedRequests
local FIntTrustedFriendRequestsPageSize = require(Parent.SharedFlags).FIntTrustedFriendRequestsPageSize
local FFlagProfileTFCardUseQrScanContext = require(Parent.SharedFlags).FFlagProfileTFCardUseQrScanContext
local FFlagTrustedFriendCandidatesSection = require(Parent.SharedFlags).FFlagTrustedFriendCandidatesSection
local TrustedConnectionsStoreDataTtlSec = game:DefineFastInt("TrustedConnectionsStoreDataTtlSec", 0)
game:DefineFastInt("TrustedConnectionsStoreProcessDelaySec", 1)

local function _()
	return game:GetFastInt("TrustedConnectionsStoreProcessDelaySec")
end

game:DefineFastInt("TrustedConnectionsStoreIncomingRequestsProcessDelaySec", 0)

local _ = function()
	return game:GetFastInt("TrustedConnectionsStoreIncomingRequestsProcessDelaySec")
end

local TrustedFriendCandidatesPageSize = game:DefineFastInt("TrustedFriendCandidatesPageSize", 20)
local TrustedFriendCandidatesMaxReadsPerFetch = game:DefineFastInt("TrustedFriendCandidatesMaxReadsPerFetch", 5)
local config = {
	None = TrustedConnectionStatusModule.Friends,
	RequestSent = TrustedConnectionStatusModule.RequestSent,
	RequestReceived = TrustedConnectionStatusModule.RequestReceived
}

return function()
	-- upvalues: TrustedConnectionsStoreDataTtlSec (copy), CreateDataCacheModule (copy), FFlagConnectionManagementChips (copy), FFlagAddFriendsPageTrustedFriendRequestSection (copy), FFlagTrustedFriendCandidatesSection (copy), GetLocalPlayerUserIdFunction (copy), FFlagAddFriendsPageHighlightUnseenTrustedRequests (copy), MergeListsWithoutDuplicatesFunction (copy), CryoModule (copy), CreateDataResolverModule (copy), RequestsModule (copy), CreateTrustedConnectionEventListenerModule (copy), TrustedConnectionStatusModule (copy), CreateFriendshipEventListenerModule (copy), PromiseModule (copy), FIntTrustedFriendRequestsPageSize (copy), TrustedFriendCandidatesPageSize (copy), config (copy), TrustedFriendCandidatesMaxReadsPerFetch (copy), FFlagProfileTFCardUseQrScanContext (copy)
	local TrustedConnectionsStoreDataTtlSec1 = if TrustedConnectionsStoreDataTtlSec > 0 then TrustedConnectionsStoreDataTtlSec else 1e999
	local DataCacheModule = CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1)
	local DataCacheModule1 = CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1)
	local DataCacheModule2 = if FFlagConnectionManagementChips then CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1) else nil
	local DataCacheModule3 = if FFlagAddFriendsPageTrustedFriendRequestSection then CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1) else nil
	local DataCacheModule4 = if FFlagAddFriendsPageTrustedFriendRequestSection then CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1) else nil
	local Flag = false
	local DataCacheModule5 = if FFlagTrustedFriendCandidatesSection then CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1) else nil
	local Flag1 = not FFlagTrustedFriendCandidatesSection and nil
	local Callback1 = if FFlagAddFriendsPageTrustedFriendRequestSection then function(Id)
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataCacheModule3 (copy), FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), MergeListsWithoutDuplicatesFunction (upval), DataCacheModule4 (copy)
		local Text = tostring(GetLocalPlayerUserIdFunction())
		local DataResult = DataCacheModule3.getItem(Text).data(false)
		
		if not DataResult then return end
		if FFlagAddFriendsPageHighlightUnseenTrustedRequests then
			local Requests = DataResult.requests
			
			if not Requests then return end
			local Id1 = MergeListsWithoutDuplicatesFunction({ { isUnseen = true, id = Id } }, Requests, "id")
			
			if #Id1 == #Requests then return end
			DataCacheModule3.replaceItem(Text, {
				senderIds = nil,
				requests = Id1,
				nextPageCursor = DataResult.nextPageCursor,
				hasMore = DataResult.hasMore
			})
		else
			local MergeListsWithoutDuplicatesResult = MergeListsWithoutDuplicatesFunction(DataResult.senderIds, { Id })
			
			if #MergeListsWithoutDuplicatesResult == #DataResult.senderIds then return end
			DataCacheModule3.replaceItem(Text, {
				senderIds = MergeListsWithoutDuplicatesResult,
				nextPageCursor = DataResult.nextPageCursor,
				hasMore = DataResult.hasMore
			})
		end
		local DataResult1: number = DataCacheModule4.getItem(Text).data(false)
		
		if DataResult1 then
			DataCacheModule4.replaceItem(Text, (math.max(DataResult1 + 1, 0)))
		end
	end else nil
	local Callback2 = if FFlagAddFriendsPageTrustedFriendRequestSection then function(Id)
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataCacheModule3 (copy), FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), CryoModule (upval), DataCacheModule4 (copy)
		local Text = tostring(GetLocalPlayerUserIdFunction())
		local DataResult = DataCacheModule3.getItem(Text).data(false)
		
		if not DataResult then return end
		if FFlagAddFriendsPageHighlightUnseenTrustedRequests then
			local Requests = DataResult.requests
			
			if not Requests then return end
			local FilterResult = CryoModule.List.filter(Requests, function(p1): boolean
				-- upvalues: Id (copy)
				return p1.id ~= Id
			end)
			
			if #FilterResult == #Requests then return end
			DataCacheModule3.replaceItem(Text, {
				senderIds = nil,
				requests = FilterResult,
				nextPageCursor = DataResult.nextPageCursor,
				hasMore = DataResult.hasMore
			})
		else
			local RemoveValueResult = CryoModule.List.removeValue(DataResult.senderIds, Id)
			
			if #RemoveValueResult == #DataResult.senderIds then return end
			DataCacheModule3.replaceItem(Text, {
				senderIds = RemoveValueResult,
				nextPageCursor = DataResult.nextPageCursor,
				hasMore = DataResult.hasMore
			})
		end
		local DataResult1: number = DataCacheModule4.getItem(Text).data(false)
		
		if DataResult1 then
			DataCacheModule4.replaceItem(Text, (math.max(DataResult1 - 1, 0)))
		end
	end else nil
	local Callback = if FFlagTrustedFriendCandidatesSection then function(Id)
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataCacheModule5 (copy), CryoModule (upval)
		local Text = tostring(GetLocalPlayerUserIdFunction())
		local DataResult = DataCacheModule5.getItem(Text).data(false)
		
		if not DataResult then return end
		local FilterResult = CryoModule.List.filter(DataResult.candidates, function(p1): boolean
			-- upvalues: Id (copy)
			return p1.id ~= Id
		end)
		
		if #FilterResult ~= #DataResult.candidates then
			DataCacheModule5.replaceItem(Text, {
				candidates = FilterResult,
				nextPageCursor = DataResult.nextPageCursor,
				hasMore = DataResult.hasMore
			})
			
			return
		end
	end else nil
	local DataResolverModule = if FFlagConnectionManagementChips then CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule2,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"),
		fetchFn = function(p1)
			-- upvalues: RequestsModule (upval), CryoModule (upval)
			return RequestsModule.GetUserTrustedConnections(p1):andThen(function(Result)
				-- upvalues: CryoModule (upval)
				return CryoModule.List.map(Result.PageItems or {}, function(p2)
					return { id = tostring(p2.id) }
				end)
			end)
		end
	}) else nil
	local TrustedConnectionEventListenerModule = CreateTrustedConnectionEventListenerModule(function(p1, TrustedFriends)
		-- upvalues: DataCacheModule (copy), DataCacheModule1 (copy), TrustedConnectionStatusModule (upval), FFlagAddFriendsPageTrustedFriendRequestSection (upval), Callback1 (copy), FFlagTrustedFriendCandidatesSection (upval), Callback (copy), FFlagConnectionManagementChips (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy)
		DataCacheModule.updateItems({ [p1] = TrustedFriends })
		DataCacheModule1.updateItems({
			[p1] = TrustedFriends == TrustedConnectionStatusModule.TrustedFriends
		})
		
		if FFlagAddFriendsPageTrustedFriendRequestSection and TrustedFriends == TrustedConnectionStatusModule.RequestReceived then
			Callback1(p1)
		end
		if FFlagTrustedFriendCandidatesSection and TrustedFriends == TrustedConnectionStatusModule.TrustedFriends then
			Callback(p1)
		end
		if FFlagConnectionManagementChips then
			local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
			
			if LocalPlayerUserId then
				DataResolverModule.fetchItem((tostring(LocalPlayerUserId)))
			end
		end
	end)
	local FriendshipEventListenerModule = if FFlagAddFriendsPageTrustedFriendRequestSection then CreateFriendshipEventListenerModule(function(p1, NotFriends)
		-- upvalues: DataCacheModule (copy), DataCacheModule1 (copy), TrustedConnectionStatusModule (upval), Callback2 (copy), FFlagTrustedFriendCandidatesSection (upval), Callback (copy)
		DataCacheModule.updateItems({ [p1] = NotFriends })
		DataCacheModule1.updateItems({
			[p1] = NotFriends == TrustedConnectionStatusModule.TrustedFriends
		})
		
		if NotFriends == TrustedConnectionStatusModule.NotFriends then
			Callback2(p1)
			
			if FFlagTrustedFriendCandidatesSection then
				Callback(p1)
			end
		end
	end) else nil
	local DataResolverModule1 = CreateDataResolverModule({
		cache = DataCacheModule1,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"),
		fetchFn = function(p1)
			-- upvalues: CryoModule (upval), RequestsModule (upval)
			local KeysResult = CryoModule.Dictionary.keys(p1)
			
			return RequestsModule.MultiGetUsersAreTrustedConnections(KeysResult):andThen(function(Result)
				-- upvalues: CryoModule (upval), KeysResult (copy)
				local FoldLeftResult = CryoModule.List.foldLeft(Result, function(p2, p3)
					p2[tostring(p3)] = true
					
					return p2
				end, {})
				
				return CryoModule.List.foldLeft(KeysResult, function(p2, p3)
					-- upvalues: FoldLeftResult (copy)
					p2[tostring(p3)] = FoldLeftResult[p3] or false
					
					return p2
				end, {})
			end)
		end
	})
	local DataResolverModule2 = CreateDataResolverModule({
		cache = DataCacheModule,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"),
		fetchFn = function(p1)
			-- upvalues: CryoModule (upval), RequestsModule (upval), PromiseModule (upval)
			return PromiseModule.all((CryoModule.List.foldLeft(CryoModule.Dictionary.keys(p1), function(List, p2)
				-- upvalues: RequestsModule (upval)
				table.insert(List, RequestsModule.GetUserTrustedConnectionStatus(p2):andThen(function(Result)
					-- upvalues: p2 (copy)
					return { [p2] = Result }
				end))
				
				return List
			end, {}))):andThen(function(Result)
				-- upvalues: CryoModule (upval)
				return CryoModule.Dictionary.join(table.unpack(Result))
			end)
		end
	})
	local DataResolverModule3 = if FFlagAddFriendsPageTrustedFriendRequestSection then CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule3,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreIncomingRequestsProcessDelaySec"),
		fetchFn = function(_, p1)
			-- upvalues: Flag (ref), RequestsModule (upval), FIntTrustedFriendRequestsPageSize (upval), FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), CryoModule (upval), MergeListsWithoutDuplicatesFunction (upval)
			local DataResult = if Flag then nil else p1.data(false)
			Flag = false
			
			return RequestsModule.GetTrustedFriendRequests(if DataResult then DataResult.nextPageCursor else nil, FIntTrustedFriendRequestsPageSize):andThen(function(Result)
				-- upvalues: FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), CryoModule (upval), DataResult (copy), MergeListsWithoutDuplicatesFunction (upval)
				if FFlagAddFriendsPageHighlightUnseenTrustedRequests then
					local NextPageCursor = if Result then Result.nextPageCursor else nil
					
					return {
						senderIds = nil,
						requests = MergeListsWithoutDuplicatesFunction(if DataResult then DataResult.requests else nil, CryoModule.List.map((if Result then Result.data else nil) or {}, function(p2)
							return { id = tostring(p2.senderId), isUnseen = p2.isUnseen }
						end), "id"),
						nextPageCursor = NextPageCursor,
						hasMore = NextPageCursor ~= nil
					}
				else
					local NextPageCursor = if Result then Result.nextPageCursor else nil
					
					return {
						senderIds = MergeListsWithoutDuplicatesFunction(if DataResult then DataResult.senderIds else nil, (CryoModule.List.map((if Result then Result.data else nil) or {}, function(p2): string
							return (tostring(p2.senderId))
						end))),
						nextPageCursor = NextPageCursor,
						hasMore = NextPageCursor ~= nil
					}
				end
			end)
		end
	}) else nil
	local DataResolverModule4 = if FFlagAddFriendsPageTrustedFriendRequestSection then CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule4,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreIncomingRequestsProcessDelaySec"),
		fetchFn = function(_)
			-- upvalues: RequestsModule (upval)
			return RequestsModule.GetTrustedFriendRequestsCount():andThen(function(Result)
				return if Result then Result.count else 0
			end)
		end
	}) else nil
	
	local function fetchTrustedFriendCandidatesPage(NextPageCursor, p1)
		-- upvalues: RequestsModule (upval), TrustedFriendCandidatesPageSize (upval), config (upval), fetchTrustedFriendCandidatesPage (copy)
		return RequestsModule.GetTrustedFriendCandidates(NextPageCursor, TrustedFriendCandidatesPageSize):andThen(function(Result)
			-- upvalues: config (upval), p1 (copy), fetchTrustedFriendCandidatesPage (upval)
			local NextPageCursor = if Result then Result.nextPageCursor else nil
			local Candidates = {}
			local Statuses = {}
			
			for _, value in if Result and Result.data then Result.data else {} do
				local Text = tostring(value.userId)
				table.insert(Candidates, { id = Text })
				Statuses[Text] = config[value.state]
			end
			return if #Candidates == 0 and NextPageCursor ~= nil and p1 > 1 then fetchTrustedFriendCandidatesPage(NextPageCursor, p1 - 1) else {
				candidates = Candidates,
				statuses = Statuses,
				nextPageCursor = NextPageCursor
			}
		end)
	end
	
	local function applyTrustedFriendCandidatesPage(p2, DataResult)
		-- upvalues: DataCacheModule (copy), MergeListsWithoutDuplicatesFunction (upval)
		DataCacheModule.updateItems(p2.statuses)
		
		return {
			candidates = MergeListsWithoutDuplicatesFunction(if DataResult then DataResult.candidates else nil, p2.candidates, "id"),
			nextPageCursor = p2.nextPageCursor,
			hasMore = p2.nextPageCursor ~= nil
		}
	end
	
	local DataResolverModule5 = if FFlagTrustedFriendCandidatesSection then CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule5,
		fetchFn = function(_, p2)
			-- upvalues: Flag1 (ref), TrustedFriendCandidatesMaxReadsPerFetch (upval), RequestsModule (upval), TrustedFriendCandidatesPageSize (upval), config (upval), fetchTrustedFriendCandidatesPage (copy), applyTrustedFriendCandidatesPage (copy)
			local Flag: boolean = Flag1
			Flag1 = false
			local DataResult = if Flag then nil else p2.data(false)
			
			return RequestsModule.GetTrustedFriendCandidates(if DataResult then DataResult.nextPageCursor else nil, TrustedFriendCandidatesPageSize):andThen(function(Result)
				-- upvalues: config (upval), TrustedFriendCandidatesMaxReadsPerFetch (copy), fetchTrustedFriendCandidatesPage (upval)
				local NextPageCursor = if Result then Result.nextPageCursor else nil
				local Candidates = {}
				local Statuses = {}
				
				for _, value in if Result and Result.data then Result.data else {} do
					local Text = tostring(value.userId)
					table.insert(Candidates, { id = Text })
					Statuses[Text] = config[value.state]
				end
				return if #Candidates == 0 and NextPageCursor ~= nil and TrustedFriendCandidatesMaxReadsPerFetch > 1 then fetchTrustedFriendCandidatesPage(NextPageCursor, TrustedFriendCandidatesMaxReadsPerFetch - 1) else {
					candidates = Candidates,
					statuses = Statuses,
					nextPageCursor = NextPageCursor
				}
			end):andThen(function(Result)
				-- upvalues: Flag (copy), p2 (copy), applyTrustedFriendCandidatesPage (upval)
				return (applyTrustedFriendCandidatesPage(Result, if Flag then nil else p2.data(false)))
			end)
		end
	}) else nil
	local v1 = if FFlagConnectionManagementChips then function()
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy)
		return DataResolverModule.getAndFetchItem((tostring((GetLocalPlayerUserIdFunction()))))
	end else nil
	local Callback3 = if FFlagAddFriendsPageTrustedFriendRequestSection then function()
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataResolverModule4 (copy)
		DataResolverModule4.fetchItem((tostring(GetLocalPlayerUserIdFunction())))
	end else nil
	local v2 = if FFlagAddFriendsPageTrustedFriendRequestSection then function(p3)
		-- upvalues: FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), Callback3 (copy), GetLocalPlayerUserIdFunction (upval), DataResolverModule4 (copy)
		if FFlagAddFriendsPageHighlightUnseenTrustedRequests and p3 and p3.forceFetch then
			Callback3()
		end
		return DataResolverModule4.getAndFetchItem((tostring((GetLocalPlayerUserIdFunction()))))
	end else nil
	local v3 = if FFlagAddFriendsPageTrustedFriendRequestSection then function()
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataCacheModule3 (copy), DataResolverModule3 (copy)
		local Text = tostring(GetLocalPlayerUserIdFunction())
		local DataResult = DataCacheModule3.getItem(Text).data(false)
		
		if not DataResult or DataResult.hasMore then
			DataResolverModule3.fetchItem(Text)
			
			return
		end
	end else nil
	local Callback4 = if FFlagAddFriendsPageTrustedFriendRequestSection then function()
		-- upvalues: Flag (ref), GetLocalPlayerUserIdFunction (upval), DataResolverModule3 (copy)
		Flag = true
		DataResolverModule3.fetchItem((tostring(GetLocalPlayerUserIdFunction())))
	end else nil
	local v4 = if FFlagAddFriendsPageTrustedFriendRequestSection then function(p3)
		-- upvalues: FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), Callback4 (copy), GetLocalPlayerUserIdFunction (upval), DataResolverModule3 (copy)
		if FFlagAddFriendsPageHighlightUnseenTrustedRequests and p3 and p3.forceFetch then
			Callback4()
		end
		return DataResolverModule3.getAndFetchItem((tostring((GetLocalPlayerUserIdFunction()))))
	end else nil
	local Callback5 = if FFlagTrustedFriendCandidatesSection then function()
		-- upvalues: Flag1 (ref), GetLocalPlayerUserIdFunction (upval), DataResolverModule5 (copy)
		Flag1 = true
		DataResolverModule5.refetchItem((tostring(GetLocalPlayerUserIdFunction())))
	end else nil
	local v5 = if FFlagTrustedFriendCandidatesSection then function(p3)
		-- upvalues: Callback5 (copy), GetLocalPlayerUserIdFunction (upval), DataResolverModule5 (copy)
		if p3 and p3.forceFetch then
			Callback5()
		end
		return DataResolverModule5.getAndFetchItem((tostring((GetLocalPlayerUserIdFunction()))))
	end else nil
	local v6 = if FFlagTrustedFriendCandidatesSection then function()
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataCacheModule5 (copy), DataResolverModule5 (copy)
		local Text = tostring(GetLocalPlayerUserIdFunction())
		local DataResult = DataCacheModule5.getItem(Text).data(false)
		
		if not DataResult or DataResult.hasMore then
			DataResolverModule5.fetchItem(Text)
			
			return
		end
	end else nil
	local v7 = if FFlagTrustedFriendCandidatesSection then function(p3)
		-- upvalues: DataResolverModule2 (copy)
		return DataResolverModule2.refetchItem(p3)
	end else nil
	local v8 = if FFlagAddFriendsPageTrustedFriendRequestSection then function()
		-- upvalues: RequestsModule (upval), GetLocalPlayerUserIdFunction (upval), FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), DataCacheModule3 (copy), DataCacheModule4 (copy), FFlagTrustedFriendCandidatesSection (upval), DataResolverModule2 (copy)
		return RequestsModule.PostUserIgnoreAllTrustedFriendRequests():andThen(function()
			-- upvalues: GetLocalPlayerUserIdFunction (upval), FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), DataCacheModule3 (upval), DataCacheModule4 (upval), FFlagTrustedFriendCandidatesSection (upval), DataResolverModule2 (upval)
			local Text = tostring(GetLocalPlayerUserIdFunction())
			
			if FFlagAddFriendsPageHighlightUnseenTrustedRequests then
				DataCacheModule3.replaceItem(Text, {
					senderIds = nil,
					nextPageCursor = nil,
					hasMore = false,
					requests = {}
				})
			else
				DataCacheModule3.replaceItem(Text, { nextPageCursor = nil, hasMore = false, senderIds = {} })
			end
			DataCacheModule4.replaceItem(Text, 0)
			
			if FFlagTrustedFriendCandidatesSection then
				DataResolverModule2.clear()
			end
		end)
	end else nil
	
	return {
		getStatus = function(p3)
			-- upvalues: DataResolverModule2 (copy)
			return DataResolverModule2.getAndFetchItem(p3)
		end,
		getIsTrustedConnection = function(p3)
			-- upvalues: DataResolverModule1 (copy)
			return DataResolverModule1.getAndFetchItem(p3)
		end,
		getUserTrustedConnections = if FFlagConnectionManagementChips then v1 else nil,
		getTrustedFriendRequests = if FFlagAddFriendsPageTrustedFriendRequestSection then v4 else nil,
		getTrustedFriendRequestsCount = if FFlagAddFriendsPageTrustedFriendRequestSection then v2 else nil,
		loadMoreTrustedFriendRequests = if FFlagAddFriendsPageTrustedFriendRequestSection then v3 else nil,
		refetchTrustedFriendRequests = if FFlagAddFriendsPageTrustedFriendRequestSection then Callback4 else nil,
		refetchTrustedFriendRequestsCount = if FFlagAddFriendsPageTrustedFriendRequestSection then Callback3 else nil,
		getTrustedFriendCandidates = if FFlagTrustedFriendCandidatesSection then v5 else nil,
		loadMoreTrustedFriendCandidates = if FFlagTrustedFriendCandidatesSection then v6 else nil,
		refetchTrustedFriendCandidates = if FFlagTrustedFriendCandidatesSection then Callback5 else nil,
		refetchStatus = if FFlagTrustedFriendCandidatesSection then v7 else nil,
		sendTrustedConnectionRequest = function(p3, p4)
			-- upvalues: RequestsModule (upval), FFlagProfileTFCardUseQrScanContext (upval), PromiseModule (upval), DataCacheModule (copy), TrustedConnectionStatusModule (upval)
			return RequestsModule.PostUserSendTrustedConnectionRequest(p3, p4):andThen(function(Result)
				-- upvalues: FFlagProfileTFCardUseQrScanContext (upval), PromiseModule (upval), DataCacheModule (upval), p3 (copy), TrustedConnectionStatusModule (upval)
				if FFlagProfileTFCardUseQrScanContext and Result and Result.responseBody and Result.responseBody.success == false then
					return PromiseModule.reject("Trusted connection request was not sent")
				else
					DataCacheModule.updateItems({ [p3] = TrustedConnectionStatusModule.RequestSent })
					
					return nil
				end
			end)
		end,
		acceptTrustedConnectionRequest = function(p3)
			-- upvalues: RequestsModule (upval), DataCacheModule (copy), TrustedConnectionStatusModule (upval), DataCacheModule1 (copy), FFlagAddFriendsPageTrustedFriendRequestSection (upval), Callback2 (copy), FFlagTrustedFriendCandidatesSection (upval), Callback (copy)
			return RequestsModule.PostUserAcceptTrustedConnectionRequest(p3):andThen(function()
				-- upvalues: DataCacheModule (upval), p3 (copy), TrustedConnectionStatusModule (upval), DataCacheModule1 (upval), FFlagAddFriendsPageTrustedFriendRequestSection (upval), Callback2 (upval), FFlagTrustedFriendCandidatesSection (upval), Callback (upval)
				DataCacheModule.updateItems({ [p3] = TrustedConnectionStatusModule.TrustedFriends })
				DataCacheModule1.updateItems({ [p3] = true })
				
				if FFlagAddFriendsPageTrustedFriendRequestSection then
					Callback2(p3)
				end
				if FFlagTrustedFriendCandidatesSection then
					Callback(p3)
				end
			end)
		end,
		ignoreTrustedConnectionRequest = function(p3)
			-- upvalues: RequestsModule (upval), DataCacheModule (copy), TrustedConnectionStatusModule (upval), FFlagAddFriendsPageTrustedFriendRequestSection (upval), Callback2 (copy)
			return RequestsModule.PostUserIgnoreTrustedConnectionRequest(p3):andThen(function()
				-- upvalues: DataCacheModule (upval), p3 (copy), TrustedConnectionStatusModule (upval), FFlagAddFriendsPageTrustedFriendRequestSection (upval), Callback2 (upval)
				DataCacheModule.updateItems({ [p3] = TrustedConnectionStatusModule.RequestIgnored })
				
				if FFlagAddFriendsPageTrustedFriendRequestSection then
					Callback2(p3)
				end
			end)
		end,
		ignoreAllTrustedFriendRequests = if FFlagAddFriendsPageTrustedFriendRequestSection then v8 else nil,
		removeTrustedConnectionRequest = function(p3)
			-- upvalues: RequestsModule (upval), DataCacheModule (copy), TrustedConnectionStatusModule (upval), DataCacheModule1 (copy)
			return RequestsModule.PostUserRemoveTrustedConnection(p3):andThen(function()
				-- upvalues: DataCacheModule (upval), p3 (copy), TrustedConnectionStatusModule (upval), DataCacheModule1 (upval)
				DataCacheModule.updateItems({ [p3] = TrustedConnectionStatusModule.RequestReceived })
				DataCacheModule1.updateItems({ [p3] = false })
			end)
		end,
		createTrustedFriendLink = function(p3)
			-- upvalues: RequestsModule (upval)
			return RequestsModule.PostUserCreateTrustedFriendLink(p3)
		end,
		validateTrustedFriendLink = function(p3, p4)
			-- upvalues: RequestsModule (upval)
			return RequestsModule.PostUserValidateTrustedFriendLink(p3, p4)
		end,
		addTrustedFriendFromLink = function(p3, p4)
			-- upvalues: RequestsModule (upval)
			return RequestsModule.PostUserAddTrustedFriendFromLink(p3, p4)
		end,
		clear = function()
			-- upvalues: DataCacheModule (copy), DataCacheModule1 (copy), DataResolverModule1 (copy), DataResolverModule2 (copy), FFlagConnectionManagementChips (upval), DataCacheModule2 (copy), DataResolverModule (copy), FFlagAddFriendsPageTrustedFriendRequestSection (upval), DataCacheModule3 (copy), DataResolverModule3 (copy), DataCacheModule4 (copy), DataResolverModule4 (copy), FFlagTrustedFriendCandidatesSection (upval), DataCacheModule5 (copy), DataResolverModule5 (copy)
			DataCacheModule.clear()
			DataCacheModule1.clear()
			DataResolverModule1.clear()
			DataResolverModule2.clear()
			
			if FFlagConnectionManagementChips then
				DataCacheModule2.clear()
				DataResolverModule.clear()
			end
			if FFlagAddFriendsPageTrustedFriendRequestSection then
				DataCacheModule3.clear()
				DataResolverModule3.clear()
				DataCacheModule4.clear()
				DataResolverModule4.clear()
			end
			if FFlagTrustedFriendCandidatesSection then
				DataCacheModule5.clear()
				DataResolverModule5.clear()
			end
		end,
		dispose = function()
			-- upvalues: DataCacheModule (copy), DataCacheModule1 (copy), DataResolverModule1 (copy), DataResolverModule2 (copy), TrustedConnectionEventListenerModule (copy), FFlagAddFriendsPageTrustedFriendRequestSection (upval), FriendshipEventListenerModule (copy), FFlagConnectionManagementChips (upval), DataCacheModule2 (copy), DataResolverModule (copy), DataCacheModule3 (copy), DataResolverModule3 (copy), DataCacheModule4 (copy), DataResolverModule4 (copy), FFlagTrustedFriendCandidatesSection (upval), DataCacheModule5 (copy), DataResolverModule5 (copy)
			DataCacheModule.dispose()
			DataCacheModule1.dispose()
			DataResolverModule1.dispose()
			DataResolverModule2.dispose()
			TrustedConnectionEventListenerModule()
			
			if FFlagAddFriendsPageTrustedFriendRequestSection then
				FriendshipEventListenerModule()
			end
			if FFlagConnectionManagementChips then
				DataCacheModule2.dispose()
				DataResolverModule.dispose()
			end
			if FFlagAddFriendsPageTrustedFriendRequestSection then
				DataCacheModule3.dispose()
				DataResolverModule3.dispose()
				DataCacheModule4.dispose()
				DataResolverModule4.dispose()
			end
			if FFlagTrustedFriendCandidatesSection then
				DataCacheModule5.dispose()
				DataResolverModule5.dispose()
			end
		end
	}
end