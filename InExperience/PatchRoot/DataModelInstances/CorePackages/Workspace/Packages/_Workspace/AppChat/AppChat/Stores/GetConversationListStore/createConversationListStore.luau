local appChat = script:FindFirstAncestor("AppChat")
local signalsModule = require(appChat.Parent.Signals)
local _ = require(appChat.Stores.GetConversationStore.createConversationStore)
local getConversationIdsModule = require(appChat.Utils.getConversationIds)

local function _(p0)
	local lastUpdated = p0.lastUpdated
	
	return if lastUpdated == nil then nil elseif typeof(lastUpdated) == "DateTime" then lastUpdated.UnixTimestamp elseif type(lastUpdated) == "table" and lastUpdated.GetUnixTimestamp ~= nil then lastUpdated:GetUnixTimestamp() else nil
end

local function conversationSortPredicate(p1, p2)
	local lastUpdated = p1.lastUpdated
	local var5 = if lastUpdated == nil then nil elseif typeof(lastUpdated) == "DateTime" then lastUpdated.UnixTimestamp elseif type(lastUpdated) == "table" and lastUpdated.GetUnixTimestamp ~= nil then lastUpdated:GetUnixTimestamp() else nil
	local lastUpdated_1 = p2.lastUpdated
	lastUpdated = if lastUpdated_1 == nil then nil elseif typeof(lastUpdated_1) == "DateTime" then lastUpdated_1.UnixTimestamp elseif type(lastUpdated_1) == "table" and lastUpdated_1.GetUnixTimestamp ~= nil then lastUpdated_1:GetUnixTimestamp() else nil
	
	return if not (var5 ~= nil and lastUpdated ~= nil) then if var5 == nil and lastUpdated == nil then string.lower(p1.title or "") < string.lower(p2.title or "") else var5 ~= nil else lastUpdated < var5
end

local function containsAllFrozenConversations(p3, p4)
	for i, v in p4 do
		if table.find(p3, v) == nil then
			return false
		end
	end
	return true
end

local _ = function(p5, p6)
	-- upvalues: conversationSortPredicate (ref)
	local conversations = p5.getConversations(p6)
	table.sort(conversations, conversationSortPredicate)
	
	return conversations
end

return function(p7)
	-- upvalues: signalsModule (ref), conversationSortPredicate (ref), getConversationIdsModule (ref), containsAllFrozenConversations (ref)
	local var7 = nil
	local var8, var9 = signalsModule.createSignal(false)
	p7.addClearListener(function()
		-- upvalues: var7 (write), var9 (ref)
		var7 = nil
		var9(false)
	end)
	
	local function getOrderedConversationIds(p8)
		-- upvalues: p7 (ref), conversationSortPredicate (copy), getConversationIdsModule (copy), var8 (ref), var7 (write), containsAllFrozenConversations (copy)
		local conversations = p7.getConversations(p8)
		table.sort(conversations, conversationSortPredicate)
		local var12 = getConversationIdsModule(conversations)
		
		if var8(p8) ~= true or var7 == nil then
			var7 = var12
			
			return var12
		elseif #var12 == 0 then
			var7 = nil
			
			return {}
		elseif containsAllFrozenConversations(var12, var7) then
			return var7
		end
		var7 = var12
		
		return var12
	end
	
	return {
		getOrderedConversationIds = getOrderedConversationIds,
		getConversations = function(p9)
			-- upvalues: getOrderedConversationIds (ref), p7 (ref)
			local t = {}
			
			for i, v in getOrderedConversationIds(p9) do
				local conversation = p7.getConversation(v, p9)
				
				if conversation ~= nil then
					table.insert(t, conversation)
				end
			end
			return t
		end,
		getListStatus = function(p10)
			-- upvalues: p7 (ref)
			return p7.getListStatus(p10)
		end,
		setLatestMessagesFetching = function(value)
			-- upvalues: var9 (ref)
			var9(value)
		end
	}
end