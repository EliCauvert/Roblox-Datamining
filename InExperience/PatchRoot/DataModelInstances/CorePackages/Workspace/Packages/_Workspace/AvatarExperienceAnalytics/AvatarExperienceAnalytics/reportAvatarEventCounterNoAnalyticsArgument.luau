local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local getAvatarEventCounterNameWithPlatformModule = require(script.Parent.getAvatarEventCounterNameWithPlatform)

return function(p0) --[[ line: 4 | named "reportAvatarEventCounterNoAnalyticsArgument" ]]
	-- upvalues: rbxAnalyticsService (ref), getAvatarEventCounterNameWithPlatformModule (ref)
	if p0 then
		rbxAnalyticsService:ReportCounter(getAvatarEventCounterNameWithPlatformModule(p0), 1)
		
		return
	end
	rbxAnalyticsService:ReportCounter("AvatarExperienceCounterMiss", 1)
end