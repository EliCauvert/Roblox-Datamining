local ReactModule = require(script:FindFirstAncestor("GameJoinCard").Parent.React)
local JoinCardBannerVideoViewModule = require(script.Parent.JoinCardBannerVideoView)
local UseJoinCardBannerVideoViewModelModule = require(script.Parent.useJoinCardBannerVideoViewModel)

return function(p1)
	-- upvalues: UseJoinCardBannerVideoViewModelModule (copy), ReactModule (copy), JoinCardBannerVideoViewModule (copy)
	return ReactModule.createElement(JoinCardBannerVideoViewModule, (UseJoinCardBannerVideoViewModelModule(p1)))
end