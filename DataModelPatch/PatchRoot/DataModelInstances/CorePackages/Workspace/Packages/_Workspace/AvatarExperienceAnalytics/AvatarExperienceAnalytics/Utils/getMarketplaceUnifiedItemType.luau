local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local _ = require(AvatarExperienceAnalytics.Parent.AvatarExperienceCommon)
local UnifiedEventLogEnumsModule = require(AvatarExperienceAnalytics.UnifiedEventLogEnums)

return function(p1)
	-- upvalues: UnifiedEventLogEnumsModule (copy)
	return if p1 == "Look" then UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType.LOOK elseif p1 == "Asset" then UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType.ASSET elseif p1 == "Bundle" then UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType.BUNDLE else nil
end