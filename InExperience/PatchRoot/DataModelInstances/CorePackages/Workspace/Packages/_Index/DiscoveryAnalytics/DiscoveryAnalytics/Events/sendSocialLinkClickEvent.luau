local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local FlaggedMutedErrorFunction = require(Parent.Loggers).flaggedMutedError
local TModule = require(Parent.t)
local StrictInterfaceResult = TModule.strictInterface({
	assignment_id = TModule.number,
	assignment_type = TModule.string,
	social_link_type = TModule.string,
	social_link_url = TModule.string,
	social_link_display_type = TModule.string
})
local config = {
	eventName = "socialLinkClickEvent",
	description = "Event fired from the client every time a social link is clicked",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/usercommunities/social_link_click_event.proto",
	backends = { "EventIngest" },
	throttlingPercentage = if require(Parent.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp then game:DefineFastInt("SocialLinkClickTelemetryThrottlePermyriad", 0) else nil,
	lastUpdated = { 25, 12, 9 }
}

return function(CustomFields)
	-- upvalues: StrictInterfaceResult (copy), FlaggedMutedErrorFunction (copy), TelemetryService (copy), config (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		FlaggedMutedErrorFunction("SocialLinkClickEventInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent(config, {
		standardizedFields = { "addSessionInfo" },
		customFields = CustomFields
	})
end