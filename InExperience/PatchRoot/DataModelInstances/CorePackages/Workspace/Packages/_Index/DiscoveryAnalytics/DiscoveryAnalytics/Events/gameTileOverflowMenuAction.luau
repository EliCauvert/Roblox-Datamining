local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameTileOverflowMenuActionThrottleHundrethsPercent = game:DefineFastInt("GameTileOverflowMenuActionThrottleHundrethsPercent", 0)
local var1 = tModule.strictInterface({
	universeId = tModule.string,
	sortId = tModule.optional(tModule.string),
	actionType = tModule.string,
	menuItem = tModule.optional(tModule.string),
	availableMenuItems = tModule.optional(tModule.string),
	contentType = if require(parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile then tModule.optional(tModule.string) else nil
})

return function(p1, p2)
	-- upvalues: discoveryEventErrorLogger (ref), var1 (ref), gameTileOverflowMenuActionThrottleHundrethsPercent (ref), telemetryService (ref)
	if not p2 then
		discoveryEventErrorLogger.reportError("GameTileOverflowMenuActionInvalidInterface", "event is missing context")
	end
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("GameTileOverflowMenuActionInvalidInterface", var3)
	end
	telemetryService:LogEvent({
		eventName = "gameTileOverflowMenuAction",
		description = "User has taken an action with the Game Tile Overflow Menu",
		backends = { "EventIngest" },
		throttlingPercentage = gameTileOverflowMenuActionThrottleHundrethsPercent,
		lastUpdated = { 25, 10, 15 }
	}, {
		eventContext = p2,
		standardizedFields = { "addSessionInfo" },
		customFields = p1
	})
end