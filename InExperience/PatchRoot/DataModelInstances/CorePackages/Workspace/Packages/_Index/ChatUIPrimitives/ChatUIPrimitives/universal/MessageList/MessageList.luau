local reactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)
local messageListViewModule = require(script.Parent.MessageListView)
local useMessageListViewModelModule = require(script.Parent.useMessageListViewModel)

return reactModule.memo(function(p1)
	-- upvalues: useMessageListViewModelModule (ref), reactModule (ref), messageListViewModule (ref)
	return reactModule.createElement(messageListViewModule, useMessageListViewModelModule(p1))
end)