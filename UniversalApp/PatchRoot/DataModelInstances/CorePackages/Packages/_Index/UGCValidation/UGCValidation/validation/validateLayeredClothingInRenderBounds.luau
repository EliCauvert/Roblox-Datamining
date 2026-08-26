local parent = script.Parent.Parent
local UGCValidationService = game:GetService("UGCValidationService")
local analyticsModule = require(parent.Analytics)
local util = parent.util
local _ = require(util.Types)
local pcallDeferredModule = require(util.pcallDeferred)
local getEngineFeatureEngineUGCValidationLCOOBModule = require(parent.flags.getEngineFeatureEngineUGCValidationLCOOB)
local getFFlagEnforceMaxSizeOffsetForLCModule = require(parent.flags.getFFlagEnforceMaxSizeOffsetForLC)

return function(p1, p2)
	-- upvalues: getEngineFeatureEngineUGCValidationLCOOBModule (ref), getFFlagEnforceMaxSizeOffsetForLCModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), analyticsModule (ref)
	if p2.allowEditableInstances then
		return true
	elseif not getEngineFeatureEngineUGCValidationLCOOBModule() then
		return false, {
			"Engine feature 'EngineUGCValidationLCOOB' is not enabled. Skipping validation for layered clothing out of bounds."
		}
	end
	local handle = p1:FindFirstChild("Handle")
	
	if not handle then
		return false, {
			"Accessory does not have a Handle. Cannot validate layered clothing out of bounds."
		}
	end
	local wrapLayer = handle:FindFirstChildWhichIsA("WrapLayer")
	
	if not wrapLayer then
		return false, {
			"Accessory does not have a WrapLayer. Cannot validate layered clothing out of bounds."
		}
	elseif getFFlagEnforceMaxSizeOffsetForLCModule() then
		if wrapLayer.MaxSize ~= Vector3.new(0, 0, 0) then
			return false, { "Accessory has a non-zero MaxSize." }
		elseif wrapLayer.Offset ~= Vector3.new(0, 0, 0) then
			return false, { "Accessory has a non-zero Offset." }
		end
	else
		wrapLayer.MaxSize = Vector3.new(0, 0, 0)
		wrapLayer.Offset = Vector3.new(0, 0, 0)
	end
	local currentTime = tick()
	local var1, var2 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), p1 (ref)
		return UGCValidationService:IsDeformedLayeredClothingOutOfRenderBounds(p1)
	end, p2)
	
	if not var1 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateDeformedLayeredClothingInRenderBounds_FailedToExecute, nil, p2)
		
		return false, {
			string.format("Unable to validate if deformed layered clothing %s is out of render bounds.", p1.Name)
		}
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p2)
	
	if var2 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateDeformedLayeredClothingInRenderBounds_ClothingOutOfBounds, nil, p2)
		
		return false, {
			string.format("Layered clothing validation failed for '%s'. When deformed, layered clothing becomes too large.", p1.Name)
		}
	end
	return true
end