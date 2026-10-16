local ReactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)
local MessageListViewModule = require(script.Parent.MessageListView)
local UseMessageListViewModelModule = require(script.Parent.useMessageListViewModel)

return ReactModule.memo(function(p1) --[[ Line: 12 | Named "MessageList" ]]
	-- upvalues: UseMessageListViewModelModule (copy), ReactModule (copy), MessageListViewModule (copy)
	return ReactModule.createElement(MessageListViewModule, (UseMessageListViewModelModule(p1)))
end)