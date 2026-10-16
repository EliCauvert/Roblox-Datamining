local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local ConversationChannelsModule = require(Parent.AppChat.ConversationChannels)
local ExpChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)

local function _(Invalid) --[[ Line: 29 | Named "toConversationModerationType" ]]
	-- upvalues: ConversationChannelsModule (copy)
	return if Invalid == ConversationChannelsModule.ModerationType.TrustedComms or Invalid == ConversationChannelsModule.ModerationType.Moderated or Invalid == ConversationChannelsModule.ModerationType.Invalid or Invalid == ConversationChannelsModule.ModerationType.UnknownType then Invalid else nil
end

return function(p1) --[[ Line: 41 | Named "useConversationModerationType" ]]
	-- upvalues: ExpChatConversationListAdapterModule (copy), ReactModule (copy), SignalsModule (copy), ConversationChannelsModule (copy), SignalsReactModule (copy)
	local ConversationId = p1.conversationId
	local HasConversationId = p1.hasConversationId
	local ConversationStore = ExpChatConversationListAdapterModule.getConversationStore()
	
	return (SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 46 ]]
		-- upvalues: SignalsModule (upval), HasConversationId (copy), ConversationStore (copy), ConversationId (copy), ConversationChannelsModule (upval)
		return SignalsModule.createComputed(function(p2) --[[ Line: 47 ]]
			-- upvalues: HasConversationId (upval), ConversationStore (upval), ConversationId (upval), ConversationChannelsModule (upval)
			if not HasConversationId then
				return nil
			end
			local Conversation = ConversationStore.getConversation(ConversationId, p2)
			
			if Conversation == nil then
				return nil
			else
				local ModerationType = Conversation.moderationType
				
				return if ModerationType == ConversationChannelsModule.ModerationType.TrustedComms or ModerationType == ConversationChannelsModule.ModerationType.Moderated or ModerationType == ConversationChannelsModule.ModerationType.Invalid or ModerationType == ConversationChannelsModule.ModerationType.UnknownType then ModerationType else nil
			end
		end)
	end, { ConversationStore, ConversationId, HasConversationId }))))
end