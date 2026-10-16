local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local StrictInterfaceResult = TModule.strictInterface({
	placeId = TModule.string,
	uid = TModule.string,
	ctx = TModule.string
})
local config = {
	eventName = "joinFriendsInGame",
	description = "User joined friends in game from experience details overflow",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("GameJoinFriendsInGameThrottleHundrethsPercent", 10000),
	lastUpdated = { 26, 4, 29 }
}
local StandardizedFields = { "addSessionInfo" }

return function(CustomFields, EventContext) --[[ Line: 29 ]]
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), TelemetryService (copy), config (copy), StandardizedFields (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("GameJoinFriendsInGameInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent(config, {
		eventContext = EventContext,
		standardizedFields = StandardizedFields,
		customFields = CustomFields
	})
end