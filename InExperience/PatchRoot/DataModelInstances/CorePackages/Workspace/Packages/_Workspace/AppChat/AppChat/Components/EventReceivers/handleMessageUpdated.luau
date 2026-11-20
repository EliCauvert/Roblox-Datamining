local AppChat = script:FindFirstAncestor("AppChat")
local GetMessageReactionsStoreModule = require(AppChat.Stores.GetMessageReactionsStore)
local QueueMessageReactionsFetchModule = require(AppChat.Stores.GetMessageReactionsStore.queueMessageReactionsFetch)
local _ = require(script.Parent.CommunicationChannelsTypes)

return function(p1)
	-- upvalues: GetMessageReactionsStoreModule (copy), QueueMessageReactionsFetchModule (copy)
	if not table.find(p1.Updated, "Reactions") then return end
	if GetMessageReactionsStoreModule(false).hasMessageReactions(p1.MessageId) then
		QueueMessageReactionsFetchModule(p1.ChannelId, p1.MessageId)
		
		return
	end
end