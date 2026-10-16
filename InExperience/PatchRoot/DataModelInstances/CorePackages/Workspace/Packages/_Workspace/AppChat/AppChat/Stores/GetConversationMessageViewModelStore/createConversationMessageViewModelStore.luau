local AppChat = script:FindFirstAncestor("AppChat")
local SignalsModule = require(AppChat.Parent.Signals)
local _ = require(AppChat.MessageData.Types)
local EnumsModule = require(AppChat.MessageData.Enums)
local _ = require(script.Parent.Parent.GetConversationMessageStore.createConversationMessageStore)
local _ = require(script.Parent.Parent.GetConversationMessageListStore.createConversationMessageListStore)
local GroupedMessageVariant = EnumsModule.GroupedMessageVariant
local MessageStatus = EnumsModule.MessageStatus
local MessageType = EnumsModule.MessageType
local MessageVisibility = EnumsModule.MessageVisibility

local function _(p1): boolean --[[ Line: 43 | Named "isChatMessage" ]]
	-- upvalues: MessageType (copy)
	return p1 ~= nil and p1.type == MessageType.User
end

local _ = function(p1) --[[ Line: 50 | Named "parseTimestamp" ]]
	if p1 == nil then
		return nil
	else
		local _DateTime = DateTime.fromIsoDate(p1)
		
		return if _DateTime then _DateTime.UnixTimestamp else nil
	end
end

local _ = function(p1, p2): boolean --[[ Line: 61 | Named "timeDiffExceedsThreshold" ]]
	if p1 == nil or p2 == nil then
		return false
	end
	local CreatedAt = p1.created_at
	local UnixTimestamp = nil
	
	if CreatedAt == nil then
		UnixTimestamp = nil
	else
		local _DateTime = DateTime.fromIsoDate(CreatedAt)
		UnixTimestamp = if _DateTime then _DateTime.UnixTimestamp else nil
	end
	local CreatedAt1 = p2.created_at
	local UnixTimestamp1 = nil
	
	if CreatedAt1 == nil then
		UnixTimestamp1 = nil
	else
		local _DateTime = DateTime.fromIsoDate(CreatedAt1)
		UnixTimestamp1 = if _DateTime then _DateTime.UnixTimestamp else nil
	end
	return UnixTimestamp ~= nil and UnixTimestamp1 ~= nil and math.abs(UnixTimestamp - UnixTimestamp1) > 300
end

local _ = function(p1): boolean --[[ Line: 73 | Named "isModeratedMessage" ]]
	-- upvalues: MessageStatus (copy)
	return p1 ~= nil and p1.status == MessageStatus.Moderated
end

local _ = function(p1): boolean --[[ Line: 77 | Named "isHiddenMessage" ]]
	-- upvalues: MessageVisibility (copy)
	return p1 ~= nil and p1.visibility == MessageVisibility.Hidden
end

local _ = function(p1): boolean --[[ Line: 81 | Named "isReplyMessage" ]]
	return p1 ~= nil and p1.replies_to ~= nil
end

local function canGroupWithAdjacent(p1, p2): boolean --[[ Line: 85 ]]
	-- upvalues: MessageType (copy), MessageVisibility (copy), MessageStatus (copy)
	local Inverted = false
	
	if p2 ~= nil then
		Inverted = p2 ~= nil and p2.type == MessageType.User
		
		if Inverted then
			Inverted = false
			
			if p2.sender_user_id == p1.sender_user_id then
				Inverted = not (p1 ~= nil and p1.visibility == MessageVisibility.Hidden)
				
				if Inverted then
					Inverted = not (p2 ~= nil and p2.visibility == MessageVisibility.Hidden)
					
					if Inverted then
						Inverted = not (p1 ~= nil and p1.status == MessageStatus.Moderated)
						
						if Inverted then
							Inverted = not (p2 ~= nil and p2.status == MessageStatus.Moderated)
							
							if Inverted then
								local IsMagnitudeAbove = nil
								if p2 == nil or p1 == nil then
									IsMagnitudeAbove = false
								else
									local CreatedAt = p2.created_at
									local UnixTimestamp = nil
									
									if CreatedAt == nil then
										UnixTimestamp = nil
									else
										local _DateTime = DateTime.fromIsoDate(CreatedAt)
										UnixTimestamp = if _DateTime then _DateTime.UnixTimestamp else nil
									end
									local CreatedAt1 = p1.created_at
									local UnixTimestamp1 = nil
									
									if CreatedAt1 == nil then
										UnixTimestamp1 = nil
									else
										local _DateTime = DateTime.fromIsoDate(CreatedAt1)
										UnixTimestamp1 = if _DateTime then _DateTime.UnixTimestamp else nil
									end
									IsMagnitudeAbove = UnixTimestamp ~= nil and UnixTimestamp1 ~= nil and math.abs(UnixTimestamp - UnixTimestamp1) > 300
								end
								Inverted = not IsMagnitudeAbove
							end
						end
					end
				end
			end
		end
	end
	return Inverted
end

local function computeGroupedVariant(p1, p2, p3) --[[ Line: 96 ]]
	-- upvalues: MessageType (copy), canGroupWithAdjacent (copy), GroupedMessageVariant (copy)
	if p1 ~= nil and p1.type == MessageType.User then
		local Inverted: boolean = canGroupWithAdjacent(p1, p2) and not (p2 ~= nil and p2.replies_to ~= nil)
		local Inverted1: boolean = canGroupWithAdjacent(p1, p3) and not (p1 ~= nil and p1.replies_to ~= nil)
		
		return if Inverted or Inverted1 then if Inverted or not Inverted1 then if Inverted and not Inverted1 then GroupedMessageVariant.First else GroupedMessageVariant.Middle else GroupedMessageVariant.Last else GroupedMessageVariant.Single
	else
		return nil
	end
end

return function(ConversationMessageStore, ConversationMessageListStore) --[[ Line: 126 | Named "createConversationMessageViewModelStore" ]]
	-- upvalues: SignalsModule (copy), MessageType (copy), GroupedMessageVariant (copy), computeGroupedVariant (copy)
	local t = {}
	
	return {
		conversationMessageStore = ConversationMessageStore,
		conversationMessageListStore = ConversationMessageListStore,
		getGroupedVariant = function(Key, Key1) --[[ Line: 132 ]]
			-- upvalues: t (copy), SignalsModule (upval), ConversationMessageStore (copy), MessageType (upval), ConversationMessageListStore (copy), GroupedMessageVariant (upval), computeGroupedVariant (upval)
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
			local Computed = SignalsModule.createComputed(function(p1) --[[ Line: 145 ]]
				-- upvalues: ConversationMessageStore (upval), Key (copy), MessageType (upval), ConversationMessageListStore (upval), Key1 (copy), GroupedMessageVariant (upval), computeGroupedVariant (upval)
				local MessagesResult = ConversationMessageStore.messages(p1)
				local MessagesResultEntry = MessagesResult[Key]
				
				if MessagesResultEntry == nil then
					return nil
				elseif MessagesResultEntry == nil or MessagesResultEntry.type ~= MessageType.User then
					return nil
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
		evictConversation = function(Key) --[[ Line: 174 ]]
			-- upvalues: t (copy)
			t[Key] = nil
		end
	}
end