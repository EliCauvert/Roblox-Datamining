local eventModule = require(script.Parent.event)
local expChat = script:FindFirstAncestor("ExpChat")
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)

return if require(expChat.Parent.SharedFlags).FFlagExpChatUseMessagesStore then function(p0)
	-- upvalues: getMessagesStoreModule (ref)
	getMessagesStoreModule(false).handleLegacyBubbleCreated(p0)
end else eventModule(require(expChat.Actions.LegacyBubbleCreated))