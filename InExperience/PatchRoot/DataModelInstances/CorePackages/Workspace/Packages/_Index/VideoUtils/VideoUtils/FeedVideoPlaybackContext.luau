local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local viewportVideoAutoplayModeModule = require(videoUtils.ViewportVideoAutoplayMode)
local videoPlaybackCoordinatorModule = require(videoUtils.VideoPlaybackCoordinator)
local videoPlaybackDetectionMethodModule = require(videoUtils.VideoPlaybackDetectionMethod)
local viewportVideoAutoplayControllerModule = require(videoUtils.ViewportVideoAutoplayController)
local fFlagLuaAppVideoAutoplayFeedElection = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection
local fFlagLuaAppOneByTwoHoverIdleAutoplay = require(parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local t = {}
t.__index = t

function t.new(p1, p2, p3, p4)
	-- upvalues: videoPlaybackCoordinatorModule (ref), fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), videoPlaybackDetectionMethodModule (ref), viewportVideoAutoplayModeModule (ref), viewportVideoAutoplayControllerModule (ref), fFlagLuaAppVideoAutoplayFeedElection (ref), t (ref)
	local var1 = videoPlaybackCoordinatorModule.new()
	local userIntentWithSelectiveAutoplay = nil
	
	if fFlagLuaAppOneByTwoHoverIdleAutoplay then
		if p4 == videoPlaybackDetectionMethodModule.Viewport then
			userIntentWithSelectiveAutoplay = viewportVideoAutoplayModeModule.AutoplayAllCandidates
		elseif p4 == videoPlaybackDetectionMethodModule.Hover then
			userIntentWithSelectiveAutoplay = viewportVideoAutoplayModeModule.UserIntentWithSelectiveAutoplay
		end
	end
	local var2 = if fFlagLuaAppOneByTwoHoverIdleAutoplay and userIntentWithSelectiveAutoplay ~= nil then viewportVideoAutoplayControllerModule.new(var1, if fFlagLuaAppVideoAutoplayFeedElection then p2 else nil, if fFlagLuaAppVideoAutoplayFeedElection then p3 else nil, userIntentWithSelectiveAutoplay) else nil
	
	if p1 then
		var2 = viewportVideoAutoplayControllerModule.new(var1, if fFlagLuaAppVideoAutoplayFeedElection then p2 else nil, if fFlagLuaAppVideoAutoplayFeedElection then p3 else nil)
	end
	local t_1 = {
		videoPlaybackCoordinator = var1,
		viewportVideoAutoplayController = var2
	}
	setmetatable(t_1, t)
	
	return t_1
end

return t