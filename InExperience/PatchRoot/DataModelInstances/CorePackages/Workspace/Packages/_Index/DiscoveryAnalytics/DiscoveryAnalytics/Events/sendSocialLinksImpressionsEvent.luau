local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local var2 = tModule.strictInterface({
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

return function(p0) --[[ line: 40 ]]
	-- upvalues: var2 (ref), discoveryEventErrorLogger (ref), telemetryService (ref), t (ref)
	local var4, var5 = var2(p0)
	
	if not var4 then
		discoveryEventErrorLogger.reportError("SocialLinksImpressionsEventInterface", var5)
	end
	telemetryService:LogEvent(t, {
		customFields = p0,
		standardizedFields = { "addSessionInfo" }
	})
end