local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local ConstantsInterfaceModule = require(Parent.ConstantsInterface)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local CreateEditableInstancesForContextModule = require(Parent.util.createEditableInstancesForContext)
local GetFFlagUGCValidateDecalTextureLimitsModule = require(Parent.flags.getFFlagUGCValidateDecalTextureLimits)
local ValidateMakeupZoneIncludeToleranceHundredthsPercent = game:DefineFastInt("ValidateMakeupZoneIncludeToleranceHundredthsPercent", 100)
local ValidateMakeupZoneExcludeHundredthsPercent = game:DefineFastInt("ValidateMakeupZoneExcludeHundredthsPercent", 200)
local config = {
	Publish = true,
	Backend = true,
	Internal = true,
	InExpServer = true
}
local config1 = { InExpServer = true, InExpClient = true }

local function validateTextureSize(p1, EditableImage, FullName, FieldName, TextureLimit, p2)
	-- upvalues: UGCValidationService (copy), ErrorSourceStringsModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: UGCValidationService (upval), EditableImage (copy)
		return UGCValidationService:GetEditableImageSize(EditableImage)
	end)
	
	if not Success then
		if p2 then
			p1:forceError(string.format("Failed to load texture data for '%s'. Make sure the texture exists and try again.", FullName))
		end
		p1:fail(ErrorSourceStringsModule.Keys.MakeupDecal_FailedToLoadTextureData, { fullName = FullName })
		
		return
	elseif TextureLimit < Result.X or TextureLimit < Result.Y then
		p1:fail(ErrorSourceStringsModule.Keys.MakeupDecal_TextureTooBig, {
			sizeX = tostring(Result.X),
			sizeY = tostring(Result.Y),
			fullName = FullName,
			maxSize = tostring(TextureLimit),
			fieldName = FieldName
		})
	end
end

local function validateCoverageOutsideIncludeBounds(p1, p2, EditableImage, Vector, Vector1, p3, AssetTypeName)
	-- upvalues: ValidateMakeupZoneIncludeToleranceHundredthsPercent (copy), ErrorSourceStringsModule (copy)
	local ScaledX = (Vector1.X - Vector.X) * (Vector1.Y - Vector.Y) * ValidateMakeupZoneIncludeToleranceHundredthsPercent / 10000 * 255
	local Total = 0
	local PixelsBuffer = EditableImage:ReadPixelsBuffer(Vector2.new(0, 0), EditableImage.Size)
	local Count = 0
	local YDelta = EditableImage.Size.Y - 1
	
	for i = 0, buffer.len(PixelsBuffer) - 1, 4 do
		if Count == EditableImage.Size.X then
			Count = 0
			YDelta -= 1
		end
		local ByteValue = buffer.readu8(PixelsBuffer, i + 3)
		
		if ByteValue > 0 and (Count < Vector.X or YDelta < Vector.Y or Vector1.X < Count or Vector1.Y < YDelta) then
			Total += ByteValue
		end
		Count += 1
	end
	if ScaledX < Total then
		p1:fail(ErrorSourceStringsModule.Keys.MakeupDecal_UVZoneIncludeViolation, {
			instanceName = p2.Name,
			minBound = tostring(p3.MinBound),
			maxBound = tostring(p3.MaxBound),
			assetTypeName = AssetTypeName
		})
	end
end

local function validateCoverageInsideExcludeBounds(p4, p5, EditableImage, Vector, Vector1, p6, AssetTypeName)
	-- upvalues: ValidateMakeupZoneExcludeHundredthsPercent (copy), ErrorSourceStringsModule (copy)
	local ScaledX = (Vector1.X - Vector.X) * (Vector1.Y - Vector.Y) * ValidateMakeupZoneExcludeHundredthsPercent / 10000 * 255
	local Total = 0
	local PixelsBuffer = EditableImage:ReadPixelsBuffer(Vector2.new(0, 0), EditableImage.Size)
	local Count = 0
	local YDelta = EditableImage.Size.Y - 1
	
	for i = 0, buffer.len(PixelsBuffer) - 1, 4 do
		if Count == EditableImage.Size.X then
			Count = 0
			YDelta -= 1
		end
		local ByteValue = buffer.readu8(PixelsBuffer, i + 3)
		
		if ByteValue > 0 and Vector.X < Count and Vector.Y < YDelta and Count < Vector1.X and YDelta < Vector1.Y then
			Total += ByteValue
		end
		Count += 1
	end
	if ScaledX < Total then
		p4:fail(ErrorSourceStringsModule.Keys.MakeupDecal_UVZoneExcludeViolation, {
			instanceName = p5.Name,
			minBound = tostring(p6.MinBound),
			maxBound = tostring(p6.MaxBound),
			assetTypeName = AssetTypeName
		})
	end
end

local function validateUVZones(p7, RootInstance, p8, WrapTextureTransfer, AssetUVBound, AssetTypeName)
	-- upvalues: validateCoverageOutsideIncludeBounds (copy), validateCoverageInsideExcludeBounds (copy)
	local UVMaxBoundDelta = WrapTextureTransfer.UVMaxBound - WrapTextureTransfer.UVMinBound
	
	for _, value in AssetUVBound do
		local ScaledMinBound = (value.MinBound - WrapTextureTransfer.UVMinBound) / UVMaxBoundDelta * p8.Size
		local ScaledMaxBound = (value.MaxBound - WrapTextureTransfer.UVMinBound) / UVMaxBoundDelta * p8.Size
		
		if value.isIncludeBound then
			validateCoverageOutsideIncludeBounds(p7, RootInstance, p8, ScaledMinBound, ScaledMaxBound, value, AssetTypeName)
		else
			validateCoverageInsideExcludeBounds(p7, RootInstance, p8, ScaledMinBound, ScaledMaxBound, value, AssetTypeName)
		end
	end
end

return {
	fflag = require(Parent.flags.getFFlagUGCValidateMigrateWrapAndMakeup),
	categories = { ValidationEnumsModule.UploadCategory.MAKEUP },
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.consumerConfig,
		ValidationEnumsModule.SharedDataMember.uploadEnum
	},
	expectedFailures = {},
	run = function(p9, p10)
		-- upvalues: config (copy), config1 (copy), ConstantsModule (copy), CreateEditableInstancesForContextModule (copy), ErrorSourceStringsModule (copy), GetFFlagUGCValidateDecalTextureLimitsModule (copy), ConstantsInterfaceModule (copy), validateTextureSize (copy), validateUVZones (copy)
		local RootInstance = p10.rootInstance
		local AssetType = p10.uploadEnum.assetType
		local IsEntry = config[p10.consumerConfig.source] == true
		local WrapTextureTransfer = RootInstance:FindFirstChildOfClass("WrapTextureTransfer")
		
		if WrapTextureTransfer == nil then
			error(string.format("WrapTextureTransfer child not found for %s", RootInstance.Name))
		end
		p9:setReportingInstance(RootInstance)
		local PreloadedEditableImages = p10.consumerConfig.preloadedEditableImages
		local IsEntry1 = config1[p10.consumerConfig.source] == true
		local Decal = ConstantsModule.TEXTURE_CONTENT_ID_FIELDS.Decal
		
		if not Decal then
			error("No texture content ID fields defined for Decal class")
		end
		local v1 = nil
		
		for _, FieldName in Decal do
			local RootInstanceEntry = RootInstance[FieldName .. "Content"]
			
			if RootInstanceEntry and RootInstanceEntry.Uri ~= nil and RootInstanceEntry.Uri ~= "" or IsEntry1 and RootInstanceEntry and RootInstanceEntry.Object then
				local EditableImageEditableInstanceInfo, EditableImageEditableInstanceInfo2 = CreateEditableInstancesForContextModule.getEditableInstanceInfo(RootInstanceEntry, PreloadedEditableImages, "EditableImage", IsEntry1)
				
				if EditableImageEditableInstanceInfo and EditableImageEditableInstanceInfo2 and EditableImageEditableInstanceInfo2.instance then
					local EditableImageEditableInstanceInfoInstance = EditableImageEditableInstanceInfo2.instance
					
					if FieldName == "ColorMap" then
						v1 = EditableImageEditableInstanceInfoInstance
					end
					validateTextureSize(p9, EditableImageEditableInstanceInfoInstance, RootInstance:GetFullName() .. "." .. FieldName, FieldName, if GetFFlagUGCValidateDecalTextureLimitsModule() and AssetType then ConstantsInterfaceModule.getTextureLimit(AssetType, RootInstance, FieldName) else ConstantsModule.MAX_TEXTURE_SIZE, IsEntry)
				else
					if IsEntry then
						p9:forceError(string.format("Failed to load %s for Decal %s", FieldName, RootInstance.Name))
					end
					p9:fail(ErrorSourceStringsModule.Keys.MakeupDecal_FailedToLoadTexture, { fieldName = FieldName, instanceName = RootInstance.Name })
				end
			end
		end
		if not v1 then
			p9:fail(ErrorSourceStringsModule.Keys.MakeupDecal_NoColorMap, { instanceName = RootInstance.Name })
			
			return
		end
		local AssetUVBound = ConstantsModule.MAKEUP_INFO.AssetUVBounds[AssetType]
		
		if AssetUVBound then
			validateUVZones(p9, RootInstance, v1, WrapTextureTransfer, AssetUVBound, AssetType.Name)
		end
	end
}