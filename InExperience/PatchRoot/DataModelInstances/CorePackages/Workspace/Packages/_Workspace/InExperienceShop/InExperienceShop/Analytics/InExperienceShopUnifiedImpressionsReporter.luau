local AvatarExperienceAnalyticsModule = require(script:FindFirstAncestor("InExperienceShop").Parent.AvatarExperienceAnalytics)
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local SendUnifiedEventLogForInstanceFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLogForInstance
local FFlagAllowCustomUnifiedEventFilter = AvatarExperienceAnalyticsModule.Flags.FFlagAllowCustomUnifiedEventFilter
local InExperienceShopUnifiedEventFilterModule = require(script.Parent.InExperienceShopUnifiedEventFilter)
local GetShopUnifiedLoggingSurfaceModule = require(script.Parent.getShopUnifiedLoggingSurface)

return function(p1)
	-- upvalues: GetShopUnifiedLoggingSurfaceModule (copy), FFlagAllowCustomUnifiedEventFilter (copy), InExperienceShopUnifiedEventFilterModule (copy), SendUnifiedEventLogForInstanceFunction (copy), UnifiedEventLogEnums (copy)
	return function(p2)
		-- upvalues: GetShopUnifiedLoggingSurfaceModule (upval), p1 (copy), FFlagAllowCustomUnifiedEventFilter (upval), InExperienceShopUnifiedEventFilterModule (upval), SendUnifiedEventLogForInstanceFunction (upval), UnifiedEventLogEnums (upval)
		SendUnifiedEventLogForInstanceFunction(p2.visibleInstance, {
			action = UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_IMPRESSION,
			surface = GetShopUnifiedLoggingSurfaceModule(p1)
		}, {
			includeScreenSize = true,
			includeElementSizeAndPosition = true,
			filter = if FFlagAllowCustomUnifiedEventFilter then InExperienceShopUnifiedEventFilterModule.filter else nil
		})
	end
end