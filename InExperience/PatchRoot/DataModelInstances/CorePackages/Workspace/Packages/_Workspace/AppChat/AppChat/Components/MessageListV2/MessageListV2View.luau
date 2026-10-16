local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local ConversationMessageSkeletonListModule = require(AppChat.Components.ChatConversation.ConversationMessageSkeletonList)
local MessageListContextModule = require(script.Parent.MessageListContext)

local function _(p1) --[[ Line: 20 | Named "renderLoading" ]]
	-- upvalues: ReactModule (copy), ConversationMessageSkeletonListModule (copy)
	return if p1 then ReactModule.createElement(ConversationMessageSkeletonListModule, { size = UDim2.fromScale(1, 1) }) else nil
end

return ReactModule.memo(function(p1) --[[ Line: 29 | Named "MessageListV2View" ]]
	-- upvalues: ReactModule (copy), MessageListContextModule (copy), ConversationMessageSkeletonListModule (copy), FoundationModule (copy), ViewRecyclerModule (copy)
	return ReactModule.createElement(MessageListContextModule.Provider, { value = p1.contextValue }, {
		Content = if p1.isLoading then if p1.showLoadingSkeleton then ReactModule.createElement(ConversationMessageSkeletonListModule, { size = UDim2.fromScale(1, 1) }) else nil else ReactModule.createElement(FoundationModule.View, { Size = UDim2.fromScale(1, 1) }, {
			List = ReactModule.createElement(ViewRecyclerModule.VirtualList, p1.listProps),
			Loading = if p1.isListVisible then nil elseif p1.showLoadingSkeleton then ReactModule.createElement(ConversationMessageSkeletonListModule, { size = UDim2.fromScale(1, 1) }) else nil
		})
	})
end)