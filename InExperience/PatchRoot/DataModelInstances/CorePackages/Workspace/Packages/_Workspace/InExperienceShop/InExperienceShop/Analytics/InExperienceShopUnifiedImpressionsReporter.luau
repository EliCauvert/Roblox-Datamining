local AvatarExperienceAnalyticsModule = require(script:FindFirstAncestor("InExperienceShop").Parent.AvatarExperienceAnalytics)
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local SendUnifiedEventLogForInstanceFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLogForInstance
local FFlagAllowCustomUnifiedEventFilter = AvatarExperienceAnalyticsModule.Flags.FFlagAllowCustomUnifiedEventFilter
local UnifiedEventLogConstants = AvatarExperienceAnalyticsModule.UnifiedEventLogConstants
local SendPassthroughUnifiedEventLogForInstanceFunction = AvatarExperienceAnalyticsModule.sendPassthroughUnifiedEventLogForInstance
local FFlagAXUnifiedEventStrictPayloads = AvatarExperienceAnalyticsModule.Flags.FFlagAXUnifiedEventStrictPayloads
local InExperienceShopUnifiedEventFilterModule = require(script.Parent.InExperienceShopUnifiedEventFilter)
local GetShopUnifiedLoggingSurfaceModule = require(script.Parent.getShopUnifiedLoggingSurface)

return function(p1)
	-- upvalues: GetShopUnifiedLoggingSurfaceModule (copy), FFlagAllowCustomUnifiedEventFilter (copy), InExperienceShopUnifiedEventFilterModule (copy), FFlagAXUnifiedEventStrictPayloads (copy), UnifiedEventLogConstants (copy), SendPassthroughUnifiedEventLogForInstanceFunction (copy), UnifiedEventLogEnums (copy), SendUnifiedEventLogForInstanceFunction (copy)
	return function(p2)
		-- upvalues: GetShopUnifiedLoggingSurfaceModule (upval), p1 (copy), FFlagAllowCustomUnifiedEventFilter (upval), InExperienceShopUnifiedEventFilterModule (upval), FFlagAXUnifiedEventStrictPayloads (upval), UnifiedEventLogConstants (upval), SendPassthroughUnifiedEventLogForInstanceFunction (upval), UnifiedEventLogEnums (upval), SendUnifiedEventLogForInstanceFunction (upval)
		local VisibleInstance = p2.visibleInstance
		local ShopUnifiedLoggingSurfaceModule = GetShopUnifiedLoggingSurfaceModule(p1)
		local Filter = if FFlagAllowCustomUnifiedEventFilter then InExperienceShopUnifiedEventFilterModule.filter else nil
		
		if FFlagAXUnifiedEventStrictPayloads then
			local ATTRIBUTEPREFIX = UnifiedEventLogConstants.ATTRIBUTE_PREFIX
			local Attributes = VisibleInstance:GetAttributes()
			SendPassthroughUnifiedEventLogForInstanceFunction(VisibleInstance, {
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_IMPRESSION,
				surface = ShopUnifiedLoggingSurfaceModule,
				itemId = Attributes[ATTRIBUTEPREFIX .. UnifiedEventLogConstants.FIELD_ITEM_ID],
				itemType = Attributes[ATTRIBUTEPREFIX .. UnifiedEventLogConstants.FIELD_ITEM_TYPE],
				gridPositionRow = Attributes[ATTRIBUTEPREFIX .. UnifiedEventLogConstants.FIELD_GRID_POSITION_ROW],
				gridPositionColumn = Attributes[ATTRIBUTEPREFIX .. UnifiedEventLogConstants.FIELD_GRID_POSITION_COLUMN]
			}, {
				includeScreenSize = true,
				includeElementSizeAndPosition = true,
				filter = Filter
			})
			
			return
		else
			SendUnifiedEventLogForInstanceFunction(VisibleInstance, {
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_IMPRESSION,
				surface = ShopUnifiedLoggingSurfaceModule
			}, {
				includeScreenSize = true,
				includeElementSizeAndPosition = true,
				filter = Filter
			})
		end
	end
end