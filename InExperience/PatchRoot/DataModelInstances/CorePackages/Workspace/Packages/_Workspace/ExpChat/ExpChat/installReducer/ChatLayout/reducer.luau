local expChat = script:FindFirstAncestor("ExpChat")

return require(expChat.Parent.Rodux).combineReducers({
	Alignment = require(script.Parent.alignment),
	ChatWindowSettings = require(script.Parent.windowSettings),
	ChatInputBarSettings = require(script.Parent.inputBarSettings),
	ChannelTabsSettings = require(expChat.Flags.getFFlagExpChatEnableChannelTabsUI)() and require(script.Parent.channelTabsSettings) or nil
})