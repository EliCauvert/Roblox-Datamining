local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local DataHydrationModule = require(Parent.DataHydration)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local NewResult = require(AppChat.Logger):new(script.Name)
local IngestConversationListPageModule = require(AppChat.Stores.Ingestion.ingestConversationListPage)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local CreateDataCacheFunction = DataHydrationModule.createDataCache
local CreateDataResolverFunction = DataHydrationModule.createDataResolver

local function _(p1)
	return if p1 == nil or p1 == "" then "__initial__" else p1
end

local _ = function(p1)
	return if p1 == "__initial__" then nil else p1
end

local _ = function(p1): boolean
	return p1 == nil or p1 == ""
end

return ((function()
	-- upvalues: CreateDataCacheFunction (copy), GetConversationStoreModule (copy), CreateDataResolverFunction (copy), NewResult (copy), IngestConversationListPageModule (copy), AppChatNetworkingModule (copy)
	local DataCache = CreateDataCacheFunction(60)
	local ConversationStoreModule = GetConversationStoreModule(false)
	local DataResolver = CreateDataResolverFunction({
		supportsMultiGet = false,
		queueProcessDelaySec = 0,
		replaceItems = true,
		cache = DataCache,
		logError = function(p1)
			-- upvalues: NewResult (upval), IngestConversationListPageModule (upval), ConversationStoreModule (copy)
			NewResult:warning(`Failed to fetch AppChat conversation list page: {tostring(p1)}`)
			IngestConversationListPageModule.ingestFailure(ConversationStoreModule, p1)
		end,
		fetchFn = function(p1)
			-- upvalues: AppChatNetworkingModule (upval), IngestConversationListPageModule (upval), ConversationStoreModule (copy)
			local Cursor = if p1 == "__initial__" then nil else p1
			
			return AppChatNetworkingModule.http.GetUserConversations(nil, Cursor):andThen(function(Result)
				-- upvalues: IngestConversationListPageModule (upval), ConversationStoreModule (upval), Cursor (copy)
				local IngestSuccessResult = IngestConversationListPageModule.ingestSuccess(ConversationStoreModule, Cursor, Result)
				
				return {
					cursor = Cursor,
					nextCursor = IngestSuccessResult.nextCursor,
					conversationCount = IngestSuccessResult.conversationCount
				}
			end)
		end
	})
	
	local function fetchPage(p1)
		-- upvalues: ConversationStoreModule (copy), DataResolver (copy), IngestConversationListPageModule (upval)
		local Initial = if p1 == nil or p1 == "" then "__initial__" else p1
		local ListStatus = ConversationStoreModule.getListStatus(false)
		
		if ListStatus.isFetchingConversations == true then
			return DataResolver.getCachedItem(Initial)
		elseif p1 == nil or p1 == "" or ListStatus.isExhausted ~= true then
			IngestConversationListPageModule.beginFetch(ConversationStoreModule, p1)
			
			return DataResolver.fetchItem(Initial)
		else
			return DataResolver.getCachedItem(Initial)
		end
	end
	
	ConversationStoreModule.addClearListener(function()
		-- upvalues: DataResolver (copy)
		DataResolver.clear()
	end)
	
	return {
		fetchPage = fetchPage,
		clear = function()
			-- upvalues: DataResolver (copy)
			DataResolver.clear()
		end
	}
end)())