local RBXConsoleCommandModule = require(script.RBXConsoleCommand)
local RBXHelpCommandModule = require(script.RBXHelpCommand)
local RBXMuteCommandModule = require(script.RBXMuteCommand)
local RBXUnmuteCommandModule = require(script.RBXUnmuteCommand)
local RBXVersionCommandModule = require(script.RBXVersionCommand)
local RBXEmoteCommandModule = require(script.RBXEmoteCommand)
local RBXTeamCommandModule = require(script.RBXTeamCommand)
local RBXClearCommandModule = require(script.RBXClearCommand)
local RBXOnlineCommandModule = require(script.RBXOnlineCommand)
local ExpChatLocalUserCountEnabledEngineFeature = game:GetEngineFeature("ExpChatLocalUserCountEnabled")
local ExpChatEnableVirtualLocalOnlineCommand = game:DefineFastFlag("ExpChatEnableVirtualLocalOnlineCommand", false)
local _ = require(script.types)

return {
	enabledCommands = {
		RBXConsoleCommandModule, RBXHelpCommandModule, RBXMuteCommandModule,
		RBXUnmuteCommandModule, RBXVersionCommandModule, RBXEmoteCommandModule,
		RBXTeamCommandModule, require(script.Whisper).RBXWhisperCommand,
		RBXClearCommandModule
	},
	getVirtualLocalEnabledCommands = function()
		-- upvalues: ExpChatLocalUserCountEnabledEngineFeature (copy), ExpChatEnableVirtualLocalOnlineCommand (copy), RBXOnlineCommandModule (copy)
		local List = {}
		
		if ExpChatLocalUserCountEnabledEngineFeature and ExpChatEnableVirtualLocalOnlineCommand then
			table.insert(List, RBXOnlineCommandModule)
		end
		return List
	end,
	autoCastCommand = require(script.autoCastCommand),
	RBXClearCommand = RBXClearCommandModule,
	RBXConsoleCommand = RBXConsoleCommandModule,
	RBXEmoteCommand = RBXEmoteCommandModule,
	RBXHelpCommand = RBXHelpCommandModule,
	RBXMuteCommand = RBXMuteCommandModule,
	RBXTeamCommand = RBXTeamCommandModule,
	RBXUnmuteCommand = RBXUnmuteCommandModule,
	RBXVersionCommand = RBXVersionCommandModule,
	Whisper = require(script.Whisper)
}