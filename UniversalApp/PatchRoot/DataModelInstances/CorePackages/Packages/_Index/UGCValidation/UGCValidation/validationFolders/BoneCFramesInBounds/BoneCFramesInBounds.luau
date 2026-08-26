local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getAllInstancesIsAModule = require(parent.util.getAllInstancesIsA)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local vector3UtilsModule = require(parent.util.Vector3Utils)
local cFrameUtilsModule = require(parent.util.CFrameUtils)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.renderMeshesData
	},
	fflag = r15plusUtilsModule.checkFlagEnabledForAllowHrd
}
local UGCValidationBoneCFrameBoundsMultiplierHundredths = game:DefineFastInt("UGCValidationBoneCFrameBoundsMultiplierHundredths", 110)
local var1 = game:DefineFastInt("UGCValidationMinimumJointDistanceHundredths", 5) / 100

function t.run(p1, p2)
	-- upvalues: UGCValidationBoneCFrameBoundsMultiplierHundredths (ref), getAllInstancesIsAModule (ref), vector3UtilsModule (ref), errorSourceStringsModule (ref), cFrameUtilsModule (ref), var1 (ref)
	local var2 = UGCValidationBoneCFrameBoundsMultiplierHundredths / 100
	
	for i, v in getAllInstancesIsAModule(p2.rootInstance, "MeshPart") do
		local name = p2.renderMeshesData[v.Name]
		
		if name then
			local var3 = name.originalSize * name.scale * var2 / 2
			local var4 = v.CFrame:Inverse()
			
			for i_1, v_1 in getAllInstancesIsAModule(v, "Bone") do
				p1:setReportingInstance(v_1)
				
				if not vector3UtilsModule.isInRange((var4 * v_1.WorldCFrame).Position, -var3, var3) then
					p1:fail(errorSourceStringsModule.Keys.HrdBone_OutOfBounds, { bonePath = v_1:GetFullName(), partName = v.Name })
				end
				if not cFrameUtilsModule.fuzzyEq(v_1.Transform, CFrame.identity) then
					p1:fail(errorSourceStringsModule.Keys.HrdBone_TransformNotIdentity, { bonePath = v_1:GetFullName() })
				end
				if v_1.Parent:IsA("Bone") and v_1.Position.Magnitude < var1 then
					p1:fail(errorSourceStringsModule.Keys.HrdBone_TooCloseToParent, { bonePath = v_1:GetFullName() })
				end
			end
		end
	end
end

return t