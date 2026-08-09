local parent = script:FindFirstAncestor("InExperienceShop").Parent
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local sendUnifiedEventLogForInstance = avatarExperienceAnalyticsModule.sendUnifiedEventLogForInstance
local unifiedLoggingSurface = require(parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local constantsModule = require(script.Parent.Constants)

return function(p0) --[[ line: 12 | named "InExperienceShopUnifiedImpressionsReporter" ]]
	-- upvalues: constantsModule (ref), unifiedLoggingSurface (ref), sendUnifiedEventLogForInstance (ref), unifiedEventLogEnums (ref)
	return function(p1) --[[ line: 13 ]]
		-- upvalues: p0 (ref), constantsModule (copy), unifiedLoggingSurface (copy), sendUnifiedEventLogForInstance (copy), unifiedEventLogEnums (copy)
		sendUnifiedEventLogForInstance(p1.visibleInstance, {
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_IMPRESSION,
			surface = if p0 == constantsModule.ShopPageType.Home then unifiedLoggingSurface.IN_EXPERIENCE_SHOP_HOME elseif p0 == constantsModule.ShopPageType.Search then unifiedLoggingSurface.IN_EXPERIENCE_SHOP_SEARCH else unifiedLoggingSurface.IN_EXPERIENCE_SHOP_DETAILS
		}, {
			includeScreenSize = true,
			includeElementSizeAndPosition = true
		})
	end
end