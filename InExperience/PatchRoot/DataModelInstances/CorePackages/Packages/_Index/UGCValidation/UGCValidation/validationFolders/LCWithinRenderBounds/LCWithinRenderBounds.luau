local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getEngineFeatureEngineUGCValidationLCOOBModule = require(parent.flags.getEngineFeatureEngineUGCValidationLCOOB)

return {
	categories = {
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.EYEBROW_EYELASH
	},
	requiredData = {},
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: getEngineFeatureEngineUGCValidationLCOOBModule (ref), errorSourceStringsModule (ref), UGCValidationService (ref)
		if p2.consumerConfig.consumerEnv == "IEC" then return end
		local rootInstance = p2.rootInstance
		
		if not getEngineFeatureEngineUGCValidationLCOOBModule() then
			p1:fail(errorSourceStringsModule.Keys.LCWithinRenderBounds_EngineFeatureDisabled, { accessoryName = rootInstance.Name })
			
			return
		end
		local handle = rootInstance:FindFirstChild("Handle")
		
		if not handle then
			p1:fail(errorSourceStringsModule.Keys.LCWithinRenderBounds_NoHandle, { accessoryName = rootInstance.Name })
			
			return
		end
		local wrapLayer = handle:FindFirstChildWhichIsA("WrapLayer")
		
		if not wrapLayer then
			p1:fail(errorSourceStringsModule.Keys.LCWithinRenderBounds_NoWrapLayer, { accessoryName = rootInstance.Name })
			
			return
		elseif wrapLayer.MaxSize ~= Vector3.new(0, 0, 0) then
			p1:fail(errorSourceStringsModule.Keys.LCWithinRenderBounds_NonZeroMaxSize, {})
			
			return
		elseif wrapLayer.Offset ~= Vector3.new(0, 0, 0) then
			p1:fail(errorSourceStringsModule.Keys.LCWithinRenderBounds_NonZeroOffset, {})
			
			return
		elseif UGCValidationService:IsDeformedLayeredClothingOutOfRenderBounds(rootInstance) then
			p1:fail(errorSourceStringsModule.Keys.LCWithinRenderBounds_OutOfBounds, { accessoryName = rootInstance.Name })
		end
	end
}