local AvatarExperienceAnalyticsModule = require(script:FindFirstAncestor("InExperienceShop").Parent.AvatarExperienceAnalytics)
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local SendUnifiedEventLogForInstanceFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLogForInstance
local FFlagAllowCustomUnifiedEventFilter = AvatarExperienceAnalyticsModule.Flags.FFlagAllowCustomUnifiedEventFilter
local InExperienceShopUnifiedEventFilterModule = require(script.Parent.InExperienceShopUnifiedEventFilter)
local GetShopUnifiedLoggingSurfaceModule = require(script.Parent.getShopUnifiedLoggingSurface)

return function(p1, p2) --[[ Line: 14 | Named "sendRobuxBuyClickUnifiedEvent" ]]
	-- upvalues: GetShopUnifiedLoggingSurfaceModule (copy), FFlagAllowCustomUnifiedEventFilter (copy), InExperienceShopUnifiedEventFilterModule (copy), SendUnifiedEventLogForInstanceFunction (copy), UnifiedEventLogEnums (copy)
	SendUnifiedEventLogForInstanceFunction(p1, {
		action = UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
		surface = GetShopUnifiedLoggingSurfaceModule(p2)
	}, {
		includeScreenSize = true,
		includeElementSizeAndPosition = true,
		filter = if FFlagAllowCustomUnifiedEventFilter then InExperienceShopUnifiedEventFilterModule.filter else nil
	})
end