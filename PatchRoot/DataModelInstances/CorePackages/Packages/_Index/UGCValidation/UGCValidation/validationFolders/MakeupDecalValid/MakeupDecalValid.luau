-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:48 2026 Pacific Standard Time.

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

local function validateTextureSize(p0, p1, p2, p3, p4, p5) --[[ line: 52 ]]
	-- upvalues: UGCValidationService (ref), errorSourceStringsModule (ref)
	local ok, status = pcall(function() --[[ line: 60 ]]
		-- upvalues: UGCValidationService (copy), p1 (ref)
		return UGCValidationService:GetEditableImageSize(p1)
	end)
	
	if ok then
		if p4 < status.X or p4 < status.Y then
			p0:fail(errorSourceStringsModule.Keys.MakeupDecal_TextureTooBig, {
				sizeX = tostring(status.X),
				sizeY = tostring(status.Y),
				fullName = p2,
				maxSize = tostring(p4),
				fieldName = p3
			})
		end
		return
	elseif p5 then
		p0:forceError(string.format("Failed to load texture data for '%s'. Make sure the texture exists and try again.", p2))
	end
	p0:fail(errorSourceStringsModule.Keys.MakeupDecal_FailedToLoadTextureData, { fullName = p2 })
end

local function validateCoverageOutsideIncludeBounds(p6, p7, p8, p9, p10, p11, p12) --[[ line: 91 ]]
	-- upvalues: validateMakeupZoneIncludeToleranceHundredthsPercent (ref), errorSourceStringsModule (ref)
	local var17 = (p10.X - p9.X) * (p10.Y - p9.Y) * validateMakeupZoneIncludeToleranceHundredthsPercent / 10000 * 255
	local var18 = 0
	local var19 = p8:ReadPixelsBuffer(Vector2.new(0, 0), p8.Size)
	local var20 = 0
	local var21 = p8.Size.Y - 1
	
	for i = 0, buffer.len(var19) - 1, 4 do
		if var20 == p8.Size.X then
			var20 = 0
			var21 -= 1
		end
		local value = buffer.readu8(var19, i + 3)
		
		if value > 0 and (var20 < p9.X or var21 < p9.Y or (p10.X < var20 or p10.Y < var21)) then
			var18 += value
		end
		var20 += 1
	end
	if var17 < var18 then
		p6:fail(errorSourceStringsModule.Keys.MakeupDecal_UVZoneIncludeViolation, {
			instanceName = p7.Name,
			minBound = tostring(p11.MinBound),
			maxBound = tostring(p11.MaxBound),
			assetTypeName = p12
		})
	end
end

local function validateCoverageInsideExcludeBounds(p13, p14, p15, p16, p17, p18, p19) --[[ line: 137 ]]
	-- upvalues: validateMakeupZoneExcludeHundredthsPercent (ref), errorSourceStringsModule (ref)
	local var23 = (p17.X - p16.X) * (p17.Y - p16.Y) * validateMakeupZoneExcludeHundredthsPercent / 10000 * 255
	local var24 = 0
	local var25 = p15:ReadPixelsBuffer(Vector2.new(0, 0), p15.Size)
	local var26 = 0
	local var27 = p15.Size.Y - 1
	
	for i = 0, buffer.len(var25) - 1, 4 do
		if var26 == p15.Size.X then
			var26 = 0
			var27 -= 1
		end
		local value = buffer.readu8(var25, i + 3)
		
		if value > 0 and p16.X < var26 and (p16.Y < var27 and var26 < p17.X) and var27 < p17.Y then
			var24 += value
		end
		var26 += 1
	end
	if var23 < var24 then
		p13:fail(errorSourceStringsModule.Keys.MakeupDecal_UVZoneExcludeViolation, {
			instanceName = p14.Name,
			minBound = tostring(p18.MinBound),
			maxBound = tostring(p18.MaxBound),
			assetTypeName = p19
		})
	end
end

local function validateUVZones(p20, p21, p22, p23, p24, p25) --[[ line: 183 ]]
	-- upvalues: validateCoverageOutsideIncludeBounds (ref), validateCoverageInsideExcludeBounds (ref)
	local var29 = p23.UVMaxBound - p23.UVMinBound
	
	for i, v in p24 do
		local var30 = (v.MinBound - p23.UVMinBound) / var29 * p22.Size
		local var31 = (v.MaxBound - p23.UVMinBound) / var29 * p22.Size
		
		if v.isIncludeBound then
			validateCoverageOutsideIncludeBounds(p20, p21, p22, var30, var31, v, p25)
		else
			validateCoverageInsideExcludeBounds(p20, p21, p22, var30, var31, v, p25)
		end
	end
end

function t_2.run(p26, p27) --[[ line: 224 ]]
	-- upvalues: t (ref), t_1 (ref), constantsModule (ref), createEditableInstancesForContextModule (ref), errorSourceStringsModule (ref), getFFlagUGCValidateDecalTextureLimitsModule (ref), constantsInterfaceModule (ref), validateTextureSize (ref), validateUVZones (ref)
	local rootInstance = p27.rootInstance
	local assetType = p27.uploadEnum.assetType
	local var32 = t[p27.consumerConfig.source] == true
	local wrapTextureTransfer = rootInstance:FindFirstChildOfClass("WrapTextureTransfer")
	
	if wrapTextureTransfer == nil then
		error(string.format("WrapTextureTransfer child not found for %s", rootInstance.Name))
	end
	p26:setReportingInstance(rootInstance)
	local preloadedEditableImages = p27.consumerConfig.preloadedEditableImages
	local var34 = t_1[p27.consumerConfig.source] == true
	local decal = constantsModule.TEXTURE_CONTENT_ID_FIELDS.Decal
	
	if not decal then
		error("No texture content ID fields defined for Decal class")
	end
	local var35 = nil
	
	for i, v in decal do
		local var37 = rootInstance[v .. "Content"]
		
		if var37 and var37.Uri ~= nil and var37.Uri ~= "" or var34 and var37 and var37.Object then
			local editableImage, editableImage_1 = createEditableInstancesForContextModule.getEditableInstanceInfo(var37, preloadedEditableImages, "EditableImage", var34)
			
			if editableImage and editableImage_1 and editableImage_1.instance then
				local instance = editableImage_1.instance
				
				if v == "ColorMap" then
					var35 = instance
				end
				validateTextureSize(p26, instance, rootInstance:GetFullName() .. "." .. v, v, if getFFlagUGCValidateDecalTextureLimitsModule() and assetType then constantsInterfaceModule.getTextureLimit(assetType, rootInstance, v) else constantsModule.MAX_TEXTURE_SIZE, var32)
			elseif var32 then
				p26:forceError(string.format("Failed to load %s for Decal %s", v, rootInstance.Name))
			end
			p26:fail(errorSourceStringsModule.Keys.MakeupDecal_FailedToLoadTexture, { fieldName = v, instanceName = rootInstance.Name })
		end
	end
	if not var35 then
		p26:fail(errorSourceStringsModule.Keys.MakeupDecal_NoColorMap, { instanceName = rootInstance.Name })
		
		return
	end
	local var36 = constantsModule.MAKEUP_INFO.AssetUVBounds[assetType]
	
	if var36 then
		validateUVZones(p26, rootInstance, var35, wrapTextureTransfer, var36, assetType.Name)
	end
end

return t_2