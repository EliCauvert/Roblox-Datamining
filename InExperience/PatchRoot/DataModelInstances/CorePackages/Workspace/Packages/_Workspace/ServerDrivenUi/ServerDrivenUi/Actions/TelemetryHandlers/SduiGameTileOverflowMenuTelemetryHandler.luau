local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local OmniRecommendationsContentType = require(Parent.DiscoveryTypes).OmniRecommendationsContentType
local FFlagSduiGameTileDirectAction = require(Parent.SharedFlags).FFlagSduiGameTileDirectAction
local FFlagLuaAppEnableFlexibleFeatureTileVariants = require(Parent.SharedFlags).FFlagLuaAppEnableFlexibleFeatureTileVariants
local FindAnalyticsFieldInAncestorsFunction = SduiCoreSystemModule.findAnalyticsFieldInAncestors
local GameTileOverflowMenuActionFunction = DiscoveryAnalyticsModule.Events.gameTileOverflowMenuAction
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue

return function(p1, p2, p3)
	-- upvalues: GetActionTelemetryFieldValueFunction (copy), FFlagLuaAppEnableFlexibleFeatureTileVariants (copy), FFlagSduiGameTileDirectAction (copy), FindAnalyticsFieldInAncestorsFunction (copy), GameTileOverflowMenuActionFunction (copy), OmniRecommendationsContentType (copy)
	local MenuItemId = GetActionTelemetryFieldValueFunction(p1, p2, "menuItemId")
	
	if typeof(MenuItemId) == "string" and MenuItemId ~= "" then
		local UniverseId = GetActionTelemetryFieldValueFunction(p1, p2, "universeId")
		local CollectionId = GetActionTelemetryFieldValueFunction(p1, p2, "collectionId")
		local ContentType = if FFlagLuaAppEnableFlexibleFeatureTileVariants then GetActionTelemetryFieldValueFunction(p1, p2, "contentType") else nil
		local AvailableMenuItemIds = GetActionTelemetryFieldValueFunction(p1, p2, "availableMenuItemIds", MenuItemId)
		local IsDirectAction = if FFlagSduiGameTileDirectAction then FindAnalyticsFieldInAncestorsFunction("isDirectAction", p2) else nil
		GameTileOverflowMenuActionFunction({
			actionType = "GameTileOverflowMenuItemActivated",
			universeId = if FFlagLuaAppEnableFlexibleFeatureTileVariants and ContentType == OmniRecommendationsContentType.AdLink then UniverseId or "" else UniverseId,
			sortId = CollectionId,
			menuItem = MenuItemId,
			availableMenuItems = if typeof(AvailableMenuItemIds) == "string" then AvailableMenuItemIds else nil,
			isDirectAction = if typeof(IsDirectAction) == "boolean" then IsDirectAction else nil,
			contentType = if FFlagLuaAppEnableFlexibleFeatureTileVariants and typeof(ContentType) == "string" then ContentType else nil
		}, p3.appPage or "Unknown")
		
		return
	end
end