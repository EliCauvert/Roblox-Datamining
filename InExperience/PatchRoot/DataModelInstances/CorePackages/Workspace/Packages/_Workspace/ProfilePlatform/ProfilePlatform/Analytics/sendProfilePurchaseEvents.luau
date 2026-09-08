local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local _ = require(parent.AvatarExperienceCommon)
local enumsModule = require(profilePlatform.Common.Enums)
local sendUnifiedEventLog = avatarExperienceAnalyticsModule.sendUnifiedEventLog
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local unifiedLoggingSurface = avatarExperienceNavigationModule.Enums.UnifiedLoggingSurface

return function(p1, p2, p3)
	-- upvalues: enumsModule (ref), unifiedLoggingSurface (ref), sendUnifiedEventLog (ref), unifiedEventLogEnums (ref)
	local var1 = if p3 == enumsModule.ProfileTypes.Community then unifiedLoggingSurface.COMMUNITY_PROFILE else unifiedLoggingSurface.USER_PROFILE
	
	for i, v in p2 do
		local var2 = v.itemType == enumsModule.ItemTypes.Bundle
		sendUnifiedEventLog({
			action = p1,
			surface = var1,
			itemId = v.itemId,
			itemType = if var2 then unifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE else unifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET,
			assetType = if not var2 then v.itemSubType else nil,
			bundleType = if var2 then v.itemSubType else nil,
			organicItemPrice = v.priceInRobux
		})
	end
end