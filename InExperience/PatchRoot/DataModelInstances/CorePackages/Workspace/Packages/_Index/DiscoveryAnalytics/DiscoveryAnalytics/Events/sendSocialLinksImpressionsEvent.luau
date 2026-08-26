local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local var1 = tModule.strictInterface({
	item_positions = tModule.string,
	social_link_urls = tModule.string,
	social_link_types = tModule.string,
	social_link_display_type = tModule.string,
	assignment_id = tModule.number,
	assignment_type = tModule.string,
	page = tModule.string
})
local t = {
	eventName = "EdpSocialLinksImpressions",
	description = "Impressions for social links on EDP",
	lastUpdated = { 25, 12, 10 },
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("SocialLinksImpressionsEventHundredthsPercent", 10000)
}

return function(p1)
	-- upvalues: var1 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("SocialLinksImpressionsEventInterface", var3)
	end
	telemetryService:LogEvent(t, {
		customFields = p1,
		standardizedFields = { "addSessionInfo" }
	})
end