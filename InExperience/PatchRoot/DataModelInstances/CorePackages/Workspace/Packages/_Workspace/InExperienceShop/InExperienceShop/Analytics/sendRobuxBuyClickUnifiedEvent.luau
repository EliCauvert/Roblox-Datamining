local AvatarExperienceAnalyticsModule = require(script:FindFirstAncestor("InExperienceShop").Parent.AvatarExperienceAnalytics)
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local SendUnifiedEventLogForInstanceFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLogForInstance
local FFlagAllowCustomUnifiedEventFilter = AvatarExperienceAnalyticsModule.Flags.FFlagAllowCustomUnifiedEventFilter
local UnifiedEventLogConstants = AvatarExperienceAnalyticsModule.UnifiedEventLogConstants
local SendPassthroughUnifiedEventLogForInstanceFunction = AvatarExperienceAnalyticsModule.sendPassthroughUnifiedEventLogForInstance
local FFlagAXUnifiedEventStrictPayloads = AvatarExperienceAnalyticsModule.Flags.FFlagAXUnifiedEventStrictPayloads
local InExperienceShopUnifiedEventFilterModule = require(script.Parent.InExperienceShopUnifiedEventFilter)
local GetShopUnifiedLoggingSurfaceModule = require(script.Parent.getShopUnifiedLoggingSurface)

return function(Object, p1)
	-- upvalues: GetShopUnifiedLoggingSurfaceModule (copy), FFlagAllowCustomUnifiedEventFilter (copy), InExperienceShopUnifiedEventFilterModule (copy), FFlagAXUnifiedEventStrictPayloads (copy), UnifiedEventLogConstants (copy), SendPassthroughUnifiedEventLogForInstanceFunction (copy), UnifiedEventLogEnums (copy), SendUnifiedEventLogForInstanceFunction (copy)
	local ShopUnifiedLoggingSurfaceModule = GetShopUnifiedLoggingSurfaceModule(p1)
	local Filter = if FFlagAllowCustomUnifiedEventFilter then InExperienceShopUnifiedEventFilterModule.filter else nil
	
	if FFlagAXUnifiedEventStrictPayloads then
		local ATTRIBUTEPREFIX = UnifiedEventLogConstants.ATTRIBUTE_PREFIX
		local Attributes = Object:GetAttributes()
		SendPassthroughUnifiedEventLogForInstanceFunction(Object, {
			action = UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
			surface = ShopUnifiedLoggingSurfaceModule,
			itemId = Attributes[ATTRIBUTEPREFIX .. UnifiedEventLogConstants.FIELD_ITEM_ID],
			itemType = Attributes[ATTRIBUTEPREFIX .. UnifiedEventLogConstants.FIELD_ITEM_TYPE]
		}, {
			includeScreenSize = true,
			includeElementSizeAndPosition = true,
			filter = Filter
		})
		
		return
	else
		SendUnifiedEventLogForInstanceFunction(Object, {
			action = UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
			surface = ShopUnifiedLoggingSurfaceModule
		}, {
			includeScreenSize = true,
			includeElementSizeAndPosition = true,
			filter = Filter
		})
	end
end