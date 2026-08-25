local appChat = script:FindFirstAncestor("AppChat")
local roactNavigationModule = require(appChat.Parent.RoactNavigation)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)
local receivedConversationModule = require(appChat.Conversations.Actions.ReceivedConversation)
local enumScreensModule = require(appChat.EnumScreens)
local getFFlagAppChatEnableRootedNavigationModule = require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)
local conversationRoduxSeedModule = require(appChat.Utils.ConversationRoduxSeed)
local isFriendsPlaceholderConversationId = conversationRoduxSeedModule.isFriendsPlaceholderConversationId
local normalizeStoreConversationForRodux = conversationRoduxSeedModule.normalizeStoreConversationForRodux
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

function t.tryNavigateToRootedChatDetails(p2, p3)
	-- upvalues: getFFlagAppChatEnableRootedNavigationModule (ref), getConversationStoreModule (ref), receivedConversationModule (ref), normalizeStoreConversationForRodux (ref), isFriendsPlaceholderConversationId (ref), conversationChannelsModule (ref), t (ref)
	local conversationId = p3 and p3.conversationId
	
	if not conversationId or p3.rooted ~= true or not getFFlagAppChatEnableRootedNavigationModule() then
		return false
	end
	local conversation = getConversationStoreModule(false).getConversation(conversationId, false)
	
	if conversation then
		p2.dispatch(receivedConversationModule(normalizeStoreConversationForRodux(conversation)))
	end
	if conversation == nil and not isFriendsPlaceholderConversationId(conversationId) or conversation ~= nil and conversation.source ~= conversationChannelsModule.Source.Friends then
		p2.fetchLatestConversationDetails(conversationId)
	end
	p2.callback(t.navigateToRootedChatDetails(conversationId, p3.rootedNavigationRequestId))
	
	return true
end

return t