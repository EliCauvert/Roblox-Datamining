local appChat = script:FindFirstAncestor("AppChat")
local signalsModule = require(appChat.Parent.Signals)
local _ = require(appChat.Stores.GetConversationStore.createConversationStore)
local _ = require(appChat.Stores.GetConversationViewModelStore.createConversationViewModelStore)
local getConversationIdsModule = require(appChat.Utils.getConversationIds)
local searchIntroducedConversationIdsModule = require(appChat.Stores.searchIntroducedConversationIds)
local fFlagAppChatAnyServerSideConversationSearchModule = require(appChat.Flags.FFlagAppChatAnyServerSideConversationSearch)
local fFlagAppChatDerivedConversationLatestActivityModule = require(appChat.Flags.FFlagAppChatDerivedConversationLatestActivity)

local function _(p1)
	local lastUpdated = p1.lastUpdated
	
	return if lastUpdated == nil then nil elseif typeof(lastUpdated) == "DateTime" then lastUpdated.UnixTimestamp elseif type(lastUpdated) == "table" and lastUpdated.GetUnixTimestamp ~= nil then lastUpdated:GetUnixTimestamp() else nil
end

local _ = function(p1, p2, p3, p4)
	return if not (p3 ~= nil and p4 ~= nil) then if p3 == nil and p4 == nil then string.lower(p1.title or "") < string.lower(p2.title or "") else p3 ~= nil else p4 < p3
end

local function compareByServerLastUpdated(p1, p2)
	local lastUpdated = p1.lastUpdated
	local var1 = if lastUpdated == nil then nil elseif typeof(lastUpdated) == "DateTime" then lastUpdated.UnixTimestamp elseif type(lastUpdated) == "table" and lastUpdated.GetUnixTimestamp ~= nil then lastUpdated:GetUnixTimestamp() else nil
	local lastUpdated_1 = p2.lastUpdated
	lastUpdated = if lastUpdated_1 == nil then nil elseif typeof(lastUpdated_1) == "DateTime" then lastUpdated_1.UnixTimestamp elseif type(lastUpdated_1) == "table" and lastUpdated_1.GetUnixTimestamp ~= nil then lastUpdated_1:GetUnixTimestamp() else nil
	
	return if not (var1 ~= nil and lastUpdated ~= nil) then if var1 == nil and lastUpdated == nil then string.lower(p1.title or "") < string.lower(p2.title or "") else var1 ~= nil else lastUpdated < var1
end

local function sortByLatestActivity(p1, p2, p3)
	local t = {}
	
	for i, v in p1 do
		t[v.id] = p2.getUnixTime(v.id)(p3)
	end
	table.sort(p1, function(p4, p5)
		-- upvalues: t (ref)
		local id = t[p4.id]
		local id_1 = t[p5.id]
		
		return if not (id ~= nil and id_1 ~= nil) then if id == nil and id_1 == nil then string.lower(p4.title or "") < string.lower(p5.title or "") else id ~= nil else id_1 < id
	end)
end

local function containsAllFrozenConversations(p4, p5)
	for i, v in p5 do
		if table.find(p4, v) == nil then
			return false
		end
	end
	return true
end

local function excludeSearchIntroduced(p6)
	-- upvalues: searchIntroducedConversationIdsModule (ref)
	local t = {}
	
	for i, v in p6 do
		if not searchIntroducedConversationIdsModule.has(v.id) then
			table.insert(t, v)
		end
	end
	return t
end

local _ = function(p7, p8, p9)
	-- upvalues: fFlagAppChatAnyServerSideConversationSearchModule (ref), excludeSearchIntroduced (ref), fFlagAppChatDerivedConversationLatestActivityModule (ref), sortByLatestActivity (ref), compareByServerLastUpdated (ref)
	local conversations = p7.getConversations(p9)
	
	if fFlagAppChatAnyServerSideConversationSearchModule then
		conversations = excludeSearchIntroduced(conversations)
	end
	if fFlagAppChatDerivedConversationLatestActivityModule then
		sortByLatestActivity(conversations, p8, p9)
		
		return conversations
	end
	table.sort(conversations, compareByServerLastUpdated)
	
	return conversations
end

return function(p7, p8)
	-- upvalues: signalsModule (ref), fFlagAppChatAnyServerSideConversationSearchModule (ref), excludeSearchIntroduced (ref), fFlagAppChatDerivedConversationLatestActivityModule (ref), sortByLatestActivity (ref), compareByServerLastUpdated (ref), getConversationIdsModule (ref), containsAllFrozenConversations (ref)
	local var1 = nil
	local var2, var3 = signalsModule.createSignal(false)
	p7.addClearListener(function()
		-- upvalues: var1 (write), var3 (ref)
		var1 = nil
		var3(false)
	end)
	
	local function getOrderedConversationIds(p9)
		-- upvalues: p7 (ref), p8 (ref), fFlagAppChatAnyServerSideConversationSearchModule (copy), excludeSearchIntroduced (copy), fFlagAppChatDerivedConversationLatestActivityModule (copy), sortByLatestActivity (copy), compareByServerLastUpdated (copy), getConversationIdsModule (copy), var2 (ref), var1 (write), containsAllFrozenConversations (copy)
		local var4
		local conversations = p7.getConversations(p9)
		
		if fFlagAppChatAnyServerSideConversationSearchModule then
			conversations = excludeSearchIntroduced(conversations)
		end
		if fFlagAppChatDerivedConversationLatestActivityModule then
			sortByLatestActivity(conversations, p8, p9)
			var4 = conversations
		else
			table.sort(conversations, compareByServerLastUpdated)
			var4 = conversations
		end
		local var5 = getConversationIdsModule(var4)
		
		if var2(p9) ~= true or var1 == nil then
			var1 = var5
			
			return var5
		elseif #var5 == 0 then
			var1 = nil
			
			return {}
		elseif containsAllFrozenConversations(var5, var1) then
			return var1
		end
		var1 = var5
		
		return var5
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
			-- upvalues: var3 (ref)
			var3(value)
		end
	}
end