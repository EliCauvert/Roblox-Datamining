local _ = require(script.Parent.types)
local ExpChatEnableGlobalOnlineCommand = game:DefineFastFlag("ExpChatEnableGlobalOnlineCommand", false)
local ExpChatGlobalUserCountEnabledEngineFeature = game:GetEngineFeature("ExpChatGlobalUserCountEnabled")

return {
	name = script.Name,
	alias = { "/help" },
	clientRun = function() --[[ Line: 9 ]]
		-- upvalues: ExpChatGlobalUserCountEnabledEngineFeature (copy), ExpChatEnableGlobalOnlineCommand (copy)
		return if ExpChatGlobalUserCountEnabledEngineFeature and ExpChatEnableGlobalOnlineCommand then {
			metadata = "Roblox.GlobalHelp.Info",
			args = nil,
			key = {
				"CoreScripts.TextChat.Help.FirstLine",
				"CoreScripts.TextChat.Clear.Help.Description",
				"CoreScripts.TextChat.ChatCommands.Mute.Description",
				"CoreScripts.TextChat.Online.Help.Description3",
				"CoreScripts.TextChat.ChatCommands.Unmute.Description"
			}
		} else {
			metadata = "Roblox.GlobalHelp.Info",
			args = nil,
			key = {
				"CoreScripts.TextChat.Help.FirstLine",
				"CoreScripts.TextChat.ChatCommands.Mute.Description",
				"CoreScripts.TextChat.ChatCommands.Unmute.Description",
				"CoreScripts.TextChat.Clear.Help.Description"
			}
		}
	end
}