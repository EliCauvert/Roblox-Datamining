local CameraUtilityModule = require(script.Parent.CameraUtility)
local CFrameUtilityModule = require(script.Parent.CFrameUtility)
local CharacterUtilityModule = require(script.Parent.CharacterUtility)
local MannequinUtilityModule = require(script.Parent.MannequinUtility)
local CameraPresetHeadshotExtentScaleHundredths = game:DefineFastInt("CameraPresetHeadshotExtentScaleHundredths", 130)

local function _(Object)
	return Object:FindFirstChild("Torso") or Object:FindFirstChild("UpperTorso")
end

local function getMannequinBodyParts(Object, Humanoid: Humanoid)
	-- upvalues: MannequinUtilityModule (copy)
	local List = {}
	
	if Humanoid.RigType == Enum.HumanoidRigType.R6 then
		for ChildName, _ in MannequinUtilityModule.CharacterPartNames.R6 do
			if ChildName ~= "CharacterMesh" and ChildName ~= "HumanoidRootPart" then
				table.insert(List, (Object:FindFirstChild(ChildName)))
			end
		end
		return List
	else
		if Humanoid.RigType == Enum.HumanoidRigType.R15 then
			for ChildName1, _ in MannequinUtilityModule.CharacterPartNames.R15 do
				if ChildName1 ~= "HumanoidRootPart" then
					table.insert(List, (Object:FindFirstChild(ChildName1)))
				end
			end
		end
		return List
	end
end

local CameraPresetsUtilityModule = {
	GOLDEN_RATIO = game:DefineFastInt("AvatarGoldenRatio", 618) / 1000,
	UPVECTOR_ORENTATION_TRESHOLD = game:DefineFastInt("UpVectorOrentationThreshold1", -60) / 100,
	AVATAR_ROTATION_DEGREE = game:DefineFastInt("LookAvatarRotationDegree1", 23),
	GetCharacterTorsoCFrame = function(Object)
		return (Object:FindFirstChild("Torso") or Object:FindFirstChild("UpperTorso")).CFrame
	end
}

function CameraPresetsUtilityModule.GetFullBodyCameraCFrame(Object, Callback: () -> (), p1, p2, p3)
	-- upvalues: CameraPresetsUtilityModule (copy), getMannequinBodyParts (copy), CharacterUtilityModule (copy), CameraUtilityModule (copy)
	local P6 = p2 or 56
	local P7 = p3 or CameraPresetsUtilityModule.GetCharacterTorsoCFrame(Object)
	local LookVector = P7.LookVector
	
	if type(Callback) == "function" then
		Callback()
	end
	local Humanoid = Object:FindFirstChildOfClass("Humanoid")
	
	if not Humanoid then return end
	local MannequinBodyParts = getMannequinBodyParts(Object, Humanoid)
	local _CFrame = (Object:FindFirstChild("Torso") or Object:FindFirstChild("UpperTorso")).CFrame
	local UpVector = _CFrame.UpVector
	local Rx, Ry, Rz = Object:FindFirstChild("Head").CFrame:ToEulerAnglesXYZ()
	
	if p1 then
		Object:PivotTo(P7 * CFrame.Angles(0, math.rad(CameraPresetsUtilityModule.AVATAR_ROTATION_DEGREE * -1), 0))
	end
	local BodyPartsExtents, BodyPartsExtents2 = CharacterUtilityModule.CalculateBodyPartsExtents(_CFrame, MannequinBodyParts)
	local Tangent = math.tan((math.rad(P6 / 2)))
	local Interpolated = BodyPartsExtents:Lerp(BodyPartsExtents2, 0.5)
	local _Vector3 = Vector3.new(Interpolated.X, BodyPartsExtents:Lerp(BodyPartsExtents2, CameraPresetsUtilityModule.GOLDEN_RATIO).Y, Interpolated.Z)
	local v1 = _CFrame:PointToWorldSpace(_Vector3)
	local NewPosition = _CFrame - _CFrame.Position + v1
	
	if not p1 then
		local _CFrame1 = CFrame.fromEulerAnglesXYZ(Rx, Ry, Rz)
		NewPosition = _CFrame1 - _CFrame1.Position + v1
	end
	local LargestRatio = math.max(_Vector3.X - BodyPartsExtents.X, _Vector3.Y - BodyPartsExtents.Y) * CameraUtilityModule.DefaultBodyMarginScale / Tangent
	local LargestRatio1 = math.max(BodyPartsExtents2.X - _Vector3.X, BodyPartsExtents2.Y - _Vector3.Y) * CameraUtilityModule.DefaultBodyMarginScale / Tangent
	local Largest: number = LargestRatio
	local IsXBelow = UpVector.X < CameraPresetsUtilityModule.UPVECTOR_ORENTATION_TRESHOLD
	
	if UpVector.Y < CameraPresetsUtilityModule.UPVECTOR_ORENTATION_TRESHOLD or IsXBelow then
		Largest = math.max(LargestRatio, LargestRatio1)
	end
	return CameraUtilityModule.GetCameraCFrame(NewPosition, Largest * CameraUtilityModule.DistanceScaleForFullBody * LookVector)
end

CameraPresetsUtilityModule.GetCameraCFrame_ForAvatarR15Action_LookAtGoldenRatioOfTheHumanoid = CameraPresetsUtilityModule.GetFullBodyCameraCFrame

function CameraPresetsUtilityModule.GetHeadshotCameraCFrame(Object, Callback: () -> (), p1, p2)
	-- upvalues: CameraPresetsUtilityModule (copy), CFrameUtilityModule (copy), CharacterUtilityModule (copy), CameraUtilityModule (copy), CameraPresetHeadshotExtentScaleHundredths (copy)
	local P10 = p2 or 30
	
	if type(Callback) == "function" then
		Callback()
	end
	if p1 then
		Object:PivotTo(CameraPresetsUtilityModule.GetCharacterTorsoCFrame(Object) * CFrame.Angles(0, math.rad(CameraPresetsUtilityModule.AVATAR_ROTATION_DEGREE * -1), 0))
	end
	local Head = Object:FindFirstChild("Head")
	
	if not Head then
		error("Character is missing a Head, cannot apply upper body camera preset.")
	end
	local HeadCFrame = Head.CFrame
	local FaceFrontAttachment = Head:FindFirstChild("FaceFrontAttachment")
	
	if FaceFrontAttachment then
		HeadCFrame = FaceFrontAttachment.WorldCFrame
	end
	local TargetCFrame = CFrameUtilityModule.CalculateTargetCFrame(HeadCFrame)
	local HeadExtents, HeadExtents2 = CharacterUtilityModule.CalculateHeadExtents(Object, TargetCFrame)
	CameraUtilityModule.SetupCamera(CameraUtilityModule.CreateThumbnailCamera(), {
		extentScale = CameraPresetHeadshotExtentScaleHundredths / 100,
		maxExtent = HeadExtents2,
		minExtent = HeadExtents,
		optCameraXRot = CameraUtilityModule.XRotForCloseup,
		optFieldOfView = P10,
		targetCFrame = TargetCFrame
	})
end

return CameraPresetsUtilityModule