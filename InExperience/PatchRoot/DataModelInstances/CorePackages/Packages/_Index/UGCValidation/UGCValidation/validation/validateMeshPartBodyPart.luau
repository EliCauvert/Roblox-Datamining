local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local validateDependenciesModule = require(parent.validation.validateDependencies)
local validateDescendantMeshMetricsModule = require(parent.validation.validateDescendantMeshMetrics)
local validateTagsModule = require(parent.validation.validateTags)
local validatePropertiesSensibleModule = require(parent.validation.ValidatePropertiesSensible)
local validateWithSchemaModule = require(parent.util.validateWithSchema)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local validateMeshPartOnlySkinnedToR15Module = require(parent.validation.ValidateMeshPartOnlySkinnedToR15)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local getFFlagUGCValidationEnableR15plusSkinningModule = require(parent.flags.getFFlagUGCValidationEnableR15plusSkinning)
local resetPhysicsDataModule = require(parent.util.resetPhysicsData)
local _ = require(parent.util.Types)

return function(p1, p2, p3)
	-- upvalues: validateWithSchemaModule (ref), analyticsModule (ref), validateDependenciesModule (ref), resetPhysicsDataModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), failureReasonsAccumulatorModule (ref), validateDescendantMeshMetricsModule (ref), validateTagsModule (ref), getFFlagUGCValidationEnableR15plusSkinningModule (ref), validateMeshPartOnlySkinnedToR15Module (ref)
	local assetTypeEnum = p3.assetTypeEnum
	local var1 = validateWithSchemaModule(p2, p1, p3)
	
	if not var1.success then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateMeshPartBodyPart_ValidateWithSchema, nil, p3)
		
		return false, {
			string.format("Body part '%s' does not follow R15 schema. The specific issues are: ", p1.Name),
			var1.message
		}
	end
	local var2, var3 = validateDependenciesModule(p1, p3, { skipExistenceCheck = true, skipOwnershipCheck = true })
	
	if not var2 then
		return var2, var3
	end
	local var4, var5 = resetPhysicsDataModule({ p1 }, p3)
	
	if not var4 then
		return false, { var5 }
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var6, var7 = validatePropertiesSensibleModule.validate(p1, p3)
		
		if not var6 then
			return false, var7
		end
	end
	local var8 = failureReasonsAccumulatorModule.new()
	var8:updateReasons(validateDescendantMeshMetricsModule(p1, p3))
	var8:updateReasons(validateTagsModule(p1, p3))
	
	if not getFFlagUGCValidationEnableR15plusSkinningModule() and assetTypeEnum ~= Enum.AssetType.DynamicHead then
		var8:updateReasons(validateMeshPartOnlySkinnedToR15Module.validateBodyParts(p1, p3))
	end
	return var8:getFinalResults()
end