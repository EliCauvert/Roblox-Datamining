local VRUtil = require(script:FindFirstAncestor("VrSpatialUi").Parent.VrCommon).VRUtil
local var0 = game:DefineFastInt("SpatialUIHeadLookDotNoMovementThreshold", 990) / 1000
local t = {}
t.__index = t

function t:getCurrentStableCameraCFrame()
	return self.lastCameraCFrame
end

function t:updateAndCheckCameraMoved()
	-- upvalues: VRUtil (ref), var0 (ref)
	local userCFrameWorldSpace = VRUtil.GetUserCFrameWorldSpace(Enum.UserCFrame.Head)
	
	if not self.lastUserHeadCFrame then
		self.lastUserHeadCFrame = userCFrameWorldSpace
		self.lastCameraCFrame = workspace.CurrentCamera.CFrame
		
		return true
	elseif workspace.CurrentCamera.CameraType == Enum.CameraType.Scriptable and not (self.lastUserHeadCFrame.LookVector:Dot(userCFrameWorldSpace.LookVector) < var0) then
		return false
	end
	self.lastUserHeadCFrame = userCFrameWorldSpace
	self.lastCameraCFrame = workspace.CurrentCamera.CFrame
	
	return true
end

function t.new()
	-- upvalues: t (ref)
	local t_1 = { lastUserHeadCFrame = nil, lastCameraCFrame = nil }
	setmetatable(t_1, t)
	
	return t_1
end

return t