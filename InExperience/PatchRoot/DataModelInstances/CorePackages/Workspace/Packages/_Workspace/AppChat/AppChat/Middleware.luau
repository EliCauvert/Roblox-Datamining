local appChat = script:FindFirstAncestor("AppChat")

return {
	ChatModerationStatusHydrationMiddleware = require(script.ChatModerationStatusHydrationMiddleware),
	SignalsConversationMiddleware = require(script.SignalsConversationMiddleware),
	SignalsFriendsChatSettingsMiddleware = if require(appChat.Flags.FFlagAppChatFriendsTabIxpEnabled) or require(appChat.Parent.SharedFlags).FFlagExpChatEnableFriendsTab then require(script.SignalsFriendsChatSettingsMiddleware) else nil,
	SignalsMessageIngestionMiddleware = require(script.SignalsMessageIngestionMiddleware),
	SignalsUnreadMessageCountMiddleware = require(script.SignalsUnreadMessageCountMiddleware)
}