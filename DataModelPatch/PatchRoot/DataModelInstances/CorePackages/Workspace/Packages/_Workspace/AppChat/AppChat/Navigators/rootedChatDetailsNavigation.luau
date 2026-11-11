local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local RoactNavigationModule = require(Parent.RoactNavigation)
local _DateTime = require(Parent.Time).DateTime
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local ReceivedConversationModule = require(AppChat.Conversations.Actions.ReceivedConversation)
local EnumScreensModule = require(AppChat.EnumScreens)
local GetFFlagAppChatEnableRootedNavigationModule = require(AppChat.Flags.getFFlagAppChatEnableRootedNavigation)

local function _(p1): boolean
	return type(p1) == "table" and p1.CreateIterator ~= nil
end

local _ = function(Text: string): boolean
	return type(Text) == "string" and string.sub(Text, 1, 8) == "friends:"
end

local function normalizeStoreConversationForRodux(Conversation)
	-- upvalues: _DateTime (copy), ConversationChannelsModule (copy), CryoModule (copy)
	local LastUpdated = Conversation.lastUpdated
	local FromUnixTimestampResult = if typeof(LastUpdated) == "DateTime" then _DateTime.fromUnixTimestamp(LastUpdated.UnixTimestamp) elseif type(LastUpdated) == "table" and typeof(LastUpdated.dateTime) == "DateTime" then _DateTime.fromUnixTimestamp(LastUpdated.dateTime.UnixTimestamp) else nil
	local Messages = Conversation.messages
	local HasCreateIterator: boolean = type(Messages) == "table" and Messages.CreateIterator ~= nil
	local Messages1 = if HasCreateIterator then Conversation.messages else ConversationChannelsModule.getEmptyMessages()
	local SendingMessages = Conversation.sendingMessages
	local HasCreateIterator1: boolean = type(SendingMessages) == "table" and SendingMessages.CreateIterator ~= nil
	local SendingMessages1 = if HasCreateIterator1 then Conversation.sendingMessages else ConversationChannelsModule.getEmptySendingMessages()
	
	return if FromUnixTimestampResult == nil and Messages1 == Conversation.messages and SendingMessages1 == Conversation.sendingMessages then Conversation else CryoModule.Dictionary.join(Conversation, {
		lastUpdated = FromUnixTimestampResult or LastUpdated,
		messages = Messages1,
		sendingMessages = SendingMessages1
	})
end

local RootedChatDetailsNavigationModule = {
	navigateToRootedChatDetails = function(ConversationId)
		-- upvalues: RoactNavigationModule (copy), EnumScreensModule (copy)
		return RoactNavigationModule.Actions.navigate({
			routeName = EnumScreensModule.ChatLandingStack,
			params = { conversationId = ConversationId },
			action = RoactNavigationModule.StackActions.reset({
				index = 1,
				actions = {
					RoactNavigationModule.Actions.navigate({
						routeName = EnumScreensModule.ChatDetails,
						params = { isRooted = true, conversationId = ConversationId }
					})
				}
			})
		})
	end
}

function RootedChatDetailsNavigationModule.tryNavigateToRootedChatDetails(p1, p2): boolean
	-- upvalues: GetFFlagAppChatEnableRootedNavigationModule (copy), GetConversationStoreModule (copy), ReceivedConversationModule (copy), normalizeStoreConversationForRodux (copy), ConversationChannelsModule (copy), RootedChatDetailsNavigationModule (copy)
	local ConversationId = p2 and p2.conversationId
	
	if not ConversationId or p2.rooted ~= true or not GetFFlagAppChatEnableRootedNavigationModule() then
		return false
	end
	local Conversation = GetConversationStoreModule(false).getConversation(ConversationId, false)
	
	if Conversation then
		p1.dispatch(ReceivedConversationModule(normalizeStoreConversationForRodux(Conversation)))
	end
	if Conversation == nil and (type(ConversationId) ~= "string" or string.sub(ConversationId, 1, 8) ~= "friends:") or Conversation ~= nil and Conversation.source ~= ConversationChannelsModule.Source.Friends then
		p1.fetchLatestConversationDetails(ConversationId)
	end
	p1.callback(RootedChatDetailsNavigationModule.navigateToRootedChatDetails(ConversationId))
	
	return true
end

return RootedChatDetailsNavigationModule