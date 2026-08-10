local debugMyStatsExperienceAgentSpec = game:DefineFastFlag("DebugMyStatsExperienceAgentSpec", false)
local _ = require(script.Parent.Types.acpSession)
local var1 = nil

return {
	isEnabled = function() --[[ line: 12 ]]
		-- upvalues: debugMyStatsExperienceAgentSpec (ref)
		return debugMyStatsExperienceAgentSpec
	end,
	get = function() --[[ line: 15 ]]
		-- upvalues: var1 (write)
		return var1
	end,
	set = function(value) --[[ line: 18 ]]
		-- upvalues: var1 (write)
		var1 = if value == nil or value == "" or value == "latest" then nil else value
	end,
	getExperiment = function() --[[ line: 22 ]]
		-- upvalues: debugMyStatsExperienceAgentSpec (ref), var1 (write)
		return if debugMyStatsExperienceAgentSpec and var1 ~= nil then {
			specVersion = var1,
			clientToolConfig = { mode = "exclude", tools = {} }
		} else nil
	end
}