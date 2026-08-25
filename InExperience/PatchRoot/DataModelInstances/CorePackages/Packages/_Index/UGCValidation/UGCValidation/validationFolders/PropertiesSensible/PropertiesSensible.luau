local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local getFIntUGCValidateMaxHSRDataLenModule = require(parent.flags.getFIntUGCValidateMaxHSRDataLen)
local getFFlagUGCValidateWrapDataCapsModule = require(parent.flags.getFFlagUGCValidateWrapDataCaps)
local getFIntUGCValidateMaxHSRMeshIdDataLenModule = require(parent.flags.getFIntUGCValidateMaxHSRMeshIdDataLen)
local describeProblematicPropertiesModule = require(script.Parent.describeProblematicProperties)
local list = {
	validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
	validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
	validationEnumsModule.UploadCategory.LAYERED_CLOTHING
}
local t = {
	categories = if require(parent.flags.getFFlagUGCValidateMakeupCategoryParity)() then constantsModule.AllAssetUploadCategories else constantsModule.AllAssetUploadCategoriesIncludingMakeup,
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.hsrAssets,
		validationEnumsModule.SharedDataMember.consumerConfig,
		validationEnumsModule.SharedDataMember.uploadCategory
	},
	fflag = getFFlagUGCValidateMigrateSchemaPropertiesModule,
	expectedFailures = {}
}

local function walkInstanceTree(p0, p1, p2)
	-- upvalues: UGCValidationService (ref), errorSourceStringsModule (ref), describeProblematicPropertiesModule (ref)
	local descendants = p1:GetDescendants()
	table.insert(descendants, p1)
	
	for i, v in descendants do
		local className = p2[v.ClassName]
		local var14, var15 = UGCValidationService:ValidatePropertiesSensible(v, className)
		
		if not var14 then
			p0:fail(errorSourceStringsModule.Keys.PropertiesNotSensible, {
				ClassName = v.ClassName,
				InstancePath = v:GetFullName(),
				ProblematicProperties = describeProblematicPropertiesModule(var15, className)
			})
		end
	end
end

function t.run(p3, p4)
	-- upvalues: getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), getFIntUGCValidateMaxHSRDataLenModule (ref), getFFlagUGCValidateWrapDataCapsModule (ref), validationEnumsModule (ref), list (ref), getFIntUGCValidateMaxHSRMeshIdDataLenModule (ref), walkInstanceTree (ref)
	if not getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then return end
	local t = {
		HiddenSurfaceRemovalAsset = { HSRData = getFIntUGCValidateMaxHSRDataLenModule() }
	}
	
	if getFFlagUGCValidateWrapDataCapsModule() then
		local consumerEnv = p4.consumerConfig.consumerEnv
		local var17 = consumerEnv == validationEnumsModule.ConsumerEnv.Backend
		local var18 = consumerEnv ~= validationEnumsModule.ConsumerEnv.IEC and table.find(list, p4.uploadCategory) ~= nil
		local t_1 = {
			HSRMeshIdData = getFIntUGCValidateMaxHSRMeshIdDataLenModule()
		}
		local t_2 = {
			HSRMeshIdData = getFIntUGCValidateMaxHSRMeshIdDataLenModule()
		}
		
		if var17 then
			t_1.HSRData = 0
			t_2.HSRData = 0
		end
		if var18 then
			t_1.TemporaryCageMeshId = 0
			t_2.TemporaryCageMeshId = 0
			t_2.TemporaryReferenceId = 0
		end
		t.WrapTarget = t_1
		t.WrapLayer = t_2
	end
	walkInstanceTree(p3, p4.rootInstance, t)
	
	for i, v in p4.hsrAssets do
		for i_1, v_1 in v do
			walkInstanceTree(p3, v_1, t)
		end
	end
end

return t