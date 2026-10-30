local AppChat = script:FindFirstAncestor("AppChat")
local SignalsModule = require(AppChat.Parent.Signals)
local _ = require(AppChat.MessageData.Types)
local EnumsModule = require(AppChat.MessageData.Enums)
local FFlagAppChatParseMessageTimestampsOnceModule = require(AppChat.Flags.FFlagAppChatParseMessageTimestampsOnce)
local FFlagAppChatGroupedVariantNeighbourIdsModule = require(AppChat.Flags.FFlagAppChatGroupedVariantNeighbourIds)
local ParseIsoDateUnixMillisModule = require(AppChat.Utils.parseIsoDateUnixMillis)
local _ = require(script.Parent.Parent.GetConversationMessageStore.createConversationMessageStore)
local _ = require(script.Parent.Parent.GetConversationMessageListStore.createConversationMessageListStore)
local GroupedMessageVariant = EnumsModule.GroupedMessageVariant
local MessageStatus = EnumsModule.MessageStatus
local MessageType = EnumsModule.MessageType
local MessageVisibility = EnumsModule.MessageVisibility

local function _(p1): boolean
	-- upvalues: MessageType (copy)
	return p1 ~= nil and p1.type == MessageType.User
end

local _ = function(p1)
	if p1 == nil then
		return nil
	else
		local _DateTime = DateTime.fromIsoDate(p1)
		
		return if _DateTime then _DateTime.UnixTimestamp else nil
	end
end

local _ = function(p1)
	-- upvalues: ParseIsoDateUnixMillisModule (copy)
	local CreatedAtUnixMillis = p1.createdAtUnixMillis
	
	if CreatedAtUnixMillis == nil then
		CreatedAtUnixMillis = ParseIsoDateUnixMillisModule(p1.created_at)
	end
	return if CreatedAtUnixMillis == nil then nil else math.floor(CreatedAtUnixMillis / 1000)
end

local function timeDiffExceedsThreshold(p1, p2): boolean
	-- upvalues: FFlagAppChatParseMessageTimestampsOnceModule (copy), ParseIsoDateUnixMillisModule (copy)
	if p1 == nil or p2 == nil then
		return false
	end
	local Floored = nil
	if FFlagAppChatParseMessageTimestampsOnceModule then
		local CreatedAtUnixMillis = p1.createdAtUnixMillis
		
		if CreatedAtUnixMillis == nil then
			CreatedAtUnixMillis = ParseIsoDateUnixMillisModule(p1.created_at)
		end
		Floored = if CreatedAtUnixMillis == nil then nil else math.floor(CreatedAtUnixMillis / 1000)
	else
		local CreatedAt = p1.created_at
		
		if CreatedAt == nil then
			Floored = nil
		else
			local _DateTime = DateTime.fromIsoDate(CreatedAt)
			Floored = if _DateTime then _DateTime.UnixTimestamp else nil
		end
	end
	local Floored1 = nil
	if FFlagAppChatParseMessageTimestampsOnceModule then
		local CreatedAtUnixMillis = p2.createdAtUnixMillis
		
		if CreatedAtUnixMillis == nil then
			CreatedAtUnixMillis = ParseIsoDateUnixMillisModule(p2.created_at)
		end
		Floored1 = if CreatedAtUnixMillis == nil then nil else math.floor(CreatedAtUnixMillis / 1000)
	else
		local CreatedAt = p2.created_at
		
		if CreatedAt == nil then
			Floored1 = nil
		else
			local _DateTime = DateTime.fromIsoDate(CreatedAt)
			Floored1 = if _DateTime then _DateTime.UnixTimestamp else nil
		end
	end
	return Floored ~= nil and Floored1 ~= nil and math.abs(Floored - Floored1) > 300
end

local _ = function(p1): boolean
	-- upvalues: MessageStatus (copy)
	return p1 ~= nil and p1.status == MessageStatus.Moderated
end

local _ = function(p1): boolean
	-- upvalues: MessageVisibility (copy)
	return p1 ~= nil and p1.visibility == MessageVisibility.Hidden
end

local _ = function(p1): boolean
	return p1 ~= nil and p1.replies_to ~= nil
end

local function canGroupWithAdjacent(p1, p2): boolean
	-- upvalues: MessageType (copy), MessageVisibility (copy), MessageStatus (copy), timeDiffExceedsThreshold (copy)
	return p2 ~= nil and (p2 ~= nil and p2.type == MessageType.User and (p2.sender_user_id == p1.sender_user_id and (not (p1 ~= nil and p1.visibility == MessageVisibility.Hidden) and (not (p2 ~= nil and p2.visibility == MessageVisibility.Hidden) and (not (p1 ~= nil and p1.status == MessageStatus.Moderated) and (not (p2 ~= nil and p2.status == MessageStatus.Moderated) and not timeDiffExceedsThreshold(p2, p1)))))))
end

local function computeGroupedVariant(p1, p2, p3)
	-- upvalues: MessageType (copy), canGroupWithAdjacent (copy), GroupedMessageVariant (copy)
	if p1 ~= nil and p1.type == MessageType.User then
		local Inverted: boolean = canGroupWithAdjacent(p1, p2) and not (p2 ~= nil and p2.replies_to ~= nil)
		local Inverted1: boolean = canGroupWithAdjacent(p1, p3) and not (p1 ~= nil and p1.replies_to ~= nil)
		
		return if Inverted or Inverted1 then if Inverted or not Inverted1 then if Inverted and not Inverted1 then GroupedMessageVariant.First else GroupedMessageVariant.Middle else GroupedMessageVariant.Last else GroupedMessageVariant.Single
	else
		return nil
	end
end

return function(ConversationMessageStore, ConversationMessageListStore)
	-- upvalues: SignalsModule (copy), MessageType (copy), FFlagAppChatGroupedVariantNeighbourIdsModule (copy), computeGroupedVariant (copy), GroupedMessageVariant (copy)
	local t = {}
	
	return {
		conversationMessageStore = ConversationMessageStore,
		conversationMessageListStore = ConversationMessageListStore,
		getGroupedVariant = function(Key, Key1)
			-- upvalues: t (copy), SignalsModule (upval), ConversationMessageStore (copy), MessageType (upval), FFlagAppChatGroupedVariantNeighbourIdsModule (upval), ConversationMessageListStore (copy), computeGroupedVariant (upval), GroupedMessageVariant (upval)
			local Entry = t[Key1]
			
			if Entry then
				local Entry1 = Entry[Key]
				
				if Entry1 ~= nil then
					return Entry1
				end
			else
				Entry = {}
				t[Key1] = Entry
			end
			local Computed = SignalsModule.createComputed(function(p1)
				-- upvalues: ConversationMessageStore (upval), Key (copy), MessageType (upval), FFlagAppChatGroupedVariantNeighbourIdsModule (upval), ConversationMessageListStore (upval), Key1 (copy), computeGroupedVariant (upval), GroupedMessageVariant (upval)
				local MessagesResult = ConversationMessageStore.messages(p1)
				local MessagesResultEntry = MessagesResult[Key]
				
				if MessagesResultEntry == nil then
					return nil
				elseif MessagesResultEntry == nil or MessagesResultEntry.type ~= MessageType.User then
					return nil
				elseif FFlagAppChatGroupedVariantNeighbourIdsModule then
					local NeighbourIds = ConversationMessageListStore.getNeighbourIds(Key1, Key, p1)
					
					return (computeGroupedVariant(MessagesResultEntry, if NeighbourIds.prevId == nil then nil else MessagesResult[NeighbourIds.prevId], if NeighbourIds.nextId == nil then nil else MessagesResult[NeighbourIds.nextId]))
				elseif ConversationMessageListStore.getIndex(Key1, Key, p1) == nil then
					return GroupedMessageVariant.Single
				else
					local PrevId = ConversationMessageListStore.getPrevId(Key1, Key, p1)
					local NextId = ConversationMessageListStore.getNextId(Key1, Key, p1)
					
					return (computeGroupedVariant(MessagesResultEntry, if PrevId == nil then nil else MessagesResult[PrevId], if NextId == nil then nil else MessagesResult[NextId]))
				end
			end)
			Entry[Key] = Computed
			
			return Computed
		end,
		evictConversation = function(Key)
			-- upvalues: t (copy)
			t[Key] = nil
		end
	}
end