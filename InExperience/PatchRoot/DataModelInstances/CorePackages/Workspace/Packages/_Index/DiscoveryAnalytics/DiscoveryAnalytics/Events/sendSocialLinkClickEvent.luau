local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local flaggedMutedError = require(parent.Loggers).flaggedMutedError
local tModule = require(parent.t)
local var1 = tModule.strictInterface({
	assignment_id = tModule.number,
	assignment_type = tModule.string,
	social_link_type = tModule.string,
	social_link_url = tModule.string,
	social_link_display_type = tModule.string
})
local t = {
	eventName = "socialLinkClickEvent",
	description = "Event fired from the client every time a social link is clicked",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/usercommunities/social_link_click_event.proto",
	backends = { "EventIngest" },
	throttlingPercentage = if require(parent.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp then game:DefineFastInt("SocialLinkClickTelemetryThrottlePermyriad", 0) else nil,
	lastUpdated = { 25, 12, 9 }
}

return function(p1)
	-- upvalues: var1 (ref), flaggedMutedError (ref), telemetryService (ref), t (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		flaggedMutedError("SocialLinkClickEventInterface", var3)
	end
	telemetryService:LogEvent(t, {
		standardizedFields = { "addSessionInfo" },
		customFields = p1
	})
end