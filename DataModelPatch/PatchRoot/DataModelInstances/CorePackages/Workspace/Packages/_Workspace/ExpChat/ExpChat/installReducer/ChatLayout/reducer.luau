local ExpChat = script:FindFirstAncestor("ExpChat")

return require(ExpChat.Parent.Rodux).combineReducers({
	Alignment = require(script.Parent.alignment),
	ChatWindowSettings = require(script.Parent.windowSettings),
	ChatInputBarSettings = require(script.Parent.inputBarSettings),
	ChannelTabsSettings = require(ExpChat.Flags.getFFlagExpChatEnableChannelTabsUI)() and require(script.Parent.channelTabsSettings) or nil
})