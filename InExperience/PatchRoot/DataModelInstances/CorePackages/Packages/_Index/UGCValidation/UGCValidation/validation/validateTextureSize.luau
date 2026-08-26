local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getFFlagUGCValidateTextureSizeExtraErrorInfoModule = require(parent.flags.getFFlagUGCValidateTextureSizeExtraErrorInfo)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)

return function(p1, p2, p3, p4)
	-- upvalues: constantsModule (ref), analyticsModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), getFFlagUGCValidateTextureSizeExtraErrorInfoModule (ref)
	local currentTime = tick()
	local isServer = p3.isServer
	
	if not p4 then
		p4 = constantsModule.MAX_TEXTURE_SIZE
	end
	assert(p4, "maxTextureSize is required for validateTextureSize")
	
	if p1.editableImage then
		local var1, var2 = pcallDeferredModule(function()
			-- upvalues: UGCValidationService (copy), p1 (ref)
			return UGCValidationService:GetEditableImageSize(p1.editableImage)
		end, p3)
		
		if var1 then
			if p4 >= var2.X and p4 >= var2.Y then
				analyticsModule.recordScriptTime(script.Name, currentTime, p3)
				
				return true
			end
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateTextureSize_TextureTooBig, nil, p3)
			
			if getFFlagUGCValidateTextureSizeExtraErrorInfoModule() or p4 ~= constantsModule.MAX_TEXTURE_SIZE then
				return false, {
					string.format("Texture resolution %dx%d px found in '%s' is higher than max size supported value of %dx%d px for field '%s'.", var2.X, var2.Y, p1.fullName, p4, p4, p1.fieldName)
				}
			end
			return false, {
				string.format("Texture resolution %dx%d px found in '%s' is higher than max size supported value of %dx%d px. You need to reduce the texture resolution", var2.X, var2.Y, p1.fullName, p4, p4)
			}
		elseif isServer ~= nil and isServer then
			error(string.format("Failed to load texture data for '%s'. Make sure the texture exists and try again.", p1.fullName))
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateTextureSize_FailedToLoadTexture, nil, p3)
		
		return false, {
			string.format("Failed to load texture data for '%s'. Make sure the texture exists and try again.", p1.fullName)
		}
	elseif p2 then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateTextureSize_InvalidTextureId, nil, p3)
	
	return false, {
		string.format("Invalid textureID used in mesh '%s'. Make sure the texture exists and try again.", p1.fullName)
	}
end