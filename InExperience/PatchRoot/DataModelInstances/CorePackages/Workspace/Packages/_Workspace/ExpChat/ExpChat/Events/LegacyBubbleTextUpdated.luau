local eventModule = require(script.Parent.event)
local expChat = script:FindFirstAncestor("ExpChat")
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)

return if require(expChat.Parent.SharedFlags).FFlagExpChatUseMessagesStore then function(p0, p1) --[[ line: 14 ]]
	-- upvalues: getMessagesStoreModule (ref)
	getMessagesStoreModule(false).handleLegacyBubbleTextUpdated(p0, p1)
end else eventModule(require(expChat.Actions.LegacyBubbleTextUpdated))