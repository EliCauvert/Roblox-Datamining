local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local gameTileOverflowMenuAction = require(parent.DiscoveryAnalytics).Events.gameTileOverflowMenuAction
local getActionTelemetryFieldValue = require(parent.SduiCoreSystem).getActionTelemetryFieldValue

return function(p1, p2, p3)
	-- upvalues: getActionTelemetryFieldValue (ref), gameTileOverflowMenuAction (ref)
	local var1 = getActionTelemetryFieldValue(p1, p2, "menuItemId")
	
	if typeof(var1) == "string" and var1 ~= "" then
		local var2 = getActionTelemetryFieldValue(p1, p2, "availableMenuItemIds", var1)
		gameTileOverflowMenuAction({
			actionType = "GameTileOverflowMenuItemActivated",
			universeId = getActionTelemetryFieldValue(p1, p2, "universeId"),
			sortId = getActionTelemetryFieldValue(p1, p2, "collectionId"),
			menuItem = var1,
			availableMenuItems = if typeof(var2) == "string" then var2 else nil
		}, p3.appPage or "Unknown")
		
		return
	end
end