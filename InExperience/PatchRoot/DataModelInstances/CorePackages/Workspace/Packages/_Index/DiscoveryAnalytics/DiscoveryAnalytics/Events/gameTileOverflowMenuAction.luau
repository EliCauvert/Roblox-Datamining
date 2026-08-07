local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameTileOverflowMenuActionThrottleHundrethsPercent = game:DefineFastInt("GameTileOverflowMenuActionThrottleHundrethsPercent", 0)
local fFlagLuaAppFixExplicitFeedbackTelemetry = require(parent.SharedFlags).FFlagLuaAppFixExplicitFeedbackTelemetry
local var3 = tModule.strictInterface({
	ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else tModule.string,
	universeId = tModule.string,
	sortId = tModule.optional(tModule.string),
	actionType = tModule.string,
	menuItem = tModule.optional(tModule.string),
	availableMenuItems = tModule.optional(tModule.string)
})

return function(p0, p1) --[[ line: 22 ]]
	-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (ref), discoveryEventErrorLogger (ref), var3 (ref), gameTileOverflowMenuActionThrottleHundrethsPercent (ref), telemetryService (ref)
	if fFlagLuaAppFixExplicitFeedbackTelemetry and not p1 then
		discoveryEventErrorLogger.reportError("GameTileOverflowMenuActionInvalidInterface", "event is missing context")
	end
	local var4, var5 = var3(p0)
	
	if not var4 then
		discoveryEventErrorLogger.reportError("GameTileOverflowMenuActionInvalidInterface", var5)
	end
	telemetryService:LogEvent({
		eventName = "gameTileOverflowMenuAction",
		description = "User has taken an action with the Game Tile Overflow Menu",
		backends = { "EventIngest" },
		throttlingPercentage = gameTileOverflowMenuActionThrottleHundrethsPercent,
		lastUpdated = { 25, 10, 15 }
	}, {
		eventContext = if fFlagLuaAppFixExplicitFeedbackTelemetry then p1 else nil,
		standardizedFields = { "addSessionInfo" },
		customFields = p0
	})
end