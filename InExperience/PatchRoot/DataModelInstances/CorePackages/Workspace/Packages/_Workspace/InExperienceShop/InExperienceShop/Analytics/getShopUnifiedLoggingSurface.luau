local unifiedLoggingSurface = require(script:FindFirstAncestor("InExperienceShop").Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local constantsModule = require(script.Parent.Constants)

return function(p1)
	-- upvalues: constantsModule (ref), unifiedLoggingSurface (ref)
	return if p1 == constantsModule.ShopPageType.Home then unifiedLoggingSurface.IN_EXPERIENCE_SHOP_HOME elseif p1 == constantsModule.ShopPageType.Search then unifiedLoggingSurface.IN_EXPERIENCE_SHOP_SEARCH else unifiedLoggingSurface.IN_EXPERIENCE_SHOP_DETAILS
end