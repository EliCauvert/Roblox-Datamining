local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local UnifiedEventLogEnumsModule = require(AvatarExperienceAnalytics.UnifiedEventLogEnums)
local UnifiedEventLoggingUtilsModule = require(AvatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)

return function(p1)
	-- upvalues: UnifiedEventLogEnumsModule (copy), UnifiedEventLoggingUtilsModule (copy)
	return if p1 == nil then nil else UnifiedEventLogEnumsModule.MarketplaceLookType[UnifiedEventLoggingUtilsModule.formatLookTypeAttribute(p1)]
end