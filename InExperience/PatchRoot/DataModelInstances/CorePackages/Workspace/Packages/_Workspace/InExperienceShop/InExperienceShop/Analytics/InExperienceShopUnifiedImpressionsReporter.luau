local parent = script:FindFirstAncestor("InExperienceShop").Parent
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local sendUnifiedEventLogForInstance = avatarExperienceAnalyticsModule.sendUnifiedEventLogForInstance
local fFlagAllowCustomUnifiedEventFilter = avatarExperienceAnalyticsModule.Flags.FFlagAllowCustomUnifiedEventFilter
local unifiedLoggingSurface = require(parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local constantsModule = require(script.Parent.Constants)
local inExperienceShopUnifiedEventFilterModule = require(script.Parent.InExperienceShopUnifiedEventFilter)

return function(p0) --[[ line: 14 | named "InExperienceShopUnifiedImpressionsReporter" ]]
	-- upvalues: constantsModule (ref), unifiedLoggingSurface (ref), fFlagAllowCustomUnifiedEventFilter (ref), inExperienceShopUnifiedEventFilterModule (ref), sendUnifiedEventLogForInstance (ref), unifiedEventLogEnums (ref)
	return function(p1) --[[ line: 15 ]]
		-- upvalues: p0 (ref), constantsModule (copy), unifiedLoggingSurface (copy), fFlagAllowCustomUnifiedEventFilter (copy), inExperienceShopUnifiedEventFilterModule (copy), sendUnifiedEventLogForInstance (copy), unifiedEventLogEnums (copy)
		sendUnifiedEventLogForInstance(p1.visibleInstance, {
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_IMPRESSION,
			surface = if p0 == constantsModule.ShopPageType.Home then unifiedLoggingSurface.IN_EXPERIENCE_SHOP_HOME elseif p0 == constantsModule.ShopPageType.Search then unifiedLoggingSurface.IN_EXPERIENCE_SHOP_SEARCH else unifiedLoggingSurface.IN_EXPERIENCE_SHOP_DETAILS
		}, {
			includeScreenSize = true,
			includeElementSizeAndPosition = true,
			filter = if fFlagAllowCustomUnifiedEventFilter then inExperienceShopUnifiedEventFilterModule.filter else nil
		})
	end
end