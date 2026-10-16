local UnifiedLoggingSurface = require(script:FindFirstAncestor("InExperienceShop").Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local ConstantsModule = require(script.Parent.Constants)

return function(Home) --[[ Line: 11 | Named "getShopUnifiedLoggingSurface" ]]
	-- upvalues: ConstantsModule (copy), UnifiedLoggingSurface (copy)
	return if Home == ConstantsModule.ShopPageType.Home then UnifiedLoggingSurface.IN_EXPERIENCE_SHOP_HOME elseif Home == ConstantsModule.ShopPageType.Search then UnifiedLoggingSurface.IN_EXPERIENCE_SHOP_SEARCH else UnifiedLoggingSurface.IN_EXPERIENCE_SHOP_DETAILS
end