local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getEngineFeatureEngineUGCValidationExpandReturnSchemaModule = require(parent.flags.getEngineFeatureEngineUGCValidationExpandReturnSchema)
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
local var9 = game:DefineFastInt("UGCValidationMinimumJointDistanceHundredths", 5) / 100

function t.run(p0, p1) --[[ line: 24 ]]
	-- upvalues: UGCValidationBoneCFrameBoundsMultiplierHundredths (ref), getAllInstancesIsAModule (ref), getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (ref), vector3UtilsModule (ref), errorSourceStringsModule (ref), cFrameUtilsModule (ref), var9 (ref)
	local var10 = UGCValidationBoneCFrameBoundsMultiplierHundredths / 100
	
	for i, v in getAllInstancesIsAModule(p1.rootInstance, "MeshPart") do
		local name = p1.renderMeshesData[v.Name]
		
		if name then
			local var11 = name.originalSize * name.scale * var10 / 2
			local var12 = v.CFrame:Inverse()
			
			for i_1, v_1 in getAllInstancesIsAModule(v, "Bone") do
				if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
					p0:setReportingInstance(v_1)
				end
				if not vector3UtilsModule.isInRange((var12 * v_1.WorldCFrame).Position, -var11, var11) then
					p0:fail(errorSourceStringsModule.Keys.HrdBone_OutOfBounds, { bonePath = v_1:GetFullName(), partName = v.Name })
				end
				if not cFrameUtilsModule.fuzzyEq(v_1.Transform, CFrame.identity) then
					p0:fail(errorSourceStringsModule.Keys.HrdBone_TransformNotIdentity, { bonePath = v_1:GetFullName() })
				end
				if v_1.Parent:IsA("Bone") and v_1.Position.Magnitude < var9 then
					p0:fail(errorSourceStringsModule.Keys.HrdBone_TooCloseToParent, { bonePath = v_1:GetFullName() })
				end
			end
		end
	end
end

return t