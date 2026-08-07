local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local _ = require(parent.util.Types)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local getEditableImageFromContextModule = require(parent.util.getEditableImageFromContext)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local validateMakeupDecalUVZonesModule = require(parent.validation.validateMakeupDecalUVZones)
local getFFlagUGCValidateDecalTextureLimitsModule = require(parent.flags.getFFlagUGCValidateDecalTextureLimits)
local validateTextureSizeModule = require(parent.validation.validateTextureSize)

return function(p0, p1) --[[ line: 23 | named "validateMakeupDecal" ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), parseContentIdsModule (ref), constantsModule (ref), getEditableImageFromContextModule (ref), analyticsModule (ref), getFFlagUGCValidateDecalTextureLimitsModule (ref), constantsInterfaceModule (ref), validateTextureSizeModule (ref), validateMakeupDecalUVZonesModule (ref)
	local currentTime = tick()
	local assetTypeEnum = p1.assetTypeEnum
	local wrapTextureTransfer = p0:FindFirstChildOfClass("WrapTextureTransfer")
	assert(wrapTextureTransfer ~= nil, string.format("WrapTextureTransfer child not found for %s", p0.Name))
	local var11 = failureReasonsAccumulatorModule.new()
	local var12 = nil
	
	for i, v in parseContentIdsModule.parse(p0, constantsModule.TEXTURE_CONTENT_ID_FIELDS, p1) do
		local t = {
			fullName = v.instance:GetFullName() .. "." .. v.fieldName,
			fieldName = v.fieldName,
			contentId = v.instance[v.fieldName]
		}
		local var14, var15 = getEditableImageFromContextModule(v.instance, v.fieldName, p1)
		
		if not var14 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateMakeupDecal_FailedToLoadTexture, nil, p1)
			var11:updateReasons(false, {
				string.format("Failed to load %s for Decal %s. Make sure TextureContent exists and is valid and try again.", t.fieldName, p0.Name)
			})
		end
		t.editableImage = var15
		
		if v.fieldName == "ColorMap" then
			var12 = var15
		end
		var11:updateReasons(validateTextureSizeModule(t, nil, p1, if getFFlagUGCValidateDecalTextureLimitsModule() and assetTypeEnum then constantsInterfaceModule.getTextureLimit(assetTypeEnum, v.instance, v.fieldName) else nil))
	end
	if var12 then
		var11:updateReasons(validateMakeupDecalUVZonesModule(p0, var12, wrapTextureTransfer, constantsModule.MAKEUP_INFO.AssetUVBounds[assetTypeEnum], p1))
		analyticsModule.recordScriptTime(script.Name, currentTime, p1)
		
		return var11:getFinalResults()
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateMakeupDecal_NoColorMap, nil, p1)
	
	return false, {
		string.format("No ColorMap found for Decal %s. Makeup Decals are required to have a valid ColorMap.", p0.Name)
	}
end