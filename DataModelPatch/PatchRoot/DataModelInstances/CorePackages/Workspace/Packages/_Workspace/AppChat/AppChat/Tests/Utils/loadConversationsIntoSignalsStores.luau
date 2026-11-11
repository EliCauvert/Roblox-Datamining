local AppChat = script:FindFirstAncestor("AppChat")
local GetConversationMessageViewModelStoreModule = require(AppChat.Stores.GetConversationMessageViewModelStore)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)

local function _(p1)
	return if p1.sent and p1.sent.ToIsoDate then p1.sent:ToIsoDate() else DateTime.now():ToIsoDate()
end

local function buildConversationMessage(p1)
	local Id = p1.id or p1.messageId
	
	if Id then
		return Id, {
			id = Id,
			content = p1.content,
			sender_user_id = if p1.senderTargetId then tonumber(p1.senderTargetId) else nil,
			type = if p1.messageType == "System" then "system" else "user",
			created_at = if p1.sent and p1.sent.ToIsoDate then p1.sent:ToIsoDate() else DateTime.now():ToIsoDate(),
			moderation_type = p1.moderationType,
			messageType = p1.messageType,
			gameLink = p1.gameLink
		}
	else
		return nil, nil
	end
end

local function collectFromOrderedMap(Messages)
	-- upvalues: buildConversationMessage (copy)
	local t = {}
	local List = {}
	
	for _, key in Messages.keys do
		local ConversationMessage, ConversationMessage2 = buildConversationMessage(Messages.values[key])
		
		if ConversationMessage then
			t[ConversationMessage] = ConversationMessage2
			table.insert(List, ConversationMessage)
		end
	end
	return t, List
end

local function collectFromValuesTable(Values)
	-- upvalues: buildConversationMessage (copy)
	local t = {}
	local List = {}
	
	for _, value in Values do
		local ConversationMessage, ConversationMessage2 = buildConversationMessage(value)
		
		if ConversationMessage then
			t[ConversationMessage] = ConversationMessage2
			table.insert(List, ConversationMessage)
		end
	end
	return t, List
end

return function(List)
	-- upvalues: GetConversationMessageViewModelStoreModule (copy), GetConversationStoreModule (copy), collectFromOrderedMap (copy), collectFromValuesTable (copy)
	if not List then return end
	local ConversationMessageViewModelStoreModule = GetConversationMessageViewModelStoreModule(false)
	local ConversationMessageStore = ConversationMessageViewModelStoreModule.conversationMessageStore
	local ConversationMessageListStore = ConversationMessageViewModelStoreModule.conversationMessageListStore
	local ConversationStoreModule = GetConversationStoreModule(false)
	ConversationMessageStore.clear()
	ConversationMessageListStore.clear()
	ConversationStoreModule.clear()
	
	for i, value in List do
		ConversationStoreModule.upsertConversation(value)
		local Messages = value.messages
		
		if Messages then
			local v1 = nil
			local v2 = nil
			
			if Messages.keys and #Messages.keys > 0 then
				v1, v22 = collectFromOrderedMap(Messages)
			elseif Messages.values then
				v1, v22 = collectFromValuesTable(Messages.values)
			end
			if v1 and next(v1) then
				ConversationMessageStore.upsertMessages(v1)
				ConversationMessageListStore.prependMessages(i, v2)
			end
		end
	end
end