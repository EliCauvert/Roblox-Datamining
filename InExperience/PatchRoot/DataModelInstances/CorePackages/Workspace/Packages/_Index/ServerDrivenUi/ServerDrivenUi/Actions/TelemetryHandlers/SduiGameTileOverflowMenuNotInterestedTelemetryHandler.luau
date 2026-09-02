local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local gameTileOverflowMenuAction = require(parent.DiscoveryAnalytics).Events.gameTileOverflowMenuAction
local getActionTelemetryFieldValue = require(parent.SduiCoreSystem).getActionTelemetryFieldValue

return function(p1, p2, p3)
	-- upvalues: getActionTelemetryFieldValue (ref), gameTileOverflowMenuAction (ref)
	local var1 = getActionTelemetryFieldValue(p1, p2, "availableMenuItems", "NotInterested")
	gameTileOverflowMenuAction({
		actionType = "GameTileOverflowMenuItemActivated",
		menuItem = "NotInterested",
		universeId = getActionTelemetryFieldValue(p1, p2, "universeId"),
		sortId = getActionTelemetryFieldValue(p1, p2, "collectionId"),
		availableMenuItems = if typeof(var1) == "string" then var1 else nil
	}, p3.appPage or "Unknown")
end