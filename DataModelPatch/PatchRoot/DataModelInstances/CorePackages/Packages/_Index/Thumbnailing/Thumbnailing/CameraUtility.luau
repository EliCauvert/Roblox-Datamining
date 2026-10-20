local CFrameUtilityModule = require(script.Parent.CFrameUtility)
local VectorUtilityModule = require(script.Parent.VectorUtility)
local CharacterUtilityModule = require(script.Parent.CharacterUtility)
local _CFrame = CFrame.fromEulerAnglesYXZ(-0.3490658503988659, 0.3490658503988659, 0)
local _CFrame1 = CFrame.fromEulerAnglesYXZ(-0.3490658503988659, -0.3490658503988659, 0)
local _CFrame2 = CFrame.Angles(0.4363323129985824, 0.4363323129985824, 0)
local _CFrame3 = CFrame.Angles(0, 1.5707963267948966, 0)
local _CFrame4 = CFrame.Angles(0, -1.5707963267948966, 0)
local CameraUtilityModule = {
	DefaultHeadMarginScale = 1.1,
	DefaultBodyMarginScale = 1.1,
	DefaultBodyPartMarginScale = 1.2,
	XRotForFullBody = 15,
	XRotForCloseup = 0,
	DistanceScaleForFullBody = 1,
	GetCameraCFrame = function(AdjustTargetCFrameWithExtentsResult, Vector3FromXYRotPlusDistanceResult): CFrame
		return CFrame.lookAt(AdjustTargetCFrameWithExtentsResult * Vector3FromXYRotPlusDistanceResult, AdjustTargetCFrameWithExtentsResult.Position)
	end,
	CreateThumbnailCamera = function()
		local ThumbnailCamera = Instance.new("Camera")
		ThumbnailCamera.Name = "ThumbnailCamera"
		ThumbnailCamera.CameraType = Enum.CameraType.Scriptable
		ThumbnailCamera.Parent = workspace:GetChildren()[1]
		
		return ThumbnailCamera
	end,
	CalculateBaseDistanceToCamera = function(Radians: number, MinExtent, MaxExtent, ExtentScale)
		return math.max((MaxExtent.X - MinExtent.X) / 2, (MaxExtent.Y - MinExtent.Y) / 2) * ExtentScale / math.tan(Radians / 2)
	end
}

function CameraUtilityModule.SetupCamera(Camera: Camera, p1)
	-- upvalues: CameraUtilityModule (copy), CFrameUtilityModule (copy), VectorUtilityModule (copy)
	if p1.optFieldOfView then
		Camera.FieldOfView = p1.optFieldOfView
	end
	local BaseDistanceToCamera = CameraUtilityModule.CalculateBaseDistanceToCamera(math.rad(p1.optFieldOfViewForDistanceScale or Camera.FieldOfView), p1.minExtent, p1.maxExtent, p1.extentScale)
	
	if p1.optCameraDistanceScale then
		BaseDistanceToCamera *= p1.optCameraDistanceScale
	end
	Camera.CFrame = CameraUtilityModule.GetCameraCFrame(CFrameUtilityModule.AdjustTargetCFrameWithExtents(p1.targetCFrame, p1.minExtent, p1.maxExtent), (VectorUtilityModule.Vector3FromXYRotPlusDistance(p1.optCameraXRot or 0, p1.optCameraYRot or 0, BaseDistanceToCamera)))
end

function CameraUtilityModule.SetupBodyPartCamera(Object, p1, ChildNames, Camera)
	-- upvalues: _CFrame1 (copy), _CFrame (copy), CharacterUtilityModule (copy), CameraUtilityModule (copy)
	local List = {}
	
	if #ChildNames > 0 then
		for _, childName in pairs(ChildNames) do
			local Child = Object:FindFirstChild(childName, true)
			
			if Child then
				table.insert(List, Child)
			end
		end
	end
	local TargetCFrame = (if p1 then _CFrame1 else _CFrame) * Object:FindFirstChild("HumanoidRootPart").CFrame
	local BodyPartsExtents, BodyPartsExtents2 = CharacterUtilityModule.CalculateBodyPartsExtents(TargetCFrame, List)
	CameraUtilityModule.SetupCamera(Camera, {
		optFieldOfView = 30,
		targetCFrame = TargetCFrame,
		minExtent = BodyPartsExtents,
		maxExtent = BodyPartsExtents2,
		extentScale = CameraUtilityModule.DefaultBodyPartMarginScale
	})
end

function CameraUtilityModule.SetupHeadCamera(Object, Camera)
	-- upvalues: CFrameUtilityModule (copy), CharacterUtilityModule (copy), CameraUtilityModule (copy)
	local ScaledTargetCFrame = CFrame.fromEulerAnglesYXZ(0.2617993877991494, 0.5235987755982988, 0) * CFrameUtilityModule.CalculateTargetCFrame(Object:FindFirstChild("Head").CFrame)
	local HeadExtents, HeadExtents2 = CharacterUtilityModule.CalculateHeadExtents(Object, ScaledTargetCFrame)
	CameraUtilityModule.SetupCamera(Camera, {
		optFieldOfView = 30,
		extentScale = 1.1,
		targetCFrame = ScaledTargetCFrame,
		minExtent = HeadExtents,
		maxExtent = HeadExtents2
	})
end

local function _(Object): boolean
	local MeshPart = Object:FindFirstChildWhichIsA("MeshPart")
	
	if MeshPart then
		assert(MeshPart, "Assert handle is not nil to silence type checker")
		
		return MeshPart:FindFirstChild("LeftFootAttachment") ~= nil
	else
		return false
	end
end

local _ = function(Object): boolean
	local MeshPart = Object:FindFirstChildWhichIsA("MeshPart")
	
	if MeshPart then
		assert(MeshPart, "Assert handle is not nil to silence type checker")
		
		return MeshPart:FindFirstChild("RightFootAttachment") ~= nil
	else
		return false
	end
end

local _ = function(Object)
	-- upvalues: _CFrame3 (copy), _CFrame4 (copy), _CFrame2 (copy)
	local MeshPart = Object:FindFirstChildWhichIsA("MeshPart")
	local HasLeftFootAttachment = nil
	
	if MeshPart then
		assert(MeshPart, "Assert handle is not nil to silence type checker")
		HasLeftFootAttachment = MeshPart:FindFirstChild("LeftFootAttachment") ~= nil
	else
		HasLeftFootAttachment = false
	end
	if HasLeftFootAttachment then
		return _CFrame3
	end
	local MeshPart1 = Object:FindFirstChildWhichIsA("MeshPart")
	local HasRightFootAttachment = nil
	
	if MeshPart1 then
		assert(MeshPart1, "Assert handle is not nil to silence type checker")
		HasRightFootAttachment = MeshPart1:FindFirstChild("RightFootAttachment") ~= nil
	else
		HasRightFootAttachment = false
	end
	return if HasRightFootAttachment then _CFrame4 else _CFrame2
end

function CameraUtilityModule.SetupAccessoryCamera(Object, Camera)
	-- upvalues: _CFrame3 (copy), _CFrame4 (copy), _CFrame2 (copy), CharacterUtilityModule (copy), CameraUtilityModule (copy)
	local Children = Object:GetChildren()
	assert(#Children == 1, "Assert SetupMeshPartAccessoryCamera accessoryModel only has accessory as a child.")
	local Child = Children[1]
	local Handle = Child:FindFirstChild("Handle")
	assert(Handle, "Assert Accessory has handle for camera setup.")
	Handle.CFrame = CFrame.new()
	local HandleCFrame = Handle.CFrame
	local MeshPart = Child:FindFirstChildWhichIsA("MeshPart")
	local HasLeftFootAttachment = nil
	
	if MeshPart then
		assert(MeshPart, "Assert handle is not nil to silence type checker")
		HasLeftFootAttachment = MeshPart:FindFirstChild("LeftFootAttachment") ~= nil
	else
		HasLeftFootAttachment = false
	end
	local _CFrame = nil
	if HasLeftFootAttachment then
		_CFrame = _CFrame3
	else
		local MeshPart1 = Child:FindFirstChildWhichIsA("MeshPart")
		local HasRightFootAttachment = nil
		
		if MeshPart1 then
			assert(MeshPart1, "Assert handle is not nil to silence type checker")
			HasRightFootAttachment = MeshPart1:FindFirstChild("RightFootAttachment") ~= nil
		else
			HasRightFootAttachment = false
		end
		_CFrame = if HasRightFootAttachment then _CFrame4 else _CFrame2
	end
	local ScaledHandleCFrame = HandleCFrame * _CFrame
	local ModelExtents, ModelExtents2 = CharacterUtilityModule.CalculateModelExtents(Object, ScaledHandleCFrame)
	CameraUtilityModule.SetupCamera(Camera, {
		optFieldOfView = 20,
		extentScale = 1.1,
		targetCFrame = ScaledHandleCFrame,
		minExtent = ModelExtents,
		maxExtent = ModelExtents2
	})
end

return CameraUtilityModule