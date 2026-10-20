local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local GetFIntUGCValidateMaxHSRDataLenModule = require(Parent.flags.getFIntUGCValidateMaxHSRDataLen)
local GetFFlagUGCValidateWrapDataCapsModule = require(Parent.flags.getFFlagUGCValidateWrapDataCaps)
local GetFIntUGCValidateMaxHSRMeshIdDataLenModule = require(Parent.flags.getFIntUGCValidateMaxHSRMeshIdDataLen)
local GetFFlagUGCValidateDisallowAeroMeshDataModule = require(Parent.flags.getFFlagUGCValidateDisallowAeroMeshData)
local GetFFlagUGCValidateTemporaryIdsBackendOnlyModule = require(Parent.flags.getFFlagUGCValidateTemporaryIdsBackendOnly)
local DescribeProblematicPropertiesModule = require(script.Parent.describeProblematicProperties)
local List = {
	ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
	ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD,
	ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
	ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH
}

local function walkInstanceTree(p1, RootInstance, p2)
	-- upvalues: UGCValidationService (copy), ErrorSourceStringsModule (copy), DescribeProblematicPropertiesModule (copy)
	local Descendants = RootInstance:GetDescendants()
	table.insert(Descendants, RootInstance)
	
	for _, descendant in Descendants do
		local StringLenRestrictions = p2[descendant.ClassName]
		local ValidatePropertiesSensibleResult, ValidatePropertiesSensibleResult2 = UGCValidationService:ValidatePropertiesSensible(descendant, StringLenRestrictions)
		
		if not ValidatePropertiesSensibleResult then
			p1:fail(ErrorSourceStringsModule.Keys.PropertiesNotSensible, {
				ClassName = descendant.ClassName,
				InstancePath = descendant:GetFullName(),
				ProblematicProperties = DescribeProblematicPropertiesModule(ValidatePropertiesSensibleResult2, StringLenRestrictions)
			})
		end
	end
end

return {
	categories = if require(Parent.flags.getFFlagUGCValidateMakeupCategoryParity)() then ConstantsModule.AllAssetUploadCategories else ConstantsModule.AllAssetUploadCategoriesIncludingMakeup,
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.hsrAssets,
		ValidationEnumsModule.SharedDataMember.consumerConfig,
		ValidationEnumsModule.SharedDataMember.uploadCategory
	},
	expectedFailures = {},
	run = function(p3, p4)
		-- upvalues: GetEngineFeatureEngineUGCValidatePropertiesSensibleModule (copy), GetFIntUGCValidateMaxHSRDataLenModule (copy), GetFFlagUGCValidateDisallowAeroMeshDataModule (copy), GetFFlagUGCValidateWrapDataCapsModule (copy), ValidationEnumsModule (copy), GetFFlagUGCValidateTemporaryIdsBackendOnlyModule (copy), List (copy), GetFIntUGCValidateMaxHSRMeshIdDataLenModule (copy), walkInstanceTree (copy)
		if not GetEngineFeatureEngineUGCValidatePropertiesSensibleModule() then return end
		local config = {
			HiddenSurfaceRemovalAsset = { HSRData = GetFIntUGCValidateMaxHSRDataLenModule() }
		}
		
		if GetFFlagUGCValidateDisallowAeroMeshDataModule() then
			config.MeshPart = { AeroMeshData = 0 }
		end
		if GetFFlagUGCValidateWrapDataCapsModule() then
			local ConsumerEnv = p4.consumerConfig.consumerEnv
			local IsConsumerEnvMatch = ConsumerEnv == ValidationEnumsModule.ConsumerEnv.Backend
			local HasFoundIndex: boolean = if GetFFlagUGCValidateTemporaryIdsBackendOnlyModule() then ConsumerEnv == ValidationEnumsModule.ConsumerEnv.Backend and table.find(List, p4.uploadCategory) ~= nil else ConsumerEnv ~= ValidationEnumsModule.ConsumerEnv.IEC and table.find(List, p4.uploadCategory) ~= nil
			local WrapTarget = {
				HSRMeshIdData = GetFIntUGCValidateMaxHSRMeshIdDataLenModule()
			}
			local WrapLayer = {
				HSRMeshIdData = GetFIntUGCValidateMaxHSRMeshIdDataLenModule()
			}
			
			if IsConsumerEnvMatch then
				WrapTarget.HSRData = 0
				WrapLayer.HSRData = 0
			end
			if HasFoundIndex then
				WrapTarget.TemporaryCageMeshId = 0
				WrapLayer.TemporaryCageMeshId = 0
				WrapLayer.TemporaryReferenceId = 0
			end
			config.WrapTarget = WrapTarget
			config.WrapLayer = WrapLayer
		end
		walkInstanceTree(p3, p4.rootInstance, config)
		
		for _, hsrAsset in p4.hsrAssets do
			for _, value in hsrAsset do
				walkInstanceTree(p3, value, config)
			end
		end
	end
}