local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameTileOverflowMenuActionThrottleHundrethsPercent = game:DefineFastInt("GameTileOverflowMenuActionThrottleHundrethsPercent", 0)
local sharedFlagsModule = require(parent.SharedFlags)
local strictInterface = tModule.strictInterface
strictInterface = strictInterface({
	universeId = tModule.string,
	sortId = tModule.optional(tModule.string),
	actionType = tModule.string,
	menuItem = tModule.optional(tModule.string),
	availableMenuItems = tModule.optional(tModule.string),
	contentType = if sharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile then tModule.optional(tModule.string) else nil,
	isDirectAction = if sharedFlagsModule.FFlagLuaAppGameTileDirectActionTelemetry or sharedFlagsModule.FFlagSduiGameTileDirectAction then tModule.optional(tModule.boolean) else nil
})

return function(p1, p2)
	-- upvalues: discoveryEventErrorLogger (ref), strictInterface (ref), gameTileOverflowMenuActionThrottleHundrethsPercent (ref), telemetryService (ref)
	if not p2 then
		discoveryEventErrorLogger.reportError("GameTileOverflowMenuActionInvalidInterface", "event is missing context")
	end
	local var1, var2 = strictInterface(p1)
	
	if not var1 then
		discoveryEventErrorLogger.reportError("GameTileOverflowMenuActionInvalidInterface", var2)
	end
	telemetryService:LogEvent({
		eventName = "gameTileOverflowMenuAction",
		description = "User has taken an action with the Game Tile Overflow Menu",
		backends = { "EventIngest" },
		throttlingPercentage = gameTileOverflowMenuActionThrottleHundrethsPercent,
		lastUpdated = { 26, 9, 23 }
	}, {
		eventContext = p2,
		standardizedFields = { "addSessionInfo" },
		customFields = p1
	})
end