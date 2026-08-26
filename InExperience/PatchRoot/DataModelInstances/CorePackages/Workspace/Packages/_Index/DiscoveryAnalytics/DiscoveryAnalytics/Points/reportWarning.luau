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

return function(p1, p2, p3, p4)
	-- upvalues: runService (ref), t_1 (ref), t (ref)
	local var1 = p4 and table.clone(p4) or {}
	var1.category = p2
	var1.extraMessage = p3
	
	if runService:IsStudio() or _G.__TESTEZ_RUNNING_TEST__ or _G.__TEST_SUITE_PACKAGE__ then
		warn(`DiscoveryWarning: [{p2}] {p3}`)
	end
	p1:logRobloxTelemetryCounter(t_1, 1, { category = p2 })
	p1:logRobloxTelemetryEvent(t, { p1.StandardizedFields.addOsInfo }, var1)
end