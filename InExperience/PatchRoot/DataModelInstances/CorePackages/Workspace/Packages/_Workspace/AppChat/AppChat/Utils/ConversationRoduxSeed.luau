local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local dateTime = require(parent.Time).DateTime
local conversationChannelsModule = require(appChat.Models.ConversationChannels)

local function _(p1)
	return type(p1) == "table" and p1.CreateIterator ~= nil
end

return {
	isFriendsPlaceholderConversationId = function(p1)
		return type(p1) == "string" and string.sub(p1, 1, 8) == "friends:"
	end,
	normalizeStoreConversationForRodux = function(p1)
		-- upvalues: dateTime (ref), conversationChannelsModule (ref), cryoModule (ref)
		local lastUpdated = p1.lastUpdated
		local var1 = nil
		
		if typeof(lastUpdated) == "DateTime" then
			var1 = dateTime.fromUnixTimestamp(lastUpdated.UnixTimestamp)
		elseif type(lastUpdated) == "table" and typeof(lastUpdated.dateTime) == "DateTime" then
			var1 = dateTime.fromUnixTimestamp(lastUpdated.dateTime.UnixTimestamp)
		end
		local messages = p1.messages
		local var2 = if type(messages) == "table" and messages.CreateIterator ~= nil then p1.messages else conversationChannelsModule.getEmptyMessages()
		local sendingMessages = p1.sendingMessages
		local var3 = if type(sendingMessages) == "table" and sendingMessages.CreateIterator ~= nil then p1.sendingMessages else conversationChannelsModule.getEmptySendingMessages()
		
		return if var1 == nil and var2 == p1.messages and var3 == p1.sendingMessages then p1 else cryoModule.Dictionary.join(p1, {
			lastUpdated = var1 or lastUpdated,
			messages = var2,
			sendingMessages = var3
		})
	end
}