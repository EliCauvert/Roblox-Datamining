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
local FFlagTCShareLinkReceiverUI = require(Parent.SharedFlags).FFlagTCShareLinkReceiverUI
local FFlagConnectionManagementChips = require(Parent.SharedFlags).FFlagConnectionManagementChips
local FFlagAddFriendsPageTrustedFriendRequestSection = require(Parent.SharedFlags).FFlagAddFriendsPageTrustedFriendRequestSection
local FFlagAddFriendsPageHighlightUnseenTrustedRequests = require(Parent.SharedFlags).FFlagAddFriendsPageHighlightUnseenTrustedRequests
local FIntTrustedFriendRequestsPageSize = require(Parent.SharedFlags).FIntTrustedFriendRequestsPageSize
local FFlagProfileTFCardUseQrScanContext = require(Parent.SharedFlags).FFlagProfileTFCardUseQrScanContext
local TrustedConnectionsStoreDataTtlSec = game:DefineFastInt("TrustedConnectionsStoreDataTtlSec", 0)
game:DefineFastInt("TrustedConnectionsStoreProcessDelaySec", 1)

local function _() --[[ Line: 77 ]]
	return game:GetFastInt("TrustedConnectionsStoreProcessDelaySec")
end

game:DefineFastInt("TrustedConnectionsStoreIncomingRequestsProcessDelaySec", 0)

local _ = function() --[[ Line: 82 ]]
	return game:GetFastInt("TrustedConnectionsStoreIncomingRequestsProcessDelaySec")
end

return function() --[[ Line: 86 | Named "createTrustedConnectionsStore" ]]
	-- upvalues: TrustedConnectionsStoreDataTtlSec (copy), CreateDataCacheModule (copy), FFlagConnectionManagementChips (copy), FFlagAddFriendsPageTrustedFriendRequestSection (copy), GetLocalPlayerUserIdFunction (copy), FFlagAddFriendsPageHighlightUnseenTrustedRequests (copy), MergeListsWithoutDuplicatesFunction (copy), CryoModule (copy), CreateDataResolverModule (copy), RequestsModule (copy), CreateTrustedConnectionEventListenerModule (copy), TrustedConnectionStatusModule (copy), CreateFriendshipEventListenerModule (copy), PromiseModule (copy), FIntTrustedFriendRequestsPageSize (copy), FFlagProfileTFCardUseQrScanContext (copy), FFlagTCShareLinkReceiverUI (copy)
	local TrustedConnectionsStoreDataTtlSec1 = if TrustedConnectionsStoreDataTtlSec > 0 then TrustedConnectionsStoreDataTtlSec else 1e999
	local DataCacheModule = CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1)
	local DataCacheModule1 = CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1)
	local DataCacheModule2 = if FFlagConnectionManagementChips then CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1) else nil
	local DataCacheModule3 = if FFlagAddFriendsPageTrustedFriendRequestSection then CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1) else nil
	local DataCacheModule4 = if FFlagAddFriendsPageTrustedFriendRequestSection then CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1) else nil
	local Flag = false
	local Callback3 = if FFlagAddFriendsPageTrustedFriendRequestSection then function(Id) --[[ Line: 103 ]]
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
	local Callback = if FFlagAddFriendsPageTrustedFriendRequestSection then function(Id) --[[ Line: 152 ]]
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataCacheModule3 (copy), FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), CryoModule (upval), DataCacheModule4 (copy)
		local Text = tostring(GetLocalPlayerUserIdFunction())
		local DataResult = DataCacheModule3.getItem(Text).data(false)
		
		if not DataResult then return end
		if FFlagAddFriendsPageHighlightUnseenTrustedRequests then
			local Requests = DataResult.requests
			
			if not Requests then return end
			local FilterResult = CryoModule.List.filter(Requests, function(p1): boolean --[[ Line: 165 ]]
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
	local DataResolverModule = if FFlagConnectionManagementChips then CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule2,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"),
		fetchFn = function(p1) --[[ Line: 205 ]]
			-- upvalues: RequestsModule (upval), CryoModule (upval)
			return RequestsModule.GetUserTrustedConnections(p1):andThen(function(Result) --[[ Line: 206 ]]
				-- upvalues: CryoModule (upval)
				return CryoModule.List.map(Result.PageItems or {}, function(p2) --[[ Line: 208 ]]
					return { id = tostring(p2.id) }
				end)
			end)
		end
	}) else nil
	local TrustedConnectionEventListenerModule = CreateTrustedConnectionEventListenerModule(function(p1, RequestReceived) --[[ Line: 219 ]]
		-- upvalues: DataCacheModule (copy), DataCacheModule1 (copy), TrustedConnectionStatusModule (upval), FFlagAddFriendsPageTrustedFriendRequestSection (upval), Callback3 (copy), FFlagConnectionManagementChips (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy)
		DataCacheModule.updateItems({ [p1] = RequestReceived })
		DataCacheModule1.updateItems({
			[p1] = RequestReceived == TrustedConnectionStatusModule.TrustedFriends
		})
		
		if FFlagAddFriendsPageTrustedFriendRequestSection and RequestReceived == TrustedConnectionStatusModule.RequestReceived then
			Callback3(p1)
		end
		if FFlagConnectionManagementChips then
			local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
			
			if LocalPlayerUserId then
				DataResolverModule.fetchItem((tostring(LocalPlayerUserId)))
			end
		end
	end)
	local FriendshipEventListenerModule = if FFlagAddFriendsPageTrustedFriendRequestSection then CreateFriendshipEventListenerModule(function(p1, NotFriends) --[[ Line: 245 ]]
		-- upvalues: DataCacheModule (copy), DataCacheModule1 (copy), TrustedConnectionStatusModule (upval), Callback (copy)
		DataCacheModule.updateItems({ [p1] = NotFriends })
		DataCacheModule1.updateItems({
			[p1] = NotFriends == TrustedConnectionStatusModule.TrustedFriends
		})
		
		if NotFriends == TrustedConnectionStatusModule.NotFriends then
			Callback(p1)
		end
	end) else nil
	local DataResolverModule1 = CreateDataResolverModule({
		cache = DataCacheModule1,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"),
		fetchFn = function(p1) --[[ Line: 263 ]]
			-- upvalues: CryoModule (upval), RequestsModule (upval)
			local KeysResult = CryoModule.Dictionary.keys(p1)
			
			return RequestsModule.MultiGetUsersAreTrustedConnections(KeysResult):andThen(function(Result) --[[ Line: 265 ]]
				-- upvalues: CryoModule (upval), KeysResult (copy)
				local FoldLeftResult = CryoModule.List.foldLeft(Result, function(p2, p3) --[[ Line: 266 ]]
					p2[tostring(p3)] = true
					
					return p2
				end, {})
				
				return CryoModule.List.foldLeft(KeysResult, function(p2, p3) --[[ Line: 271 ]]
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
		fetchFn = function(p1) --[[ Line: 282 ]]
			-- upvalues: CryoModule (upval), RequestsModule (upval), PromiseModule (upval)
			return PromiseModule.all((CryoModule.List.foldLeft(CryoModule.Dictionary.keys(p1), function(List, p2) --[[ Line: 284 ]]
				-- upvalues: RequestsModule (upval)
				table.insert(List, RequestsModule.GetUserTrustedConnectionStatus(p2):andThen(function(Result) --[[ Line: 288 ]]
					-- upvalues: p2 (copy)
					return { [p2] = Result }
				end))
				
				return List
			end, {}))):andThen(function(Result) --[[ Line: 295 ]]
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
		fetchFn = function(_, p1) --[[ Line: 307 ]]
			-- upvalues: Flag (ref), RequestsModule (upval), FIntTrustedFriendRequestsPageSize (upval), FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), CryoModule (upval), MergeListsWithoutDuplicatesFunction (upval)
			local DataResult = if Flag then nil else p1.data(false)
			Flag = false
			
			return RequestsModule.GetTrustedFriendRequests(if DataResult then DataResult.nextPageCursor else nil, FIntTrustedFriendRequestsPageSize):andThen(function(Result) --[[ Line: 314 ]]
				-- upvalues: FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), CryoModule (upval), DataResult (copy), MergeListsWithoutDuplicatesFunction (upval)
				if FFlagAddFriendsPageHighlightUnseenTrustedRequests then
					local NextPageCursor = if Result then Result.nextPageCursor else nil
					
					return {
						senderIds = nil,
						requests = MergeListsWithoutDuplicatesFunction(if DataResult then DataResult.requests else nil, CryoModule.List.map((if Result then Result.data else nil) or {}, function(p2) --[[ Line: 319 ]]
							return { id = tostring(p2.senderId), isUnseen = p2.isUnseen }
						end), "id"),
						nextPageCursor = NextPageCursor,
						hasMore = NextPageCursor ~= nil
					}
				else
					local NextPageCursor = if Result then Result.nextPageCursor else nil
					
					return {
						senderIds = MergeListsWithoutDuplicatesFunction(if DataResult then DataResult.senderIds else nil, (CryoModule.List.map((if Result then Result.data else nil) or {}, function(p2): string --[[ Line: 339 ]]
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
		fetchFn = function(_) --[[ Line: 363 ]]
			-- upvalues: RequestsModule (upval)
			return RequestsModule.GetTrustedFriendRequestsCount():andThen(function(Result) --[[ Line: 364 ]]
				return if Result then Result.count else 0
			end)
		end
	}) else nil
	local v1 = if FFlagConnectionManagementChips then function() --[[ Line: 380 ]]
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy)
		return DataResolverModule.getAndFetchItem((tostring((GetLocalPlayerUserIdFunction()))))
	end else nil
	local Callback2 = if FFlagAddFriendsPageTrustedFriendRequestSection then function() --[[ Line: 387 ]]
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataResolverModule4 (copy)
		DataResolverModule4.fetchItem((tostring(GetLocalPlayerUserIdFunction())))
	end else nil
	local v2 = if FFlagAddFriendsPageTrustedFriendRequestSection then function(p1) --[[ Line: 394 ]]
		-- upvalues: FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), Callback2 (copy), GetLocalPlayerUserIdFunction (upval), DataResolverModule4 (copy)
		if FFlagAddFriendsPageHighlightUnseenTrustedRequests and p1 and p1.forceFetch then
			Callback2()
		end
		return DataResolverModule4.getAndFetchItem((tostring((GetLocalPlayerUserIdFunction()))))
	end else nil
	local v3 = if FFlagAddFriendsPageTrustedFriendRequestSection then function() --[[ Line: 405 ]]
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataCacheModule3 (copy), DataResolverModule3 (copy)
		local Text = tostring(GetLocalPlayerUserIdFunction())
		local DataResult = DataCacheModule3.getItem(Text).data(false)
		
		if not DataResult or DataResult.hasMore then
			DataResolverModule3.fetchItem(Text)
			
			return
		end
	end else nil
	local Callback1 = if FFlagAddFriendsPageTrustedFriendRequestSection then function() --[[ Line: 416 ]]
		-- upvalues: Flag (ref), GetLocalPlayerUserIdFunction (upval), DataResolverModule3 (copy)
		Flag = true
		DataResolverModule3.fetchItem((tostring(GetLocalPlayerUserIdFunction())))
	end else nil
	local v4 = if FFlagAddFriendsPageTrustedFriendRequestSection then function(p1) --[[ Line: 425 ]]
		-- upvalues: FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), Callback1 (copy), GetLocalPlayerUserIdFunction (upval), DataResolverModule3 (copy)
		if FFlagAddFriendsPageHighlightUnseenTrustedRequests and p1 and p1.forceFetch then
			Callback1()
		end
		return DataResolverModule3.getAndFetchItem((tostring((GetLocalPlayerUserIdFunction()))))
	end else nil
	local v5 = if FFlagAddFriendsPageTrustedFriendRequestSection then function() --[[ Line: 482 ]]
		-- upvalues: RequestsModule (upval), GetLocalPlayerUserIdFunction (upval), FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), DataCacheModule3 (copy), DataCacheModule4 (copy)
		return RequestsModule.PostUserIgnoreAllTrustedFriendRequests():andThen(function() --[[ Line: 483 ]]
			-- upvalues: GetLocalPlayerUserIdFunction (upval), FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), DataCacheModule3 (upval), DataCacheModule4 (upval)
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
		end)
	end else nil
	
	local function v39(p1, p2) --[[ Line: 520 ]]
		-- upvalues: RequestsModule (upval)
		return RequestsModule.PostUserValidateTrustedFriendLink(p1, p2)
	end
	
	local function v40(p1, p2) --[[ Line: 524 ]]
		-- upvalues: RequestsModule (upval)
		return RequestsModule.PostUserAddTrustedFriendFromLink(p1, p2)
	end
	
	return {
		getStatus = function(p1) --[[ Line: 371 ]]
			-- upvalues: DataResolverModule2 (copy)
			return DataResolverModule2.getAndFetchItem(p1)
		end,
		getIsTrustedConnection = function(p1) --[[ Line: 375 ]]
			-- upvalues: DataResolverModule1 (copy)
			return DataResolverModule1.getAndFetchItem(p1)
		end,
		getUserTrustedConnections = if FFlagConnectionManagementChips then v1 else nil,
		getTrustedFriendRequests = if FFlagAddFriendsPageTrustedFriendRequestSection then v4 else nil,
		getTrustedFriendRequestsCount = if FFlagAddFriendsPageTrustedFriendRequestSection then v2 else nil,
		loadMoreTrustedFriendRequests = if FFlagAddFriendsPageTrustedFriendRequestSection then v3 else nil,
		refetchTrustedFriendRequests = if FFlagAddFriendsPageTrustedFriendRequestSection then Callback1 else nil,
		refetchTrustedFriendRequestsCount = if FFlagAddFriendsPageTrustedFriendRequestSection then Callback2 else nil,
		sendTrustedConnectionRequest = function(p1, p2) --[[ Line: 435 ]]
			-- upvalues: RequestsModule (upval), FFlagProfileTFCardUseQrScanContext (upval), PromiseModule (upval), DataCacheModule (copy), TrustedConnectionStatusModule (upval)
			return RequestsModule.PostUserSendTrustedConnectionRequest(p1, p2):andThen(function(Result) --[[ Line: 436 ]]
				-- upvalues: FFlagProfileTFCardUseQrScanContext (upval), PromiseModule (upval), DataCacheModule (upval), p1 (copy), TrustedConnectionStatusModule (upval)
				if FFlagProfileTFCardUseQrScanContext and Result and Result.responseBody and Result.responseBody.success == false then
					return PromiseModule.reject("Trusted connection request was not sent")
				else
					DataCacheModule.updateItems({ [p1] = TrustedConnectionStatusModule.RequestSent })
					
					return nil
				end
			end)
		end,
		acceptTrustedConnectionRequest = function(p1) --[[ Line: 453 ]]
			-- upvalues: RequestsModule (upval), DataCacheModule (copy), TrustedConnectionStatusModule (upval), DataCacheModule1 (copy), FFlagAddFriendsPageTrustedFriendRequestSection (upval), Callback (copy)
			return RequestsModule.PostUserAcceptTrustedConnectionRequest(p1):andThen(function() --[[ Line: 454 ]]
				-- upvalues: DataCacheModule (upval), p1 (copy), TrustedConnectionStatusModule (upval), DataCacheModule1 (upval), FFlagAddFriendsPageTrustedFriendRequestSection (upval), Callback (upval)
				DataCacheModule.updateItems({ [p1] = TrustedConnectionStatusModule.TrustedFriends })
				DataCacheModule1.updateItems({ [p1] = true })
				
				if FFlagAddFriendsPageTrustedFriendRequestSection then
					Callback(p1)
				end
			end)
		end,
		ignoreTrustedConnectionRequest = function(p1) --[[ Line: 469 ]]
			-- upvalues: RequestsModule (upval), DataCacheModule (copy), TrustedConnectionStatusModule (upval), FFlagAddFriendsPageTrustedFriendRequestSection (upval), Callback (copy)
			return RequestsModule.PostUserIgnoreTrustedConnectionRequest(p1):andThen(function() --[[ Line: 470 ]]
				-- upvalues: DataCacheModule (upval), p1 (copy), TrustedConnectionStatusModule (upval), FFlagAddFriendsPageTrustedFriendRequestSection (upval), Callback (upval)
				DataCacheModule.updateItems({ [p1] = TrustedConnectionStatusModule.RequestIgnored })
				
				if FFlagAddFriendsPageTrustedFriendRequestSection then
					Callback(p1)
				end
			end)
		end,
		ignoreAllTrustedFriendRequests = if FFlagAddFriendsPageTrustedFriendRequestSection then v5 else nil,
		removeTrustedConnectionRequest = function(p1) --[[ Line: 504 ]]
			-- upvalues: RequestsModule (upval), DataCacheModule (copy), TrustedConnectionStatusModule (upval), DataCacheModule1 (copy)
			return RequestsModule.PostUserRemoveTrustedConnection(p1):andThen(function() --[[ Line: 505 ]]
				-- upvalues: DataCacheModule (upval), p1 (copy), TrustedConnectionStatusModule (upval), DataCacheModule1 (upval)
				DataCacheModule.updateItems({ [p1] = TrustedConnectionStatusModule.RequestReceived })
				DataCacheModule1.updateItems({ [p1] = false })
			end)
		end,
		createTrustedFriendLink = function(p1) --[[ Line: 516 ]]
			-- upvalues: RequestsModule (upval)
			return RequestsModule.PostUserCreateTrustedFriendLink(p1)
		end,
		validateTrustedFriendLink = if FFlagTCShareLinkReceiverUI then v39 else nil,
		addTrustedFriendFromLink = if FFlagTCShareLinkReceiverUI then v40 else nil,
		clear = function() --[[ Line: 528 ]]
			-- upvalues: DataCacheModule (copy), DataCacheModule1 (copy), DataResolverModule1 (copy), DataResolverModule2 (copy), FFlagConnectionManagementChips (upval), DataCacheModule2 (copy), DataResolverModule (copy), FFlagAddFriendsPageTrustedFriendRequestSection (upval), DataCacheModule3 (copy), DataResolverModule3 (copy), DataCacheModule4 (copy), DataResolverModule4 (copy)
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
		end,
		dispose = function() --[[ Line: 547 ]]
			-- upvalues: DataCacheModule (copy), DataCacheModule1 (copy), DataResolverModule1 (copy), DataResolverModule2 (copy), TrustedConnectionEventListenerModule (copy), FFlagAddFriendsPageTrustedFriendRequestSection (upval), FriendshipEventListenerModule (copy), FFlagConnectionManagementChips (upval), DataCacheModule2 (copy), DataResolverModule (copy), DataCacheModule3 (copy), DataResolverModule3 (copy), DataCacheModule4 (copy), DataResolverModule4 (copy)
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
		end
	}
end