local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local _DateTime = require(Parent.Time).DateTime
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)

local function _(p1): boolean --[[ Line: 19 | Named "hasIteratorMember" ]]
	return type(p1) == "table" and p1.CreateIterator ~= nil
end

return {
	isFriendsPlaceholderConversationId = function(Text: string): boolean --[[ Line: 25 ]]
		return type(Text) == "string" and string.sub(Text, 1, 8) == "friends:"
	end,
	normalizeStoreConversationForRodux = function(p1) --[[ Line: 29 ]]
		-- upvalues: _DateTime (copy), ConversationChannelsModule (copy), CryoModule (copy)
		local LastUpdated = p1.lastUpdated
		local FromUnixTimestampResult = if typeof(LastUpdated) == "DateTime" then _DateTime.fromUnixTimestamp(LastUpdated.UnixTimestamp) elseif type(LastUpdated) == "table" and typeof(LastUpdated.dateTime) == "DateTime" then _DateTime.fromUnixTimestamp(LastUpdated.dateTime.UnixTimestamp) else nil
		local Messages = p1.messages
		local HasCreateIterator: boolean = type(Messages) == "table" and Messages.CreateIterator ~= nil
		local Messages1 = if HasCreateIterator then p1.messages else ConversationChannelsModule.getEmptyMessages()
		local SendingMessages = p1.sendingMessages
		local HasCreateIterator1: boolean = type(SendingMessages) == "table" and SendingMessages.CreateIterator ~= nil
		local SendingMessages1 = if HasCreateIterator1 then p1.sendingMessages else ConversationChannelsModule.getEmptySendingMessages()
		
		return if FromUnixTimestampResult == nil and Messages1 == p1.messages and SendingMessages1 == p1.sendingMessages then p1 else CryoModule.Dictionary.join(p1, {
			lastUpdated = FromUnixTimestampResult or LastUpdated,
			messages = Messages1,
			sendingMessages = SendingMessages1
		})
	end
}