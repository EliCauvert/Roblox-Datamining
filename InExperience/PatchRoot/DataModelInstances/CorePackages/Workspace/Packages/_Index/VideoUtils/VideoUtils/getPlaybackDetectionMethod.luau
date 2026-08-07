local videoUtils = script:FindFirstAncestor("VideoUtils")
local responsiveModule = require(videoUtils.Parent.Responsive)
local videoPlaybackDetectionMethodModule = require(videoUtils.VideoPlaybackDetectionMethod)

return function(p0, p1) --[[ line: 10 | named "getPlaybackDetectionMethod" ]]
	-- upvalues: videoPlaybackDetectionMethodModule (ref), responsiveModule (ref)
	return if p1 then videoPlaybackDetectionMethodModule.Hover elseif p0 == responsiveModule.Input.Touch then videoPlaybackDetectionMethodModule.Viewport elseif p0 == responsiveModule.Input.Directional then videoPlaybackDetectionMethodModule.Selection else nil
end