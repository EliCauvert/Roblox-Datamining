local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local GetAvatarEventCounterNameWithPlatformModule = require(script.Parent.getAvatarEventCounterNameWithPlatform)

return function(p1)
	-- upvalues: RbxAnalyticsService (copy), GetAvatarEventCounterNameWithPlatformModule (copy)
	if p1 then
		RbxAnalyticsService:ReportCounter(GetAvatarEventCounterNameWithPlatformModule(p1), 1)
		
		return
	else
		RbxAnalyticsService:ReportCounter("AvatarExperienceCounterMiss", 1)
	end
end