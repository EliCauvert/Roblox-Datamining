local Parent = script.Parent.Parent
local Util = Parent.util
local _ = require(Util.Types)
local CreateEmoteSchemaModule = require(Util.createEmoteSchema)
local FailureReasonsAccumulatorModule = require(Util.FailureReasonsAccumulator)
local Validation = Parent.validation
local ValidateSingleInstanceModule = require(Validation.validateSingleInstance)
local ValidateInstanceTreeModule = require(Validation.validateInstanceTree)
local ValidateTagsModule = require(Validation.validateTags)
local ValidateDependenciesModule = require(Validation.validateDependencies)
local ValidatePropertiesSensibleModule = require(Validation.ValidatePropertiesSensible)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local ValidateEmoteAnimationModule = {
	validateStructure = function(p1) --[[ Line: 24 ]]
		-- upvalues: ValidateSingleInstanceModule (copy), ValidateInstanceTreeModule (copy), CreateEmoteSchemaModule (copy)
		local ValidateSingleInstanceModuleResult, ValidateSingleInstanceModuleResult2 = ValidateSingleInstanceModule(p1.instances or {}, p1)
		
		if not ValidateSingleInstanceModuleResult then
			return false, ValidateSingleInstanceModuleResult2
		end
		local InstancesEntry = p1.instances[1]
		local ValidateInstanceTreeModuleResult, ValidateInstanceTreeModuleResult2 = ValidateInstanceTreeModule(CreateEmoteSchemaModule(), InstancesEntry, p1)
		
		if ValidateInstanceTreeModuleResult then
			return true, nil, InstancesEntry
		else
			return false, ValidateInstanceTreeModuleResult2
		end
	end
}

function ValidateEmoteAnimationModule.validate(p1) --[[ Line: 45 ]]
	-- upvalues: ValidateEmoteAnimationModule (copy), GetEngineFeatureEngineUGCValidatePropertiesSensibleModule (copy), ValidatePropertiesSensibleModule (copy), ValidateDependenciesModule (copy), FailureReasonsAccumulatorModule (copy), ValidateTagsModule (copy)
	local ValidateStructureResult, ValidateStructureResult2, ValidateStructureResult3 = ValidateEmoteAnimationModule.validateStructure(p1)
	
	if not ValidateStructureResult then
		return false, ValidateStructureResult2
	end
	if GetEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local ValidateResult, ValidateResult2 = ValidatePropertiesSensibleModule.validate(ValidateStructureResult3, p1)
		
		if not ValidateResult then
			return false, ValidateResult2
		end
	end
	local ValidateDependenciesModuleResult, ValidateDependenciesModuleResult2 = ValidateDependenciesModule(ValidateStructureResult3, p1, { skipExistenceCheck = true, skipOwnershipCheck = true })
	
	if ValidateDependenciesModuleResult then
		local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
		NewFailureReasonsAccumulator:updateReasons(ValidateTagsModule(ValidateStructureResult3, p1))
		
		return NewFailureReasonsAccumulator:getFinalResults()
	else
		return false, ValidateDependenciesModuleResult2
	end
end

return ValidateEmoteAnimationModule