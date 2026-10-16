local VideoUtils = script:FindFirstAncestor("VideoUtils")
local ResponsiveModule = require(VideoUtils.Parent.Responsive)
local VideoPlaybackDetectionMethodModule = require(VideoUtils.VideoPlaybackDetectionMethod)

return function(Directional, p1) --[[ Line: 10 | Named "getPlaybackDetectionMethod" ]]
	-- upvalues: VideoPlaybackDetectionMethodModule (copy), ResponsiveModule (copy)
	return if p1 then VideoPlaybackDetectionMethodModule.Hover elseif Directional == ResponsiveModule.Input.Touch then VideoPlaybackDetectionMethodModule.Viewport elseif Directional == ResponsiveModule.Input.Directional then VideoPlaybackDetectionMethodModule.Selection else nil
end