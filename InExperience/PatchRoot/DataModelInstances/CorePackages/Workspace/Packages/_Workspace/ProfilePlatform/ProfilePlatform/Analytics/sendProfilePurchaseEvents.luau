local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local _ = require(Parent.AvatarExperienceModel)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local SendUnifiedEventLogFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLog
local SendPassthroughUnifiedEventLogFunction = AvatarExperienceAnalyticsModule.sendPassthroughUnifiedEventLog
local FFlagAXUnifiedEventStrictPayloads = AvatarExperienceAnalyticsModule.Flags.FFlagAXUnifiedEventStrictPayloads
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local _ = UnifiedEventLogEnums.MarketplaceUnifiedAction
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface

return function(Action, List, Community)
	-- upvalues: EnumsModule (copy), UnifiedLoggingSurface (copy), FFlagAXUnifiedEventStrictPayloads (copy), SendPassthroughUnifiedEventLogFunction (copy), UnifiedEventLogEnums (copy), SendUnifiedEventLogFunction (copy)
	local COMMUNITYPROFILE = if Community == EnumsModule.ProfileTypes.Community then UnifiedLoggingSurface.COMMUNITY_PROFILE else UnifiedLoggingSurface.USER_PROFILE
	for _, value in List do
		local IsItemTypeMatch = value.itemType == EnumsModule.ItemTypes.Bundle
		
		if FFlagAXUnifiedEventStrictPayloads then
			SendPassthroughUnifiedEventLogFunction({
				action = Action,
				surface = COMMUNITYPROFILE,
				itemId = value.itemId,
				itemType = if IsItemTypeMatch then UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE else UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET,
				assetType = if IsItemTypeMatch then nil else value.itemSubType,
				bundleType = if IsItemTypeMatch then value.itemSubType else nil,
				organicItemPrice = value.priceInRobux
			})
		else
			SendUnifiedEventLogFunction({
				action = Action,
				surface = COMMUNITYPROFILE,
				itemId = value.itemId,
				itemType = if IsItemTypeMatch then UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE else UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET,
				assetType = if IsItemTypeMatch then nil else value.itemSubType,
				bundleType = if IsItemTypeMatch then value.itemSubType else nil,
				organicItemPrice = value.priceInRobux
			})
		end
	end
end