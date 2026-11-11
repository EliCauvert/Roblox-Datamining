local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule = require(Parent.flags.getEngineFeatureEngineUGCValidationExpandReturnSchema)
local GetAllInstancesIsAModule = require(Parent.util.getAllInstancesIsA)
local GetAllInstancesWithNameModule = require(Parent.util.getAllInstancesWithName)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.rootInstance },
	fflag = R15plusUtilsModule.checkFlagEnabledForAllowHrd,
	run = function(p1, p2)
		-- upvalues: GetAllInstancesIsAModule (copy), GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule (copy), R15plusUtilsModule (copy), GetAllInstancesWithNameModule (copy), ErrorSourceStringsModule (copy)
		for _, value in GetAllInstancesIsAModule(p2.rootInstance, "MeshPart") do
			if GetEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then
				p1:setReportingInstance(value)
			end
			for AttName, value1 in R15plusUtilsModule.getNameWhitelistOfClassInSchema(R15plusUtilsModule.getAvatarBoneSchema(value.Name), "Attachment") do
				if value1 then
					local AllInstancesWithNameModule = GetAllInstancesWithNameModule(value, AttName)
					
					if #AllInstancesWithNameModule ~= 1 or AllInstancesWithNameModule[1].ClassName ~= "Attachment" then
						p1:fail(ErrorSourceStringsModule.Keys.MissingRequiredAttachment, { attName = AttName, partName = value.Name })
					end
				end
			end
		end
	end
}