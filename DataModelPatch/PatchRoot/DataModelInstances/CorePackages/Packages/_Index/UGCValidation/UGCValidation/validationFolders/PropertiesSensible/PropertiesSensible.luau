local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local GetFIntUGCValidateMaxHSRDataLenModule = require(Parent.flags.getFIntUGCValidateMaxHSRDataLen)

local function walkInstanceTree(p1, RootInstance, p2)
	-- upvalues: UGCValidationService (copy), ErrorSourceStringsModule (copy)
	local Descendants = RootInstance:GetDescendants()
	table.insert(Descendants, RootInstance)
	
	for _, descendant in Descendants do
		local ValidatePropertiesSensibleResult, ValidatePropertiesSensibleResult2 = UGCValidationService:ValidatePropertiesSensible(descendant, p2[descendant.ClassName])
		
		if not ValidatePropertiesSensibleResult then
			p1:fail(ErrorSourceStringsModule.Keys.PropertiesNotSensible, {
				ClassName = descendant.ClassName,
				InstancePath = descendant:GetFullName(),
				ProblematicProperties = table.concat(ValidatePropertiesSensibleResult2, ", ")
			})
		end
	end
end

return {
	categories = require(Parent.Constants).AllAssetUploadCategoriesIncludingMakeup,
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.hsrAssets
	},
	fflag = require(Parent.flags.getFFlagUGCValidateMigrateSchemaProperties),
	expectedFailures = {},
	run = function(p3, p4)
		-- upvalues: GetEngineFeatureEngineUGCValidatePropertiesSensibleModule (copy), GetFIntUGCValidateMaxHSRDataLenModule (copy), walkInstanceTree (copy)
		if not GetEngineFeatureEngineUGCValidatePropertiesSensibleModule() then return end
		local config = {
			HiddenSurfaceRemovalAsset = { HSRData = GetFIntUGCValidateMaxHSRDataLenModule() }
		}
		walkInstanceTree(p3, p4.rootInstance, config)
		
		for _, hsrAsset in p4.hsrAssets do
			for _, value in hsrAsset do
				walkInstanceTree(p3, value, config)
			end
		end
	end
}