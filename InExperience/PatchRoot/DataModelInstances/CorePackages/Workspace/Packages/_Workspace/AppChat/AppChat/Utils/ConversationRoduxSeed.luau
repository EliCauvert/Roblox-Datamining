local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local dateTime = require(parent.Time).DateTime
local conversationChannelsModule = require(appChat.Models.ConversationChannels)

local function _(p0)
	return type(p0) == "table" and p0.CreateIterator ~= nil
end

return {
	isFriendsPlaceholderConversationId = function(p1)
		return type(p1) == "string" and string.sub(p1, 1, 8) == "friends:"
	end,
	normalizeStoreConversationForRodux = function(p2)
		-- upvalues: dateTime (ref), conversationChannelsModule (ref), cryoModule (ref)
		local lastUpdated = p2.lastUpdated
		local var3 = nil
		
		if typeof(lastUpdated) == "DateTime" then
			var3 = dateTime.fromUnixTimestamp(lastUpdated.UnixTimestamp)
		elseif type(lastUpdated) == "table" and typeof(lastUpdated.dateTime) == "DateTime" then
			var3 = dateTime.fromUnixTimestamp(lastUpdated.dateTime.UnixTimestamp)
		end
		local messages = p2.messages
		local var4 = if type(messages) == "table" and messages.CreateIterator ~= nil then p2.messages else conversationChannelsModule.getEmptyMessages()
		local sendingMessages = p2.sendingMessages
		local var5 = if type(sendingMessages) == "table" and sendingMessages.CreateIterator ~= nil then p2.sendingMessages else conversationChannelsModule.getEmptySendingMessages()
		
		return if var3 == nil and var4 == p2.messages and var5 == p2.sendingMessages then p2 else cryoModule.Dictionary.join(p2, {
			lastUpdated = var3 or lastUpdated,
			messages = var4,
			sendingMessages = var5
		})
	end
}