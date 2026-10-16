local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local _ = require(InExperienceShop.Types)

return function(p1) --[[ Line: 7 | Named "mapShopItemTypeToUnifiedItemType" ]]
	-- upvalues: Parent (copy)
	local MarketplaceUnifiedItemType = require(Parent.AvatarExperienceAnalytics).UnifiedEventLogEnums.MarketplaceUnifiedItemType
	
	return if p1 == "GamePass" then MarketplaceUnifiedItemType.GAME_PASS elseif p1 == "Product" then MarketplaceUnifiedItemType.DEVELOPER_PRODUCT elseif p1 == "Robux" then MarketplaceUnifiedItemType.ROBUX else nil
end