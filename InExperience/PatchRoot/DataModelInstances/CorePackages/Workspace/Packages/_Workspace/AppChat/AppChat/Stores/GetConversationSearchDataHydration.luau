local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dataHydrationModule = require(parent.DataHydration)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local name = require(appChat.Logger):new(script.Name)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local ingestConversationListPageModule = require(appChat.Stores.Ingestion.ingestConversationListPage)
local getResponseBodyModule = require(appChat.Stores.Ingestion.getResponseBody)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)
local searchIntroducedConversationIdsModule = require(appChat.Stores.searchIntroducedConversationIds)
local createDataCache = dataHydrationModule.createDataCache
local createDataResolver = dataHydrationModule.createDataResolver

local function _(p1)
	return if p1 ~= nil then p1 == "" else true
end

local _ = function(p1, p2)
	return `{p1}\0{if p2 == nil or p2 == "" then "__initial__" else p2}`
end

local _ = function(p3, p4)
	-- upvalues: conversationChannelsModule (ref)
	return p4.source == conversationChannelsModule.Source.Channels and p4.type == conversationChannelsModule.Type.OneToOne and p4.participant_user_ids ~= nil and p3.getConversation(conversationChannelsModule.getFriendConversationId(p4.participant_user_ids), false) ~= nil
end

local function collectSearchOnlyIds(p3, p4)
	-- upvalues: conversationChannelsModule (ref), searchIntroducedConversationIdsModule (ref)
	local t = {}
	
	if p4 == nil or p4.conversations == nil then
		return t
	end
	for i, v in p4.conversations do
		if v ~= nil and v.status ~= "failed" then
			local conversationId = conversationChannelsModule.getConversationId(v)
			
			if not (v.source == conversationChannelsModule.Source.Channels and v.type == conversationChannelsModule.Type.OneToOne and v.participant_user_ids ~= nil and p3.getConversation(conversationChannelsModule.getFriendConversationId(v.participant_user_ids), false) ~= nil) and (p3.getConversation(conversationId, false) == nil or searchIntroducedConversationIdsModule.has(conversationId)) then
				table.insert(t, conversationId)
			end
		end
	end
	return t
end

local function getOrderedMatchedIds(p5)
	-- upvalues: conversationChannelsModule (ref)
	local t = {}
	
	if p5 == nil or p5.conversations == nil then
		return t
	end
	local t_1 = {}
	
	for i, v in p5.conversations do
		if v ~= nil and v.status ~= "failed" then
			local conversationId = conversationChannelsModule.getConversationId(v)
			
			if not t_1[conversationId] then
				t_1[conversationId] = true
				table.insert(t, conversationId)
			end
		end
	end
	return t
end

return signalsModule.createComputed(function()
	-- upvalues: createDataCache (ref), getConversationStoreModule (ref), createDataResolver (ref), name (ref), appChatNetworkingModule (ref), getResponseBodyModule (ref), collectSearchOnlyIds (ref), signalsExperimentalModule (ref), ingestConversationListPageModule (ref), searchIntroducedConversationIdsModule (ref), getOrderedMatchedIds (ref)
	local var1 = createDataCache(30)
	local var2 = getConversationStoreModule(false)
	local t = {}
	local var3 = 0
	local var4 = createDataResolver({
		supportsMultiGet = false,
		queueProcessDelaySec = 0,
		replaceItems = true,
		cache = var1,
		logError = function(p6)
			-- upvalues: name (copy)
			name:warning(`Failed to fetch AppChat conversation search page: {tostring(p6)}`)
		end,
		fetchFn = function(p6)
			-- upvalues: t (write), var3 (write), appChatNetworkingModule (copy), getResponseBodyModule (copy), collectSearchOnlyIds (copy), var2 (ref), signalsExperimentalModule (copy), ingestConversationListPageModule (copy), searchIntroducedConversationIdsModule (copy), getOrderedMatchedIds (copy)
			local var5 = t[p6]
			
			return appChatNetworkingModule.http.SearchConversations(nil, if var5 ~= nil then "" else var5.query, if var5 ~= nil then nil else var5.cursor):andThen(function(p7)
				-- upvalues: var3 (ref), var3 (copy), getResponseBodyModule (copy), collectSearchOnlyIds (copy), var2 (copy), signalsExperimentalModule (copy), ingestConversationListPageModule (copy), searchIntroducedConversationIdsModule (copy), getOrderedMatchedIds (copy)
				if var3 ~= var3 then
					return { nextCursor = nil, matchedConversationIds = {} }
				end
				local var6 = getResponseBodyModule(p7)
				local var7 = collectSearchOnlyIds(var2, var6)
				signalsExperimentalModule.batch(function()
					-- upvalues: ingestConversationListPageModule (copy), var2 (copy), var6 (ref), var7 (ref), searchIntroducedConversationIdsModule (copy)
					ingestConversationListPageModule.ingestConversationResponses(var2, var6)
					
					for i, v in var7 do
						searchIntroducedConversationIdsModule.add(v)
					end
				end)
				local var8 = if var6 ~= nil then nil else var6.next_cursor
				
				return {
					matchedConversationIds = getOrderedMatchedIds(var6),
					nextCursor = if var8 == nil or var8 == "" then nil else var8
				}
			end)
		end
	})
	
	local function fetchPage(p7, p8)
		-- upvalues: t (write), var4 (ref)
		if if p7 ~= nil then p7 == "" else true then
			return nil
		end
		local var6 = `{p7}\0{if p8 == nil or p8 == "" then "__initial__" else p8}`
		t[var6] = { query = p7, cursor = p8 }
		
		return var4.getAndFetchItem(var6)
	end
	
	var2.addClearListener(function()
		-- upvalues: var3 (write), t (write), searchIntroducedConversationIdsModule (copy), var4 (ref)
		var3 += 1
		t = {}
		searchIntroducedConversationIdsModule.clear()
		var4.clear()
	end)
	
	return { fetchPage = fetchPage }
end)