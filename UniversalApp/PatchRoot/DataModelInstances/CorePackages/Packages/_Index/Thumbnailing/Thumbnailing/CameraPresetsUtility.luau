local cameraUtilityModule = require(script.Parent.CameraUtility)
local cFrameUtilityModule = require(script.Parent.CFrameUtility)
local characterUtilityModule = require(script.Parent.CharacterUtility)
local mannequinUtilityModule = require(script.Parent.MannequinUtility)
local cameraPresetHeadshotExtentScaleHundredths = game:DefineFastInt("CameraPresetHeadshotExtentScaleHundredths", 130)
local t = {
	GOLDEN_RATIO = game:DefineFastInt("AvatarGoldenRatio", 618) / 1000,
	UPVECTOR_ORENTATION_TRESHOLD = game:DefineFastInt("UpVectorOrentationThreshold1", -60) / 100,
	AVATAR_ROTATION_DEGREE = game:DefineFastInt("LookAvatarRotationDegree1", 23),
	GetCharacterTorsoCFrame = function(p1)
		return (p1:FindFirstChild("Torso") or p1:FindFirstChild("UpperTorso")).CFrame
	end
}

local function _(p1)
	return p1:FindFirstChild("Torso") or p1:FindFirstChild("UpperTorso")
end

local function getMannequinBodyParts(p1, p2)
	-- upvalues: mannequinUtilityModule (ref)
	local t = {}
	
	if p2.RigType == Enum.HumanoidRigType.R6 then
		for i, v in mannequinUtilityModule.CharacterPartNames.R6 do
			if i ~= "CharacterMesh" and i ~= "HumanoidRootPart" then
				table.insert(t, p1:FindFirstChild(i))
			end
		end
		return t
	elseif p2.RigType == Enum.HumanoidRigType.R15 then
		for i, v in mannequinUtilityModule.CharacterPartNames.R15 do
			if i ~= "HumanoidRootPart" then
				table.insert(t, p1:FindFirstChild(i))
			end
		end
	end
	return t
end

function t.GetFullBodyCameraCFrame(p3, p4, p5, p6, p7)
	-- upvalues: t (ref), getMannequinBodyParts (ref), characterUtilityModule (ref), cameraUtilityModule (ref)
	p6 = p6 or 56
	p7 = p7 or t.GetCharacterTorsoCFrame(p3)
	local lookVector = p7.LookVector
	
	if type(p4) == "function" then
		p4()
	end
	local humanoid = p3:FindFirstChildOfClass("Humanoid")
	
	if not humanoid then return end
	local var1 = getMannequinBodyParts(p3, humanoid)
	local cFrame = (p3:FindFirstChild("Torso") or p3:FindFirstChild("UpperTorso")).CFrame
	local upVector = cFrame.UpVector
	local _ = nil
	local _ = nil
	local _ = nil
	local var2, var3, var4 = p3:FindFirstChild("Head").CFrame:ToEulerAnglesXYZ()
	
	if p5 then
		p3:PivotTo(p7 * CFrame.Angles(0, math.rad(t.AVATAR_ROTATION_DEGREE * -1), 0))
	end
	local var5, var6 = characterUtilityModule.CalculateBodyPartsExtents(cFrame, var1)
	local var7 = math.tan(math.rad(p6 / 2))
	local var8 = var5:Lerp(var6, 0.5)
	local vector3 = Vector3.new(var8.X, var5:Lerp(var6, t.GOLDEN_RATIO).Y, var8.Z)
	local var9 = cFrame:PointToWorldSpace(vector3)
	local var10 = cFrame - cFrame.Position + var9
	
	if not p5 then
		local cFrame_1 = CFrame.fromEulerAnglesXYZ(var2, var3, var4)
		var10 = cFrame_1 - cFrame_1.Position + var9
	end
	local var11 = math.max(vector3.X - var5.X, vector3.Y - var5.Y) * cameraUtilityModule.DefaultBodyMarginScale / var7
	local var12 = math.max(var6.X - vector3.X, var6.Y - vector3.Y) * cameraUtilityModule.DefaultBodyMarginScale / var7
	local var13 = var11
	
	if upVector.Y < t.UPVECTOR_ORENTATION_TRESHOLD or upVector.X < t.UPVECTOR_ORENTATION_TRESHOLD then
		var13 = math.max(var11, var12)
	end
	return cameraUtilityModule.GetCameraCFrame(var10, var13 * cameraUtilityModule.DistanceScaleForFullBody * lookVector)
end

t.GetCameraCFrame_ForAvatarR15Action_LookAtGoldenRatioOfTheHumanoid = t.GetFullBodyCameraCFrame

function t.GetHeadshotCameraCFrame(p3, p4, p5, p6)
	-- upvalues: t (ref), cFrameUtilityModule (ref), characterUtilityModule (ref), cameraUtilityModule (ref), cameraPresetHeadshotExtentScaleHundredths (ref)
	p6 = p6 or 30
	
	if type(p4) == "function" then
		p4()
	end
	if p5 then
		p3:PivotTo(t.GetCharacterTorsoCFrame(p3) * CFrame.Angles(0, math.rad(t.AVATAR_ROTATION_DEGREE * -1), 0))
	end
	local head = p3:FindFirstChild("Head")
	
	if not head then
		error("Character is missing a Head, cannot apply upper body camera preset.")
	end
	local cFrame = head.CFrame
	local faceFrontAttachment = head:FindFirstChild("FaceFrontAttachment")
	
	if faceFrontAttachment then
		cFrame = faceFrontAttachment.WorldCFrame
	end
	local var1 = cFrameUtilityModule.CalculateTargetCFrame(cFrame)
	local var2, var3 = characterUtilityModule.CalculateHeadExtents(p3, var1)
	cameraUtilityModule.SetupCamera(cameraUtilityModule.CreateThumbnailCamera(), {
		extentScale = cameraPresetHeadshotExtentScaleHundredths / 100,
		maxExtent = var3,
		minExtent = var2,
		optCameraXRot = cameraUtilityModule.XRotForCloseup,
		optFieldOfView = p6,
		targetCFrame = var1
	})
end

return t