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
	-- upvalues: createDataCache (ref), getConversationStoreModule (ref), signalsModule (ref), createDataResolver (ref), name (ref), appChatNetworkingModule (ref), getResponseBodyModule (ref), collectSearchOnlyIds (ref), signalsExperimentalModule (ref), ingestConversationListPageModule (ref), searchIntroducedConversationIdsModule (ref), getOrderedMatchedIds (ref)
	local var1 = createDataCache(30)
	local var2 = getConversationStoreModule(false)
	local t = {}
	local var3 = 0
	local var4, var5 = signalsModule.createSignal(0)
	local t_1 = {}
	local fetchPage = nil
	local var6 = createDataResolver({
		supportsMultiGet = false,
		queueProcessDelaySec = 0,
		replaceItems = true,
		cache = var1,
		logError = function(p6)
			-- upvalues: name (copy)
			name:warning(`Failed to fetch AppChat conversation search page: {tostring(p6)}`)
		end,
		fetchFn = function(p6)
			-- upvalues: t (write), var3 (write), t_1 (write), var4 (ref), appChatNetworkingModule (copy), getResponseBodyModule (copy), collectSearchOnlyIds (copy), var2 (ref), signalsExperimentalModule (copy), ingestConversationListPageModule (copy), searchIntroducedConversationIdsModule (copy), getOrderedMatchedIds (copy), fetchPage (write)
			local var7 = t[p6]
			local var8 = if var7 ~= nil then "" else var7.query
			local var9 = if var7 ~= nil then nil else var7.cursor
			t_1[p6] = var4(false)
			
			return appChatNetworkingModule.http.SearchConversations(nil, var8, var9):andThen(function(p7)
				-- upvalues: var3 (ref), var3 (copy), getResponseBodyModule (copy), collectSearchOnlyIds (copy), var2 (copy), signalsExperimentalModule (copy), ingestConversationListPageModule (copy), searchIntroducedConversationIdsModule (copy), getOrderedMatchedIds (copy), t_1 (copy), p6 (ref), var4 (copy), fetchPage (copy), var8 (ref), var9 (ref)
				if var3 ~= var3 then
					return { nextCursor = nil, matchedConversationIds = {} }
				end
				local var10 = getResponseBodyModule(p7)
				local var11 = collectSearchOnlyIds(var2, var10)
				signalsExperimentalModule.batch(function()
					-- upvalues: ingestConversationListPageModule (copy), var2 (copy), var10 (ref), var11 (ref), searchIntroducedConversationIdsModule (copy)
					ingestConversationListPageModule.ingestConversationResponses(var2, var10)
					
					for i, v in var11 do
						searchIntroducedConversationIdsModule.add(v)
					end
				end)
				local var12 = getOrderedMatchedIds(var10)
				local var13 = if var10 ~= nil then nil else var10.next_cursor
				
				if t_1[p6] ~= var4(false) then
					task.defer(function()
						-- upvalues: var3 (copy), var3 (copy), fetchPage (copy), var8 (copy), var9 (copy)
						if var3 == var3 then
							fetchPage(var8, var9)
						end
					end)
				end
				return {
					matchedConversationIds = var12,
					nextCursor = if var13 == nil or var13 == "" then nil else var13
				}
			end)
		end
	})
	
	fetchPage = function(p7, p8)
		-- upvalues: t (write), var6 (ref), t_1 (write), var4 (ref)
		if if p7 ~= nil then p7 == "" else true then
			return nil
		end
		local var10 = `{p7}\0{if p8 == nil or p8 == "" then "__initial__" else p8}`
		t[var10] = { query = p7, cursor = p8 }
		
		return var6.getAndFetchItem(var10, function()
			-- upvalues: t_1 (copy), var10 (ref), var4 (copy)
			return t_1[var10] ~= var4(false)
		end)
	end
	
	local function invalidate()
		-- upvalues: var5 (ref), var4 (ref)
		var5(var4(false) + 1)
	end
	
	var2.addClearListener(function()
		-- upvalues: var3 (write), t (write), t_1 (write), searchIntroducedConversationIdsModule (copy), var6 (ref)
		var3 += 1
		t = {}
		t_1 = {}
		searchIntroducedConversationIdsModule.clear()
		var6.clear()
	end)
	
	return {
		fetchPage = fetchPage,
		getInvalidationGeneration = var4,
		invalidate = invalidate
	}
end)