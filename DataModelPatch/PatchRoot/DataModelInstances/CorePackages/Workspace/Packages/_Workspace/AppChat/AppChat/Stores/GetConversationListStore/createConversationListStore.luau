local AppChat = script:FindFirstAncestor("AppChat")
local SignalsModule = require(AppChat.Parent.Signals)
local _ = require(AppChat.Stores.GetConversationStore.createConversationStore)
local GetConversationIdsModule = require(AppChat.Utils.getConversationIds)

local function _(p1)
	local LastUpdated = p1.lastUpdated
	
	return if LastUpdated == nil then nil elseif typeof(LastUpdated) == "DateTime" then LastUpdated.UnixTimestamp elseif type(LastUpdated) == "table" and LastUpdated.GetUnixTimestamp ~= nil then LastUpdated:GetUnixTimestamp() else nil
end

local function conversationSortPredicate(A, B): boolean
	local LastUpdated = A.lastUpdated
	local UnixTimestamp = if LastUpdated == nil then nil elseif typeof(LastUpdated) == "DateTime" then LastUpdated.UnixTimestamp elseif type(LastUpdated) == "table" and LastUpdated.GetUnixTimestamp ~= nil then LastUpdated:GetUnixTimestamp() else nil
	local LastUpdated1 = B.lastUpdated
	local UnixTimestamp1 = if LastUpdated1 == nil then nil elseif typeof(LastUpdated1) == "DateTime" then LastUpdated1.UnixTimestamp elseif type(LastUpdated1) == "table" and LastUpdated1.GetUnixTimestamp ~= nil then LastUpdated1:GetUnixTimestamp() else nil
	
	return if UnixTimestamp == nil or UnixTimestamp1 == nil then if UnixTimestamp == nil and UnixTimestamp1 == nil then string.lower(A.title or "") < string.lower(B.title or "") else UnixTimestamp ~= nil else UnixTimestamp1 < UnixTimestamp
end

local function containsAllFrozenConversations(List, List1): boolean
	for _, value in List1 do
		if table.find(List, value) == nil then
			return false
		end
	end
	return true
end

local _ = function(p1, p2)
	-- upvalues: conversationSortPredicate (copy)
	local Conversations = p1.getConversations(p2)
	table.sort(Conversations, conversationSortPredicate)
	
	return Conversations
end

return function(p1)
	-- upvalues: SignalsModule (copy), conversationSortPredicate (copy), GetConversationIdsModule (copy), containsAllFrozenConversations (copy)
	local v1 = nil
	local Signal, Signal2 = SignalsModule.createSignal(false)
	p1.addClearListener(function()
		-- upvalues: v1 (ref), Signal2 (copy)
		v1 = nil
		Signal2(false)
	end)
	
	local function getOrderedConversationIds(p2)
		-- upvalues: p1 (copy), conversationSortPredicate (upval), GetConversationIdsModule (upval), Signal (copy), v1 (ref), containsAllFrozenConversations (upval)
		local Conversations = p1.getConversations(p2)
		table.sort(Conversations, conversationSortPredicate)
		local ConversationIdsModule = GetConversationIdsModule(Conversations)
		
		if Signal(p2) ~= true or v1 == nil then
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
		getConversations = function(p2)
			-- upvalues: getOrderedConversationIds (copy), p1 (copy)
			local Conversations = {}
			
			for _, value in getOrderedConversationIds(p2) do
				local Conversation = p1.getConversation(value, p2)
				
				if Conversation ~= nil then
					table.insert(Conversations, Conversation)
				end
			end
			return Conversations
		end,
		getListStatus = function(p3)
			-- upvalues: p1 (copy)
			return p1.getListStatus(p3)
		end,
		setLatestMessagesFetching = function(p3)
			-- upvalues: Signal2 (copy)
			Signal2(p3)
		end
	}
end