-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:44 2026 Pacific Standard Time.

local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local util = parent.util
local failureReasonsAccumulatorModule = require(util.FailureReasonsAccumulator)
local _ = require(util.Types)
local getFIntUGCValidateMaxHSRDataLenModule = require(parent.flags.getFIntUGCValidateMaxHSRDataLen)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local t = {}
local var6 = nil

local function _() --[[ line: 23 | named "createPropertyLengthRestrictions" ]]
	-- upvalues: var6 (write), getFIntUGCValidateMaxHSRDataLenModule (ref)
	if var6 then
		return
	end
	var6 = {
		HiddenSurfaceRemovalAsset = { HSRData = getFIntUGCValidateMaxHSRDataLenModule() }
	}
end

function t.resetPropertyLengthRestrictions() --[[ line: 33 ]]
	-- upvalues: var6 (write)
	var6 = nil
end

local function validateIndividual(p0) --[[ line: 37 ]]
	-- upvalues: UGCValidationService (ref), var6 (write)
	local var8, var9 = UGCValidationService:ValidatePropertiesSensible(p0, var6[p0.ClassName])
	
	if var8 then
		return true
	end
	return false, {
		string.format("%s %s has invalid properties: %s. These properties may be numeric values with NaNs or Infs, or strings/BinaryStrings longer than the max number of characters.", p0.ClassName, p0:GetFullName(), table.concat(var9, ", "))
	}
end

function t.validate(p1, p2) --[[ line: 58 ]]
	-- upvalues: getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), var6 (write), getFIntUGCValidateMaxHSRDataLenModule (ref), failureReasonsAccumulatorModule (ref), validateIndividual (ref), analyticsModule (ref)
	if not getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		return true
	end
	local currentTime = tick()
	
	if not var6 then
		var6 = {
			HiddenSurfaceRemovalAsset = { HSRData = getFIntUGCValidateMaxHSRDataLenModule() }
		}
	end
	local var11 = failureReasonsAccumulatorModule.new()
	local descendants = p1:GetDescendants()
	table.insert(descendants, p1)
	
	for i, v in descendants do
		var11:updateReasons(validateIndividual(v))
	end
	if not var11:getFinalResults() then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validatePropertiesSensible_IncorrectPropertiesFound, nil, p2)
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p2)
	
	return var11:getFinalResults()
end

return t