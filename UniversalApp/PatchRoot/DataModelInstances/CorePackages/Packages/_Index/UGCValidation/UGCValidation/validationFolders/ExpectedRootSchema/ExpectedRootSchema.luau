local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local constantsModule = require(parent.Constants)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local createExpectedSchemaModule = require(parent.util.CreateExpectedSchema)
local validateInstanceTreeAgainstSchemaModule = require(parent.util.validateInstanceTreeAgainstSchema)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule = require(parent.flags.getEngineFeatureEngineUGCValidateInstanceTreesEquivalent)
local shouldValidateR15LegacyDuplicateModule = require(parent.util.shouldValidateR15LegacyDuplicate)

return {
	categories = constantsModule.AllUploadCategories,
	requiredData = {
		validationEnumsModule.SharedDataMember.entrypointInput,
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.uploadCategory,
		validationEnumsModule.SharedDataMember.uploadEnum,
		validationEnumsModule.SharedDataMember.consumerConfig
	},
	run = function(p1, p2)
		-- upvalues: errorSourceStringsModule (ref), createExpectedSchemaModule (ref), validateInstanceTreeAgainstSchemaModule (ref), getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (ref), shouldValidateR15LegacyDuplicateModule (ref)
		local rootInstance = p2.rootInstance
		local uploadCategory = p2.uploadCategory
		local uploadEnum = p2.uploadEnum
		
		if rootInstance == nil then
			p1:fail(errorSourceStringsModule.Keys.SelectionCountNotOne)
			
			return
		end
		local var1 = if uploadEnum.bundleType then if uploadEnum.bundleType == Enum.BundleType.Animations then createExpectedSchemaModule.generateAnimationPackBundleSchema() else createExpectedSchemaModule.generateBundleSchema(p2.entrypointInput) else createExpectedSchemaModule.generateAssetSchema(uploadCategory, uploadEnum.assetType, rootInstance)
		validateInstanceTreeAgainstSchemaModule(rootInstance, var1, p1)
		
		if getEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() and shouldValidateR15LegacyDuplicateModule(p2) then
			if p2.r15LegacyDuplicateRoot == nil then
				p1:fail(errorSourceStringsModule.Keys.FolderStructureMismatch)
				
				return
			end
			p1:setReportingRoot(p2.r15LegacyDuplicateRoot)
			validateInstanceTreeAgainstSchemaModule(p2.r15LegacyDuplicateRoot, var1, p1)
			p1:setReportingRoot(rootInstance)
		end
	end
}