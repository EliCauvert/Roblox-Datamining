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

return function(p1, p2)
	-- upvalues: failureReasonsAccumulatorModule (ref), parseContentIdsModule (ref), constantsModule (ref), getEditableImageFromContextModule (ref), analyticsModule (ref), getFFlagUGCValidateDecalTextureLimitsModule (ref), constantsInterfaceModule (ref), validateTextureSizeModule (ref), validateMakeupDecalUVZonesModule (ref)
	local currentTime = tick()
	local assetTypeEnum = p2.assetTypeEnum
	local wrapTextureTransfer = p1:FindFirstChildOfClass("WrapTextureTransfer")
	assert(wrapTextureTransfer ~= nil, string.format("WrapTextureTransfer child not found for %s", p1.Name))
	local var1 = failureReasonsAccumulatorModule.new()
	local var2 = nil
	
	for i, v in parseContentIdsModule.parse(p1, constantsModule.TEXTURE_CONTENT_ID_FIELDS, p2) do
		local t = {
			fullName = v.instance:GetFullName() .. "." .. v.fieldName,
			fieldName = v.fieldName,
			contentId = v.instance[v.fieldName]
		}
		local var3, var4 = getEditableImageFromContextModule(v.instance, v.fieldName, p2)
		
		if not var3 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateMakeupDecal_FailedToLoadTexture, nil, p2)
			var1:updateReasons(false, {
				string.format("Failed to load %s for Decal %s. Make sure TextureContent exists and is valid and try again.", t.fieldName, p1.Name)
			})
		end
		t.editableImage = var4
		
		if v.fieldName == "ColorMap" then
			var2 = var4
		end
		var1:updateReasons(validateTextureSizeModule(t, nil, p2, if getFFlagUGCValidateDecalTextureLimitsModule() and assetTypeEnum then constantsInterfaceModule.getTextureLimit(assetTypeEnum, v.instance, v.fieldName) else nil))
	end
	if var2 then
		var1:updateReasons(validateMakeupDecalUVZonesModule(p1, var2, wrapTextureTransfer, constantsModule.MAKEUP_INFO.AssetUVBounds[assetTypeEnum], p2))
		analyticsModule.recordScriptTime(script.Name, currentTime, p2)
		
		return var1:getFinalResults()
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateMakeupDecal_NoColorMap, nil, p2)
	
	return false, {
		string.format("No ColorMap found for Decal %s. Makeup Decals are required to have a valid ColorMap.", p1.Name)
	}
end