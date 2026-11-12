local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local ReactModule = require(Parent.React)
local VideoPlayer = require(Parent.VideoUtils).VideoPlayer

return function(p1)
	-- upvalues: ReactModule (copy), VideoPlayer (copy)
	return ReactModule.createElement("Frame", {
		[ReactModule.Tag] = "data-testid=JoinCardBannerVideoView",
		Size = p1.Size,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Visible = p1.isVisible,
		ZIndex = p1.ZIndex
	}, {
		VideoPlayer = ReactModule.createElement(VideoPlayer, {
			muted = true,
			looped = true,
			hideCenterPlayButton = true,
			video = p1.video,
			shouldStartPlayback = p1.shouldStartPlayback,
			Size = UDim2.fromScale(1, 1),
			ScaleType = Enum.ScaleType.Crop,
			cornerRadius = p1.cornerRadius,
			disableActivation = p1.onActivated == nil,
			onVideoPlayerActivated = p1.onActivated,
			videoAnalyticsContext = p1.videoAnalyticsContext,
			onVideoLoaded = p1.onVideoLoaded
		})
	})
end