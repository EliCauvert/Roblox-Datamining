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
local var1 = game:DefineFastInt("UGCValidationTposePositionOffsetPercentThreshold", 40) / 100
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

local function checkJointTposeAdjustment(p1, p2, p3, p4, p5, p6)
	-- upvalues: UGCValidationService (ref), getDiffBetweenOrientationsModule (ref), errorSourceStringsModule (ref), cFrameUtilsModule (ref), vector3UtilsModule (ref), valueToStringModule (ref)
	local var2 = UGCValidationService:GetExpectedTposeRotation(p2, p4)
	
	if p6 < getDiffBetweenOrientationsModule(p3.Rotation, var2) then
		p1:fail(errorSourceStringsModule.Keys.HrdTposeRotation, {
			jointName = p2.Name,
			degLimit = p6,
			expectedOrientation = cFrameUtilsModule.getRotationString(var2)
		})
	end
	if not vector3UtilsModule.isInRange(p3.Position, p5 * -1, p5) then
		p1:fail(errorSourceStringsModule.Keys.HrdTposePosition, {
			jointName = p2.Name,
			offsetLimit = valueToStringModule(p5)
		})
	end
end

function t.run(p1, p2)
	-- upvalues: getAllInstancesIsAModule (ref), var1 (ref), checkJointTposeAdjustment (ref), t_1 (ref), UGCValidationTposeGeneralDegreeOffsetThreshold (ref), UGCValidationTposeFingerDegreeOffsetThreshold (ref)
	local rootInstance = p2.rootInstance
	
	for i, v in getAllInstancesIsAModule(rootInstance, "MeshPart") do
		local humanoidRigDescription = v:FindFirstChildWhichIsA("HumanoidRigDescription")
		
		if humanoidRigDescription ~= nil then
			p1:setReportingInstance(v)
			local name = p2.renderMeshesData[v.Name]
			local var2 = name.originalSize * name.scale * var1
			
			for i_1, v_1 in humanoidRigDescription:GetContainedJointLabels(v.Name) do
				if humanoidRigDescription:GetJoint(v_1) then
					checkJointTposeAdjustment(p1, v_1, humanoidRigDescription:GetTposeAdjustment(v_1), rootInstance, var2, t_1[v_1] or UGCValidationTposeGeneralDegreeOffsetThreshold)
				end
			end
			local digitsRigDescription = v:FindFirstChildWhichIsA("DigitsRigDescription")
			
			if digitsRigDescription ~= nil then
				for v_1, v_2 in digitsRigDescription:GetJointLabels() do
					if digitsRigDescription:GetJoint(v_2) then
						checkJointTposeAdjustment(p1, v_2, digitsRigDescription:GetTposeAdjustment(v_2), rootInstance, var2, t_1[v_2] or UGCValidationTposeFingerDegreeOffsetThreshold)
					end
				end
			end
		end
	end
end

return t