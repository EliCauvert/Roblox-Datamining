local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local getFFlagUGCValidateTextureSizeExtraErrorInfoModule = require(parent.flags.getFFlagUGCValidateTextureSizeExtraErrorInfo)
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)

return function(p0, p1, p2, p3) --[[ line: 14 | named "validateTextureSize" ]]
	-- upvalues: constantsModule (ref), analyticsModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), getFFlagUGCValidateTextureSizeExtraErrorInfoModule (ref)
	local currentTime = tick()
	local isServer = p2.isServer
	
	if not p3 then
		p3 = constantsModule.MAX_TEXTURE_SIZE
	end
	assert(p3, "maxTextureSize is required for validateTextureSize")
	
	if p0.editableImage then
		local var6, var7 = pcallDeferredModule(function() --[[ line: 41 ]]
			-- upvalues: UGCValidationService (copy), p0 (ref)
			return UGCValidationService:GetEditableImageSize(p0.editableImage)
		end, p2)
		
		if var6 then
			if p3 >= var7.X and p3 >= var7.Y then
				analyticsModule.recordScriptTime(script.Name, currentTime, p2)
				
				return true
			end
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateTextureSize_TextureTooBig, nil, p2)
			
			if getFFlagUGCValidateTextureSizeExtraErrorInfoModule() or p3 ~= constantsModule.MAX_TEXTURE_SIZE then
				return false, {
					string.format("Texture resolution %dx%d px found in '%s' is higher than max size supported value of %dx%d px for field '%s'.", var7.X, var7.Y, p0.fullName, p3, p3, p0.fieldName)
				}
			end
			return false, {
				string.format("Texture resolution %dx%d px found in '%s' is higher than max size supported value of %dx%d px. You need to reduce the texture resolution", var7.X, var7.Y, p0.fullName, p3, p3)
			}
		elseif isServer ~= nil and isServer then
			error(string.format("Failed to load texture data for '%s'. Make sure the texture exists and try again.", p0.fullName))
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateTextureSize_FailedToLoadTexture, nil, p2)
		
		return false, {
			string.format("Failed to load texture data for '%s'. Make sure the texture exists and try again.", p0.fullName)
		}
	elseif p1 then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateTextureSize_InvalidTextureId, nil, p2)
	
	return false, {
		string.format("Invalid textureID used in mesh '%s'. Make sure the texture exists and try again.", p0.fullName)
	}
end