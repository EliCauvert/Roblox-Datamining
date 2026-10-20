local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local UseLocalizationFunction = require(ProfilePlatform.Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local config = {
	[EnumsModule.DisabledReasons.BannedFromCommunity] = TextKeysModule.BannedFromGroup,
	[EnumsModule.DisabledReasons.CommunityIsClosed] = TextKeysModule.GroupClosed,
	[EnumsModule.DisabledReasons.MaxCommunitiesJoined] = TextKeysModule.PremiumMaxGroups,
	[EnumsModule.DisabledReasons.AccountCreatedLessThanOneDay] = TextKeysModule.RequiresAccountTenureTooltipOneDay,
	[EnumsModule.DisabledReasons.AccountCreatedLessThanThreeDays] = TextKeysModule.RequiresAccountTenureTooltipThreeDays,
	[EnumsModule.DisabledReasons.AccountCreatedLessThanOneWeek] = TextKeysModule.RequiresAccountTenureTooltipOneWeek,
	[EnumsModule.DisabledReasons.AccountCreatedLessThanOneMonth] = TextKeysModule.RequiresAccountTenureTooltipOneMonth,
	[EnumsModule.DisabledReasons.AccountCreatedLessThanThreeMonths] = TextKeysModule.RequiresAccountTenureTooltipThreeMonths,
	[EnumsModule.DisabledReasons.InsufficientVerificationLevelHigh] = nil,
	[EnumsModule.DisabledReasons.InsufficientVerificationLevelMedium] = nil,
	[EnumsModule.DisabledReasons.InsufficientVerificationLevelLow] = nil
}

return function(p1)
	-- upvalues: config (copy), UseLocalizationFunction (copy)
	return UseLocalizationFunction({ disabledReasonText = if p1 then config[p1] else nil }).disabledReasonText
end