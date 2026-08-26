local expChatShared = script:FindFirstAncestor("ExpChatShared")
local chatWindowMessagesClearedModule = require(expChatShared.Actions.ChatWindowMessagesCleared)
local fFlagExpChatUseMessagesStore = require(expChatShared.Parent.SharedFlags).FFlagExpChatUseMessagesStore
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/clear", "/cls" },
	clientRun = function(p1, _, _, p2)
		-- upvalues: fFlagExpChatUseMessagesStore (ref), chatWindowMessagesClearedModule (ref)
		if fFlagExpChatUseMessagesStore then
			if not p2 or not p2.messagesStore then
				return {
					key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
					metadata = "Roblox.Clear.Error.ContextNotAvailable",
					args = {}
				}
			end
			p2.messagesStore.clearWindowMessages()
		else
			p1:dispatch(chatWindowMessagesClearedModule())
		end
		return { key = "", metadata = "Roblox.Clear.Info.Success" }
	end
}