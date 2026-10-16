local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetAllInstancesIsAModule = require(Parent.util.getAllInstancesIsA)
local Vector3UtilsModule = require(Parent.util.Vector3Utils)
local CFrameUtilsModule = require(Parent.util.CFrameUtils)
local UGCValidationBoneCFrameBoundsMultiplierHundredths = game:DefineFastInt("UGCValidationBoneCFrameBoundsMultiplierHundredths", 110)
local UGCValidationMinimumJointDistanceHundredthsRatio = game:DefineFastInt("UGCValidationMinimumJointDistanceHundredths", 5) / 100

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.renderMeshesData
	},
	fflag = require(Parent.util.R15plusUtils).checkFlagEnabledForAllowHrd,
	run = function(p1, p2) --[[ Line: 22 ]]
		-- upvalues: UGCValidationBoneCFrameBoundsMultiplierHundredths (copy), GetAllInstancesIsAModule (copy), Vector3UtilsModule (copy), ErrorSourceStringsModule (copy), CFrameUtilsModule (copy), UGCValidationMinimumJointDistanceHundredthsRatio (copy)
		local UGCValidationBoneCFrameBoundsMultiplierHundredthsRatio = UGCValidationBoneCFrameBoundsMultiplierHundredths / 100
		
		for _, value in GetAllInstancesIsAModule(p2.rootInstance, "MeshPart") do
			local RenderMeshes = p2.renderMeshesData[value.Name]
			
			if RenderMeshes then
				local OriginalSizeRatio = RenderMeshes.originalSize * RenderMeshes.scale * UGCValidationBoneCFrameBoundsMultiplierHundredthsRatio / 2
				local Inverted = value.CFrame:Inverse()
				
				for _, Object in GetAllInstancesIsAModule(value, "Bone") do
					p1:setReportingInstance(Object)
					
					if not Vector3UtilsModule.isInRange((Inverted * Object.WorldCFrame).Position, -OriginalSizeRatio, OriginalSizeRatio) then
						p1:fail(ErrorSourceStringsModule.Keys.HrdBone_OutOfBounds, { bonePath = Object:GetFullName(), partName = value.Name })
					end
					if not CFrameUtilsModule.fuzzyEq(Object.Transform, CFrame.identity) then
						p1:fail(ErrorSourceStringsModule.Keys.HrdBone_TransformNotIdentity, { bonePath = Object:GetFullName() })
					end
					if Object.Parent:IsA("Bone") and Object.Position.Magnitude < UGCValidationMinimumJointDistanceHundredthsRatio then
						p1:fail(ErrorSourceStringsModule.Keys.HrdBone_TooCloseToParent, { bonePath = Object:GetFullName() })
					end
				end
			end
		end
	end
}