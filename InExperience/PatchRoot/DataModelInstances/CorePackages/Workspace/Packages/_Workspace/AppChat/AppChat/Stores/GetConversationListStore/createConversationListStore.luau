local AppChat = script:FindFirstAncestor("AppChat")
local SignalsModule = require(AppChat.Parent.Signals)
local _ = require(AppChat.Stores.GetConversationStore.createConversationStore)
local _ = require(AppChat.Stores.GetConversationViewModelStore.createConversationViewModelStore)
local GetConversationIdsModule = require(AppChat.Utils.getConversationIds)
local SearchIntroducedConversationIdsModule = require(AppChat.Stores.searchIntroducedConversationIds)
local FFlagAppChatAnyServerSideConversationSearchModule = require(AppChat.Flags.FFlagAppChatAnyServerSideConversationSearch)
local FFlagAppChatDerivedConversationLatestActivityModule = require(AppChat.Flags.FFlagAppChatDerivedConversationLatestActivity)

local function _(p1)
	local LastUpdated = p1.lastUpdated
	
	return if LastUpdated == nil then nil elseif typeof(LastUpdated) == "DateTime" then LastUpdated.UnixTimestamp elseif type(LastUpdated) == "table" and LastUpdated.GetUnixTimestamp ~= nil then LastUpdated:GetUnixTimestamp() else nil
end

local _ = function(p1, p2, p3, p4): boolean
	return if p3 == nil or p4 == nil then if p3 == nil and p4 == nil then string.lower(p1.title or "") < string.lower(p2.title or "") else p3 ~= nil else p4 < p3
end

local function compareByServerLastUpdated(A, B): boolean
	local LastUpdated = A.lastUpdated
	local UnixTimestamp = if LastUpdated == nil then nil elseif typeof(LastUpdated) == "DateTime" then LastUpdated.UnixTimestamp elseif type(LastUpdated) == "table" and LastUpdated.GetUnixTimestamp ~= nil then LastUpdated:GetUnixTimestamp() else nil
	local LastUpdated1 = B.lastUpdated
	local UnixTimestamp1 = if LastUpdated1 == nil then nil elseif typeof(LastUpdated1) == "DateTime" then LastUpdated1.UnixTimestamp elseif type(LastUpdated1) == "table" and LastUpdated1.GetUnixTimestamp ~= nil then LastUpdated1:GetUnixTimestamp() else nil
	
	return if UnixTimestamp == nil or UnixTimestamp1 == nil then if UnixTimestamp == nil and UnixTimestamp1 == nil then string.lower(A.title or "") < string.lower(B.title or "") else UnixTimestamp ~= nil else UnixTimestamp1 < UnixTimestamp
end

local function sortByLatestActivity(List, p1, p2)
	local t = {}
	
	for _, value in List do
		t[value.id] = p1.getUnixTime(value.id)(p2)
	end
	table.sort(List, function(A, B): boolean
		-- upvalues: t (copy)
		local Entry = t[A.id]
		local Entry1 = t[B.id]
		
		return if Entry == nil or Entry1 == nil then if Entry == nil and Entry1 == nil then string.lower(A.title or "") < string.lower(B.title or "") else Entry ~= nil else Entry1 < Entry
	end)
end

local function containsAllFrozenConversations(List, List1): boolean
	for _, value in List1 do
		if table.find(List, value) == nil then
			return false
		end
	end
	return true
end

local function excludeSearchIntroduced(Conversations)
	-- upvalues: SearchIntroducedConversationIdsModule (copy)
	local List = {}
	
	for _, conversation in Conversations do
		if not SearchIntroducedConversationIdsModule.has(conversation.id) then
			table.insert(List, conversation)
		end
	end
	return List
end

local _ = function(p3, p4, p5)
	-- upvalues: FFlagAppChatAnyServerSideConversationSearchModule (copy), excludeSearchIntroduced (copy), FFlagAppChatDerivedConversationLatestActivityModule (copy), sortByLatestActivity (copy), compareByServerLastUpdated (copy)
	local Conversations = p3.getConversations(p5)
	
	if FFlagAppChatAnyServerSideConversationSearchModule then
		Conversations = excludeSearchIntroduced(Conversations)
	end
	if FFlagAppChatDerivedConversationLatestActivityModule then
		sortByLatestActivity(Conversations, p4, p5)
		
		return Conversations
	else
		table.sort(Conversations, compareByServerLastUpdated)
		
		return Conversations
	end
end

return function(p3, p4)
	-- upvalues: SignalsModule (copy), FFlagAppChatAnyServerSideConversationSearchModule (copy), excludeSearchIntroduced (copy), FFlagAppChatDerivedConversationLatestActivityModule (copy), sortByLatestActivity (copy), compareByServerLastUpdated (copy), GetConversationIdsModule (copy), containsAllFrozenConversations (copy)
	local v1 = nil
	local Signal, Signal2 = SignalsModule.createSignal(false)
	p3.addClearListener(function()
		-- upvalues: v1 (ref), Signal2 (copy)
		v1 = nil
		Signal2(false)
	end)
	
	local function getOrderedConversationIds(p5)
		-- upvalues: p3 (copy), p4 (copy), FFlagAppChatAnyServerSideConversationSearchModule (upval), excludeSearchIntroduced (upval), FFlagAppChatDerivedConversationLatestActivityModule (upval), sortByLatestActivity (upval), compareByServerLastUpdated (upval), GetConversationIdsModule (upval), Signal (copy), v1 (ref), containsAllFrozenConversations (upval)
		local Conversations = p3.getConversations(p5)
		
		if FFlagAppChatAnyServerSideConversationSearchModule then
			Conversations = excludeSearchIntroduced(Conversations)
		end
		local Conversations1 = nil
		if FFlagAppChatDerivedConversationLatestActivityModule then
			sortByLatestActivity(Conversations, p4, p5)
			Conversations1 = Conversations
		else
			table.sort(Conversations, compareByServerLastUpdated)
			Conversations1 = Conversations
		end
		local ConversationIdsModule = GetConversationIdsModule(Conversations1)
		
		if Signal(p5) ~= true or v1 == nil then
			v1 = ConversationIdsModule
			
			return ConversationIdsModule
		elseif #ConversationIdsModule == 0 then
			v1 = nil
			
			return {}
		elseif containsAllFrozenConversations(ConversationIdsModule, v1) then
			return v1
		else
			v1 = ConversationIdsModule
			
			return ConversationIdsModule
		end
	end
	
	return {
		getOrderedConversationIds = getOrderedConversationIds,
		getConversations = function(p5)
			-- upvalues: getOrderedConversationIds (copy), p3 (copy)
			local Conversations = {}
			
			for _, value in getOrderedConversationIds(p5) do
				local Conversation = p3.getConversation(value, p5)
				
				if Conversation ~= nil then
					table.insert(Conversations, Conversation)
				end
			end
			return Conversations
		end,
		getListStatus = function(p6)
			-- upvalues: p3 (copy)
			return p3.getListStatus(p6)
		end,
		setLatestMessagesFetching = function(p6)
			-- upvalues: Signal2 (copy)
			Signal2(p6)
		end
	}
end