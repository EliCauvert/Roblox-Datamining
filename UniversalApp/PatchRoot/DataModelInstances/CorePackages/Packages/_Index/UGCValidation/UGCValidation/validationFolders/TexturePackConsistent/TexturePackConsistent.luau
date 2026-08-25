local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local texturePackUtilsModule = require(parent.util.TexturePackUtils)
local getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule = require(parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality)
local getFFlagUGCValidateTexturePackModule = require(parent.flags.getFFlagUGCValidateTexturePack)
local getFFlagUGCValidateTexturePackOnRCCOnlyModule = require(parent.flags.getFFlagUGCValidateTexturePackOnRCCOnly)
local t = {
	Publish = true,
	Backend = true,
	InExpServer = true,
	Internal = true
}
local t_1 = { InExpServer = true, InExpClient = true }

return {
	fflag = getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule,
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = {},
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: getFFlagUGCValidateTexturePackModule (ref), t_1 (ref), t (ref), validationEnumsModule (ref), getFFlagUGCValidateTexturePackOnRCCOnlyModule (ref), texturePackUtilsModule (ref), errorSourceStringsModule (ref), UGCValidationService (ref)
		if not getFFlagUGCValidateTexturePackModule() then return end
		local rootInstance = p2.rootInstance
		local source = p2.consumerConfig.source
		
		if t_1[source] == true then return end
		local var1 = t[source] == true
		local uploadCategory = p2.uploadCategory
		local var2 = if uploadCategory ~= validationEnumsModule.UploadCategory.TORSO_AND_LIMBS then uploadCategory == validationEnumsModule.UploadCategory.DYNAMIC_HEAD else true
		
		if not getFFlagUGCValidateTexturePackOnRCCOnlyModule() then
			for i, v in texturePackUtilsModule.findSurfaceAppearancesMissingTexturePacks(rootInstance, var2) do
				p1:fail(errorSourceStringsModule.Keys.TexturePackInvalidURL, { SurfaceAppearanceName = v:GetFullName() }, v)
			end
		elseif var1 then
			for i, v in texturePackUtilsModule.findSurfaceAppearancesMissingTexturePacks(rootInstance, var2) do
				p1:fail(errorSourceStringsModule.Keys.TexturePackInvalidURL, { SurfaceAppearanceName = v:GetFullName() }, v)
			end
		end
		for i, v in texturePackUtilsModule.findSurfaceAppearancesWithTexturePacks(rootInstance) do
			local ok, status = pcall(function()
				-- upvalues: UGCValidationService (copy), v (ref)
				return UGCValidationService:DoesSurfaceAppearanceMatchTexturePackAsync(v)
			end)
			
			if not ok then
				if var1 then
					p1:forceError(`Failed to download TexturePack for SurfaceAppearance '{v:GetFullName()}'.`)
				end
				p1:fail(errorSourceStringsModule.Keys.TexturePack_DownloadFailed, { SurfaceAppearanceName = v:GetFullName() }, v)
			elseif not status then
				p1:fail(errorSourceStringsModule.Keys.TexturePack_Mismatch, { SurfaceAppearanceName = v:GetFullName() }, v)
			end
		end
	end
}