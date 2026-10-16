local TelemetryService = game:GetService("TelemetryService")
local ShouldSampleHundredthsPercentModule = require(script:FindFirstAncestor("BuildExperience").Telemetry.shouldSampleHundredthsPercent)

return function(p1) --[[ Line: 21 | Named "sendBuildExperienceStat" ]]
	-- upvalues: ShouldSampleHundredthsPercentModule (copy), TelemetryService (copy)
	local SampleHundredthsPercent = p1.sampleHundredthsPercent
	
	if not SampleHundredthsPercent or ShouldSampleHundredthsPercentModule(SampleHundredthsPercent) then
		TelemetryService:LogStat(p1.config, { customFields = p1.customFields }, p1.value)
		
		return
	end
end