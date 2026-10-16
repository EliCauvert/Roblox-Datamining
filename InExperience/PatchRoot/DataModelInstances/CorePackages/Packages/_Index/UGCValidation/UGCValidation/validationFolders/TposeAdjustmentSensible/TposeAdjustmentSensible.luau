local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetAllInstancesIsAModule = require(Parent.util.getAllInstancesIsA)
local Vector3UtilsModule = require(Parent.util.Vector3Utils)
local ValueToStringModule = require(Parent.util.valueToString)
local CFrameUtilsModule = require(Parent.util.CFrameUtils)
local GetDiffBetweenOrientationsModule = require(Parent.util.getDiffBetweenOrientations)
local UGCValidationService = game:GetService("UGCValidationService")
local UGCValidationTposeShoulderDegreeOffsetThreshold = game:DefineFastInt("UGCValidationTposeShoulderDegreeOffsetThreshold", 30)
local UGCValidationTposeElbowDegreeOffsetThreshold = game:DefineFastInt("UGCValidationTposeElbowDegreeOffsetThreshold", 30)
local UGCValidationTposeWristDegreeOffsetThreshold = game:DefineFastInt("UGCValidationTposeWristDegreeOffsetThreshold", 30)
local UGCValidationTposeClavicleDegreeOffsetThreshold = game:DefineFastInt("UGCValidationTposeClavicleDegreeOffsetThreshold", 30)
local UGCValidationTposeFingerDegreeOffsetThreshold = game:DefineFastInt("UGCValidationTposeFingerDegreeOffsetThreshold", 30)
local UGCValidationTposeGeneralDegreeOffsetThreshold = game:DefineFastInt("UGCValidationTposeGeneralDegreeOffsetThreshold", 30)
local UGCValidationTposePositionOffsetPercentThresholdRatio = game:DefineFastInt("UGCValidationTposePositionOffsetPercentThreshold", 40) / 100
local config = {
	[Enum.RigLabel.LeftShoulder] = UGCValidationTposeShoulderDegreeOffsetThreshold,
	[Enum.RigLabel.RightShoulder] = UGCValidationTposeShoulderDegreeOffsetThreshold,
	[Enum.RigLabel.LeftElbow] = UGCValidationTposeElbowDegreeOffsetThreshold,
	[Enum.RigLabel.RightElbow] = UGCValidationTposeElbowDegreeOffsetThreshold,
	[Enum.RigLabel.LeftWrist] = UGCValidationTposeWristDegreeOffsetThreshold,
	[Enum.RigLabel.RightWrist] = UGCValidationTposeWristDegreeOffsetThreshold,
	[Enum.RigLabel.LeftClavicle] = UGCValidationTposeClavicleDegreeOffsetThreshold,
	[Enum.RigLabel.RightClavicle] = UGCValidationTposeClavicleDegreeOffsetThreshold
}

local function checkJointTposeAdjustment(p1, Label, TposeAdjustment, RootInstance, ScaledOriginalSize: number, DegLimit) --[[ Line: 42 ]]
	-- upvalues: UGCValidationService (copy), GetDiffBetweenOrientationsModule (copy), ErrorSourceStringsModule (copy), CFrameUtilsModule (copy), Vector3UtilsModule (copy), ValueToStringModule (copy)
	local ExpectedTposeRotation = UGCValidationService:GetExpectedTposeRotation(Label, RootInstance)
	
	if DegLimit < GetDiffBetweenOrientationsModule(TposeAdjustment.Rotation, ExpectedTposeRotation) then
		p1:fail(ErrorSourceStringsModule.Keys.HrdTposeRotation, {
			jointName = Label.Name,
			degLimit = DegLimit,
			expectedOrientation = CFrameUtilsModule.getRotationString(ExpectedTposeRotation)
		})
	end
	if not Vector3UtilsModule.isInRange(TposeAdjustment.Position, ScaledOriginalSize * -1, ScaledOriginalSize) then
		p1:fail(ErrorSourceStringsModule.Keys.HrdTposePosition, {
			jointName = Label.Name,
			offsetLimit = ValueToStringModule(ScaledOriginalSize)
		})
	end
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.renderMeshesData
	},
	fflag = require(Parent.flags.getEngineFeatureEngineUGCValidateTPoseAdjustment),
	run = function(p1, p2) --[[ Line: 69 ]]
		-- upvalues: GetAllInstancesIsAModule (copy), UGCValidationTposePositionOffsetPercentThresholdRatio (copy), checkJointTposeAdjustment (copy), config (copy), UGCValidationTposeGeneralDegreeOffsetThreshold (copy), UGCValidationTposeFingerDegreeOffsetThreshold (copy)
		local RootInstance = p2.rootInstance
		
		for _, Object in GetAllInstancesIsAModule(RootInstance, "MeshPart") do
			local HumanoidRigDescription = Object:FindFirstChildWhichIsA("HumanoidRigDescription")
			
			if HumanoidRigDescription ~= nil then
				p1:setReportingInstance(Object)
				local RenderMeshes = p2.renderMeshesData[Object.Name]
				local ScaledOriginalSize = RenderMeshes.originalSize * RenderMeshes.scale * UGCValidationTposePositionOffsetPercentThresholdRatio
				
				for _, containedJointLabel in HumanoidRigDescription:GetContainedJointLabels(Object.Name) do
					if HumanoidRigDescription:GetJoint(containedJointLabel) then
						checkJointTposeAdjustment(p1, containedJointLabel, HumanoidRigDescription:GetTposeAdjustment(containedJointLabel), RootInstance, ScaledOriginalSize, config[containedJointLabel] or UGCValidationTposeGeneralDegreeOffsetThreshold)
					end
				end
				local DigitsRigDescription = Object:FindFirstChildWhichIsA("DigitsRigDescription")
				
				if DigitsRigDescription ~= nil then
					for _, jointLabel in DigitsRigDescription:GetJointLabels() do
						if DigitsRigDescription:GetJoint(jointLabel) then
							checkJointTposeAdjustment(p1, jointLabel, DigitsRigDescription:GetTposeAdjustment(jointLabel), RootInstance, ScaledOriginalSize, config[jointLabel] or UGCValidationTposeFingerDegreeOffsetThreshold)
						end
					end
				end
			end
		end
	end
}