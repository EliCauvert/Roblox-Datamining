local videoUtils = script:FindFirstAncestor("VideoUtils")
local responsiveModule = require(videoUtils.Parent.Responsive)
local videoPlaybackDetectionMethodModule = require(videoUtils.VideoPlaybackDetectionMethod)

return function(p1, p2)
	-- upvalues: videoPlaybackDetectionMethodModule (ref), responsiveModule (ref)
	return if p2 then videoPlaybackDetectionMethodModule.Hover elseif p1 == responsiveModule.Input.Touch then videoPlaybackDetectionMethodModule.Viewport elseif p1 == responsiveModule.Input.Directional then videoPlaybackDetectionMethodModule.Selection else nil
end