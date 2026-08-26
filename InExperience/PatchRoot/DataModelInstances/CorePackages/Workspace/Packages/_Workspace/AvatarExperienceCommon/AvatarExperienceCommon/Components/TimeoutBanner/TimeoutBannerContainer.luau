local reactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local useTimeoutBannerPropsModule = require(script.Parent.useTimeoutBannerProps)
local timeoutBannerModule = require(script.Parent.TimeoutBanner)

return reactModule.memo(function(p1)
	-- upvalues: useTimeoutBannerPropsModule (ref), reactModule (ref), timeoutBannerModule (ref)
	return reactModule.createElement(timeoutBannerModule, useTimeoutBannerPropsModule(p1))
end)