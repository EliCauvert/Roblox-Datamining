local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local _ = require(Parent.Signals)
local RequestsModule = require(script.Parent.Requests)
local _ = require(script.Parent.FriendsRequestsStoreTypes)

local function _(p1)
	-- upvalues: LocalUserIdStore (copy), GetLocalPlayerUserIdFunction (copy)
	local CurrentUserId = LocalUserIdStore.getCurrentUserId(p1)
	
	if CurrentUserId == "" then
		local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
		
		return if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
	else
		return CurrentUserId
	end
end

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), RequestsModule (copy), LocalUserIdStore (copy), GetLocalPlayerUserIdFunction (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule,
		fetchFn = function(_)
			-- upvalues: RequestsModule (upval)
			return RequestsModule.GetNewFriendRequestsCount():andThen(function(Result)
				return if Result and Result.count then Result.count else 0
			end)
		end
	})
	
	return {
		getUnseenRequestCount = function(p1)
			-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy)
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			return if p1 and p1.skipFetch then DataResolverModule.getCachedItem(CurrentUserId1) else DataResolverModule.getAndFetchItem(CurrentUserId1)
		end,
		refetchUnseenRequestCount = function()
			-- upvalues: DataResolverModule (copy), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval)
			local FetchItemFunction: (any) -> () = DataResolverModule.fetchItem
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
		clearUnseenRequest = function()
			-- upvalues: RequestsModule (upval), DataCacheModule (copy), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval)
			return RequestsModule.ClearNewFriendRequests():andThen(function()
				-- upvalues: DataCacheModule (upval), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval)
				local ReplaceItemFunction: (any, any) -> () = DataCacheModule.replaceItem
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
		clearUnseenRequestCount = function()
			-- upvalues: DataCacheModule (copy), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval)
			local ReplaceItemFunction: (any, any) -> () = DataCacheModule.replaceItem
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
		clear = function()
			-- upvalues: DataResolverModule (copy)
			DataResolverModule.clear()
		end,
		dispose = function()
			-- upvalues: DataResolverModule (copy)
			DataResolverModule.dispose()
		end
	}
end