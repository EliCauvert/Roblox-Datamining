local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getAllInstancesIsAModule = require(parent.util.getAllInstancesIsA)
local vector3UtilsModule = require(parent.util.Vector3Utils)
local valueToStringModule = require(parent.util.valueToString)
local cFrameUtilsModule = require(parent.util.CFrameUtils)
local getDiffBetweenOrientationsModule = require(parent.util.getDiffBetweenOrientations)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.renderMeshesData
	},
	fflag = require(parent.flags.getEngineFeatureEngineUGCValidateTPoseAdjustment)
}
local UGCValidationService = game:GetService("UGCValidationService")
local UGCValidationTposeShoulderDegreeOffsetThreshold = game:DefineFastInt("UGCValidationTposeShoulderDegreeOffsetThreshold", 30)
local UGCValidationTposeElbowDegreeOffsetThreshold = game:DefineFastInt("UGCValidationTposeElbowDegreeOffsetThreshold", 30)
local UGCValidationTposeWristDegreeOffsetThreshold = game:DefineFastInt("UGCValidationTposeWristDegreeOffsetThreshold", 30)
local UGCValidationTposeClavicleDegreeOffsetThreshold = game:DefineFastInt("UGCValidationTposeClavicleDegreeOffsetThreshold", 30)
local UGCValidationTposeFingerDegreeOffsetThreshold = game:DefineFastInt("UGCValidationTposeFingerDegreeOffsetThreshold", 30)
local UGCValidationTposeGeneralDegreeOffsetThreshold = game:DefineFastInt("UGCValidationTposeGeneralDegreeOffsetThreshold", 30)
local var15 = game:DefineFastInt("UGCValidationTposePositionOffsetPercentThreshold", 40) / 100
local t_1 = {
	[Enum.RigLabel.LeftShoulder] = UGCValidationTposeShoulderDegreeOffsetThreshold,
	[Enum.RigLabel.RightShoulder] = UGCValidationTposeShoulderDegreeOffsetThreshold,
	[Enum.RigLabel.LeftElbow] = UGCValidationTposeElbowDegreeOffsetThreshold,
	[Enum.RigLabel.RightElbow] = UGCValidationTposeElbowDegreeOffsetThreshold,
	[Enum.RigLabel.LeftWrist] = UGCValidationTposeWristDegreeOffsetThreshold,
	[Enum.RigLabel.RightWrist] = UGCValidationTposeWristDegreeOffsetThreshold,
	[Enum.RigLabel.LeftClavicle] = UGCValidationTposeClavicleDegreeOffsetThreshold,
	[Enum.RigLabel.RightClavicle] = UGCValidationTposeClavicleDegreeOffsetThreshold
}

local function checkJointTposeAdjustment(p0, p1, p2, p3, p4, p5)
	-- upvalues: UGCValidationService (ref), getDiffBetweenOrientationsModule (ref), errorSourceStringsModule (ref), cFrameUtilsModule (ref), vector3UtilsModule (ref), valueToStringModule (ref)
	local var18 = UGCValidationService:GetExpectedTposeRotation(p1, p3)
	
	if p5 < getDiffBetweenOrientationsModule(p2.Rotation, var18) then
		p0:fail(errorSourceStringsModule.Keys.HrdTposeRotation, {
			jointName = p1.Name,
			degLimit = p5,
			expectedOrientation = cFrameUtilsModule.getRotationString(var18)
		})
	end
	if not vector3UtilsModule.isInRange(p2.Position, p4 * -1, p4) then
		p0:fail(errorSourceStringsModule.Keys.HrdTposePosition, {
			jointName = p1.Name,
			offsetLimit = valueToStringModule(p4)
		})
	end
end

function t.run(p6, p7)
	-- upvalues: getAllInstancesIsAModule (ref), var15 (ref), checkJointTposeAdjustment (ref), t_1 (ref), UGCValidationTposeGeneralDegreeOffsetThreshold (ref), UGCValidationTposeFingerDegreeOffsetThreshold (ref)
	local rootInstance = p7.rootInstance
	
	for i, v in getAllInstancesIsAModule(rootInstance, "MeshPart") do
		local humanoidRigDescription = v:FindFirstChildWhichIsA("HumanoidRigDescription")
		
		if humanoidRigDescription ~= nil then
			p6:setReportingInstance(v)
			local name = p7.renderMeshesData[v.Name]
			local var20 = name.originalSize * name.scale * var15
			
			for i_1, v_1 in humanoidRigDescription:GetContainedJointLabels(v.Name) do
				if humanoidRigDescription:GetJoint(v_1) then
					checkJointTposeAdjustment(p6, v_1, humanoidRigDescription:GetTposeAdjustment(v_1), rootInstance, var20, t_1[v_1] or UGCValidationTposeGeneralDegreeOffsetThreshold)
				end
			end
			local digitsRigDescription = v:FindFirstChildWhichIsA("DigitsRigDescription")
			
			if digitsRigDescription ~= nil then
				for v_1, v_2 in digitsRigDescription:GetJointLabels() do
					if digitsRigDescription:GetJoint(v_2) then
						checkJointTposeAdjustment(p6, v_2, digitsRigDescription:GetTposeAdjustment(v_2), rootInstance, var20, t_1[v_2] or UGCValidationTposeFingerDegreeOffsetThreshold)
					end
				end
			end
		end
	end
end

return t