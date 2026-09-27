local avatarExperienceAnalyticsModule = require(script:FindFirstAncestor("InExperienceShop").Parent.AvatarExperienceAnalytics)
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local sendUnifiedEventLogForInstance = avatarExperienceAnalyticsModule.sendUnifiedEventLogForInstance
local fFlagAllowCustomUnifiedEventFilter = avatarExperienceAnalyticsModule.Flags.FFlagAllowCustomUnifiedEventFilter
local inExperienceShopUnifiedEventFilterModule = require(script.Parent.InExperienceShopUnifiedEventFilter)
local getShopUnifiedLoggingSurfaceModule = require(script.Parent.getShopUnifiedLoggingSurface)

return function(p1, p2)
	-- upvalues: getShopUnifiedLoggingSurfaceModule (ref), fFlagAllowCustomUnifiedEventFilter (ref), inExperienceShopUnifiedEventFilterModule (ref), sendUnifiedEventLogForInstance (ref), unifiedEventLogEnums (ref)
	sendUnifiedEventLogForInstance(p1, {
		action = unifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
		surface = getShopUnifiedLoggingSurfaceModule(p2)
	}, {
		includeScreenSize = true,
		includeElementSizeAndPosition = true,
		filter = if fFlagAllowCustomUnifiedEventFilter then inExperienceShopUnifiedEventFilterModule.filter else nil
	})
end