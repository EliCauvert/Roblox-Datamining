local RBXConsoleCommandModule = require(script.RBXConsoleCommand)
local RBXHelpCommandModule = require(script.RBXHelpCommand)
local RBXMuteCommandModule = require(script.RBXMuteCommand)
local RBXUnmuteCommandModule = require(script.RBXUnmuteCommand)
local RBXVersionCommandModule = require(script.RBXVersionCommand)
local RBXEmoteCommandModule = require(script.RBXEmoteCommand)
local RBXTeamCommandModule = require(script.RBXTeamCommand)
local RBXWhisperCommand = require(script.Whisper).RBXWhisperCommand
local RBXClearCommandModule = require(script.RBXClearCommand)
local RBXOnlineCommandModule = require(script.RBXOnlineCommand)
local expChatLocalUserCountEnabledEngineFeature = game:GetEngineFeature("ExpChatLocalUserCountEnabled")
local expChatEnableVirtualLocalOnlineCommand = game:DefineFastFlag("ExpChatEnableVirtualLocalOnlineCommand", false)
local _ = require(script.types)

return {
	enabledCommands = {
		RBXConsoleCommandModule, RBXHelpCommandModule, RBXMuteCommandModule,
		RBXUnmuteCommandModule, RBXVersionCommandModule, RBXEmoteCommandModule,
		RBXTeamCommandModule, RBXWhisperCommand, RBXClearCommandModule
	},
	getVirtualLocalEnabledCommands = function() --[[ line: 33 ]]
		-- upvalues: expChatLocalUserCountEnabledEngineFeature (ref), expChatEnableVirtualLocalOnlineCommand (ref), RBXOnlineCommandModule (ref)
		local t = {}
		
		if expChatLocalUserCountEnabledEngineFeature and expChatEnableVirtualLocalOnlineCommand then
			table.insert(t, RBXOnlineCommandModule)
		end
		return t
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