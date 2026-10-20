local Parent = script:FindFirstAncestor("FriendsChat").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local ExpChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local GetFriendsChatHeaderPropsModule = require(script.Parent.Parent.HeaderBar.getFriendsChatHeaderProps)

local function areSelectedHeaderFieldsEqual(p1, p2)
	-- upvalues: CryoModule (copy)
	return p1 == p2 or p1 ~= nil and p2 ~= nil and (p1.title == p2.title and p1.titleForViewer == p2.titleForViewer and CryoModule.List.equals(p1.participants or {}, p2.participants or {}))
end

return function(p1)
	-- upvalues: ExpChatConversationListAdapterModule (copy), ReactModule (copy), SignalsModule (copy), areSelectedHeaderFieldsEqual (copy), SignalsReactModule (copy), GetFriendsChatHeaderPropsModule (copy)
	local ConversationId = p1.conversationId
	local HasConversationId = p1.hasConversationId
	local LocalUserId = p1.localUserId
	local ConversationStore = ExpChatConversationListAdapterModule.getConversationStore()
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), HasConversationId (copy), ConversationStore (copy), ConversationId (copy), areSelectedHeaderFieldsEqual (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: HasConversationId (upval), ConversationStore (upval), ConversationId (upval)
			if HasConversationId then
				local Conversation = ConversationStore.getConversation(ConversationId, p2)
				
				return if Conversation == nil then nil else {
					title = Conversation.title,
					titleForViewer = Conversation.titleForViewer,
					participants = Conversation.participants
				}
			else
				return nil
			end
		end, areSelectedHeaderFieldsEqual)
	end, { ConversationStore, ConversationId, HasConversationId })))
	
	return ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), GetFriendsChatHeaderPropsModule (upval), LocalUserId (copy)
		return if UseSignalStateResult == nil then nil else GetFriendsChatHeaderPropsModule(UseSignalStateResult, LocalUserId)
	end, { UseSignalStateResult, LocalUserId })
end