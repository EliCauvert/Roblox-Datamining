local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(parent.AvatarExperienceNavigation)
local _ = require(parent.AvatarExperienceCommon)
local sendUnifiedEventForDeferredActionModule = require(script.Parent.sendUnifiedEventForDeferredAction)
local getMarketplaceUnifiedItemTypeModule = require(script.Parent.Utils.getMarketplaceUnifiedItemType)
local getUnifiedLoggingSurfaceModule = require(script.Parent.Utils.getUnifiedLoggingSurface)
local unifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local fFlagAXFixClickItemDetailsSurfaceLogging = sharedFlagsModule.FFlagAXFixClickItemDetailsSurfaceLogging

return function(p0) --[[ line: 28 | named "sendUnifiedClickItemDetailsEvent" ]]
	-- upvalues: sendUnifiedEventForDeferredActionModule (ref), unifiedEventLogEnumsModule (ref), getMarketplaceUnifiedItemTypeModule (ref), fFlagAXFixClickItemDetailsSurfaceLogging (ref), getUnifiedLoggingSurfaceModule (ref)
	sendUnifiedEventForDeferredActionModule({
		elementName = "CLICK_ITEM_DETAILS",
		action = unifiedEventLogEnumsModule.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
		itemId = p0.itemId,
		itemType = getMarketplaceUnifiedItemTypeModule(p0.itemType),
		surface = if fFlagAXFixClickItemDetailsSurfaceLogging then getUnifiedLoggingSurfaceModule(p0.avatarRoute) else nil
	})
end