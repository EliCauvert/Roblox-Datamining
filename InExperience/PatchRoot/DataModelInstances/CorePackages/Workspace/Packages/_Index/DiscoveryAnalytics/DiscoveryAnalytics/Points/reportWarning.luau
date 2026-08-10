local runService = game:GetService("RunService")
local loggingProtocolModule = require(script:FindFirstAncestor("DiscoveryAnalytics").Parent.LoggingProtocol)
local t = {
	eventName = "DiscoveryWarning",
	description = "Generic warning message for Discovery surfaces",
	links = "",
	backends = { loggingProtocolModule.default.TelemetryBackends.Points },
	throttlingPercentage = game:DefineFastInt("DiscoveryWarningEventHundredthsPercent", 0),
	lastUpdated = { 25, 1, 22 }
}
local t_1 = {
	eventName = "DiscoveryWarningCounter",
	throttlingPercentage = 0,
	description = "Counter for the total number of warnings sent",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 25, 1, 22 }
}

return function(p0, p1, p2, p3) --[[ line: 31 | named "reportWarning" ]]
	-- upvalues: runService (ref), t_1 (ref), t (ref)
	local var4 = p3 and table.clone(p3) or {}
	var4.category = p1
	var4.extraMessage = p2
	
	if runService:IsStudio() or _G.__TESTEZ_RUNNING_TEST__ or _G.__TEST_SUITE_PACKAGE__ then
		warn(`DiscoveryWarning: [{p1}] {p2}`)
	end
	p0:logRobloxTelemetryCounter(t_1, 1, { category = p1 })
	p0:logRobloxTelemetryEvent(t, { p0.StandardizedFields.addOsInfo }, var4)
end