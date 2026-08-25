local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameTileOverflowMenuActionThrottleHundrethsPercent = game:DefineFastInt("GameTileOverflowMenuActionThrottleHundrethsPercent", 0)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppFixExplicitFeedbackTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local var4 = tModule.strictInterface({
	ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else tModule.string,
	universeId = tModule.string,
	sortId = tModule.optional(tModule.string),
	actionType = tModule.string,
	menuItem = tModule.optional(tModule.string),
	availableMenuItems = tModule.optional(tModule.string),
	contentType = if sharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile then tModule.optional(tModule.string) else nil
})

return function(p0, p1)
	-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (ref), discoveryEventErrorLogger (ref), var4 (ref), gameTileOverflowMenuActionThrottleHundrethsPercent (ref), telemetryService (ref)
	if fFlagLuaAppFixExplicitFeedbackTelemetry and not p1 then
		discoveryEventErrorLogger.reportError("GameTileOverflowMenuActionInvalidInterface", "event is missing context")
	end
	local var5, var6 = var4(p0)
	
	if not var5 then
		discoveryEventErrorLogger.reportError("GameTileOverflowMenuActionInvalidInterface", var6)
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