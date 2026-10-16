local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local StrictInterfaceResult = TModule.strictInterface({
	item_positions = TModule.string,
	social_link_urls = TModule.string,
	social_link_types = TModule.string,
	social_link_display_type = TModule.string,
	assignment_id = TModule.number,
	assignment_type = TModule.string,
	page = TModule.string
})
local config = {
	eventName = "EdpSocialLinksImpressions",
	description = "Impressions for social links on EDP",
	lastUpdated = { 25, 12, 10 },
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("SocialLinksImpressionsEventHundredthsPercent", 10000)
}

return function(CustomFields) --[[ Line: 40 ]]
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), TelemetryService (copy), config (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("SocialLinksImpressionsEventInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent(config, {
		customFields = CustomFields,
		standardizedFields = { "addSessionInfo" }
	})
end