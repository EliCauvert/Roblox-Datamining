local debugMyStatsExperienceAgentSpec = game:DefineFastFlag("DebugMyStatsExperienceAgentSpec", false)
local _ = require(script.Parent.Types.acpSession)
local var1 = nil

return {
	isEnabled = function()
		-- upvalues: debugMyStatsExperienceAgentSpec (ref)
		return debugMyStatsExperienceAgentSpec
	end,
	get = function()
		-- upvalues: var1 (write)
		return var1
	end,
	set = function(value)
		-- upvalues: var1 (write)
		var1 = if value == nil or value == "" or value == "latest" then nil else value
	end,
	getExperiment = function()
		-- upvalues: debugMyStatsExperienceAgentSpec (ref), var1 (write)
		return if debugMyStatsExperienceAgentSpec and var1 ~= nil then {
			specVersion = var1,
			clientToolConfig = { mode = "exclude", tools = {} }
		} else nil
	end
}