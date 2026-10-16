local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local GetAvatarEventCounterNameWithPlatformModule = require(script.Parent.getAvatarEventCounterNameWithPlatform)

return function(p1) --[[ Line: 5 | Named "reportAvatarEventCounterV1" ]]
	-- upvalues: GetAvatarEventCounterNameWithPlatformModule (copy), RbxAnalyticsService (copy)
	RbxAnalyticsService:ReportCounter(GetAvatarEventCounterNameWithPlatformModule(p1), 1)
end