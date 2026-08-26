local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local _ = require(inExperienceShop.Types)

return function(p1)
	-- upvalues: parent (ref)
	local marketplaceUnifiedItemType = require(parent.AvatarExperienceAnalytics).UnifiedEventLogEnums.MarketplaceUnifiedItemType
	
	return if p1 == "GamePass" then marketplaceUnifiedItemType.GAME_PASS elseif p1 == "Product" then marketplaceUnifiedItemType.DEVELOPER_PRODUCT elseif p1 == "Robux" then marketplaceUnifiedItemType.ROBUX else nil
end