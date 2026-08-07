-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:45 2026 Pacific Standard Time.

local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateCageGeometryModule = require(parent.flags.getFFlagUGCValidateMigrateCageGeometry)
local getFIntUGCValidateCageMeshDistanceThresholdModule = require(parent.flags.getFIntUGCValidateCageMeshDistanceThreshold)
local getFFlagUGCValidationEyebrowEyelashSupportModule = require(parent.flags.getFFlagUGCValidationEyebrowEyelashSupport)

return {
	fflag = getFFlagUGCValidateMigrateCageGeometryModule,
	categories = { validationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	requiredData = {
		validationEnumsModule.SharedDataMember.renderMeshesData,
		validationEnumsModule.SharedDataMember.innerCagesData,
		validationEnumsModule.SharedDataMember.outerCagesData
	},
	expectedFailures = {},
	run = function(p0, p1) --[[ line: 24 ]]
		-- upvalues: getFFlagUGCValidationEyebrowEyelashSupportModule (ref), UGCValidationService (ref), getFIntUGCValidateCageMeshDistanceThresholdModule (ref), errorSourceStringsModule (ref)
		local assetType
		if getFFlagUGCValidationEyebrowEyelashSupportModule() then
			assetType = p1.uploadEnum.assetType
			
			if assetType == Enum.AssetType.EyebrowAccessory or assetType == Enum.AssetType.EyelashAccessory then return end
		end
		assetType = p1.renderMeshesData.Handle
		
		if assetType == nil then return end
		local handle = p1.innerCagesData.Handle
		local handle_1 = p1.outerCagesData.Handle
		
		if handle == nil or handle_1 == nil then return end
		local editable = UGCValidationService:CalculateAverageEditableCageMeshDistance(handle.editable, handle_1.editable, assetType.editable, handle.origin, handle_1.origin)
		
		if getFIntUGCValidateCageMeshDistanceThresholdModule() < editable * 100 or editable < 0 then
			if editable < 0 then
				p0:fail(errorSourceStringsModule.Keys.CageMeshDistanceBounded_MeshOutsideCage, {})
				
				return
			end
			p0:fail(errorSourceStringsModule.Keys.CageMeshDistanceBounded_DistanceTooHigh, { distance = string.format("%.2f", editable) })
		end
	end
}