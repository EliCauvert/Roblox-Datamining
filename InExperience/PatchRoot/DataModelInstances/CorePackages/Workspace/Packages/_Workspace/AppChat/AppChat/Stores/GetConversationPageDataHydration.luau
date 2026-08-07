local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dataHydrationModule = require(parent.DataHydration)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local name = require(appChat.Logger):new(script.Name)
local ingestConversationListPageModule = require(appChat.Stores.Ingestion.ingestConversationListPage)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)
local createDataCache = dataHydrationModule.createDataCache
local createDataResolver = dataHydrationModule.createDataResolver

local function _(p0) --[[ line: 28 | named "getPageId" ]]
	return if p0 == nil or p0 == "" then "__initial__" else p0
end

local _ = function(p1) --[[ line: 32 | named "getCursorFromPageId" ]]
	return if p1 == "__initial__" then nil else p1
end

local _ = function(p2) --[[ line: 36 | named "isInitialCursor" ]]
	return if p2 ~= nil then p2 == "" else true
end

return (function() --[[ line: 40 | named "createConversationPageDataHydrationStore" ]]
	-- upvalues: createDataCache (ref), getConversationStoreModule (ref), createDataResolver (ref), name (ref), ingestConversationListPageModule (ref), appChatNetworkingModule (ref)
	local var6 = getConversationStoreModule(false)
	local var7 = createDataResolver({
		supportsMultiGet = false,
		queueProcessDelaySec = 0,
		replaceItems = true,
		cache = createDataCache(60),
		logError = function(p3) --[[ line: 48 ]]
			-- upvalues: name (copy), ingestConversationListPageModule (copy), var6 (ref)
			name:warning(`Failed to fetch AppChat conversation list page: {tostring(p3)}`)
			ingestConversationListPageModule.ingestFailure(var6, p3)
		end,
		fetchFn = function(p4) --[[ line: 52 ]]
			-- upvalues: appChatNetworkingModule (copy), ingestConversationListPageModule (copy), var6 (ref)
			local var9 = if p4 == "__initial__" then nil else p4
			
			return appChatNetworkingModule.http.GetUserConversations(nil, var9):andThen(function(p5) --[[ line: 55 ]]
				-- upvalues: ingestConversationListPageModule (copy), var6 (copy), var9 (ref)
				local var10 = ingestConversationListPageModule.ingestSuccess(var6, var9, p5)
				
				return {
					cursor = var9,
					nextCursor = var10.nextCursor,
					conversationCount = var10.conversationCount
				}
			end)
		end
	})
	
	local function fetchPage(p6) --[[ line: 67 ]]
		-- upvalues: var6 (ref), var7 (ref), ingestConversationListPageModule (copy)
		local var11 = if p6 == nil or p6 == "" then "__initial__" else p6
		local listStatus = var6.getListStatus(false)
		
		if listStatus.isFetchingConversations == true then
			return var7.getCachedItem(var11)
		elseif (if p6 ~= nil then p6 == "" else true) or listStatus.isExhausted ~= true then
			ingestConversationListPageModule.beginFetch(var6, p6)
			
			return var7.fetchItem(var11)
		end
		return var7.getCachedItem(var11)
	end
	
	var6.addClearListener(function() --[[ line: 83 ]]
		-- upvalues: var7 (ref)
		var7.clear()
	end)
	
	return {
		fetchPage = fetchPage,
		clear = function() --[[ line: 89 ]]
			-- upvalues: var7 (ref)
			var7.clear()
		end
	}
end)()