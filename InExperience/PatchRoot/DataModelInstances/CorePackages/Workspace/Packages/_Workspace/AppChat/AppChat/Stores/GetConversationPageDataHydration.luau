local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dataHydrationModule = require(parent.DataHydration)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local name = require(appChat.Logger):new(script.Name)
local ingestConversationListPageModule = require(appChat.Stores.Ingestion.ingestConversationListPage)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)
local createDataCache = dataHydrationModule.createDataCache
local createDataResolver = dataHydrationModule.createDataResolver

local function _(p1)
	return if p1 == nil or p1 == "" then "__initial__" else p1
end

local _ = function(p1)
	return if p1 == "__initial__" then nil else p1
end

local _ = function(p1)
	return if p1 ~= nil then p1 == "" else true
end

return (function()
	-- upvalues: createDataCache (ref), getConversationStoreModule (ref), createDataResolver (ref), name (ref), ingestConversationListPageModule (ref), appChatNetworkingModule (ref)
	local var1 = getConversationStoreModule(false)
	local var2 = createDataResolver({
		supportsMultiGet = false,
		queueProcessDelaySec = 0,
		replaceItems = true,
		cache = createDataCache(60),
		logError = function(p1)
			-- upvalues: name (copy), ingestConversationListPageModule (copy), var1 (ref)
			name:warning(`Failed to fetch AppChat conversation list page: {tostring(p1)}`)
			ingestConversationListPageModule.ingestFailure(var1, p1)
		end,
		fetchFn = function(p1)
			-- upvalues: appChatNetworkingModule (copy), ingestConversationListPageModule (copy), var1 (ref)
			local var3 = if p1 == "__initial__" then nil else p1
			
			return appChatNetworkingModule.http.GetUserConversations(nil, var3):andThen(function(p2)
				-- upvalues: ingestConversationListPageModule (copy), var1 (copy), var3 (ref)
				local var4 = ingestConversationListPageModule.ingestSuccess(var1, var3, p2)
				
				return {
					cursor = var3,
					nextCursor = var4.nextCursor,
					conversationCount = var4.conversationCount
				}
			end)
		end
	})
	
	local function fetchPage(p1)
		-- upvalues: var1 (ref), var2 (ref), ingestConversationListPageModule (copy)
		local var3 = if p1 == nil or p1 == "" then "__initial__" else p1
		local listStatus = var1.getListStatus(false)
		
		if listStatus.isFetchingConversations == true then
			return var2.getCachedItem(var3)
		elseif (if p1 ~= nil then p1 == "" else true) or listStatus.isExhausted ~= true then
			ingestConversationListPageModule.beginFetch(var1, p1)
			
			return var2.fetchItem(var3)
		end
		return var2.getCachedItem(var3)
	end
	
	var1.addClearListener(function()
		-- upvalues: var2 (ref)
		var2.clear()
	end)
	
	return {
		fetchPage = fetchPage,
		clear = function()
			-- upvalues: var2 (ref)
			var2.clear()
		end
	}
end)()