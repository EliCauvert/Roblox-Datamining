local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local videoPlaybackCoordinatorModule = require(videoUtils.VideoPlaybackCoordinator)
local viewportVideoAutoplayControllerModule = require(videoUtils.ViewportVideoAutoplayController)
local fFlagLuaAppVideoAutoplayFeedElection = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection
local t = {}
t.__index = t

function t.new(p0, p1, p2) --[[ line: 27 ]]
	-- upvalues: videoPlaybackCoordinatorModule (ref), viewportVideoAutoplayControllerModule (ref), fFlagLuaAppVideoAutoplayFeedElection (ref), t (ref)
	local var4 = videoPlaybackCoordinatorModule.new()
	local t_1 = {
		videoPlaybackCoordinator = var4,
		viewportVideoAutoplayController = if p0 then viewportVideoAutoplayControllerModule.new(var4, if fFlagLuaAppVideoAutoplayFeedElection then p1 else nil, if fFlagLuaAppVideoAutoplayFeedElection then p2 else nil) else nil
	}
	setmetatable(t_1, t)
	
	return t_1
end

return t