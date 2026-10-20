local RunService = game:GetService("RunService")
local LoggingProtocolModule = require(script:FindFirstAncestor("DiscoveryAnalytics").Parent.LoggingProtocol)
local config = {
	eventName = "DiscoveryWarning",
	description = "Generic warning message for Discovery surfaces",
	links = "",
	backends = { LoggingProtocolModule.default.TelemetryBackends.Points },
	throttlingPercentage = game:DefineFastInt("DiscoveryWarningEventHundredthsPercent", 0),
	lastUpdated = { 25, 1, 22 }
}
local config1 = {
	eventName = "DiscoveryWarningCounter",
	throttlingPercentage = 0,
	description = "Counter for the total number of warnings sent",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 25, 1, 22 }
}

return function(p1, Category, ExtraMessage, Tbl)
	-- upvalues: RunService (copy), config1 (copy), config (copy)
	local Copy = Tbl and table.clone(Tbl) or {}
	Copy.category = Category
	Copy.extraMessage = ExtraMessage
	
	if RunService:IsStudio() or _G.__TESTEZ_RUNNING_TEST__ or _G.__TEST_SUITE_PACKAGE__ then
		warn(`DiscoveryWarning: [{Category}] {ExtraMessage}`)
	end
	p1:logRobloxTelemetryCounter(config1, 1, { category = Category })
	p1:logRobloxTelemetryEvent(config, { p1.StandardizedFields.addOsInfo }, Copy)
end