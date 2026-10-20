local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local GameTileOverflowMenuActionThrottleHundrethsPercent = game:DefineFastInt("GameTileOverflowMenuActionThrottleHundrethsPercent", 0)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiGameTileDirectAction = SharedFlagsModule.FFlagSduiGameTileDirectAction
local StrictInterfaceResult = TModule.strictInterface({
	universeId = TModule.string,
	sortId = TModule.optional(TModule.string),
	actionType = TModule.string,
	menuItem = TModule.optional(TModule.string),
	availableMenuItems = TModule.optional(TModule.string),
	contentType = if SharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile then TModule.optional(TModule.string) else nil,
	isDirectAction = if SharedFlagsModule.FFlagLuaAppGameTileDirectActionTelemetry or FFlagSduiGameTileDirectAction then TModule.optional(TModule.boolean) else nil
})

return function(CustomFields, EventContext)
	-- upvalues: DiscoveryEventErrorLogger (copy), StrictInterfaceResult (copy), GameTileOverflowMenuActionThrottleHundrethsPercent (copy), TelemetryService (copy)
	if not EventContext then
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
		lastUpdated = { 26, 9, 23 }
	}, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo" },
		customFields = CustomFields
	})
end