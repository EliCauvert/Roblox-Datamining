local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local DataHydrationModule = require(Parent.DataHydration)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local SignalsModule = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local NewResult = require(AppChat.Logger):new(script.Name)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local IngestConversationListPageModule = require(AppChat.Stores.Ingestion.ingestConversationListPage)
local GetResponseBodyModule = require(AppChat.Stores.Ingestion.getResponseBody)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local SearchIntroducedConversationIdsModule = require(AppChat.Stores.searchIntroducedConversationIds)
local CreateDataCacheFunction = DataHydrationModule.createDataCache
local CreateDataResolverFunction = DataHydrationModule.createDataResolver

local function _(p1): boolean
	return p1 == nil or p1 == ""
end

local _ = function(p1, p2): string
	return `{p1}\0{if p2 == nil or p2 == "" then "__initial__" else p2}`
end

local _ = function(p3, p4): boolean
	-- upvalues: ConversationChannelsModule (copy)
	return p4.source == ConversationChannelsModule.Source.Channels and p4.type == ConversationChannelsModule.Type.OneToOne and p4.participant_user_ids ~= nil and p3.getConversation(ConversationChannelsModule.getFriendConversationId(p4.participant_user_ids), false) ~= nil
end

local function collectSearchOnlyIds(p3, p4)
	-- upvalues: ConversationChannelsModule (copy), SearchIntroducedConversationIdsModule (copy)
	local ConversationIds = {}
	
	if p4 == nil or p4.conversations == nil then
		return ConversationIds
	end
	for _, conversation in p4.conversations do
		local HasConversation: boolean = conversation == nil or conversation.status == "failed"
		local ConversationId = nil
		
		if not HasConversation then
			ConversationId = ConversationChannelsModule.getConversationId(conversation)
			HasConversation = conversation.source == ConversationChannelsModule.Source.Channels and conversation.type == ConversationChannelsModule.Type.OneToOne and conversation.participant_user_ids ~= nil and p3.getConversation(ConversationChannelsModule.getFriendConversationId(conversation.participant_user_ids), false) ~= nil or p3.getConversation(ConversationId, false) ~= nil and not SearchIntroducedConversationIdsModule.has(ConversationId)
		end
		if not HasConversation then
			table.insert(ConversationIds, ConversationId)
		end
	end
	return ConversationIds
end

local function getOrderedMatchedIds(p5)
	-- upvalues: ConversationChannelsModule (copy)
	local ConversationIds = {}
	
	if p5 == nil or p5.conversations == nil then
		return ConversationIds
	end
	local t = {}
	
	for _, conversation in p5.conversations do
		local v1 = conversation == nil or conversation.status == "failed"
		local ConversationId = nil
		
		if not v1 then
			ConversationId = ConversationChannelsModule.getConversationId(conversation)
			v1 = t[ConversationId]
		end
		if not v1 then
			t[ConversationId] = true
			table.insert(ConversationIds, ConversationId)
		end
	end
	return ConversationIds
end

return SignalsModule.createComputed(function()
	-- upvalues: CreateDataCacheFunction (copy), GetConversationStoreModule (copy), SignalsModule (copy), CreateDataResolverFunction (copy), NewResult (copy), AppChatNetworkingModule (copy), GetResponseBodyModule (copy), collectSearchOnlyIds (copy), SignalsExperimentalModule (copy), IngestConversationListPageModule (copy), SearchIntroducedConversationIdsModule (copy), getOrderedMatchedIds (copy)
	local DataCache = CreateDataCacheFunction(30)
	local ConversationStoreModule = GetConversationStoreModule(false)
	local t = {}
	local Count = 0
	local Signal, Signal2 = SignalsModule.createSignal(0)
	local t1 = {}
	local Callback = nil
	local DataResolver = CreateDataResolverFunction({
		supportsMultiGet = false,
		queueProcessDelaySec = 0,
		replaceItems = true,
		cache = DataCache,
		logError = function(p6)
			-- upvalues: NewResult (upval)
			NewResult:warning(`Failed to fetch AppChat conversation search page: {tostring(p6)}`)
		end,
		fetchFn = function(Key)
			-- upvalues: t (ref), Count (ref), t1 (ref), Signal (copy), AppChatNetworkingModule (upval), GetResponseBodyModule (upval), collectSearchOnlyIds (upval), ConversationStoreModule (copy), SignalsExperimentalModule (upval), IngestConversationListPageModule (upval), SearchIntroducedConversationIdsModule (upval), getOrderedMatchedIds (upval), Callback (ref)
			local Entry = t[Key]
			local Query = if Entry == nil then "" else Entry.query
			local Cursor = if Entry == nil then nil else Entry.cursor
			local Count1 = Count
			t1[Key] = Signal(false)
			
			return AppChatNetworkingModule.http.SearchConversations(nil, Query, Cursor):andThen(function(Result)
				-- upvalues: Count1 (copy), Count (upval), GetResponseBodyModule (upval), collectSearchOnlyIds (upval), ConversationStoreModule (upval), SignalsExperimentalModule (upval), IngestConversationListPageModule (upval), SearchIntroducedConversationIdsModule (upval), getOrderedMatchedIds (upval), t1 (upval), Key (copy), Signal (upval), Callback (upval), Query (copy), Cursor (copy)
				if Count1 ~= Count then
					return { nextCursor = nil, matchedConversationIds = {} }
				end
				local ResponseBodyModule = GetResponseBodyModule(Result)
				local CollectSearchOnlyIdsResult = collectSearchOnlyIds(ConversationStoreModule, ResponseBodyModule)
				SignalsExperimentalModule.batch(function()
					-- upvalues: IngestConversationListPageModule (upval), ConversationStoreModule (upval), ResponseBodyModule (copy), CollectSearchOnlyIdsResult (copy), SearchIntroducedConversationIdsModule (upval)
					IngestConversationListPageModule.ingestConversationResponses(ConversationStoreModule, ResponseBodyModule)
					
					for _, value in CollectSearchOnlyIdsResult do
						SearchIntroducedConversationIdsModule.add(value)
					end
				end)
				local OrderedMatchedIds = getOrderedMatchedIds(ResponseBodyModule)
				local NextCursor = if ResponseBodyModule == nil then nil else ResponseBodyModule.next_cursor
				
				if t1[Key] ~= Signal(false) then
					task.defer(function()
						-- upvalues: Count1 (upval), Count (upval), Callback (upval), Query (upval), Cursor (upval)
						if Count1 == Count then
							Callback(Query, Cursor)
						end
					end)
				end
				return {
					matchedConversationIds = OrderedMatchedIds,
					nextCursor = if NextCursor == nil or NextCursor == "" then nil else NextCursor
				}
			end)
		end
	})
	
	Callback = function(Query, Cursor)
		-- upvalues: t (ref), DataResolver (copy), t1 (ref), Signal (copy)
		if Query == nil or Query == "" then
			return nil
		else
			local Text: string = `{Query}\0{if Cursor == nil or Cursor == "" then "__initial__" else Cursor}`
			t[Text] = { query = Query, cursor = Cursor }
			
			return DataResolver.getAndFetchItem(Text, function(): boolean
				-- upvalues: t1 (upval), Text (copy), Signal (upval)
				return t1[Text] ~= Signal(false)
			end)
		end
	end
	
	local function invalidate()
		-- upvalues: Signal2 (copy), Signal (copy)
		Signal2(Signal(false) + 1)
	end
	
	ConversationStoreModule.addClearListener(function()
		-- upvalues: Count (ref), t (ref), t1 (ref), SearchIntroducedConversationIdsModule (upval), DataResolver (copy)
		Count += 1
		t = {}
		t1 = {}
		SearchIntroducedConversationIdsModule.clear()
		DataResolver.clear()
	end)
	
	return {
		fetchPage = Callback,
		getInvalidationGeneration = Signal,
		invalidate = invalidate
	}
end)