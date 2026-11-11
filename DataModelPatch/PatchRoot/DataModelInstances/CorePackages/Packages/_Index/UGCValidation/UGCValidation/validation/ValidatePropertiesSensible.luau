local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local Util = Parent.util
local FailureReasonsAccumulatorModule = require(Util.FailureReasonsAccumulator)
local _ = require(Util.Types)
local GetFIntUGCValidateMaxHSRDataLenModule = require(Parent.flags.getFIntUGCValidateMaxHSRDataLen)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local Config = nil

local function _()
	-- upvalues: Config (ref), GetFIntUGCValidateMaxHSRDataLenModule (copy)
	if not Config then
		Config = {
			HiddenSurfaceRemovalAsset = { HSRData = GetFIntUGCValidateMaxHSRDataLenModule() }
		}
		
		return
	end
end

local function validateIndividual(Object)
	-- upvalues: UGCValidationService (copy), Config (ref)
	local ValidatePropertiesSensibleResult, ValidatePropertiesSensibleResult2 = UGCValidationService:ValidatePropertiesSensible(Object, Config[Object.ClassName])
	
	if ValidatePropertiesSensibleResult then
		return true
	else
		return false, {
			string.format("%s %s has invalid properties: %s. These properties may be numeric values with NaNs or Infs, or strings/BinaryStrings longer than the max number of characters.", Object.ClassName, Object:GetFullName(), table.concat(ValidatePropertiesSensibleResult2, ", "))
		}
	end
end

return {
	resetPropertyLengthRestrictions = function()
		-- upvalues: Config (ref)
		Config = nil
	end,
	validate = function(Object, p1)
		-- upvalues: GetEngineFeatureEngineUGCValidatePropertiesSensibleModule (copy), Config (ref), GetFIntUGCValidateMaxHSRDataLenModule (copy), FailureReasonsAccumulatorModule (copy), validateIndividual (copy), AnalyticsModule (copy)
		if not GetEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
			return true
		end
		local CurrentTime = tick()
		
		if not Config then
			Config = {
				HiddenSurfaceRemovalAsset = { HSRData = GetFIntUGCValidateMaxHSRDataLenModule() }
			}
		end
		local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
		local Descendants = Object:GetDescendants()
		table.insert(Descendants, Object)
		
		for _, descendant in Descendants do
			NewFailureReasonsAccumulator:updateReasons(validateIndividual(descendant))
		end
		if not NewFailureReasonsAccumulator:getFinalResults() then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validatePropertiesSensible_IncorrectPropertiesFound, nil, p1)
		end
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p1)
		
		return NewFailureReasonsAccumulator:getFinalResults()
	end
}