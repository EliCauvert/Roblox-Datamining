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
local FIntTrustedFriendRequestsPageSize = require(Parent.SharedFlags).FIntTrustedFriendRequestsPageSize
local FFlagProfileTFCardUseQrScanContext = require(Parent.SharedFlags).FFlagProfileTFCardUseQrScanContext
local TrustedConnectionsStoreDataTtlSec = game:DefineFastInt("TrustedConnectionsStoreDataTtlSec", 0)
game:DefineFastInt("TrustedConnectionsStoreProcessDelaySec", 1)

local function _() --[[ Line: 69 ]]
	return game:GetFastInt("TrustedConnectionsStoreProcessDelaySec")
end

game:DefineFastInt("TrustedConnectionsStoreIncomingRequestsProcessDelaySec", 0)

local _ = function() --[[ Line: 74 ]]
	return game:GetFastInt("TrustedConnectionsStoreIncomingRequestsProcessDelaySec")
end

return function() --[[ Line: 78 | Named "createTrustedConnectionsStore" ]]
	-- upvalues: TrustedConnectionsStoreDataTtlSec (copy), CreateDataCacheModule (copy), FFlagConnectionManagementChips (copy), FFlagAddFriendsPageTrustedFriendRequestSection (copy), GetLocalPlayerUserIdFunction (copy), MergeListsWithoutDuplicatesFunction (copy), CryoModule (copy), CreateDataResolverModule (copy), RequestsModule (copy), CreateTrustedConnectionEventListenerModule (copy), TrustedConnectionStatusModule (copy), CreateFriendshipEventListenerModule (copy), PromiseModule (copy), FIntTrustedFriendRequestsPageSize (copy), FFlagProfileTFCardUseQrScanContext (copy), FFlagTCShareLinkReceiverUI (copy)
	local TrustedConnectionsStoreDataTtlSec1 = if TrustedConnectionsStoreDataTtlSec > 0 then TrustedConnectionsStoreDataTtlSec else 1e999
	local DataCacheModule = CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1)
	local DataCacheModule1 = CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1)
	local DataCacheModule2 = if FFlagConnectionManagementChips then CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1) else nil
	local DataCacheModule3 = if FFlagAddFriendsPageTrustedFriendRequestSection then CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1) else nil
	local DataCacheModule4 = if FFlagAddFriendsPageTrustedFriendRequestSection then CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1) else nil
	local Flag = false
	local Callback = if FFlagAddFriendsPageTrustedFriendRequestSection then function(p1) --[[ Line: 95 ]]
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataCacheModule3 (copy), MergeListsWithoutDuplicatesFunction (upval), DataCacheModule4 (copy)
		local Text = tostring(GetLocalPlayerUserIdFunction())
		local DataResult = DataCacheModule3.getItem(Text).data(false)
		
		if not DataResult then return end
		local MergeListsWithoutDuplicatesResult = MergeListsWithoutDuplicatesFunction(DataResult.senderIds, { p1 })
		
		if #MergeListsWithoutDuplicatesResult == #DataResult.senderIds then return end
		DataCacheModule3.replaceItem(Text, {
			senderIds = MergeListsWithoutDuplicatesResult,
			nextPageCursor = DataResult.nextPageCursor,
			hasMore = DataResult.hasMore
		})
		local DataResult1: number = DataCacheModule4.getItem(Text).data(false)
		
		if DataResult1 then
			DataCacheModule4.replaceItem(Text, (math.max(DataResult1 + 1, 0)))
		end
	end else nil
	local Callback1 = if FFlagAddFriendsPageTrustedFriendRequestSection then function(p1) --[[ Line: 121 ]]
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataCacheModule3 (copy), CryoModule (upval), DataCacheModule4 (copy)
		local Text = tostring(GetLocalPlayerUserIdFunction())
		local DataResult = DataCacheModule3.getItem(Text).data(false)
		
		if not DataResult then return end
		local RemoveValueResult = CryoModule.List.removeValue(DataResult.senderIds, p1)
		
		if #RemoveValueResult == #DataResult.senderIds then return end
		DataCacheModule3.replaceItem(Text, {
			senderIds = RemoveValueResult,
			nextPageCursor = DataResult.nextPageCursor,
			hasMore = DataResult.hasMore
		})
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
		fetchFn = function(p1) --[[ Line: 153 ]]
			-- upvalues: RequestsModule (upval), CryoModule (upval)
			return RequestsModule.GetUserTrustedConnections(p1):andThen(function(Result) --[[ Line: 154 ]]
				-- upvalues: CryoModule (upval)
				return CryoModule.List.map(Result.PageItems or {}, function(p2) --[[ Line: 156 ]]
					return { id = tostring(p2.id) }
				end)
			end)
		end
	}) else nil
	local TrustedConnectionEventListenerModule = CreateTrustedConnectionEventListenerModule(function(p1, RequestReceived) --[[ Line: 167 ]]
		-- upvalues: DataCacheModule (copy), DataCacheModule1 (copy), TrustedConnectionStatusModule (upval), FFlagAddFriendsPageTrustedFriendRequestSection (upval), Callback (copy), FFlagConnectionManagementChips (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy)
		DataCacheModule.updateItems({ [p1] = RequestReceived })
		DataCacheModule1.updateItems({
			[p1] = RequestReceived == TrustedConnectionStatusModule.TrustedFriends
		})
		
		if FFlagAddFriendsPageTrustedFriendRequestSection and RequestReceived == TrustedConnectionStatusModule.RequestReceived then
			Callback(p1)
		end
		if FFlagConnectionManagementChips then
			local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
			
			if LocalPlayerUserId then
				DataResolverModule.fetchItem((tostring(LocalPlayerUserId)))
			end
		end
	end)
	local FriendshipEventListenerModule = if FFlagAddFriendsPageTrustedFriendRequestSection then CreateFriendshipEventListenerModule(function(p1, NotFriends) --[[ Line: 193 ]]
		-- upvalues: DataCacheModule (copy), DataCacheModule1 (copy), TrustedConnectionStatusModule (upval), Callback1 (copy)
		DataCacheModule.updateItems({ [p1] = NotFriends })
		DataCacheModule1.updateItems({
			[p1] = NotFriends == TrustedConnectionStatusModule.TrustedFriends
		})
		
		if NotFriends == TrustedConnectionStatusModule.NotFriends then
			Callback1(p1)
		end
	end) else nil
	local DataResolverModule1 = CreateDataResolverModule({
		cache = DataCacheModule1,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreProcessDelaySec"),
		fetchFn = function(p1) --[[ Line: 211 ]]
			-- upvalues: CryoModule (upval), RequestsModule (upval)
			local KeysResult = CryoModule.Dictionary.keys(p1)
			
			return RequestsModule.MultiGetUsersAreTrustedConnections(KeysResult):andThen(function(Result) --[[ Line: 213 ]]
				-- upvalues: CryoModule (upval), KeysResult (copy)
				local FoldLeftResult = CryoModule.List.foldLeft(Result, function(p2, p3) --[[ Line: 214 ]]
					p2[tostring(p3)] = true
					
					return p2
				end, {})
				
				return CryoModule.List.foldLeft(KeysResult, function(p2, p3) --[[ Line: 219 ]]
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
		fetchFn = function(p1) --[[ Line: 230 ]]
			-- upvalues: CryoModule (upval), RequestsModule (upval), PromiseModule (upval)
			return PromiseModule.all((CryoModule.List.foldLeft(CryoModule.Dictionary.keys(p1), function(List, p2) --[[ Line: 232 ]]
				-- upvalues: RequestsModule (upval)
				table.insert(List, RequestsModule.GetUserTrustedConnectionStatus(p2):andThen(function(Result) --[[ Line: 236 ]]
					-- upvalues: p2 (copy)
					return { [p2] = Result }
				end))
				
				return List
			end, {}))):andThen(function(Result) --[[ Line: 243 ]]
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
		fetchFn = function(_, p1) --[[ Line: 255 ]]
			-- upvalues: Flag (ref), RequestsModule (upval), FIntTrustedFriendRequestsPageSize (upval), CryoModule (upval), MergeListsWithoutDuplicatesFunction (upval)
			local DataResult = if Flag then nil else p1.data(false)
			Flag = false
			
			return RequestsModule.GetTrustedFriendRequests(if DataResult then DataResult.nextPageCursor else nil, FIntTrustedFriendRequestsPageSize):andThen(function(Result) --[[ Line: 262 ]]
				-- upvalues: CryoModule (upval), DataResult (copy), MergeListsWithoutDuplicatesFunction (upval)
				local NextPageCursor = if Result then Result.nextPageCursor else nil
				
				return {
					senderIds = MergeListsWithoutDuplicatesFunction(if DataResult then DataResult.senderIds else nil, (CryoModule.List.map((if Result then Result.data else nil) or {}, function(p2): string --[[ Line: 264 ]]
						return (tostring(p2.senderId))
					end))),
					nextPageCursor = NextPageCursor,
					hasMore = NextPageCursor ~= nil
				}
			end)
		end
	}) else nil
	local DataResolverModule4 = if FFlagAddFriendsPageTrustedFriendRequestSection then CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule4,
		queueProcessDelaySec = game:GetFastInt("TrustedConnectionsStoreIncomingRequestsProcessDelaySec"),
		fetchFn = function(_) --[[ Line: 287 ]]
			-- upvalues: RequestsModule (upval)
			return RequestsModule.GetTrustedFriendRequestsCount():andThen(function(Result) --[[ Line: 288 ]]
				return if Result then Result.count else 0
			end)
		end
	}) else nil
	local v1 = if FFlagConnectionManagementChips then function() --[[ Line: 304 ]]
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy)
		return DataResolverModule.getAndFetchItem((tostring((GetLocalPlayerUserIdFunction()))))
	end else nil
	local v2 = if FFlagAddFriendsPageTrustedFriendRequestSection then function() --[[ Line: 311 ]]
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataResolverModule3 (copy)
		return DataResolverModule3.getAndFetchItem((tostring((GetLocalPlayerUserIdFunction()))))
	end else nil
	local v3 = if FFlagAddFriendsPageTrustedFriendRequestSection then function() --[[ Line: 318 ]]
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataResolverModule4 (copy)
		return DataResolverModule4.getAndFetchItem((tostring((GetLocalPlayerUserIdFunction()))))
	end else nil
	local v4 = if FFlagAddFriendsPageTrustedFriendRequestSection then function() --[[ Line: 325 ]]
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataCacheModule3 (copy), DataResolverModule3 (copy)
		local Text = tostring(GetLocalPlayerUserIdFunction())
		local DataResult = DataCacheModule3.getItem(Text).data(false)
		
		if not DataResult or DataResult.hasMore then
			DataResolverModule3.fetchItem(Text)
			
			return
		end
	end else nil
	local v5 = if FFlagAddFriendsPageTrustedFriendRequestSection then function() --[[ Line: 336 ]]
		-- upvalues: Flag (ref), GetLocalPlayerUserIdFunction (upval), DataResolverModule3 (copy)
		Flag = true
		DataResolverModule3.fetchItem((tostring(GetLocalPlayerUserIdFunction())))
	end else nil
	local v6 = if FFlagAddFriendsPageTrustedFriendRequestSection then function() --[[ Line: 345 ]]
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataResolverModule4 (copy)
		DataResolverModule4.fetchItem((tostring(GetLocalPlayerUserIdFunction())))
	end else nil
	local v7 = if FFlagAddFriendsPageTrustedFriendRequestSection then function() --[[ Line: 398 ]]
		-- upvalues: RequestsModule (upval), GetLocalPlayerUserIdFunction (upval), DataCacheModule3 (copy), DataCacheModule4 (copy)
		return RequestsModule.PostUserIgnoreAllTrustedFriendRequests():andThen(function() --[[ Line: 399 ]]
			-- upvalues: GetLocalPlayerUserIdFunction (upval), DataCacheModule3 (upval), DataCacheModule4 (upval)
			local Text = tostring(GetLocalPlayerUserIdFunction())
			DataCacheModule3.replaceItem(Text, { nextPageCursor = nil, hasMore = false, senderIds = {} })
			DataCacheModule4.replaceItem(Text, 0)
		end)
	end else nil
	
	local function v40(p1, p2) --[[ Line: 427 ]]
		-- upvalues: RequestsModule (upval)
		return RequestsModule.PostUserValidateTrustedFriendLink(p1, p2)
	end
	
	local function v41(p1, p2) --[[ Line: 431 ]]
		-- upvalues: RequestsModule (upval)
		return RequestsModule.PostUserAddTrustedFriendFromLink(p1, p2)
	end
	
	return {
		getStatus = function(p1) --[[ Line: 295 ]]
			-- upvalues: DataResolverModule2 (copy)
			return DataResolverModule2.getAndFetchItem(p1)
		end,
		getIsTrustedConnection = function(p1) --[[ Line: 299 ]]
			-- upvalues: DataResolverModule1 (copy)
			return DataResolverModule1.getAndFetchItem(p1)
		end,
		getUserTrustedConnections = if FFlagConnectionManagementChips then v1 else nil,
		getTrustedFriendRequests = if FFlagAddFriendsPageTrustedFriendRequestSection then v2 else nil,
		getTrustedFriendRequestsCount = if FFlagAddFriendsPageTrustedFriendRequestSection then v3 else nil,
		loadMoreTrustedFriendRequests = if FFlagAddFriendsPageTrustedFriendRequestSection then v4 else nil,
		refetchTrustedFriendRequests = if FFlagAddFriendsPageTrustedFriendRequestSection then v5 else nil,
		refetchTrustedFriendRequestsCount = if FFlagAddFriendsPageTrustedFriendRequestSection then v6 else nil,
		sendTrustedConnectionRequest = function(p1, p2) --[[ Line: 351 ]]
			-- upvalues: RequestsModule (upval), FFlagProfileTFCardUseQrScanContext (upval), PromiseModule (upval), DataCacheModule (copy), TrustedConnectionStatusModule (upval)
			return RequestsModule.PostUserSendTrustedConnectionRequest(p1, p2):andThen(function(Result) --[[ Line: 352 ]]
				-- upvalues: FFlagProfileTFCardUseQrScanContext (upval), PromiseModule (upval), DataCacheModule (upval), p1 (copy), TrustedConnectionStatusModule (upval)
				if FFlagProfileTFCardUseQrScanContext and Result and Result.responseBody and Result.responseBody.success == false then
					return PromiseModule.reject("Trusted connection request was not sent")
				else
					DataCacheModule.updateItems({ [p1] = TrustedConnectionStatusModule.RequestSent })
					
					return nil
				end
			end)
		end,
		acceptTrustedConnectionRequest = function(p1) --[[ Line: 369 ]]
			-- upvalues: RequestsModule (upval), DataCacheModule (copy), TrustedConnectionStatusModule (upval), DataCacheModule1 (copy), FFlagAddFriendsPageTrustedFriendRequestSection (upval), Callback1 (copy)
			return RequestsModule.PostUserAcceptTrustedConnectionRequest(p1):andThen(function() --[[ Line: 370 ]]
				-- upvalues: DataCacheModule (upval), p1 (copy), TrustedConnectionStatusModule (upval), DataCacheModule1 (upval), FFlagAddFriendsPageTrustedFriendRequestSection (upval), Callback1 (upval)
				DataCacheModule.updateItems({ [p1] = TrustedConnectionStatusModule.TrustedFriends })
				DataCacheModule1.updateItems({ [p1] = true })
				
				if FFlagAddFriendsPageTrustedFriendRequestSection then
					Callback1(p1)
				end
			end)
		end,
		ignoreTrustedConnectionRequest = function(p1) --[[ Line: 385 ]]
			-- upvalues: RequestsModule (upval), DataCacheModule (copy), TrustedConnectionStatusModule (upval), FFlagAddFriendsPageTrustedFriendRequestSection (upval), Callback1 (copy)
			return RequestsModule.PostUserIgnoreTrustedConnectionRequest(p1):andThen(function() --[[ Line: 386 ]]
				-- upvalues: DataCacheModule (upval), p1 (copy), TrustedConnectionStatusModule (upval), FFlagAddFriendsPageTrustedFriendRequestSection (upval), Callback1 (upval)
				DataCacheModule.updateItems({ [p1] = TrustedConnectionStatusModule.RequestIgnored })
				
				if FFlagAddFriendsPageTrustedFriendRequestSection then
					Callback1(p1)
				end
			end)
		end,
		ignoreAllTrustedFriendRequests = if FFlagAddFriendsPageTrustedFriendRequestSection then v7 else nil,
		removeTrustedConnectionRequest = function(p1) --[[ Line: 411 ]]
			-- upvalues: RequestsModule (upval), DataCacheModule (copy), TrustedConnectionStatusModule (upval), DataCacheModule1 (copy)
			return RequestsModule.PostUserRemoveTrustedConnection(p1):andThen(function() --[[ Line: 412 ]]
				-- upvalues: DataCacheModule (upval), p1 (copy), TrustedConnectionStatusModule (upval), DataCacheModule1 (upval)
				DataCacheModule.updateItems({ [p1] = TrustedConnectionStatusModule.RequestReceived })
				DataCacheModule1.updateItems({ [p1] = false })
			end)
		end,
		createTrustedFriendLink = function(p1) --[[ Line: 423 ]]
			-- upvalues: RequestsModule (upval)
			return RequestsModule.PostUserCreateTrustedFriendLink(p1)
		end,
		validateTrustedFriendLink = if FFlagTCShareLinkReceiverUI then v40 else nil,
		addTrustedFriendFromLink = if FFlagTCShareLinkReceiverUI then v41 else nil,
		clear = function() --[[ Line: 435 ]]
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
		dispose = function() --[[ Line: 454 ]]
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