local AppChat = script:FindFirstAncestor("AppChat")
local RoactNavigationModule = require(AppChat.Parent.RoactNavigation)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local ReceivedConversationModule = require(AppChat.Conversations.Actions.ReceivedConversation)
local EnumScreensModule = require(AppChat.EnumScreens)
local GetFFlagAppChatEnableRootedNavigationModule = require(AppChat.Flags.getFFlagAppChatEnableRootedNavigation)
local ConversationRoduxSeedModule = require(AppChat.Utils.ConversationRoduxSeed)
local IsFriendsPlaceholderConversationIdFunction = ConversationRoduxSeedModule.isFriendsPlaceholderConversationId
local NormalizeStoreConversationForRoduxFunction = ConversationRoduxSeedModule.normalizeStoreConversationForRodux
local RootedChatDetailsNavigationModule = {
	navigateToRootedChatDetails = function(ConversationId, RootedNavigationRequestId) --[[ Line: 17 ]]
		-- upvalues: RoactNavigationModule (copy), EnumScreensModule (copy)
		return RoactNavigationModule.Actions.navigate({
			routeName = EnumScreensModule.ChatLandingStack,
			params = { conversationId = ConversationId },
			action = RoactNavigationModule.StackActions.reset({
				index = 1,
				actions = {
					RoactNavigationModule.Actions.navigate({
						routeName = EnumScreensModule.ChatDetails,
						params = {
							isRooted = true,
							conversationId = ConversationId,
							rootedNavigationRequestId = RootedNavigationRequestId
						}
					})
				}
			})
		})
	end
}

function RootedChatDetailsNavigationModule.tryNavigateToRootedChatDetails(p1, p2): boolean --[[ Line: 44 ]]
	-- upvalues: GetFFlagAppChatEnableRootedNavigationModule (copy), GetConversationStoreModule (copy), ReceivedConversationModule (copy), NormalizeStoreConversationForRoduxFunction (copy), IsFriendsPlaceholderConversationIdFunction (copy), ConversationChannelsModule (copy), RootedChatDetailsNavigationModule (copy)
	local ConversationId = p2 and p2.conversationId
	
	if not ConversationId or p2.rooted ~= true or not GetFFlagAppChatEnableRootedNavigationModule() then
		return false
	end
	local Conversation = GetConversationStoreModule(false).getConversation(ConversationId, false)
	
	if Conversation then
		p1.dispatch(ReceivedConversationModule(NormalizeStoreConversationForRoduxFunction(Conversation)))
	end
	if Conversation == nil and not IsFriendsPlaceholderConversationIdFunction(ConversationId) or Conversation ~= nil and Conversation.source ~= ConversationChannelsModule.Source.Friends then
		p1.fetchLatestConversationDetails(ConversationId)
	end
	p1.callback(RootedChatDetailsNavigationModule.navigateToRootedChatDetails(ConversationId, p2.rootedNavigationRequestId))
	
	return true
end

return RootedChatDetailsNavigationModule