local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local getAvatarEventCounterNameWithPlatformModule = require(script.Parent.getAvatarEventCounterNameWithPlatform)

return function(p0)
	-- upvalues: getAvatarEventCounterNameWithPlatformModule (ref), rbxAnalyticsService (ref)
	rbxAnalyticsService:ReportCounter(getAvatarEventCounterNameWithPlatformModule(p0), 1)
end