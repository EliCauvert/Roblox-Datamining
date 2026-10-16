local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local FFlagSduiGameTileDirectAction = require(Parent.SharedFlags).FFlagSduiGameTileDirectAction
local FindAnalyticsFieldInAncestorsFunction = SduiCoreSystemModule.findAnalyticsFieldInAncestors
local GameTileOverflowMenuActionFunction = require(Parent.DiscoveryAnalytics).Events.gameTileOverflowMenuAction
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue

return function(p1, p2, p3) --[[ Line: 16 | Named "SduiGameTileOverflowMenuTelemetryHandler" ]]
	-- upvalues: GetActionTelemetryFieldValueFunction (copy), FFlagSduiGameTileDirectAction (copy), FindAnalyticsFieldInAncestorsFunction (copy), GameTileOverflowMenuActionFunction (copy)
	local MenuItemId = GetActionTelemetryFieldValueFunction(p1, p2, "menuItemId")
	
	if typeof(MenuItemId) == "string" and MenuItemId ~= "" then
		local UniverseId = GetActionTelemetryFieldValueFunction(p1, p2, "universeId")
		local CollectionId = GetActionTelemetryFieldValueFunction(p1, p2, "collectionId")
		local AvailableMenuItemIds = GetActionTelemetryFieldValueFunction(p1, p2, "availableMenuItemIds", MenuItemId)
		local IsDirectAction = if FFlagSduiGameTileDirectAction then FindAnalyticsFieldInAncestorsFunction("isDirectAction", p2) else nil
		GameTileOverflowMenuActionFunction({
			actionType = "GameTileOverflowMenuItemActivated",
			universeId = UniverseId,
			sortId = CollectionId,
			menuItem = MenuItemId,
			availableMenuItems = if typeof(AvailableMenuItemIds) == "string" then AvailableMenuItemIds else nil,
			isDirectAction = if typeof(IsDirectAction) == "boolean" then IsDirectAction else nil
		}, p3.appPage or "Unknown")
		
		return
	end
end