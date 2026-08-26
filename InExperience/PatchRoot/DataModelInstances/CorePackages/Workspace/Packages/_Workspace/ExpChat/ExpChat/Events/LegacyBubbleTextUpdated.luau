local eventModule = require(script.Parent.event)
local expChat = script:FindFirstAncestor("ExpChat")
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)

return if require(expChat.Parent.SharedFlags).FFlagExpChatUseMessagesStore then function(p1, p2)
	-- upvalues: getMessagesStoreModule (ref)
	getMessagesStoreModule(false).handleLegacyBubbleTextUpdated(p1, p2)
end else eventModule(require(expChat.Actions.LegacyBubbleTextUpdated))