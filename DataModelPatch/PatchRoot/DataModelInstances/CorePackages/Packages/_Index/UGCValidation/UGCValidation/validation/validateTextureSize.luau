local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local GetFFlagUGCValidateTextureSizeExtraErrorInfoModule = require(Parent.flags.getFFlagUGCValidateTextureSizeExtraErrorInfo)
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)

return function(p1, p2, p3, MAXTEXTURESIZE)
	-- upvalues: ConstantsModule (copy), AnalyticsModule (copy), PcallDeferredModule (copy), UGCValidationService (copy), GetFFlagUGCValidateTextureSizeExtraErrorInfoModule (copy)
	local CurrentTime = tick()
	local IsServer = p3.isServer
	
	if not MAXTEXTURESIZE then
		MAXTEXTURESIZE = ConstantsModule.MAX_TEXTURE_SIZE
	end
	assert(MAXTEXTURESIZE, "maxTextureSize is required for validateTextureSize")
	
	if p1.editableImage then
		local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
			-- upvalues: UGCValidationService (upval), p1 (copy)
			return UGCValidationService:GetEditableImageSize(p1.editableImage)
		end, p3)
		
		if not PcallDeferredModuleResult then
			if IsServer ~= nil and IsServer then
				error(string.format("Failed to load texture data for '%s'. Make sure the texture exists and try again.", p1.fullName))
			end
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateTextureSize_FailedToLoadTexture, nil, p3)
			
			return false, {
				string.format("Failed to load texture data for '%s'. Make sure the texture exists and try again.", p1.fullName)
			}
		elseif MAXTEXTURESIZE >= PcallDeferredModuleResult2.X and MAXTEXTURESIZE >= PcallDeferredModuleResult2.Y then
			AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p3)
			
			return true
		else
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateTextureSize_TextureTooBig, nil, p3)
			local IsNotMAXTEXTURESIZEMatch = MAXTEXTURESIZE ~= ConstantsModule.MAX_TEXTURE_SIZE
			
			if GetFFlagUGCValidateTextureSizeExtraErrorInfoModule() or IsNotMAXTEXTURESIZEMatch then
				return false, {
					string.format("Texture resolution %dx%d px found in '%s' is higher than max size supported value of %dx%d px for field '%s'.", PcallDeferredModuleResult2.X, PcallDeferredModuleResult2.Y, p1.fullName, MAXTEXTURESIZE, MAXTEXTURESIZE, p1.fieldName)
				}
			else
				return false, {
					string.format("Texture resolution %dx%d px found in '%s' is higher than max size supported value of %dx%d px. You need to reduce the texture resolution", PcallDeferredModuleResult2.X, PcallDeferredModuleResult2.Y, p1.fullName, MAXTEXTURESIZE, MAXTEXTURESIZE)
				}
			end
		end
	elseif p2 then
		return true
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateTextureSize_InvalidTextureId, nil, p3)
		
		return false, {
			string.format("Invalid textureID used in mesh '%s'. Make sure the texture exists and try again.", p1.fullName)
		}
	end
end