local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local _ = require(avatarExperienceAnalytics.Parent.AvatarExperienceCommon)
local unifiedEventLogEnumsModule = require(avatarExperienceAnalytics.UnifiedEventLogEnums)

return function(p1)
	-- upvalues: unifiedEventLogEnumsModule (ref)
	return if p1 == "Look" then unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.LOOK elseif p1 == "Asset" then unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.ASSET elseif p1 == "Bundle" then unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.BUNDLE else nil
end