local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/clear", "/cls" },
	clientRun = function(_, _, _, p1)
		if not p1 or not p1.messagesStore then
			return {
				key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
				metadata = "Roblox.Clear.Error.ContextNotAvailable",
				args = {}
			}
		end
		p1.messagesStore.clearWindowMessages()
		return { key = "", metadata = "Roblox.Clear.Info.Success" }
	end
}