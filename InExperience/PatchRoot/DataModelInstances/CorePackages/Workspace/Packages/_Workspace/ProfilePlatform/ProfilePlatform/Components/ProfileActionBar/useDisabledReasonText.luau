local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local useLocalization = require(profilePlatform.Parent.Localization).Hooks.useLocalization
local textKeysModule = require(profilePlatform.Common.TextKeys)
local enumsModule = require(profilePlatform.Common.Enums)
local t = {
	[enumsModule.DisabledReasons.BannedFromCommunity] = textKeysModule.BannedFromGroup,
	[enumsModule.DisabledReasons.CommunityIsClosed] = textKeysModule.GroupClosed,
	[enumsModule.DisabledReasons.MaxCommunitiesJoined] = textKeysModule.PremiumMaxGroups,
	[enumsModule.DisabledReasons.AccountCreatedLessThanOneDay] = textKeysModule.RequiresAccountTenureTooltipOneDay,
	[enumsModule.DisabledReasons.AccountCreatedLessThanThreeDays] = textKeysModule.RequiresAccountTenureTooltipThreeDays,
	[enumsModule.DisabledReasons.AccountCreatedLessThanOneWeek] = textKeysModule.RequiresAccountTenureTooltipOneWeek,
	[enumsModule.DisabledReasons.AccountCreatedLessThanOneMonth] = textKeysModule.RequiresAccountTenureTooltipOneMonth,
	[enumsModule.DisabledReasons.AccountCreatedLessThanThreeMonths] = textKeysModule.RequiresAccountTenureTooltipThreeMonths,
	[enumsModule.DisabledReasons.InsufficientVerificationLevelHigh] = nil,
	[enumsModule.DisabledReasons.InsufficientVerificationLevelMedium] = nil,
	[enumsModule.DisabledReasons.InsufficientVerificationLevelLow] = nil
}

return function(p1)
	-- upvalues: t (ref), useLocalization (ref)
	return useLocalization({ disabledReasonText = if p1 then t[p1] else nil }).disabledReasonText
end