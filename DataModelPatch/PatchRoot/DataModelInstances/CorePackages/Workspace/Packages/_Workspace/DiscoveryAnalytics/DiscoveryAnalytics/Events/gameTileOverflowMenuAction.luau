local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local GameTileOverflowMenuActionThrottleHundrethsPercent = game:DefineFastInt("GameTileOverflowMenuActionThrottleHundrethsPercent", 0)
local FFlagLuaAppFixExplicitFeedbackTelemetry = require(Parent.SharedFlags).FFlagLuaAppFixExplicitFeedbackTelemetry
local StrictInterfaceResult = TModule.strictInterface({
	ctx = if FFlagLuaAppFixExplicitFeedbackTelemetry then nil else TModule.string,
	universeId = TModule.string,
	sortId = TModule.optional(TModule.string),
	actionType = TModule.string,
	menuItem = TModule.optional(TModule.string),
	availableMenuItems = TModule.optional(TModule.string)
})

return function(CustomFields, p1)
	-- upvalues: FFlagLuaAppFixExplicitFeedbackTelemetry (copy), DiscoveryEventErrorLogger (copy), StrictInterfaceResult (copy), GameTileOverflowMenuActionThrottleHundrethsPercent (copy), TelemetryService (copy)
	if FFlagLuaAppFixExplicitFeedbackTelemetry and not p1 then
		DiscoveryEventErrorLogger.reportError("GameTileOverflowMenuActionInvalidInterface", "event is missing context")
	end
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("GameTileOverflowMenuActionInvalidInterface", StrictInterfaceResultResult2)
	end
	TelemetryService:LogEvent({
		eventName = "gameTileOverflowMenuAction",
		description = "User has taken an action with the Game Tile Overflow Menu",
		backends = { "EventIngest" },
		throttlingPercentage = GameTileOverflowMenuActionThrottleHundrethsPercent,
		lastUpdated = { 25, 10, 15 }
	}, {
		eventContext = if FFlagLuaAppFixExplicitFeedbackTelemetry then p1 else nil,
		standardizedFields = { "addSessionInfo" },
		customFields = CustomFields
	})
end