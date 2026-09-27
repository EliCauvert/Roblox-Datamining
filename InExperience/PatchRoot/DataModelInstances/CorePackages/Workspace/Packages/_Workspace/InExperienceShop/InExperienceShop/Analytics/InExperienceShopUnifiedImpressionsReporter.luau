local avatarExperienceAnalyticsModule = require(script:FindFirstAncestor("InExperienceShop").Parent.AvatarExperienceAnalytics)
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local sendUnifiedEventLogForInstance = avatarExperienceAnalyticsModule.sendUnifiedEventLogForInstance
local fFlagAllowCustomUnifiedEventFilter = avatarExperienceAnalyticsModule.Flags.FFlagAllowCustomUnifiedEventFilter
local inExperienceShopUnifiedEventFilterModule = require(script.Parent.InExperienceShopUnifiedEventFilter)
local getShopUnifiedLoggingSurfaceModule = require(script.Parent.getShopUnifiedLoggingSurface)

return function(p1)
	-- upvalues: getShopUnifiedLoggingSurfaceModule (ref), fFlagAllowCustomUnifiedEventFilter (ref), inExperienceShopUnifiedEventFilterModule (ref), sendUnifiedEventLogForInstance (ref), unifiedEventLogEnums (ref)
	return function(p2)
		-- upvalues: getShopUnifiedLoggingSurfaceModule (copy), p1 (ref), fFlagAllowCustomUnifiedEventFilter (copy), inExperienceShopUnifiedEventFilterModule (copy), sendUnifiedEventLogForInstance (copy), unifiedEventLogEnums (copy)
		sendUnifiedEventLogForInstance(p2.visibleInstance, {
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_IMPRESSION,
			surface = getShopUnifiedLoggingSurfaceModule(p1)
		}, {
			includeScreenSize = true,
			includeElementSizeAndPosition = true,
			filter = if fFlagAllowCustomUnifiedEventFilter then inExperienceShopUnifiedEventFilterModule.filter else nil
		})
	end
end