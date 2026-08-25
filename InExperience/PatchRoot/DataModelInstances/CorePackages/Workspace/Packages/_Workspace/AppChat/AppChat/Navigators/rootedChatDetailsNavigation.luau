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
	navigateToRootedChatDetails = function(p0, p1)
		-- upvalues: roactNavigationModule (ref), enumScreensModule (ref)
		return roactNavigationModule.Actions.navigate({
			routeName = enumScreensModule.ChatLandingStack,
			params = { conversationId = p0 },
			action = roactNavigationModule.StackActions.reset({
				index = 1,
				actions = {
					roactNavigationModule.Actions.navigate({
						routeName = enumScreensModule.ChatDetails,
						params = {
							isRooted = true,
							conversationId = p0,
							rootedNavigationRequestId = p1
						}
					})
				}
			})
		})
	end
}

local function _(p2)
	return type(p2) == "table" and p2.CreateIterator ~= nil
end

local _ = function(p3)
	return type(p3) == "string" and string.sub(p3, 1, 8) == "friends:"
end

local function normalizeStoreConversationForRodux(p4)
	-- upvalues: dateTime (ref), conversationChannelsModule (ref), cryoModule (ref)
	local lastUpdated = p4.lastUpdated
	local var10 = nil
	
	if typeof(lastUpdated) == "DateTime" then
		var10 = dateTime.fromUnixTimestamp(lastUpdated.UnixTimestamp)
	elseif type(lastUpdated) == "table" and typeof(lastUpdated.dateTime) == "DateTime" then
		var10 = dateTime.fromUnixTimestamp(lastUpdated.dateTime.UnixTimestamp)
	end
	local messages = p4.messages
	local var11 = if type(messages) == "table" and messages.CreateIterator ~= nil then p4.messages else conversationChannelsModule.getEmptyMessages()
	local sendingMessages = p4.sendingMessages
	local var12 = if type(sendingMessages) == "table" and sendingMessages.CreateIterator ~= nil then p4.sendingMessages else conversationChannelsModule.getEmptySendingMessages()
	
	return if var10 == nil and var11 == p4.messages and var12 == p4.sendingMessages then p4 else cryoModule.Dictionary.join(p4, {
		lastUpdated = var10 or lastUpdated,
		messages = var11,
		sendingMessages = var12
	})
end

function t.tryNavigateToRootedChatDetails(p5, p6)
	-- upvalues: getFFlagAppChatEnableRootedNavigationModule (ref), getConversationStoreModule (ref), receivedConversationModule (ref), normalizeStoreConversationForRodux (ref), conversationChannelsModule (ref), t (ref)
	local conversationId = p6 and p6.conversationId
	
	if not conversationId or p6.rooted ~= true or not getFFlagAppChatEnableRootedNavigationModule() then
		return false
	end
	local conversation = getConversationStoreModule(false).getConversation(conversationId, false)
	
	if conversation then
		p5.dispatch(receivedConversationModule(normalizeStoreConversationForRodux(conversation)))
	end
	if conversation == nil and not (type(conversationId) == "string" and string.sub(conversationId, 1, 8) == "friends:") or conversation ~= nil and conversation.source ~= conversationChannelsModule.Source.Friends then
		p5.fetchLatestConversationDetails(conversationId)
	end
	p5.callback(t.navigateToRootedChatDetails(conversationId, p6.rootedNavigationRequestId))
	
	return true
end

return t