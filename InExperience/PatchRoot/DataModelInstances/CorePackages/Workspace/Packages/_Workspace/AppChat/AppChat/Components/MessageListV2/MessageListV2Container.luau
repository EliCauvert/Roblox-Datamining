local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local MessageListV2ViewModule = require(script.Parent.MessageListV2View)
local UseMessageListV2ViewModelModule = require(script.Parent.useMessageListV2ViewModel)

local function ConversationMessageList(p1)
	-- upvalues: UseMessageListV2ViewModelModule (copy), ReactModule (copy), MessageListV2ViewModule (copy)
	return ReactModule.createElement(MessageListV2ViewModule, (UseMessageListV2ViewModelModule(p1)))
end

return ReactModule.memo(function(Tbl)
	-- upvalues: ReactModule (copy), ConversationMessageList (copy)
	local Copy = table.clone(Tbl)
	Copy.key = Tbl.conversationId
	
	return ReactModule.createElement(ConversationMessageList, Copy)
end)