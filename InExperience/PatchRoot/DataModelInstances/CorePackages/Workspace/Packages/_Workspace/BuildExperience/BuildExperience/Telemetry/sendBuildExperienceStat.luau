local telemetryService = game:GetService("TelemetryService")
local shouldSampleHundredthsPercentModule = require(script:FindFirstAncestor("BuildExperience").Telemetry.shouldSampleHundredthsPercent)

return function(p1)
	-- upvalues: shouldSampleHundredthsPercentModule (ref), telemetryService (ref)
	local sampleHundredthsPercent = p1.sampleHundredthsPercent
	
	if sampleHundredthsPercent and not shouldSampleHundredthsPercentModule(sampleHundredthsPercent) then
		return
	end
	telemetryService:LogStat(p1.config, { customFields = p1.customFields }, p1.value)
end