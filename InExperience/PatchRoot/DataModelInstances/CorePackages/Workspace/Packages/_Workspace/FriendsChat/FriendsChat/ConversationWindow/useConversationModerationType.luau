local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local conversationChannelsModule = require(parent.AppChat.ConversationChannels)
local expChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)

local function _(p0) --[[ line: 29 | named "toConversationModerationType" ]]
	-- upvalues: conversationChannelsModule (ref)
	return if p0 == conversationChannelsModule.ModerationType.TrustedComms or p0 == conversationChannelsModule.ModerationType.Moderated or (p0 == conversationChannelsModule.ModerationType.Invalid or p0 == conversationChannelsModule.ModerationType.UnknownType) then p0 else nil
end

return function(p1) --[[ line: 41 | named "useConversationModerationType" ]]
	-- upvalues: expChatConversationListAdapterModule (ref), reactModule (ref), signalsModule (ref), conversationChannelsModule (ref), signalsReactModule (ref)
	local conversationId = p1.conversationId
	local hasConversationId = p1.hasConversationId
	local conversationStore = expChatConversationListAdapterModule.getConversationStore()
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 46 ]]
		-- upvalues: signalsModule (copy), hasConversationId (ref), conversationStore (ref), conversationId (ref), conversationChannelsModule (copy)
		return signalsModule.createComputed(function(p2) --[[ line: 47 ]]
			-- upvalues: hasConversationId (copy), conversationStore (copy), conversationId (copy), conversationChannelsModule (copy)
			if not hasConversationId then
				return nil
			end
			local conversation = conversationStore.getConversation(conversationId, p2)
			
			if conversation == nil then
				return nil
			end
			local moderationType = conversation.moderationType
			
			return if moderationType == conversationChannelsModule.ModerationType.TrustedComms or moderationType == conversationChannelsModule.ModerationType.Moderated or (moderationType == conversationChannelsModule.ModerationType.Invalid or moderationType == conversationChannelsModule.ModerationType.UnknownType) then moderationType else nil
		end)
	end, { conversationStore, conversationId, hasConversationId }))
end