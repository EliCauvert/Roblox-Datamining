local _ = require(script.Parent.types)

return {
	name = script.Name,
	alias = { "/clear", "/cls" },
	clientRun = function(_, _, _, p1)
		if p1 and p1.messagesStore then
			p1.messagesStore.clearWindowMessages()
		else
			return {
				key = "CoreScripts.TextChat.MessageStatus.Warning.Unknown",
				metadata = "Roblox.Clear.Error.ContextNotAvailable",
				args = {}
			}
		end
		return { key = "", metadata = "Roblox.Clear.Info.Success" }
	end
}