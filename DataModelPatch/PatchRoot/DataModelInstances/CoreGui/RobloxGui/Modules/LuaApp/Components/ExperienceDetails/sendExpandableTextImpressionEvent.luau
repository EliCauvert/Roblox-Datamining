local TelemetryService = game:GetService("TelemetryService")
local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local DiscoveryEventErrorLogger = require(CorePackages.Workspace.Packages.DiscoveryUtils).DiscoveryEventErrorLogger
local config = {
	eventName = "expandableTextImpression",
	description = "Impressions for thresholds reached on expandable text content",
	lastUpdated = { 26, 3, 25 },
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("ExpandableTextImpressionsEventHundredthsPercent", 10000)
}
local StrictInterfaceResult = TModule.strictInterface({
	impressionThreshold = TModule.number,
	isButtonExpanded = TModule.optional(TModule.boolean),
	interactionUuid = TModule.string,
	contentType = TModule.string,
	pageContext = TModule.string,
	itemId = TModule.number,
	componentType = TModule.string
})

return function(CustomFields)
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), TelemetryService (copy), config (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("ExpandableTextImpressionInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent(config, {
		customFields = CustomFields,
		standardizedFields = { "addSessionInfo", "addOSInfo" }
	})
end