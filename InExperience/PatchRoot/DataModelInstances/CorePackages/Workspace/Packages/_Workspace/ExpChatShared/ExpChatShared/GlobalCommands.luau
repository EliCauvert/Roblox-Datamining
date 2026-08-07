local globalHelpCommandModule = require(script.GlobalHelpCommand)
local globalClearCommandModule = require(script.GlobalClearCommand)
local globalMuteCommandModule = require(script.GlobalMuteCommand)
local globalUnmuteCommandModule = require(script.GlobalUnmuteCommand)
local globalOnlineCommandModule = require(script.GlobalOnlineCommand)
local expChatGlobalUserCountEnabledEngineFeature = game:GetEngineFeature("ExpChatGlobalUserCountEnabled")
local expChatEnableGlobalOnlineCommand = game:DefineFastFlag("ExpChatEnableGlobalOnlineCommand", false)
local _ = require(script.types)

return {
	getGlobalEnabledCommands = function() --[[ line: 13 ]]
		-- upvalues: globalClearCommandModule (ref), globalHelpCommandModule (ref), globalMuteCommandModule (ref), globalUnmuteCommandModule (ref), expChatGlobalUserCountEnabledEngineFeature (ref), expChatEnableGlobalOnlineCommand (ref), globalOnlineCommandModule (ref)
		local t = {}
		table.insert(t, globalClearCommandModule)
		table.insert(t, globalHelpCommandModule)
		table.insert(t, globalMuteCommandModule)
		table.insert(t, globalUnmuteCommandModule)
		
		if expChatGlobalUserCountEnabledEngineFeature and expChatEnableGlobalOnlineCommand then
			table.insert(t, globalOnlineCommandModule)
		end
		return t
	end,
	GlobalHelpCommand = globalHelpCommandModule,
	GlobalClearCommand = globalClearCommandModule,
	GlobalMuteCommand = globalMuteCommandModule,
	GlobalUnmuteCommand = globalUnmuteCommandModule,
	GlobalOnlineCommand = globalOnlineCommandModule
}