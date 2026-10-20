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
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local FFlagTCShareLinkReceiverUI = require(Parent.SharedFlags).FFlagTCShareLinkReceiverUI
local FFlagConnectionManagementChips = require(Parent.SharedFlags).FFlagConnectionManagementChips
local TrustedConnectionsStoreDataTtlSec = game:DefineFastInt("TrustedConnectionsStoreDataTtlSec", 0)
game:DefineFastInt("TrustedConnectionsStoreProcessDelaySec", 1)

local function _()
	return game:GetFastInt("TrustedConnectionsStoreProcessDelaySec")
end

return function()
	-- upvalues: TrustedConnectionsStoreDataTtlSec (copy), CreateDataCacheModule (copy), FFlagConnectionManagementChips (copy), CreateDataResolverModule (copy), RequestsModule (copy), CryoModule (copy), CreateTrustedConnectionEventListenerModule (copy), TrustedConnectionStatusModule (copy), GetLocalPlayerUserIdFunction (copy), PromiseModule (copy), FFlagTCShareLinkReceiverUI (copy)
	local TrustedConnectionsStoreDataTtlSec1 = if TrustedConnectionsStoreDataTtlSec > 0 then TrustedConnectionsStoreDataTtlSec else 1e999
	local DataCacheModule = CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1)
	local DataCacheModule1 = CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1)
	local DataCacheModule2 = if FFlagConnectionManagementChips then CreateDataCacheModule(TrustedConnectionsStoreDataTtlSec1) else nil
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
		-- upvalues: DataCacheModule (copy), DataCacheModule1 (copy), TrustedConnectionStatusModule (upval), FFlagConnectionManagementChips (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy)
		DataCacheModule.updateItems({ [p1] = TrustedFriends })
		DataCacheModule1.updateItems({
			[p1] = TrustedFriends == TrustedConnectionStatusModule.TrustedFriends
		})
		
		if FFlagConnectionManagementChips then
			local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
			
			if LocalPlayerUserId then
				DataResolverModule.fetchItem((tostring(LocalPlayerUserId)))
			end
		end
	end)
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
	local v1 = if FFlagConnectionManagementChips then function()
		-- upvalues: GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy)
		return DataResolverModule.getAndFetchItem((tostring((GetLocalPlayerUserIdFunction()))))
	end else nil
	
	local function v23(p1, p2)
		-- upvalues: RequestsModule (upval)
		return RequestsModule.PostUserValidateTrustedFriendLink(p1, p2)
	end
	
	local function v24(p1, p2)
		-- upvalues: RequestsModule (upval)
		return RequestsModule.PostUserAddTrustedFriendFromLink(p1, p2)
	end
	
	return {
		getStatus = function(p1)
			-- upvalues: DataResolverModule2 (copy)
			return DataResolverModule2.getAndFetchItem(p1)
		end,
		getIsTrustedConnection = function(p1)
			-- upvalues: DataResolverModule1 (copy)
			return DataResolverModule1.getAndFetchItem(p1)
		end,
		getUserTrustedConnections = if FFlagConnectionManagementChips then v1 else nil,
		sendTrustedConnectionRequest = function(p1, p2)
			-- upvalues: RequestsModule (upval), DataCacheModule (copy), TrustedConnectionStatusModule (upval)
			return RequestsModule.PostUserSendTrustedConnectionRequest(p1, p2):andThen(function()
				-- upvalues: DataCacheModule (upval), p1 (copy), TrustedConnectionStatusModule (upval)
				DataCacheModule.updateItems({ [p1] = TrustedConnectionStatusModule.RequestSent })
			end)
		end,
		acceptTrustedConnectionRequest = function(p1)
			-- upvalues: RequestsModule (upval), DataCacheModule (copy), TrustedConnectionStatusModule (upval), DataCacheModule1 (copy)
			return RequestsModule.PostUserAcceptTrustedConnectionRequest(p1):andThen(function()
				-- upvalues: DataCacheModule (upval), p1 (copy), TrustedConnectionStatusModule (upval), DataCacheModule1 (upval)
				DataCacheModule.updateItems({ [p1] = TrustedConnectionStatusModule.TrustedFriends })
				DataCacheModule1.updateItems({ [p1] = true })
			end)
		end,
		ignoreTrustedConnectionRequest = function(p1)
			-- upvalues: RequestsModule (upval), DataCacheModule (copy), TrustedConnectionStatusModule (upval)
			return RequestsModule.PostUserIgnoreTrustedConnectionRequest(p1):andThen(function()
				-- upvalues: DataCacheModule (upval), p1 (copy), TrustedConnectionStatusModule (upval)
				DataCacheModule.updateItems({ [p1] = TrustedConnectionStatusModule.RequestIgnored })
			end)
		end,
		removeTrustedConnectionRequest = function(p1)
			-- upvalues: RequestsModule (upval), DataCacheModule (copy), TrustedConnectionStatusModule (upval), DataCacheModule1 (copy)
			return RequestsModule.PostUserRemoveTrustedConnection(p1):andThen(function()
				-- upvalues: DataCacheModule (upval), p1 (copy), TrustedConnectionStatusModule (upval), DataCacheModule1 (upval)
				DataCacheModule.updateItems({ [p1] = TrustedConnectionStatusModule.RequestReceived })
				DataCacheModule1.updateItems({ [p1] = false })
			end)
		end,
		createTrustedFriendLink = function(p1)
			-- upvalues: RequestsModule (upval)
			return RequestsModule.PostUserCreateTrustedFriendLink(p1)
		end,
		validateTrustedFriendLink = if FFlagTCShareLinkReceiverUI then v23 else nil,
		addTrustedFriendFromLink = if FFlagTCShareLinkReceiverUI then v24 else nil,
		clear = function()
			-- upvalues: DataCacheModule (copy), DataCacheModule1 (copy), DataResolverModule1 (copy), DataResolverModule2 (copy), FFlagConnectionManagementChips (upval), DataCacheModule2 (copy), DataResolverModule (copy)
			DataCacheModule.clear()
			DataCacheModule1.clear()
			DataResolverModule1.clear()
			DataResolverModule2.clear()
			
			if FFlagConnectionManagementChips then
				DataCacheModule2.clear()
				DataResolverModule.clear()
			end
		end,
		dispose = function()
			-- upvalues: DataCacheModule (copy), DataCacheModule1 (copy), DataResolverModule1 (copy), DataResolverModule2 (copy), TrustedConnectionEventListenerModule (copy), FFlagConnectionManagementChips (upval), DataCacheModule2 (copy), DataResolverModule (copy)
			DataCacheModule.dispose()
			DataCacheModule1.dispose()
			DataResolverModule1.dispose()
			DataResolverModule2.dispose()
			TrustedConnectionEventListenerModule()
			
			if FFlagConnectionManagementChips then
				DataCacheModule2.dispose()
				DataResolverModule.dispose()
			end
		end
	}
end