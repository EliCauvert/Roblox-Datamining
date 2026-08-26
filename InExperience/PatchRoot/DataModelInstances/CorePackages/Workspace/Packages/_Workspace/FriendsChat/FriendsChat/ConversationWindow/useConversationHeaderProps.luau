local parent = script:FindFirstAncestor("FriendsChat").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local expChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local getFriendsChatHeaderPropsModule = require(script.Parent.Parent.HeaderBar.getFriendsChatHeaderProps)

local function areSelectedHeaderFieldsEqual(p1, p2)
	-- upvalues: cryoModule (ref)
	if p1 == p2 then
		return true
	elseif p1 == nil or p2 == nil then
		return false
	end
	local var1 = false
	
	if p1.title == p2.title then
		var1 = false
		
		if p1.titleForViewer == p2.titleForViewer then
			var1 = cryoModule.List.equals
			var1 = var1(p1.participants or {}, p2.participants or {})
		end
	end
	return var1
end

return function(p1)
	-- upvalues: expChatConversationListAdapterModule (ref), reactModule (ref), signalsModule (ref), areSelectedHeaderFieldsEqual (ref), signalsReactModule (ref), getFriendsChatHeaderPropsModule (ref)
	local conversationId = p1.conversationId
	local hasConversationId = p1.hasConversationId
	local localUserId = p1.localUserId
	local conversationStore = expChatConversationListAdapterModule.getConversationStore()
	local var1 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), hasConversationId (ref), conversationStore (ref), conversationId (ref), areSelectedHeaderFieldsEqual (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: hasConversationId (copy), conversationStore (copy), conversationId (copy)
			if not hasConversationId then
				return nil
			end
			local conversation = conversationStore.getConversation(conversationId, p2)
			
			return if conversation == nil then nil else {
				title = conversation.title,
				titleForViewer = conversation.titleForViewer,
				participants = conversation.participants
			}
		end, areSelectedHeaderFieldsEqual)
	end, { conversationStore, conversationId, hasConversationId }))
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), getFriendsChatHeaderPropsModule (copy), localUserId (ref)
		return if var1 == nil then nil else getFriendsChatHeaderPropsModule(var1, localUserId)
	end, { var1, localUserId })
end