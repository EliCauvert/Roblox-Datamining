local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local getAvatarEventCounterNameWithPlatformModule = require(script.Parent.getAvatarEventCounterNameWithPlatform)

return function(p1)
	-- upvalues: getAvatarEventCounterNameWithPlatformModule (ref), rbxAnalyticsService (ref)
	rbxAnalyticsService:ReportCounter(getAvatarEventCounterNameWithPlatformModule(p1), 1)
end