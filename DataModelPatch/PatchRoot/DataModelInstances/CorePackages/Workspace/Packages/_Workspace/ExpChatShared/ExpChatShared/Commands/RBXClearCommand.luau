local ExpChatShared = script:FindFirstAncestor("ExpChatShared")
local ChatWindowMessagesClearedModule = require(ExpChatShared.Actions.ChatWindowMessagesCleared)
local FFlagExpChatUseMessagesStore = require(ExpChatShared.Parent.SharedFlags).FFlagExpChatUseMessagesStore
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/clear", "/cls" },
	clientRun = function(p1, _, _, p2)
		-- upvalues: FFlagExpChatUseMessagesStore (copy), ChatWindowMessagesClearedModule (copy)
		if FFlagExpChatUseMessagesStore then
			if not p2 or not p2.messagesStore then
				return {
					key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
					metadata = "Roblox.Clear.Error.ContextNotAvailable",
					args = {}
				}
			end
			p2.messagesStore.clearWindowMessages()
		else
			p1:dispatch(ChatWindowMessagesClearedModule())
		end
		return { key = "", metadata = "Roblox.Clear.Info.Success" }
	end
}