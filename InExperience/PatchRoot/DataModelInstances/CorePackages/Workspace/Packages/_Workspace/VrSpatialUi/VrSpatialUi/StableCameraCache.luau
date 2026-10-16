local VRUtil = require(script:FindFirstAncestor("VrSpatialUi").Parent.VrCommon).VRUtil
local SpatialUIHeadLookDotNoMovementThresholdRatio = game:DefineFastInt("SpatialUIHeadLookDotNoMovementThreshold", 990) / 1000
local StableCameraCache = {}
StableCameraCache.__index = StableCameraCache

function StableCameraCache:getCurrentStableCameraCFrame() --[[ Line: 18 ]]
	return self.lastCameraCFrame
end

function StableCameraCache:updateAndCheckCameraMoved(): boolean --[[ Line: 22 ]]
	-- upvalues: VRUtil (copy), SpatialUIHeadLookDotNoMovementThresholdRatio (copy)
	local UserCFrameWorldSpace = VRUtil.GetUserCFrameWorldSpace(Enum.UserCFrame.Head)
	
	if not self.lastUserHeadCFrame then
		self.lastUserHeadCFrame = UserCFrameWorldSpace
		self.lastCameraCFrame = workspace.CurrentCamera.CFrame
		
		return true
	end
	local IsDotProductBelow = self.lastUserHeadCFrame.LookVector:Dot(UserCFrameWorldSpace.LookVector) < SpatialUIHeadLookDotNoMovementThresholdRatio
	
	if workspace.CurrentCamera.CameraType == Enum.CameraType.Scriptable and not IsDotProductBelow then
		return false
	else
		self.lastUserHeadCFrame = UserCFrameWorldSpace
		self.lastCameraCFrame = workspace.CurrentCamera.CFrame
		
		return true
	end
end

function StableCameraCache.new() --[[ Line: 44 ]]
	-- upvalues: StableCameraCache (copy)
	local config = { lastUserHeadCFrame = nil, lastCameraCFrame = nil }
	setmetatable(config, StableCameraCache)
	
	return config
end

return StableCameraCache