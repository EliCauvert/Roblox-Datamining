local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local ConstantsInterfaceModule = require(Parent.ConstantsInterface)
local _ = require(Parent.util.Types)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local GetEditableImageFromContextModule = require(Parent.util.getEditableImageFromContext)
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local ValidateMakeupDecalUVZonesModule = require(Parent.validation.validateMakeupDecalUVZones)
local GetFFlagUGCValidateDecalTextureLimitsModule = require(Parent.flags.getFFlagUGCValidateDecalTextureLimits)
local ValidateTextureSizeModule = require(Parent.validation.validateTextureSize)

return function(Object, p1)
	-- upvalues: FailureReasonsAccumulatorModule (copy), ParseContentIdsModule (copy), ConstantsModule (copy), GetEditableImageFromContextModule (copy), AnalyticsModule (copy), GetFFlagUGCValidateDecalTextureLimitsModule (copy), ConstantsInterfaceModule (copy), ValidateTextureSizeModule (copy), ValidateMakeupDecalUVZonesModule (copy)
	local CurrentTime = tick()
	local AssetTypeEnum = p1.assetTypeEnum
	local WrapTextureTransfer = Object:FindFirstChildOfClass("WrapTextureTransfer")
	assert(WrapTextureTransfer ~= nil, string.format("WrapTextureTransfer child not found for %s", Object.Name))
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	local v1 = nil
	
	for _, value in ParseContentIdsModule.parse(Object, ConstantsModule.TEXTURE_CONTENT_ID_FIELDS, p1) do
		local config = {
			fullName = value.instance:GetFullName() .. "." .. value.fieldName,
			fieldName = value.fieldName,
			contentId = value.instance[value.fieldName]
		}
		local EditableImageFromContextModule, EditableImageFromContextModule2 = GetEditableImageFromContextModule(value.instance, value.fieldName, p1)
		
		if not EditableImageFromContextModule then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMakeupDecal_FailedToLoadTexture, nil, p1)
			NewFailureReasonsAccumulator:updateReasons(false, {
				string.format("Failed to load %s for Decal %s. Make sure TextureContent exists and is valid and try again.", config.fieldName, Object.Name)
			})
		end
		config.editableImage = EditableImageFromContextModule2
		
		if value.fieldName == "ColorMap" then
			v1 = EditableImageFromContextModule2
		end
		NewFailureReasonsAccumulator:updateReasons(ValidateTextureSizeModule(config, nil, p1, if GetFFlagUGCValidateDecalTextureLimitsModule() and AssetTypeEnum then ConstantsInterfaceModule.getTextureLimit(AssetTypeEnum, value.instance, value.fieldName) else nil))
	end
	if v1 then
		NewFailureReasonsAccumulator:updateReasons(ValidateMakeupDecalUVZonesModule(Object, v1, WrapTextureTransfer, ConstantsModule.MAKEUP_INFO.AssetUVBounds[AssetTypeEnum], p1))
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p1)
		
		return NewFailureReasonsAccumulator:getFinalResults()
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateMakeupDecal_NoColorMap, nil, p1)
		
		return false, {
			string.format("No ColorMap found for Decal %s. Makeup Decals are required to have a valid ColorMap.", Object.Name)
		}
	end
end