local AppChat = script:FindFirstAncestor("AppChat")
local _ = require(AppChat.MessageData.Types)
local GetConversationMessageStoreModule = require(AppChat.Stores.GetConversationMessageStore)
local GetConversationMessageListStoreModule = require(AppChat.Stores.GetConversationMessageListStore)
local IngestOperationModule = require(script.Parent.IngestOperation)

return function(p1, List, Append, p2)
	-- upvalues: GetConversationMessageStoreModule (copy), GetConversationMessageListStoreModule (copy), IngestOperationModule (copy)
	local ConversationMessageStoreModule = GetConversationMessageStoreModule(false)
	local ConversationMessageListStoreModule = GetConversationMessageListStoreModule(false)
	local t = {}
	local Ids = {}
	
	for _, value in List do
		if value and value.id then
			t[value.id] = value
			table.insert(Ids, value.id)
		end
	end
	if next(t) ~= nil then
		ConversationMessageStoreModule.upsertMessages(t)
	end
	if Append == IngestOperationModule.AppendAndAdvanceCursor then
		ConversationMessageListStoreModule.receivePage(p1, Ids, p2)
		
		return Ids
	end
	if Append ~= IngestOperationModule.Append then
		if #Ids > 0 then
			ConversationMessageListStoreModule.prependMessages(p1, Ids)
		end
	elseif #Ids > 0 then
		ConversationMessageListStoreModule.appendMessages(p1, Ids)
		
		return Ids
	end
	return Ids
end