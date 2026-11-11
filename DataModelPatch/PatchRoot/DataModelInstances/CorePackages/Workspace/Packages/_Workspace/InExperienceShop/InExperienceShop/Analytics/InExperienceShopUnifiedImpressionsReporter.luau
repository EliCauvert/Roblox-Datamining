local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local SendUnifiedEventLogForInstanceFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLogForInstance
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local ConstantsModule = require(script.Parent.Constants)

return function(Home)
	-- upvalues: ConstantsModule (copy), UnifiedLoggingSurface (copy), SendUnifiedEventLogForInstanceFunction (copy), UnifiedEventLogEnums (copy)
	return function(p1)
		-- upvalues: Home (copy), ConstantsModule (upval), UnifiedLoggingSurface (upval), SendUnifiedEventLogForInstanceFunction (upval), UnifiedEventLogEnums (upval)
		SendUnifiedEventLogForInstanceFunction(p1.visibleInstance, {
			action = UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_IMPRESSION,
			surface = if Home == ConstantsModule.ShopPageType.Home then UnifiedLoggingSurface.IN_EXPERIENCE_SHOP_HOME elseif Home == ConstantsModule.ShopPageType.Search then UnifiedLoggingSurface.IN_EXPERIENCE_SHOP_SEARCH else UnifiedLoggingSurface.IN_EXPERIENCE_SHOP_DETAILS
		}, {
			includeScreenSize = true,
			includeElementSizeAndPosition = true
		})
	end
end