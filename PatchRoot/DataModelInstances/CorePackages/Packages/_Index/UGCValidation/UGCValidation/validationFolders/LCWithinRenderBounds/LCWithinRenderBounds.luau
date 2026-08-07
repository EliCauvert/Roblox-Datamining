-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:48 2026 Pacific Standard Time.

local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateCageGeometryModule = require(parent.flags.getFFlagUGCValidateMigrateCageGeometry)
local getEngineFeatureEngineUGCValidationLCOOBModule = require(parent.flags.getEngineFeatureEngineUGCValidationLCOOB)
local getFFlagEnforceMaxSizeOffsetForLCModule = require(parent.flags.getFFlagEnforceMaxSizeOffsetForLC)

return {
	fflag = getFFlagUGCValidateMigrateCageGeometryModule,
	categories = { validationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	requiredData = {},
	expectedFailures = {},
	run = function(p0, p1) --[[ line: 20 ]]
		-- upvalues: getEngineFeatureEngineUGCValidationLCOOBModule (ref), errorSourceStringsModule (ref), getFFlagEnforceMaxSizeOffsetForLCModule (ref), UGCValidationService (ref)
		if p1.consumerConfig.consumerEnv == "IEC" then return end
		local rootInstance = p1.rootInstance
		
		if not getEngineFeatureEngineUGCValidationLCOOBModule() then
			p0:fail(errorSourceStringsModule.Keys.LCWithinRenderBounds_EngineFeatureDisabled, { accessoryName = rootInstance.Name })
			
			return
		end
		local handle = rootInstance:FindFirstChild("Handle")
		
		if not handle then
			p0:fail(errorSourceStringsModule.Keys.LCWithinRenderBounds_NoHandle, { accessoryName = rootInstance.Name })
			
			return
		end
		local wrapLayer = handle:FindFirstChildWhichIsA("WrapLayer")
		
		if not wrapLayer then
			p0:fail(errorSourceStringsModule.Keys.LCWithinRenderBounds_NoWrapLayer, { accessoryName = rootInstance.Name })
			
			return
		elseif getFFlagEnforceMaxSizeOffsetForLCModule() then
			if wrapLayer.MaxSize ~= Vector3.new(0, 0, 0) then
				p0:fail(errorSourceStringsModule.Keys.LCWithinRenderBounds_NonZeroMaxSize, {})
				
				return
			elseif wrapLayer.Offset ~= Vector3.new(0, 0, 0) then
				p0:fail(errorSourceStringsModule.Keys.LCWithinRenderBounds_NonZeroOffset, {})
				
				return
			elseif UGCValidationService:IsDeformedLayeredClothingOutOfRenderBounds(rootInstance) then
				p0:fail(errorSourceStringsModule.Keys.LCWithinRenderBounds_OutOfBounds, { accessoryName = rootInstance.Name })
			end
			return
		else
			wrapLayer.MaxSize = Vector3.new(0, 0, 0)
			wrapLayer.Offset = Vector3.new(0, 0, 0)
		end
	end
}