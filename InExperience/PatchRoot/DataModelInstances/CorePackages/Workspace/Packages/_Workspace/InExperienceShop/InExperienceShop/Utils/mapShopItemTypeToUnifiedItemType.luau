local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local _ = require(inExperienceShop.Types)

return function(p0)
	-- upvalues: parent (ref)
	local marketplaceUnifiedItemType = require(parent.AvatarExperienceAnalytics).UnifiedEventLogEnums.MarketplaceUnifiedItemType
	
	return if p0 == "GamePass" then marketplaceUnifiedItemType.GAME_PASS elseif p0 == "Product" then marketplaceUnifiedItemType.DEVELOPER_PRODUCT elseif p0 == "Robux" then marketplaceUnifiedItemType.ROBUX else nil
end