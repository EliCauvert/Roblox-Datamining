local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetEngineFeatureEngineUGCValidationLCOOBModule = require(Parent.flags.getEngineFeatureEngineUGCValidationLCOOB)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH
	},
	requiredData = {},
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: GetEngineFeatureEngineUGCValidationLCOOBModule (copy), ErrorSourceStringsModule (copy), UGCValidationService (copy)
		if p2.consumerConfig.consumerEnv == "IEC" then return end
		local RootInstance = p2.rootInstance
		
		if not GetEngineFeatureEngineUGCValidationLCOOBModule() then
			p1:fail(ErrorSourceStringsModule.Keys.LCWithinRenderBounds_EngineFeatureDisabled, { accessoryName = RootInstance.Name })
			
			return
		end
		local Handle = RootInstance:FindFirstChild("Handle")
		
		if not Handle then
			p1:fail(ErrorSourceStringsModule.Keys.LCWithinRenderBounds_NoHandle, { accessoryName = RootInstance.Name })
			
			return
		end
		local WrapLayer = Handle:FindFirstChildWhichIsA("WrapLayer")
		
		if not WrapLayer then
			p1:fail(ErrorSourceStringsModule.Keys.LCWithinRenderBounds_NoWrapLayer, { accessoryName = RootInstance.Name })
			
			return
		end
		if WrapLayer.MaxSize ~= vector.create(0, 0, 0) then
			p1:fail(ErrorSourceStringsModule.Keys.LCWithinRenderBounds_NonZeroMaxSize, {})
			
			return
		end
		if WrapLayer.Offset ~= vector.create(0, 0, 0) then
			p1:fail(ErrorSourceStringsModule.Keys.LCWithinRenderBounds_NonZeroOffset, {})
			
			return
		end
		if UGCValidationService:IsDeformedLayeredClothingOutOfRenderBounds(RootInstance) then
			p1:fail(ErrorSourceStringsModule.Keys.LCWithinRenderBounds_OutOfBounds, { accessoryName = RootInstance.Name })
		end
	end
}