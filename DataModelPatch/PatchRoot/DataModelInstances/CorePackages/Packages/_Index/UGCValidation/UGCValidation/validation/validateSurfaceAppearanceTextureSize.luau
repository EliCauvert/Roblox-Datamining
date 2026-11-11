local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local ConstantsInterfaceModule = require(Parent.ConstantsInterface)
local _ = require(Parent.util.Types)
local ValidateTextureSizeModule = require(Parent.validation.validateTextureSize)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local GetEditableImageFromContextModule = require(Parent.util.getEditableImageFromContext)
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local GetFFlagUGCValidateAccessoryAssetSurfaceAppearanceTextureLimitsModule = require(Parent.flags.getFFlagUGCValidateAccessoryAssetSurfaceAppearanceTextureLimits)
local config = {
	ColorMap = game:DefineFastInt("AccessoryColorMapMaxSize", 1024),
	MetalnessMap = game:DefineFastInt("AccessoryMetalnessMapMaxSize", 256),
	NormalMap = game:DefineFastInt("AccessoryNormalMapMaxSize", 256),
	RoughnessMap = game:DefineFastInt("AccessoryRoughnessMapMaxSize", 256)
}

return function(Object, p1)
	-- upvalues: FailureReasonsAccumulatorModule (copy), ParseContentIdsModule (copy), ConstantsModule (copy), GetEditableImageFromContextModule (copy), GetFFlagUGCValidateAccessoryAssetSurfaceAppearanceTextureLimitsModule (copy), ConstantsInterfaceModule (copy), config (copy), ValidateTextureSizeModule (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	local Descendants = Object:GetDescendants()
	table.insert(Descendants, Object)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	for _, Part in Descendants do
		if Part:IsA("MeshPart") then
			local SurfaceAppearance = Part:FindFirstChildWhichIsA("SurfaceAppearance")
			
			if SurfaceAppearance then
				for _, value in ParseContentIdsModule.parse(SurfaceAppearance, ConstantsModule.TEXTURE_CONTENT_ID_FIELDS, p1) do
					local config1 = {
						fullName = value.instance:GetFullName() .. "." .. value.fieldName,
						fieldName = value.fieldName,
						contentId = value.instance[value.fieldName]
					}
					local EditableImageFromContextModule, EditableImageFromContextModule2 = GetEditableImageFromContextModule(value.instance, value.fieldName, p1)
					
					if not EditableImageFromContextModule then
						return false, { "Failed to load texture data" }
					end
					config1.editableImage = EditableImageFromContextModule2
					NewFailureReasonsAccumulator:updateReasons(ValidateTextureSizeModule(config1, nil, p1, if GetFFlagUGCValidateAccessoryAssetSurfaceAppearanceTextureLimitsModule() and p1.assetTypeEnum then ConstantsInterfaceModule.getTextureLimit(p1.assetTypeEnum, value.instance, value.fieldName) else config[value.fieldName]))
				end
			end
		end
	end
	AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p1)
	
	return NewFailureReasonsAccumulator:getFinalResults()
end