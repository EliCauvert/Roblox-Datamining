local Parent = script.Parent.Parent
local UGCValidationService = game:GetService("UGCValidationService")
local AnalyticsModule = require(Parent.Analytics)
local Util = Parent.util
local _ = require(Util.Types)
local PcallDeferredModule = require(Util.pcallDeferred)
local GetEngineFeatureEngineUGCValidationLCOOBModule = require(Parent.flags.getEngineFeatureEngineUGCValidationLCOOB)
local GetFFlagEnforceMaxSizeOffsetForLCModule = require(Parent.flags.getFFlagEnforceMaxSizeOffsetForLC)

return function(Object, p1)
	-- upvalues: GetEngineFeatureEngineUGCValidationLCOOBModule (copy), GetFFlagEnforceMaxSizeOffsetForLCModule (copy), PcallDeferredModule (copy), UGCValidationService (copy), AnalyticsModule (copy)
	if p1.allowEditableInstances then
		return true
	end
	if not GetEngineFeatureEngineUGCValidationLCOOBModule() then
		return false, {
			"Engine feature 'EngineUGCValidationLCOOB' is not enabled. Skipping validation for layered clothing out of bounds."
		}
	end
	local Handle = Object:FindFirstChild("Handle")
	
	if not Handle then
		return false, {
			"Accessory does not have a Handle. Cannot validate layered clothing out of bounds."
		}
	end
	local WrapLayer = Handle:FindFirstChildWhichIsA("WrapLayer")
	
	if not WrapLayer then
		return false, {
			"Accessory does not have a WrapLayer. Cannot validate layered clothing out of bounds."
		}
	end
	if not GetFFlagEnforceMaxSizeOffsetForLCModule() then
		WrapLayer.MaxSize = vector.create(0, 0, 0)
		WrapLayer.Offset = vector.create(0, 0, 0)
	elseif WrapLayer.MaxSize ~= vector.create(0, 0, 0) then
		return false, { "Accessory has a non-zero MaxSize." }
	elseif WrapLayer.Offset ~= vector.create(0, 0, 0) then
		return false, { "Accessory has a non-zero Offset." }
	end
	local CurrentTime = tick()
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: UGCValidationService (upval), Object (copy)
		return UGCValidationService:IsDeformedLayeredClothingOutOfRenderBounds(Object)
	end, p1)
	
	if not PcallDeferredModuleResult then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDeformedLayeredClothingInRenderBounds_FailedToExecute, nil, p1)
		
		return false, {
			(string.format("Unable to validate if deformed layered clothing %s is out of render bounds.", Object.Name))
		}
	end
	AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p1)
	
	if PcallDeferredModuleResult2 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDeformedLayeredClothingInRenderBounds_ClothingOutOfBounds, nil, p1)
		
		return false, {
			(string.format("Layered clothing validation failed for '%s'. When deformed, layered clothing becomes too large.", Object.Name))
		}
	else
		return true
	end
end