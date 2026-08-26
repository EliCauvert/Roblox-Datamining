local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local util = parent.util
local failureReasonsAccumulatorModule = require(util.FailureReasonsAccumulator)
local _ = require(util.Types)
local getFIntUGCValidateMaxHSRDataLenModule = require(parent.flags.getFIntUGCValidateMaxHSRDataLen)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local t = {}
local var1 = nil

local function _()
	-- upvalues: var1 (write), getFIntUGCValidateMaxHSRDataLenModule (ref)
	if var1 then
		return
	end
	var1 = {
		HiddenSurfaceRemovalAsset = { HSRData = getFIntUGCValidateMaxHSRDataLenModule() }
	}
end

function t.resetPropertyLengthRestrictions()
	-- upvalues: var1 (write)
	var1 = nil
end

local function validateIndividual(p1)
	-- upvalues: UGCValidationService (ref), var1 (write)
	local var2, var3 = UGCValidationService:ValidatePropertiesSensible(p1, var1[p1.ClassName])
	
	if var2 then
		return true
	end
	return false, {
		string.format("%s %s has invalid properties: %s. These properties may be numeric values with NaNs or Infs, or strings/BinaryStrings longer than the max number of characters.", p1.ClassName, p1:GetFullName(), table.concat(var3, ", "))
	}
end

function t.validate(p1, p2)
	-- upvalues: getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), var1 (write), getFIntUGCValidateMaxHSRDataLenModule (ref), failureReasonsAccumulatorModule (ref), validateIndividual (ref), analyticsModule (ref)
	if not getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		return true
	end
	local currentTime = tick()
	
	if not var1 then
		var1 = {
			HiddenSurfaceRemovalAsset = { HSRData = getFIntUGCValidateMaxHSRDataLenModule() }
		}
	end
	local var2 = failureReasonsAccumulatorModule.new()
	local descendants = p1:GetDescendants()
	table.insert(descendants, p1)
	
	for i, v in descendants do
		var2:updateReasons(validateIndividual(v))
	end
	if not var2:getFinalResults() then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validatePropertiesSensible_IncorrectPropertiesFound, nil, p2)
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p2)
	
	return var2:getFinalResults()
end

return t