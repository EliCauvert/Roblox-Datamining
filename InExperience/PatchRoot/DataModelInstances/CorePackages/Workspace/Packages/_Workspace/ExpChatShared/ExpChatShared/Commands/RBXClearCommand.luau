local expChatShared = script:FindFirstAncestor("ExpChatShared")
local chatWindowMessagesClearedModule = require(expChatShared.Actions.ChatWindowMessagesCleared)
local fFlagExpChatUseMessagesStore = require(expChatShared.Parent.SharedFlags).FFlagExpChatUseMessagesStore
local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/clear", "/cls" },
	clientRun = function(p0, _, _, p1) --[[ line: 14 ]]
		-- upvalues: fFlagExpChatUseMessagesStore (ref), chatWindowMessagesClearedModule (ref)
		if fFlagExpChatUseMessagesStore then
			if not p1 or not p1.messagesStore then
				return {
					key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
					metadata = "Roblox.Clear.Error.ContextNotAvailable",
					args = {}
				}
			end
			p1.messagesStore.clearWindowMessages()
		else
			p0:dispatch(chatWindowMessagesClearedModule())
		end
		return { key = "", metadata = "Roblox.Clear.Info.Success" }
	end
}