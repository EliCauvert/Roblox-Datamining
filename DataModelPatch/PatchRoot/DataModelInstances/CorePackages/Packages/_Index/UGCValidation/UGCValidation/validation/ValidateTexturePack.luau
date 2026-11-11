local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local Util = Parent.util
local _ = require(Util.Types)
local TexturePackUtilsModule = require(Util.TexturePackUtils)
local FailureReasonsAccumulatorModule = require(Util.FailureReasonsAccumulator)
local GetFFlagUGCValidateTexturePackModule = require(Parent.flags.getFFlagUGCValidateTexturePack)
local GetFFlagUGCValidateTexturePackOnRCCOnlyModule = require(Parent.flags.getFFlagUGCValidateTexturePackOnRCCOnly)

local function validateTexturePackURL(p1, p2, p3)
	-- upvalues: FailureReasonsAccumulatorModule (copy), TexturePackUtilsModule (copy), AnalyticsModule (copy)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	local SurfaceAppearancesMissingTexturePacks = TexturePackUtilsModule.findSurfaceAppearancesMissingTexturePacks(p1, p2)
	
	for _, surfaceAppearancesMissingTexturePack in SurfaceAppearancesMissingTexturePacks do
		NewFailureReasonsAccumulator:updateReasons(false, {
			`'{surfaceAppearancesMissingTexturePack:GetFullName()}' has a 'TexturePack' property with an invalid URL. Please fix the URL.`
		})
	end
	if #SurfaceAppearancesMissingTexturePacks > 0 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateTexturePack_InvalidTexturePackURL, nil, p3)
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end

local function validateSurfaceAppearanceTexturePackMatch(p4, p5)
	-- upvalues: FailureReasonsAccumulatorModule (copy), TexturePackUtilsModule (copy), UGCValidationService (copy), AnalyticsModule (copy)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	local v1 = false
	local Flag = false
	
	for _, Object in TexturePackUtilsModule.findSurfaceAppearancesWithTexturePacks(p4) do
		local Success, Result = pcall(function()
			-- upvalues: UGCValidationService (upval), Object (copy)
			return UGCValidationService:DoesSurfaceAppearanceMatchTexturePackAsync(Object)
		end)
		
		if Success then
			NewFailureReasonsAccumulator:updateReasons(Result, {
				`The textures in SurfaceAppearance '{Object:GetFullName()}' do not match those in its TexturePack. Please fix the TexturePack`
			})
			
			if not v1 then
				v1 = not Result
			end
		else
			local Message: string = `Failed to download TexturePack for SurfaceAppearance '{Object:GetFullName()}'.`
			
			if p5.isServer then
				error(Message)
			end
			Flag = true
			NewFailureReasonsAccumulator:updateReasons(false, { Message })
		end
	end
	if Flag then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateTexturePack_FailedToDownloadTexturePack, nil, p5)
	end
	if v1 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateTexturePack_TexturePackMismatch, nil, p5)
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end

return {
	validate = function(p6, p7, p8)
		-- upvalues: GetFFlagUGCValidateTexturePackModule (copy), GetFFlagUGCValidateTexturePackOnRCCOnlyModule (copy), FailureReasonsAccumulatorModule (copy), validateTexturePackURL (copy), validateSurfaceAppearanceTexturePackMatch (copy), AnalyticsModule (copy)
		if not GetFFlagUGCValidateTexturePackModule() then
			return true
		end
		local v2 = if GetFFlagUGCValidateTexturePackOnRCCOnlyModule() then if p8.isServer then true else false else nil
		
		if p8.allowEditableInstances then
			return true
		end
		local CurrentTime = tick()
		local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
		
		if GetFFlagUGCValidateTexturePackOnRCCOnlyModule() then
			if v2 then
				NewFailureReasonsAccumulator:updateReasons(validateTexturePackURL(p6, p7, p8))
			end
		else
			NewFailureReasonsAccumulator:updateReasons(validateTexturePackURL(p6, p7, p8))
		end
		NewFailureReasonsAccumulator:updateReasons(validateSurfaceAppearanceTexturePackMatch(p6, p8))
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p8)
		
		return NewFailureReasonsAccumulator:getFinalResults()
	end
}