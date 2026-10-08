local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local viewRecyclerModule = require(parent.ViewRecycler)
local conversationMessageSkeletonListModule = require(appChat.Components.ChatConversation.ConversationMessageSkeletonList)
local messageListContextModule = require(script.Parent.MessageListContext)

local function _(p1)
	-- upvalues: reactModule (ref), conversationMessageSkeletonListModule (ref)
	return if p1 then reactModule.createElement(conversationMessageSkeletonListModule, { size = UDim2.fromScale(1, 1) }) else nil
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), messageListContextModule (ref), conversationMessageSkeletonListModule (ref), foundationModule (ref), viewRecyclerModule (ref)
	return reactModule.createElement(messageListContextModule.Provider, { value = p1.contextValue }, {
		Content = if p1.isLoading then if p1.showLoadingSkeleton then reactModule.createElement(conversationMessageSkeletonListModule, { size = UDim2.fromScale(1, 1) }) else nil else reactModule.createElement(foundationModule.View, { Size = UDim2.fromScale(1, 1) }, {
			List = reactModule.createElement(viewRecyclerModule.VirtualList, p1.listProps),
			Loading = if p1.isListVisible then nil elseif p1.showLoadingSkeleton then reactModule.createElement(conversationMessageSkeletonListModule, { size = UDim2.fromScale(1, 1) }) else nil
		})
	})
end)