local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local getFIntUGCValidateMaxHSRDataLenModule = require(parent.flags.getFIntUGCValidateMaxHSRDataLen)
local t = {
	categories = constantsModule.AllAssetUploadCategoriesIncludingMakeup,
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.hsrAssets
	},
	fflag = getFFlagUGCValidateMigrateSchemaPropertiesModule,
	expectedFailures = {}
}

local function walkInstanceTree(p1, p2, p3)
	-- upvalues: UGCValidationService (ref), errorSourceStringsModule (ref)
	local descendants = p2:GetDescendants()
	table.insert(descendants, p2)
	
	for i, v in descendants do
		local var1, var2 = UGCValidationService:ValidatePropertiesSensible(v, p3[v.ClassName])
		
		if not var1 then
			p1:fail(errorSourceStringsModule.Keys.PropertiesNotSensible, {
				ClassName = v.ClassName,
				InstancePath = v:GetFullName(),
				ProblematicProperties = table.concat(var2, ", ")
			})
		end
	end
end

function t.run(p1, p2)
	-- upvalues: getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), getFIntUGCValidateMaxHSRDataLenModule (ref), walkInstanceTree (ref)
	if not getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then return end
	local t = {
		HiddenSurfaceRemovalAsset = { HSRData = getFIntUGCValidateMaxHSRDataLenModule() }
	}
	walkInstanceTree(p1, p2.rootInstance, t)
	
	for i, v in p2.hsrAssets do
		for i_1, v_1 in v do
			walkInstanceTree(p1, v_1, t)
		end
	end
end

return t