local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local ValidateTagsModule = require(Parent.validation.validateTags)
local ValidateSingleInstanceModule = require(Parent.validation.validateSingleInstance)
local ValidateDependenciesModule = require(Parent.validation.validateDependencies)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local GetFFlagUGCValidateMakeupCategoryParityModule = require(Parent.flags.getFFlagUGCValidateMakeupCategoryParity)

return function(p1) --[[ Line: 12 | Named "validateMakeupAsset" ]]
	-- upvalues: GetFFlagUGCValidateMakeupCategoryParityModule (copy), ValidateSingleInstanceModule (copy), ValidateDependenciesModule (copy), FailureReasonsAccumulatorModule (copy), ValidateTagsModule (copy)
	local Instances = p1.instances
	
	if not GetFFlagUGCValidateMakeupCategoryParityModule() then
		local ValidateSingleInstanceModuleResult, ValidateSingleInstanceModuleResult2 = ValidateSingleInstanceModule(Instances, p1)
		
		if not ValidateSingleInstanceModuleResult then
			return false, ValidateSingleInstanceModuleResult2
		end
	end
	local InstancesEntry = Instances[1]
	local ValidateDependenciesModuleResult, ValidateDependenciesModuleResult2 = ValidateDependenciesModule(InstancesEntry, p1, { skipExistenceCheck = true, skipOwnershipCheck = true })
	
	if not ValidateDependenciesModuleResult then
		return false, ValidateDependenciesModuleResult2
	end
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	if not GetFFlagUGCValidateMakeupCategoryParityModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateTagsModule(InstancesEntry, p1))
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end