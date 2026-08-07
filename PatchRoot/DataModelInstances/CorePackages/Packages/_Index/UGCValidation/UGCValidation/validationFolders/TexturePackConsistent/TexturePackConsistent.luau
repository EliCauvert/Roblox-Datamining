-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:48 2026 Pacific Standard Time.

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
	run = function(p0, p1) --[[ line: 51 ]]
		-- upvalues: getFFlagUGCValidateTexturePackModule (ref), t_1 (ref), t (ref), validationEnumsModule (ref), getFFlagUGCValidateTexturePackOnRCCOnlyModule (ref), texturePackUtilsModule (ref), errorSourceStringsModule (ref), UGCValidationService (ref)
		if not getFFlagUGCValidateTexturePackModule() then return end
		local rootInstance = p1.rootInstance
		local source = p1.consumerConfig.source
		
		if t_1[source] == true then return end
		local var9 = t[source] == true
		local uploadCategory = p1.uploadCategory
		local var10 = if uploadCategory ~= validationEnumsModule.UploadCategory.TORSO_AND_LIMBS then uploadCategory == validationEnumsModule.UploadCategory.DYNAMIC_HEAD else true
		
		if not getFFlagUGCValidateTexturePackOnRCCOnlyModule() then
			for i, v in texturePackUtilsModule.findSurfaceAppearancesMissingTexturePacks(rootInstance, var10) do
				p0:fail(errorSourceStringsModule.Keys.TexturePackInvalidURL, { SurfaceAppearanceName = v:GetFullName() }, v)
			end
		elseif var9 then
			for i, v in texturePackUtilsModule.findSurfaceAppearancesMissingTexturePacks(rootInstance, var10) do
				p0:fail(errorSourceStringsModule.Keys.TexturePackInvalidURL, { SurfaceAppearanceName = v:GetFullName() }, v)
			end
		end
		for i, v in texturePackUtilsModule.findSurfaceAppearancesWithTexturePacks(rootInstance) do
			local ok, status = pcall(function() --[[ line: 91 ]]
				-- upvalues: UGCValidationService (copy), v (ref)
				return UGCValidationService:DoesSurfaceAppearanceMatchTexturePackAsync(v)
			end)
			
			if not ok then
				if var9 then
					p0:forceError(`Failed to download TexturePack for SurfaceAppearance '{v:GetFullName()}'.`)
				end
				p0:fail(errorSourceStringsModule.Keys.TexturePack_DownloadFailed, { SurfaceAppearanceName = v:GetFullName() }, v)
			elseif not status then
				p0:fail(errorSourceStringsModule.Keys.TexturePack_Mismatch, { SurfaceAppearanceName = v:GetFullName() }, v)
			end
		end
	end
}