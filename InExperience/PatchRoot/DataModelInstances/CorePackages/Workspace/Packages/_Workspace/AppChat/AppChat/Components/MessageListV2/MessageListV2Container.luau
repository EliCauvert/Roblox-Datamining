local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local messageListV2ViewModule = require(script.Parent.MessageListV2View)
local useMessageListV2ViewModelModule = require(script.Parent.useMessageListV2ViewModel)

local function ConversationMessageList(p1)
	-- upvalues: useMessageListV2ViewModelModule (ref), reactModule (ref), messageListV2ViewModule (ref)
	return reactModule.createElement(messageListV2ViewModule, useMessageListV2ViewModelModule(p1))
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), ConversationMessageList (ref)
	local cloned = table.clone(p1)
	cloned.key = p1.conversationId
	
	return reactModule.createElement(ConversationMessageList, cloned)
end)