local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local videoPlaybackCoordinatorModule = require(videoUtils.VideoPlaybackCoordinator)
local viewportVideoAutoplayControllerModule = require(videoUtils.ViewportVideoAutoplayController)
local fFlagLuaAppVideoAutoplayFeedElection = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection
local t = {}
t.__index = t

function t.new(p1, p2, p3)
	-- upvalues: videoPlaybackCoordinatorModule (ref), viewportVideoAutoplayControllerModule (ref), fFlagLuaAppVideoAutoplayFeedElection (ref), t (ref)
	local var1 = videoPlaybackCoordinatorModule.new()
	local t_1 = {
		videoPlaybackCoordinator = var1,
		viewportVideoAutoplayController = if p1 then viewportVideoAutoplayControllerModule.new(var1, if fFlagLuaAppVideoAutoplayFeedElection then p2 else nil, if fFlagLuaAppVideoAutoplayFeedElection then p3 else nil) else nil
	}
	setmetatable(t_1, t)
	
	return t_1
end

return t