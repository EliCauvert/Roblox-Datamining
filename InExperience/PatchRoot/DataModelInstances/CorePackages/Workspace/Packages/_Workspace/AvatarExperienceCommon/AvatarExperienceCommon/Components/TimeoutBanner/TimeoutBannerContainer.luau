local ReactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local UseTimeoutBannerPropsModule = require(script.Parent.useTimeoutBannerProps)
local TimeoutBannerModule = require(script.Parent.TimeoutBanner)

return ReactModule.memo(function(p1) --[[ Line: 16 | Named "TimeoutBannerContainer" ]]
	-- upvalues: UseTimeoutBannerPropsModule (copy), ReactModule (copy), TimeoutBannerModule (copy)
	return ReactModule.createElement(TimeoutBannerModule, (UseTimeoutBannerPropsModule(p1)))
end)