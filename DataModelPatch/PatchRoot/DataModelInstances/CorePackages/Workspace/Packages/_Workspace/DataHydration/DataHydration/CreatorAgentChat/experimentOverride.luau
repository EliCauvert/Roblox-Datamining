local DebugMyStatsExperienceAgentSpec = game:DefineFastFlag("DebugMyStatsExperienceAgentSpec", false)
local _ = require(script.Parent.Types.acpSession)
local SpecVersion = nil

return {
	isEnabled = function()
		-- upvalues: DebugMyStatsExperienceAgentSpec (copy)
		return DebugMyStatsExperienceAgentSpec
	end,
	get = function()
		-- upvalues: SpecVersion (ref)
		return SpecVersion
	end,
	set = function(p1)
		-- upvalues: SpecVersion (ref)
		SpecVersion = if p1 == nil or p1 == "" or p1 == "latest" then nil else p1
	end,
	getExperiment = function()
		-- upvalues: DebugMyStatsExperienceAgentSpec (copy), SpecVersion (ref)
		return if DebugMyStatsExperienceAgentSpec and SpecVersion ~= nil then { ignoreClientTools = false, specVersion = SpecVersion } else nil
	end
}