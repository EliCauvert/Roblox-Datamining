local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local MessageListModule = require(Parent.ChatUIPrimitives.MessageList)
local UseMessageListViewModelModule = require(script.Parent.useMessageListViewModel)

return ReactModule.memo(function(p1)
	-- upvalues: UseMessageListViewModelModule (copy), ReactModule (copy), FoundationModule (copy), MessageListModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full",
		testId = "--social-exp-chat-message-list",
		padding = p1.contentPadding
	}, {
		MessageList = ReactModule.createElement(MessageListModule, (UseMessageListViewModelModule(p1)))
	})
end)