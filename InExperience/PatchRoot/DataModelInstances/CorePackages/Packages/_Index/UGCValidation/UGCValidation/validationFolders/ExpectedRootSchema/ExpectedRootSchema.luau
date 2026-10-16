local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local CreateExpectedSchemaModule = require(Parent.util.CreateExpectedSchema)
local ValidateInstanceTreeAgainstSchemaModule = require(Parent.util.validateInstanceTreeAgainstSchema)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule = require(Parent.flags.getEngineFeatureEngineUGCValidateInstanceTreesEquivalent)
local ShouldValidateR15LegacyDuplicateModule = require(Parent.util.shouldValidateR15LegacyDuplicate)

return {
	categories = require(Parent.Constants).AllUploadCategories,
	requiredData = {
		ValidationEnumsModule.SharedDataMember.entrypointInput,
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.uploadCategory,
		ValidationEnumsModule.SharedDataMember.uploadEnum,
		ValidationEnumsModule.SharedDataMember.consumerConfig
	},
	run = function(p1, p2) --[[ Line: 23 ]]
		-- upvalues: ErrorSourceStringsModule (copy), CreateExpectedSchemaModule (copy), ValidateInstanceTreeAgainstSchemaModule (copy), GetEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule (copy), ShouldValidateR15LegacyDuplicateModule (copy)
		local RootInstance = p2.rootInstance
		local UploadCategory = p2.uploadCategory
		local UploadEnum = p2.uploadEnum
		
		if RootInstance == nil then
			p1:fail(ErrorSourceStringsModule.Keys.SelectionCountNotOne)
			
			return
		end
		local AnimationPackBundleSchema = if UploadEnum.bundleType then if UploadEnum.bundleType == Enum.BundleType.Animations then CreateExpectedSchemaModule.generateAnimationPackBundleSchema() else CreateExpectedSchemaModule.generateBundleSchema(p2.entrypointInput) else CreateExpectedSchemaModule.generateAssetSchema(UploadCategory, UploadEnum.assetType, RootInstance)
		ValidateInstanceTreeAgainstSchemaModule(RootInstance, AnimationPackBundleSchema, p1)
		
		if GetEngineFeatureEngineUGCValidateInstanceTreesEquivalentModule() and ShouldValidateR15LegacyDuplicateModule(p2) then
			if p2.r15LegacyDuplicateRoot == nil then
				p1:fail(ErrorSourceStringsModule.Keys.FolderStructureMismatch)
				
				return
			end
			p1:setReportingRoot(p2.r15LegacyDuplicateRoot)
			ValidateInstanceTreeAgainstSchemaModule(p2.r15LegacyDuplicateRoot, AnimationPackBundleSchema, p1)
			p1:setReportingRoot(RootInstance)
		end
	end
}