local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local createEditableInstancesForContextModule = require(parent.util.createEditableInstancesForContext)
local getFFlagUGCValidateMigrateWrapAndMakeupModule = require(parent.flags.getFFlagUGCValidateMigrateWrapAndMakeup)
local getFFlagUGCValidateDecalTextureLimitsModule = require(parent.flags.getFFlagUGCValidateDecalTextureLimits)
local validateMakeupZoneIncludeToleranceHundredthsPercent = game:DefineFastInt("ValidateMakeupZoneIncludeToleranceHundredthsPercent", 100)
local validateMakeupZoneExcludeHundredthsPercent = game:DefineFastInt("ValidateMakeupZoneExcludeHundredthsPercent", 200)
local t = {
	Publish = true,
	Backend = true,
	Internal = true,
	InExpServer = true
}
local t_1 = { InExpServer = true, InExpClient = true }
local t_2 = {
	fflag = getFFlagUGCValidateMigrateWrapAndMakeupModule,
	categories = { validationEnumsModule.UploadCategory.MAKEUP },
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.consumerConfig,
		validationEnumsModule.SharedDataMember.uploadEnum
	},
	expectedFailures = {}
}

local function validateTextureSize(p1, p2, p3, p4, p5, p6)
	-- upvalues: UGCValidationService (ref), errorSourceStringsModule (ref)
	local ok, status = pcall(function()
		-- upvalues: UGCValidationService (copy), p2 (ref)
		return UGCValidationService:GetEditableImageSize(p2)
	end)
	
	if ok then
		if p5 < status.X or p5 < status.Y then
			p1:fail(errorSourceStringsModule.Keys.MakeupDecal_TextureTooBig, {
				sizeX = tostring(status.X),
				sizeY = tostring(status.Y),
				fullName = p3,
				maxSize = tostring(p5),
				fieldName = p4
			})
		end
		return
	elseif p6 then
		p1:forceError(string.format("Failed to load texture data for '%s'. Make sure the texture exists and try again.", p3))
	end
	p1:fail(errorSourceStringsModule.Keys.MakeupDecal_FailedToLoadTextureData, { fullName = p3 })
end

local function validateCoverageOutsideIncludeBounds(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: validateMakeupZoneIncludeToleranceHundredthsPercent (ref), errorSourceStringsModule (ref)
	local var1 = (p5.X - p4.X) * (p5.Y - p4.Y) * validateMakeupZoneIncludeToleranceHundredthsPercent / 10000 * 255
	local var2 = 0
	local var3 = p3:ReadPixelsBuffer(Vector2.new(0, 0), p3.Size)
	local var4 = 0
	local var5 = p3.Size.Y - 1
	
	for i = 0, buffer.len(var3) - 1, 4 do
		if var4 == p3.Size.X then
			var4 = 0
			var5 -= 1
		end
		local value = buffer.readu8(var3, i + 3)
		
		if value > 0 and (var4 < p4.X or var5 < p4.Y or (p5.X < var4 or p5.Y < var5)) then
			var2 += value
		end
		var4 += 1
	end
	if var1 < var2 then
		p1:fail(errorSourceStringsModule.Keys.MakeupDecal_UVZoneIncludeViolation, {
			instanceName = p2.Name,
			minBound = tostring(p6.MinBound),
			maxBound = tostring(p6.MaxBound),
			assetTypeName = p7
		})
	end
end

local function validateCoverageInsideExcludeBounds(p8, p9, p10, p11, p12, p13, p14)
	-- upvalues: validateMakeupZoneExcludeHundredthsPercent (ref), errorSourceStringsModule (ref)
	local var6 = (p12.X - p11.X) * (p12.Y - p11.Y) * validateMakeupZoneExcludeHundredthsPercent / 10000 * 255
	local var7 = 0
	local var8 = p10:ReadPixelsBuffer(Vector2.new(0, 0), p10.Size)
	local var9 = 0
	local var10 = p10.Size.Y - 1
	
	for i = 0, buffer.len(var8) - 1, 4 do
		if var9 == p10.Size.X then
			var9 = 0
			var10 -= 1
		end
		local value = buffer.readu8(var8, i + 3)
		
		if value > 0 and p11.X < var9 and (p11.Y < var10 and var9 < p12.X) and var10 < p12.Y then
			var7 += value
		end
		var9 += 1
	end
	if var6 < var7 then
		p8:fail(errorSourceStringsModule.Keys.MakeupDecal_UVZoneExcludeViolation, {
			instanceName = p9.Name,
			minBound = tostring(p13.MinBound),
			maxBound = tostring(p13.MaxBound),
			assetTypeName = p14
		})
	end
end

local function validateUVZones(p15, p16, p17, p18, p19, p20)
	-- upvalues: validateCoverageOutsideIncludeBounds (ref), validateCoverageInsideExcludeBounds (ref)
	local var11 = p18.UVMaxBound - p18.UVMinBound
	
	for i, v in p19 do
		local var12 = (v.MinBound - p18.UVMinBound) / var11 * p17.Size
		local var13 = (v.MaxBound - p18.UVMinBound) / var11 * p17.Size
		
		if v.isIncludeBound then
			validateCoverageOutsideIncludeBounds(p15, p16, p17, var12, var13, v, p20)
		else
			validateCoverageInsideExcludeBounds(p15, p16, p17, var12, var13, v, p20)
		end
	end
end

function t_2.run(p21, p22)
	-- upvalues: t (ref), t_1 (ref), constantsModule (ref), createEditableInstancesForContextModule (ref), errorSourceStringsModule (ref), getFFlagUGCValidateDecalTextureLimitsModule (ref), constantsInterfaceModule (ref), validateTextureSize (ref), validateUVZones (ref)
	local rootInstance = p22.rootInstance
	local assetType = p22.uploadEnum.assetType
	local var14 = t[p22.consumerConfig.source] == true
	local wrapTextureTransfer = rootInstance:FindFirstChildOfClass("WrapTextureTransfer")
	
	if wrapTextureTransfer == nil then
		error(string.format("WrapTextureTransfer child not found for %s", rootInstance.Name))
	end
	p21:setReportingInstance(rootInstance)
	local preloadedEditableImages = p22.consumerConfig.preloadedEditableImages
	local var15 = t_1[p22.consumerConfig.source] == true
	local decal = constantsModule.TEXTURE_CONTENT_ID_FIELDS.Decal
	
	if not decal then
		error("No texture content ID fields defined for Decal class")
	end
	local var16 = nil
	
	for i, v in decal do
		local var17 = rootInstance[v .. "Content"]
		
		if var17 and var17.Uri ~= nil and var17.Uri ~= "" or var15 and var17 and var17.Object then
			local editableImage, editableImage_1 = createEditableInstancesForContextModule.getEditableInstanceInfo(var17, preloadedEditableImages, "EditableImage", var15)
			
			if editableImage and editableImage_1 and editableImage_1.instance then
				local instance = editableImage_1.instance
				
				if v == "ColorMap" then
					var16 = instance
				end
				validateTextureSize(p21, instance, rootInstance:GetFullName() .. "." .. v, v, if getFFlagUGCValidateDecalTextureLimitsModule() and assetType then constantsInterfaceModule.getTextureLimit(assetType, rootInstance, v) else constantsModule.MAX_TEXTURE_SIZE, var14)
			elseif var14 then
				p21:forceError(string.format("Failed to load %s for Decal %s", v, rootInstance.Name))
			end
			p21:fail(errorSourceStringsModule.Keys.MakeupDecal_FailedToLoadTexture, { fieldName = v, instanceName = rootInstance.Name })
		end
	end
	if not var16 then
		p21:fail(errorSourceStringsModule.Keys.MakeupDecal_NoColorMap, { instanceName = rootInstance.Name })
		
		return
	end
	local var18 = constantsModule.MAKEUP_INFO.AssetUVBounds[assetType]
	
	if var18 then
		validateUVZones(p21, rootInstance, var16, wrapTextureTransfer, var18, assetType.Name)
	end
end

return t_2