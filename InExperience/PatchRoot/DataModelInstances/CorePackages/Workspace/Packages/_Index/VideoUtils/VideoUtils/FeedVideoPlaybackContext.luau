local videoUtils = script:FindFirstAncestor("VideoUtils")
local videoPlaybackCoordinatorModule = require(videoUtils.VideoPlaybackCoordinator)
local viewportVideoAutoplayControllerModule = require(videoUtils.ViewportVideoAutoplayController)
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: videoPlaybackCoordinatorModule (ref), viewportVideoAutoplayControllerModule (ref), t (ref)
	local var1 = videoPlaybackCoordinatorModule.new()
	local t_1 = {
		videoPlaybackCoordinator = var1,
		viewportVideoAutoplayController = if p1 then viewportVideoAutoplayControllerModule.new(var1) else nil
	}
	setmetatable(t_1, t)
	
	return t_1
end

return t