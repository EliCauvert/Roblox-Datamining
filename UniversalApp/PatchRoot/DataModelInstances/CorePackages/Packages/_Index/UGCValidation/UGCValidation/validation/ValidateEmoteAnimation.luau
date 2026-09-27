local parent = script.Parent.Parent
local util = parent.util
local _ = require(util.Types)
local createEmoteSchemaModule = require(util.createEmoteSchema)
local failureReasonsAccumulatorModule = require(util.FailureReasonsAccumulator)
local validation = parent.validation
local validateSingleInstanceModule = require(validation.validateSingleInstance)
local validateInstanceTreeModule = require(validation.validateInstanceTree)
local validateTagsModule = require(validation.validateTags)
local validateDependenciesModule = require(validation.validateDependencies)
local validatePropertiesSensibleModule = require(validation.ValidatePropertiesSensible)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local t = {
	validateStructure = function(p1)
		-- upvalues: validateSingleInstanceModule (ref), validateInstanceTreeModule (ref), createEmoteSchemaModule (ref)
		local var1, var2 = validateSingleInstanceModule(p1.instances or {}, p1)
		
		if not var1 then
			return false, var2
		end
		local var3 = p1.instances[1]
		local var4, var5 = validateInstanceTreeModule(createEmoteSchemaModule(), var3, p1)
		
		if var4 then
			return true, nil, var3
		end
		return false, var5
	end
}

function t.validate(p1)
	-- upvalues: t (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), validateDependenciesModule (ref), failureReasonsAccumulatorModule (ref), validateTagsModule (ref)
	local _ = nil
	local var1, var2, var3 = t.validateStructure(p1)
	
	if not var1 then
		return false, var2
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var4, var5 = validatePropertiesSensibleModule.validate(var3, p1)
		
		if not var4 then
			return false, var5
		end
	end
	var19, var16 = validateDependenciesModule(var3, p1, { skipExistenceCheck = true, skipOwnershipCheck = true })
	
	if var19 then
		local var6 = failureReasonsAccumulatorModule.new()
		var6:updateReasons(validateTagsModule(var3, p1))
		
		return var6:getFinalResults()
	end
	return false, var3
end

return t