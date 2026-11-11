local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local ConstantsModule = require(Parent.Constants)
local ConstantsInterfaceModule = require(Parent.ConstantsInterface)
local ValidateTextureSizeModule = require(Parent.validation.validateTextureSize)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local GetEditableImageFromContextModule = require(Parent.util.getEditableImageFromContext)
local GetFFlagUGCValidateBodyAssetTextureLimitsModule = require(Parent.flags.getFFlagUGCValidateBodyAssetTextureLimits)

return function(p1, p2)
	-- upvalues: FailureReasonsAccumulatorModule (copy), ParseContentIdsModule (copy), ConstantsModule (copy), GetEditableImageFromContextModule (copy), GetFFlagUGCValidateBodyAssetTextureLimitsModule (copy), ConstantsInterfaceModule (copy), ValidateTextureSizeModule (copy)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	local t = {}
	
	for _, value in ParseContentIdsModule.parse(p1, ConstantsModule.TEXTURE_CONTENT_ID_FIELDS, p2) do
		local config = {
			fullName = value.instance:GetFullName(),
			fieldName = value.fieldName,
			contentId = value.instance[value.fieldName]
		}
		local EditableImageFromContextModule, EditableImageFromContextModule2 = GetEditableImageFromContextModule(value.instance, value.fieldName, p2)
		
		if not EditableImageFromContextModule then
			return false, { "Failed to load texture data" }
		end
		config.editableImage = EditableImageFromContextModule2
		
		if not t[value.id] then
			NewFailureReasonsAccumulator:updateReasons(ValidateTextureSizeModule(config, nil, p2, if GetFFlagUGCValidateBodyAssetTextureLimitsModule() then ConstantsInterfaceModule.getTextureLimit(p2.assetTypeEnum, value.instance, value.fieldName) else nil))
			
			if value.id then
				t[value.id] = true
			end
		end
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end