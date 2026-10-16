local _ = require(script.Parent.types)
local ExpChatLocalUserCountEnabledEngineFeature = game:GetEngineFeature("ExpChatLocalUserCountEnabled")
local ExpChatEnableVirtualLocalOnlineCommand = game:DefineFastFlag("ExpChatEnableVirtualLocalOnlineCommand", false)

return {
	name = script.Name,
	alias = { "/help", "/?" },
	clientRun = function() --[[ Line: 9 ]]
		-- upvalues: ExpChatLocalUserCountEnabledEngineFeature (copy), ExpChatEnableVirtualLocalOnlineCommand (copy)
		return if ExpChatLocalUserCountEnabledEngineFeature and ExpChatEnableVirtualLocalOnlineCommand then {
			metadata = "Roblox.Help.Info",
			args = nil,
			key = {
				"CoreScripts.TextChat.Help.FirstLine",
				"CoreScripts.TextChat.Clear.Help.Description",
				"InGame.UnknownNamespace.GameChat_ChatCommandsTeller_MuteCommand",
				"CoreScripts.TextChat.Online.Help.Description3",
				"InGame.UnknownNamespace.GameChat_ChatCommandsTeller_TeamCommand",
				"InGame.UnknownNamespace.GameChat_ChatCommandsTeller_UnMuteCommand",
				"InGame.UnknownNamespace.GameChat_ChatCommandsTeller_WhisperCommand"
			}
		} else {
			metadata = "Roblox.Help.Info",
			args = nil,
			key = {
				"CoreScripts.TextChat.Help.FirstLine",
				"InGame.UnknownNamespace.GameChat_ChatCommandsTeller_WhisperCommand",
				"InGame.UnknownNamespace.GameChat_ChatCommandsTeller_TeamCommand",
				"InGame.UnknownNamespace.GameChat_ChatCommandsTeller_MuteCommand",
				"InGame.UnknownNamespace.GameChat_ChatCommandsTeller_UnMuteCommand",
				"CoreScripts.TextChat.Clear.Help.Description"
			}
		}
	end
}