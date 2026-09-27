local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validateTagsModule = require(parent.validation.validateTags)
local validateSingleInstanceModule = require(parent.validation.validateSingleInstance)
local validateDependenciesModule = require(parent.validation.validateDependencies)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local getFFlagUGCValidateMakeupCategoryParityModule = require(parent.flags.getFFlagUGCValidateMakeupCategoryParity)

return function(value)
	-- upvalues: getFFlagUGCValidateMakeupCategoryParityModule (ref), validateSingleInstanceModule (ref), validateDependenciesModule (ref), failureReasonsAccumulatorModule (ref), validateTagsModule (ref)
	local instances = value.instances
	local _ = nil
	local _ = nil
	
	if not getFFlagUGCValidateMakeupCategoryParityModule() then
		local var1, var2 = validateSingleInstanceModule(instances, value)
		local var3 = var2
		
		if not var1 then
			return false, var3
		end
	end
	local var4 = instances[1]
	local var5, var6 = validateDependenciesModule(var4, value, { skipExistenceCheck = true, skipOwnershipCheck = true })
	
	if not var5 then
		return false, var6
	end
	local var7 = failureReasonsAccumulatorModule.new()
	
	if not getFFlagUGCValidateMakeupCategoryParityModule() then
		var7:updateReasons(validateTagsModule(var4, value))
	end
	return var7:getFinalResults()
end