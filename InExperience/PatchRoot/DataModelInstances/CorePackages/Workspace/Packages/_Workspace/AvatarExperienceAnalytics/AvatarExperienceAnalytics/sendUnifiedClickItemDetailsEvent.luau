local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local _ = require(Parent.AvatarExperienceNavigation)
local _ = require(Parent.AvatarExperienceModel)
local SendUnifiedEventForDeferredActionModule = require(script.Parent.sendUnifiedEventForDeferredAction)
local GetMarketplaceUnifiedItemTypeModule = require(script.Parent.Utils.getMarketplaceUnifiedItemType)
local GetUnifiedLoggingSurfaceModule = require(script.Parent.Utils.getUnifiedLoggingSurface)
local UnifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local FFlagAXFixClickItemDetailsSurfaceLogging = require(Parent.SharedFlags).FFlagAXFixClickItemDetailsSurfaceLogging

return function(p1) --[[ Line: 28 | Named "sendUnifiedClickItemDetailsEvent" ]]
	-- upvalues: SendUnifiedEventForDeferredActionModule (copy), UnifiedEventLogEnumsModule (copy), GetMarketplaceUnifiedItemTypeModule (copy), FFlagAXFixClickItemDetailsSurfaceLogging (copy), GetUnifiedLoggingSurfaceModule (copy)
	SendUnifiedEventForDeferredActionModule({
		elementName = "CLICK_ITEM_DETAILS",
		action = UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
		itemId = p1.itemId,
		itemType = GetMarketplaceUnifiedItemTypeModule(p1.itemType),
		surface = if FFlagAXFixClickItemDetailsSurfaceLogging then GetUnifiedLoggingSurfaceModule(p1.avatarRoute) else nil
	})
end