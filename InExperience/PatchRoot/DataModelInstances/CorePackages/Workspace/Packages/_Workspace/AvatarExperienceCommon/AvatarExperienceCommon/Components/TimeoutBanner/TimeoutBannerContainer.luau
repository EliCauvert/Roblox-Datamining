local reactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local useTimeoutBannerPropsModule = require(script.Parent.useTimeoutBannerProps)
local timeoutBannerModule = require(script.Parent.TimeoutBanner)

return reactModule.memo(function(p0) --[[ line: 16 | named "TimeoutBannerContainer" ]]
	-- upvalues: useTimeoutBannerPropsModule (ref), reactModule (ref), timeoutBannerModule (ref)
	return reactModule.createElement(timeoutBannerModule, useTimeoutBannerPropsModule(p0))
end)