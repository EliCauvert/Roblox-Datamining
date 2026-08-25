local parent = script:FindFirstAncestor("FriendsChat").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local expChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local getFriendsChatHeaderPropsModule = require(script.Parent.Parent.HeaderBar.getFriendsChatHeaderProps)

local function areSelectedHeaderFieldsEqual(p0, p1)
	-- upvalues: cryoModule (ref)
	if p0 == p1 then
		return true
	elseif p0 == nil or p1 == nil then
		return false
	end
	local var7 = false
	
	if p0.title == p1.title then
		var7 = false
		
		if p0.titleForViewer == p1.titleForViewer then
			var7 = cryoModule.List.equals
			var7 = var7(p0.participants or {}, p1.participants or {})
		end
	end
	return var7
end

return function(p2)
	-- upvalues: expChatConversationListAdapterModule (ref), reactModule (ref), signalsModule (ref), areSelectedHeaderFieldsEqual (ref), signalsReactModule (ref), getFriendsChatHeaderPropsModule (ref)
	local conversationId = p2.conversationId
	local hasConversationId = p2.hasConversationId
	local localUserId = p2.localUserId
	local conversationStore = expChatConversationListAdapterModule.getConversationStore()
	local var9 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), hasConversationId (ref), conversationStore (ref), conversationId (ref), areSelectedHeaderFieldsEqual (copy)
		return signalsModule.createComputed(function(p3)
			-- upvalues: hasConversationId (copy), conversationStore (copy), conversationId (copy)
			if not hasConversationId then
				return nil
			end
			local conversation = conversationStore.getConversation(conversationId, p3)
			
			return if conversation == nil then nil else {
				title = conversation.title,
				titleForViewer = conversation.titleForViewer,
				participants = conversation.participants
			}
		end, areSelectedHeaderFieldsEqual)
	end, { conversationStore, conversationId, hasConversationId }))
	
	return reactModule.useMemo(function()
		-- upvalues: var9 (ref), getFriendsChatHeaderPropsModule (copy), localUserId (ref)
		return if var9 == nil then nil else getFriendsChatHeaderPropsModule(var9, localUserId)
	end, { var9, localUserId })
end