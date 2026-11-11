local VideoUtils = script:FindFirstAncestor("VideoUtils")
local VideoPlaybackCoordinatorModule = require(VideoUtils.VideoPlaybackCoordinator)
local ViewportVideoAutoplayControllerModule = require(VideoUtils.ViewportVideoAutoplayController)
local FeedVideoPlaybackContextModule = {}
FeedVideoPlaybackContextModule.__index = FeedVideoPlaybackContextModule

function FeedVideoPlaybackContextModule.new(NewResult)
	-- upvalues: VideoPlaybackCoordinatorModule (copy), ViewportVideoAutoplayControllerModule (copy), FeedVideoPlaybackContextModule (copy)
	local NewVideoPlaybackCoordinator = VideoPlaybackCoordinatorModule.new()
	local config = {
		videoPlaybackCoordinator = NewVideoPlaybackCoordinator,
		viewportVideoAutoplayController = if NewResult then ViewportVideoAutoplayControllerModule.new(NewVideoPlaybackCoordinator) else nil
	}
	setmetatable(config, FeedVideoPlaybackContextModule)
	
	return config
end

return FeedVideoPlaybackContextModule