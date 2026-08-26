local appChat = script:FindFirstAncestor("AppChat")
local signalsModule = require(appChat.Parent.Signals)
local _ = require(appChat.Stores.GetConversationStore.createConversationStore)
local getConversationIdsModule = require(appChat.Utils.getConversationIds)

local function _(p1)
	local lastUpdated = p1.lastUpdated
	
	return if lastUpdated == nil then nil elseif typeof(lastUpdated) == "DateTime" then lastUpdated.UnixTimestamp elseif type(lastUpdated) == "table" and lastUpdated.GetUnixTimestamp ~= nil then lastUpdated:GetUnixTimestamp() else nil
end

local function conversationSortPredicate(p1, p2)
	local lastUpdated = p1.lastUpdated
	local var1 = if lastUpdated == nil then nil elseif typeof(lastUpdated) == "DateTime" then lastUpdated.UnixTimestamp elseif type(lastUpdated) == "table" and lastUpdated.GetUnixTimestamp ~= nil then lastUpdated:GetUnixTimestamp() else nil
	local lastUpdated_1 = p2.lastUpdated
	lastUpdated = if lastUpdated_1 == nil then nil elseif typeof(lastUpdated_1) == "DateTime" then lastUpdated_1.UnixTimestamp elseif type(lastUpdated_1) == "table" and lastUpdated_1.GetUnixTimestamp ~= nil then lastUpdated_1:GetUnixTimestamp() else nil
	
	return if not (var1 ~= nil and lastUpdated ~= nil) then if var1 == nil and lastUpdated == nil then string.lower(p1.title or "") < string.lower(p2.title or "") else var1 ~= nil else lastUpdated < var1
end

local function containsAllFrozenConversations(p1, p2)
	for i, v in p2 do
		if table.find(p1, v) == nil then
			return false
		end
	end
	return true
end

local _ = function(p3, p4)
	-- upvalues: conversationSortPredicate (ref)
	local conversations = p3.getConversations(p4)
	table.sort(conversations, conversationSortPredicate)
	
	return conversations
end

return function(p3)
	-- upvalues: signalsModule (ref), conversationSortPredicate (ref), getConversationIdsModule (ref), containsAllFrozenConversations (ref)
	local var1 = nil
	local var2, var3 = signalsModule.createSignal(false)
	p3.addClearListener(function()
		-- upvalues: var1 (write), var3 (ref)
		var1 = nil
		var3(false)
	end)
	
	local function getOrderedConversationIds(p4)
		-- upvalues: p3 (ref), conversationSortPredicate (copy), getConversationIdsModule (copy), var2 (ref), var1 (write), containsAllFrozenConversations (copy)
		local conversations = p3.getConversations(p4)
		table.sort(conversations, conversationSortPredicate)
		local var4 = getConversationIdsModule(conversations)
		
		if var2(p4) ~= true or var1 == nil then
			var1 = var4
			
			return var4
		elseif #var4 == 0 then
			var1 = nil
			
			return {}
		elseif containsAllFrozenConversations(var4, var1) then
			return var1
		end
		var1 = var4
		
		return var4
	end
	
	return {
		getOrderedConversationIds = getOrderedConversationIds,
		getConversations = function(p4)
			-- upvalues: getOrderedConversationIds (ref), p3 (ref)
			local t = {}
			
			for i, v in getOrderedConversationIds(p4) do
				local conversation = p3.getConversation(v, p4)
				
				if conversation ~= nil then
					table.insert(t, conversation)
				end
			end
			return t
		end,
		getListStatus = function(p5)
			-- upvalues: p3 (ref)
			return p3.getListStatus(p5)
		end,
		setLatestMessagesFetching = function(value)
			-- upvalues: var3 (ref)
			var3(value)
		end
	}
end