local _ = require(script.Parent.types)
local expChatEnableGlobalOnlineCommand = game:DefineFastFlag("ExpChatEnableGlobalOnlineCommand", false)
local expChatGlobalUserCountEnabledEngineFeature = game:GetEngineFeature("ExpChatGlobalUserCountEnabled")

return {
	name = script.Name,
	alias = { "/help" },
	clientRun = function() --[[ line: 9 ]]
		-- upvalues: expChatGlobalUserCountEnabledEngineFeature (ref), expChatEnableGlobalOnlineCommand (ref)
		return if expChatGlobalUserCountEnabledEngineFeature and expChatEnableGlobalOnlineCommand then {
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