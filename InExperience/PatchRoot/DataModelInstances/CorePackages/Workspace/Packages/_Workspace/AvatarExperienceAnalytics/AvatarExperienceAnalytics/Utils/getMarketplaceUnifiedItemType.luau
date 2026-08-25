local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local _ = require(avatarExperienceAnalytics.Parent.AvatarExperienceCommon)
local unifiedEventLogEnumsModule = require(avatarExperienceAnalytics.UnifiedEventLogEnums)

return function(p0)
	-- upvalues: unifiedEventLogEnumsModule (ref)
	return if p0 == "Look" then unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.LOOK elseif p0 == "Asset" then unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.ASSET elseif p0 == "Bundle" then unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.BUNDLE else nil
end