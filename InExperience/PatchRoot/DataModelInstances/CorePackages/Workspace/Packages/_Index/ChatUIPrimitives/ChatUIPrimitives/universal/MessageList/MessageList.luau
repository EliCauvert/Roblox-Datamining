local ReactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)
local MessageListViewModule = require(script.Parent.MessageListView)
local ObservingUserContextModule = require(script.Parent.ObservingUserContext)
local UseMessageListViewModelModule = require(script.Parent.useMessageListViewModel)

return ReactModule.memo(function(p1) --[[ Line: 13 | Named "MessageList" ]]
	-- upvalues: UseMessageListViewModelModule (copy), ReactModule (copy), ObservingUserContextModule (copy), MessageListViewModule (copy)
	return ReactModule.createElement(ObservingUserContextModule.Context.Provider, {
		value = if p1.observingUserId == "" then nil else p1.observingUserId
	}, {
		MessageListView = ReactModule.createElement(MessageListViewModule, (UseMessageListViewModelModule(p1)))
	})
end)