local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local FriendsChatMessageListModule = require(script.Parent.FriendsChatMessageList)
local _ = require(script.Parent.useConversationHeaderFadeLayout)
local UseConversationMessagePoolModule = require(script.Parent.useConversationMessagePool)
local FFlagFriendsChatOsaSystemMessage = require(Parent.SharedFlags).FFlagFriendsChatOsaSystemMessage

return function(p1)
	-- upvalues: UseConversationMessagePoolModule (copy), ReactModule (copy), FriendsChatMessageListModule (copy), FFlagFriendsChatOsaSystemMessage (copy)
	local FadeLayout = p1.fadeLayout
	
	return ReactModule.createElement(FriendsChatMessageListModule, {
		layoutOrder = p1.layoutOrder,
		conversationId = p1.conversationId,
		scrollViewChildrenSignal = UseConversationMessagePoolModule({
			conversationId = p1.conversationId,
			shouldReadMessages = p1.hasConversationId,
			chatWindowSettings = p1.hostChatWindowSettings,
			textTransparency = p1.textTransparency,
			isSpatialUIEnabled = p1.isSpatialUIEnabled
		}),
		contentTopPadding = FadeLayout.contentTopPadding,
		messageFadeSequence = FadeLayout.messageFadeSequence,
		onCanvasPositionChanged = FadeLayout.onMessageCanvasPositionChanged,
		onViewportAbsoluteSizeChanged = FadeLayout.onMessageViewportAbsoluteSizeChanged,
		chatWindowSettings = p1.chatWindowSettings,
		transparencyValue = p1.transparencyValue,
		textTransparency = p1.textTransparency,
		isSpatialUIEnabled = p1.isSpatialUIEnabled,
		isChannelBarVisible = p1.isChannelBarVisible,
		scrollToTopOnReset = if FFlagFriendsChatOsaSystemMessage then p1.shouldOpenToOsaSystemMessage else nil,
		onHovered = p1.onHovered,
		onUnhovered = p1.onUnhovered,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		onAbsolutePositionChanged = p1.onAbsolutePositionChanged
	})
end