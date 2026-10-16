local GlobalHelpCommandModule = require(script.GlobalHelpCommand)
local GlobalClearCommandModule = require(script.GlobalClearCommand)
local GlobalMuteCommandModule = require(script.GlobalMuteCommand)
local GlobalUnmuteCommandModule = require(script.GlobalUnmuteCommand)
local GlobalOnlineCommandModule = require(script.GlobalOnlineCommand)
local ExpChatGlobalUserCountEnabledEngineFeature = game:GetEngineFeature("ExpChatGlobalUserCountEnabled")
local ExpChatEnableGlobalOnlineCommand = game:DefineFastFlag("ExpChatEnableGlobalOnlineCommand", false)
local _ = require(script.types)

return {
	getGlobalEnabledCommands = function() --[[ Line: 13 ]]
		-- upvalues: GlobalClearCommandModule (copy), GlobalHelpCommandModule (copy), GlobalMuteCommandModule (copy), GlobalUnmuteCommandModule (copy), ExpChatGlobalUserCountEnabledEngineFeature (copy), ExpChatEnableGlobalOnlineCommand (copy), GlobalOnlineCommandModule (copy)
		local List = {}
		table.insert(List, GlobalClearCommandModule)
		table.insert(List, GlobalHelpCommandModule)
		table.insert(List, GlobalMuteCommandModule)
		table.insert(List, GlobalUnmuteCommandModule)
		
		if ExpChatGlobalUserCountEnabledEngineFeature and ExpChatEnableGlobalOnlineCommand then
			table.insert(List, GlobalOnlineCommandModule)
		end
		return List
	end,
	GlobalHelpCommand = GlobalHelpCommandModule,
	GlobalClearCommand = GlobalClearCommandModule,
	GlobalMuteCommand = GlobalMuteCommandModule,
	GlobalUnmuteCommand = GlobalUnmuteCommandModule,
	GlobalOnlineCommand = GlobalOnlineCommandModule
}