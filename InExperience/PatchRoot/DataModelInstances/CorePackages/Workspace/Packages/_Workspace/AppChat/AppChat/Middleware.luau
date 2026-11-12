local AppChat = script:FindFirstAncestor("AppChat")
local FFlagExpChatEnableFriendsTab = require(AppChat.Parent.SharedFlags).FFlagExpChatEnableFriendsTab

return {
	ChatModerationStatusHydrationMiddleware = require(script.ChatModerationStatusHydrationMiddleware),
	SignalsConversationMiddleware = require(script.SignalsConversationMiddleware),
	SignalsFriendsChatSettingsMiddleware = if require(AppChat.Flags.FFlagAppChatFriendsTabIxpEnabled) or FFlagExpChatEnableFriendsTab then require(script.SignalsFriendsChatSettingsMiddleware) else nil,
	SignalsMessageIngestionMiddleware = require(script.SignalsMessageIngestionMiddleware),
	SignalsUnreadMessageCountMiddleware = require(script.SignalsUnreadMessageCountMiddleware)
}