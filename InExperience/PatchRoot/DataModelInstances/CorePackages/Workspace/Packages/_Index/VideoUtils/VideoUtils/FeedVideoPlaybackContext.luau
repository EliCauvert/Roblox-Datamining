local videoUtils = script:FindFirstAncestor("VideoUtils")
local videoPlaybackCoordinatorModule = require(videoUtils.VideoPlaybackCoordinator)
local viewportVideoAutoplayControllerModule = require(videoUtils.ViewportVideoAutoplayController)
local t = {}
t.__index = t

function t.new(p0) --[[ line: 22 ]]
	-- upvalues: videoPlaybackCoordinatorModule (ref), viewportVideoAutoplayControllerModule (ref), t (ref)
	local var4 = videoPlaybackCoordinatorModule.new()
	local t_1 = {
		videoPlaybackCoordinator = var4,
		viewportVideoAutoplayController = if p0 then viewportVideoAutoplayControllerModule.new(var4) else nil
	}
	setmetatable(t_1, t)
	
	return t_1
end

return t