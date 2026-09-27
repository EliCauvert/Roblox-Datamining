local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local fFlagSduiGameTileDirectAction = require(parent.SharedFlags).FFlagSduiGameTileDirectAction
local findAnalyticsFieldInAncestors = sduiCoreSystemModule.findAnalyticsFieldInAncestors
local gameTileOverflowMenuAction = discoveryAnalyticsModule.Events.gameTileOverflowMenuAction
local getActionTelemetryFieldValue = sduiCoreSystemModule.getActionTelemetryFieldValue

return function(p1, p2, p3)
	-- upvalues: getActionTelemetryFieldValue (ref), fFlagSduiGameTileDirectAction (ref), findAnalyticsFieldInAncestors (ref), gameTileOverflowMenuAction (ref)
	local var1 = getActionTelemetryFieldValue(p1, p2, "menuItemId")
	
	if typeof(var1) == "string" and var1 ~= "" then
		local var2 = getActionTelemetryFieldValue(p1, p2, "universeId")
		local var3 = getActionTelemetryFieldValue(p1, p2, "collectionId")
		local var4 = getActionTelemetryFieldValue(p1, p2, "availableMenuItemIds", var1)
		local var5 = if fFlagSduiGameTileDirectAction then findAnalyticsFieldInAncestors("isDirectAction", p2) else nil
		gameTileOverflowMenuAction({
			actionType = "GameTileOverflowMenuItemActivated",
			universeId = var2,
			sortId = var3,
			menuItem = var1,
			availableMenuItems = if typeof(var4) == "string" then var4 else nil,
			isDirectAction = if typeof(var5) == "boolean" then var5 else nil
		}, p3.appPage or "Unknown")
		
		return
	end
end