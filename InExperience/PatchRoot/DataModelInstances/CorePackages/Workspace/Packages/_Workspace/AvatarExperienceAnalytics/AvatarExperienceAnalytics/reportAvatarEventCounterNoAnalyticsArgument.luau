local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local getAvatarEventCounterNameWithPlatformModule = require(script.Parent.getAvatarEventCounterNameWithPlatform)

return function(p1)
	-- upvalues: rbxAnalyticsService (ref), getAvatarEventCounterNameWithPlatformModule (ref)
	if p1 then
		rbxAnalyticsService:ReportCounter(getAvatarEventCounterNameWithPlatformModule(p1), 1)
		
		return
	end
	rbxAnalyticsService:ReportCounter("AvatarExperienceCounterMiss", 1)
end