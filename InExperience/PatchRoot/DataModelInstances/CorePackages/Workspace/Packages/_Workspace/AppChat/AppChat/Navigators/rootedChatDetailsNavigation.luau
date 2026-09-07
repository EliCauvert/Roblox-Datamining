local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local roactNavigationModule = require(parent.RoactNavigation)
local dateTime = require(parent.Time).DateTime
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)
local receivedConversationModule = require(appChat.Conversations.Actions.ReceivedConversation)
local enumScreensModule = require(appChat.EnumScreens)
local getFFlagAppChatEnableRootedNavigationModule = require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)
local t = {
	navigateToRootedChatDetails = function(p1, p2)
		-- upvalues: roactNavigationModule (ref), enumScreensModule (ref)
		return roactNavigationModule.Actions.navigate({
			routeName = enumScreensModule.ChatLandingStack,
			params = { conversationId = p1 },
			action = roactNavigationModule.StackActions.reset({
				index = 1,
				actions = {
					roactNavigationModule.Actions.navigate({
						routeName = enumScreensModule.ChatDetails,
						params = {
							isRooted = true,
							conversationId = p1,
							rootedNavigationRequestId = p2
						}
					})
				}
			})
		})
	end
}

local function _(p1)
	return type(p1) == "table" and p1.CreateIterator ~= nil
end

local _ = function(p1)
	return type(p1) == "string" and string.sub(p1, 1, 8) == "friends:"
end

local function normalizeStoreConversationForRodux(p1)
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

function t.tryNavigateToRootedChatDetails(p1, p2)
	-- upvalues: getFFlagAppChatEnableRootedNavigationModule (ref), getConversationStoreModule (ref), receivedConversationModule (ref), normalizeStoreConversationForRodux (ref), conversationChannelsModule (ref), t (ref)
	local conversationId = p2 and p2.conversationId
	
	if not conversationId or p2.rooted ~= true or not getFFlagAppChatEnableRootedNavigationModule() then
		return false
	end
	local conversation = getConversationStoreModule(false).getConversation(conversationId, false)
	
	if conversation then
		p1.dispatch(receivedConversationModule(normalizeStoreConversationForRodux(conversation)))
	end
	if conversation == nil and not (type(conversationId) == "string" and string.sub(conversationId, 1, 8) == "friends:") or conversation ~= nil and conversation.source ~= conversationChannelsModule.Source.Friends then
		p1.fetchLatestConversationDetails(conversationId)
	end
	p1.callback(t.navigateToRootedChatDetails(conversationId, p2.rootedNavigationRequestId))
	
	return true
end

return t