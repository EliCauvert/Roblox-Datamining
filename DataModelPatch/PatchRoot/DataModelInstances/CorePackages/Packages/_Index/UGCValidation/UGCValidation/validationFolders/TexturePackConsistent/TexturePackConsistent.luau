local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local TexturePackUtilsModule = require(Parent.util.TexturePackUtils)
local GetFFlagUGCValidateTexturePackModule = require(Parent.flags.getFFlagUGCValidateTexturePack)
local GetFFlagUGCValidateTexturePackOnRCCOnlyModule = require(Parent.flags.getFFlagUGCValidateTexturePackOnRCCOnly)
local config = {
	Publish = true,
	Backend = true,
	InExpServer = true,
	Internal = true
}
local config1 = { InExpServer = true, InExpClient = true }

return {
	fflag = require(Parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality),
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = {},
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: GetFFlagUGCValidateTexturePackModule (copy), config1 (copy), config (copy), ValidationEnumsModule (copy), GetFFlagUGCValidateTexturePackOnRCCOnlyModule (copy), TexturePackUtilsModule (copy), ErrorSourceStringsModule (copy), UGCValidationService (copy)
		if not GetFFlagUGCValidateTexturePackModule() then return end
		local RootInstance = p2.rootInstance
		local Source = p2.consumerConfig.source
		
		if config1[Source] == true then return end
		local IsEntry = config[Source] == true
		local UploadCategory = p2.uploadCategory
		local IsUploadCategoryMatch: boolean = UploadCategory == ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS or UploadCategory == ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
		
		if GetFFlagUGCValidateTexturePackOnRCCOnlyModule() then
			if IsEntry then
				for _, value in TexturePackUtilsModule.findSurfaceAppearancesMissingTexturePacks(RootInstance, IsUploadCategoryMatch) do
					p1:fail(ErrorSourceStringsModule.Keys.TexturePackInvalidURL, { SurfaceAppearanceName = value:GetFullName() }, value)
				end
			end
		else
			for _, value1 in TexturePackUtilsModule.findSurfaceAppearancesMissingTexturePacks(RootInstance, IsUploadCategoryMatch) do
				p1:fail(ErrorSourceStringsModule.Keys.TexturePackInvalidURL, { SurfaceAppearanceName = value1:GetFullName() }, value1)
			end
		end
		for _, Object in TexturePackUtilsModule.findSurfaceAppearancesWithTexturePacks(RootInstance) do
			local Success, Result = pcall(function()
				-- upvalues: UGCValidationService (upval), Object (copy)
				return UGCValidationService:DoesSurfaceAppearanceMatchTexturePackAsync(Object)
			end)
			
			if not Success then
				if IsEntry then
					p1:forceError(`Failed to download TexturePack for SurfaceAppearance '{Object:GetFullName()}'.`)
				end
				p1:fail(ErrorSourceStringsModule.Keys.TexturePack_DownloadFailed, { SurfaceAppearanceName = Object:GetFullName() }, Object)
			elseif not Result then
				p1:fail(ErrorSourceStringsModule.Keys.TexturePack_Mismatch, { SurfaceAppearanceName = Object:GetFullName() }, Object)
			end
		end
	end
}