local VideoUtils = script:FindFirstAncestor("VideoUtils")
local Parent = VideoUtils.Parent
local ViewportVideoAutoplayModeModule = require(VideoUtils.ViewportVideoAutoplayMode)
local VideoPlaybackCoordinatorModule = require(VideoUtils.VideoPlaybackCoordinator)
local VideoPlaybackDetectionMethodModule = require(VideoUtils.VideoPlaybackDetectionMethod)
local ViewportVideoAutoplayControllerModule = require(VideoUtils.ViewportVideoAutoplayController)
local FFlagLuaAppVideoAutoplayFeedElection = require(Parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection
local FFlagLuaAppOneByTwoHoverIdleAutoplay = require(Parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local FeedVideoPlaybackContextModule = {}
FeedVideoPlaybackContextModule.__index = FeedVideoPlaybackContextModule

function FeedVideoPlaybackContextModule.new(NewResult, p1, p2, AutoplayAllCandidates) --[[ Line: 30 ]]
	-- upvalues: VideoPlaybackCoordinatorModule (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), VideoPlaybackDetectionMethodModule (copy), ViewportVideoAutoplayModeModule (copy), ViewportVideoAutoplayControllerModule (copy), FFlagLuaAppVideoAutoplayFeedElection (copy), FeedVideoPlaybackContextModule (copy)
	local NewVideoPlaybackCoordinator = VideoPlaybackCoordinatorModule.new()
	local AutoplayAllCandidates1 = nil
	
	if FFlagLuaAppOneByTwoHoverIdleAutoplay then
		if AutoplayAllCandidates == VideoPlaybackDetectionMethodModule.Viewport then
			AutoplayAllCandidates1 = ViewportVideoAutoplayModeModule.AutoplayAllCandidates
		elseif AutoplayAllCandidates == VideoPlaybackDetectionMethodModule.Hover then
			AutoplayAllCandidates1 = ViewportVideoAutoplayModeModule.UserIntentWithSelectiveAutoplay
		end
	end
	local config = {
		videoPlaybackCoordinator = NewVideoPlaybackCoordinator,
		viewportVideoAutoplayController = if FFlagLuaAppOneByTwoHoverIdleAutoplay and AutoplayAllCandidates1 ~= nil then if NewResult then ViewportVideoAutoplayControllerModule.new(NewVideoPlaybackCoordinator, if FFlagLuaAppVideoAutoplayFeedElection then p1 else nil, if FFlagLuaAppVideoAutoplayFeedElection then p2 else nil) else ViewportVideoAutoplayControllerModule.new(NewVideoPlaybackCoordinator, if FFlagLuaAppVideoAutoplayFeedElection then p1 else nil, if FFlagLuaAppVideoAutoplayFeedElection then p2 else nil, AutoplayAllCandidates1) elseif NewResult then ViewportVideoAutoplayControllerModule.new(NewVideoPlaybackCoordinator, if FFlagLuaAppVideoAutoplayFeedElection then p1 else nil, if FFlagLuaAppVideoAutoplayFeedElection then p2 else nil) else nil
	}
	setmetatable(config, FeedVideoPlaybackContextModule)
	
	return config
end

return FeedVideoPlaybackContextModule