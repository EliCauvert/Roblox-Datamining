local cameraUtilityModule = require(script.Parent.CameraUtility)
local cFrameUtilityModule = require(script.Parent.CFrameUtility)
local characterUtilityModule = require(script.Parent.CharacterUtility)
local mannequinUtilityModule = require(script.Parent.MannequinUtility)
local cameraPresetHeadshotExtentScaleHundredths = game:DefineFastInt("CameraPresetHeadshotExtentScaleHundredths", 130)
local t = {
	GOLDEN_RATIO = game:DefineFastInt("AvatarGoldenRatio", 618) / 1000,
	UPVECTOR_ORENTATION_TRESHOLD = game:DefineFastInt("UpVectorOrentationThreshold1", -60) / 100,
	AVATAR_ROTATION_DEGREE = game:DefineFastInt("LookAvatarRotationDegree1", 23),
	GetCharacterTorsoCFrame = function(p0)
		return (p0:FindFirstChild("Torso") or p0:FindFirstChild("UpperTorso")).CFrame
	end
}

local function _(p1)
	return p1:FindFirstChild("Torso") or p1:FindFirstChild("UpperTorso")
end

local function getMannequinBodyParts(p2, p3)
	-- upvalues: mannequinUtilityModule (ref)
	local t = {}
	
	if p3.RigType == Enum.HumanoidRigType.R6 then
		for i, v in mannequinUtilityModule.CharacterPartNames.R6 do
			if i ~= "CharacterMesh" and i ~= "HumanoidRootPart" then
				table.insert(t, p2:FindFirstChild(i))
			end
		end
		return t
	elseif p3.RigType == Enum.HumanoidRigType.R15 then
		for i, v in mannequinUtilityModule.CharacterPartNames.R15 do
			if i ~= "HumanoidRootPart" then
				table.insert(t, p2:FindFirstChild(i))
			end
		end
	end
	return t
end

function t.GetFullBodyCameraCFrame(p4, p5, p6, p7, p8)
	-- upvalues: t (ref), getMannequinBodyParts (ref), characterUtilityModule (ref), cameraUtilityModule (ref)
	p7 = p7 or 56
	p8 = p8 or t.GetCharacterTorsoCFrame(p4)
	local lookVector = p8.LookVector
	
	if type(p5) == "function" then
		p5()
	end
	local humanoid = p4:FindFirstChildOfClass("Humanoid")
	
	if not humanoid then return end
	local var11 = getMannequinBodyParts(p4, humanoid)
	local cFrame = (p4:FindFirstChild("Torso") or p4:FindFirstChild("UpperTorso")).CFrame
	local upVector = cFrame.UpVector
	local _ = nil
	local _ = nil
	local _ = nil
	local var12, var13, var14 = p4:FindFirstChild("Head").CFrame:ToEulerAnglesXYZ()
	
	if p6 then
		p4:PivotTo(p8 * CFrame.Angles(0, math.rad(t.AVATAR_ROTATION_DEGREE * -1), 0))
	end
	local var15, var16 = characterUtilityModule.CalculateBodyPartsExtents(cFrame, var11)
	local var17 = math.tan(math.rad(p7 / 2))
	local var18 = var15:Lerp(var16, 0.5)
	local vector3 = Vector3.new(var18.X, var15:Lerp(var16, t.GOLDEN_RATIO).Y, var18.Z)
	local var20 = cFrame:PointToWorldSpace(vector3)
	local var21 = cFrame - cFrame.Position + var20
	
	if not p6 then
		local cFrame_1 = CFrame.fromEulerAnglesXYZ(var12, var13, var14)
		var21 = cFrame_1 - cFrame_1.Position + var20
	end
	local var23 = math.max(vector3.X - var15.X, vector3.Y - var15.Y) * cameraUtilityModule.DefaultBodyMarginScale / var17
	local var24 = math.max(var16.X - vector3.X, var16.Y - vector3.Y) * cameraUtilityModule.DefaultBodyMarginScale / var17
	local var25 = var23
	
	if upVector.Y < t.UPVECTOR_ORENTATION_TRESHOLD or upVector.X < t.UPVECTOR_ORENTATION_TRESHOLD then
		var25 = math.max(var23, var24)
	end
	return cameraUtilityModule.GetCameraCFrame(var21, var25 * cameraUtilityModule.DistanceScaleForFullBody * lookVector)
end

t.GetCameraCFrame_ForAvatarR15Action_LookAtGoldenRatioOfTheHumanoid = t.GetFullBodyCameraCFrame

function t.GetHeadshotCameraCFrame(p9, p10, p11, p12)
	-- upvalues: t (ref), cFrameUtilityModule (ref), characterUtilityModule (ref), cameraUtilityModule (ref), cameraPresetHeadshotExtentScaleHundredths (ref)
	p12 = p12 or 30
	
	if type(p10) == "function" then
		p10()
	end
	if p11 then
		p9:PivotTo(t.GetCharacterTorsoCFrame(p9) * CFrame.Angles(0, math.rad(t.AVATAR_ROTATION_DEGREE * -1), 0))
	end
	local head = p9:FindFirstChild("Head")
	
	if not head then
		error("Character is missing a Head, cannot apply upper body camera preset.")
	end
	local cFrame = head.CFrame
	local faceFrontAttachment = head:FindFirstChild("FaceFrontAttachment")
	
	if faceFrontAttachment then
		cFrame = faceFrontAttachment.WorldCFrame
	end
	local var29 = cFrameUtilityModule.CalculateTargetCFrame(cFrame)
	local var30, var31 = characterUtilityModule.CalculateHeadExtents(p9, var29)
	cameraUtilityModule.SetupCamera(cameraUtilityModule.CreateThumbnailCamera(), {
		extentScale = cameraPresetHeadshotExtentScaleHundredths / 100,
		maxExtent = var31,
		minExtent = var30,
		optCameraXRot = cameraUtilityModule.XRotForCloseup,
		optFieldOfView = p12,
		targetCFrame = var29
	})
end

return t