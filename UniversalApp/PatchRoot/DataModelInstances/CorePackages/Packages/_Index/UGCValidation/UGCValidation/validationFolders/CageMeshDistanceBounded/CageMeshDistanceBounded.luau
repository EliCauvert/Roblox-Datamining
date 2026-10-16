local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFIntUGCValidateCageMeshDistanceThresholdModule = require(Parent.flags.getFIntUGCValidateCageMeshDistanceThreshold)
local GetFFlagUGCValidationEyebrowEyelashSupportModule = require(Parent.flags.getFFlagUGCValidationEyebrowEyelashSupport)

return {
	categories = { ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	requiredData = {
		ValidationEnumsModule.SharedDataMember.renderMeshesData,
		ValidationEnumsModule.SharedDataMember.innerCagesData,
		ValidationEnumsModule.SharedDataMember.outerCagesData
	},
	expectedFailures = {},
	run = function(p1, p2) --[[ Line: 22 ]]
		-- upvalues: GetFFlagUGCValidationEyebrowEyelashSupportModule (copy), UGCValidationService (copy), GetFIntUGCValidateCageMeshDistanceThresholdModule (copy), ErrorSourceStringsModule (copy)
		if GetFFlagUGCValidationEyebrowEyelashSupportModule() then
			local AssetType = p2.uploadEnum.assetType
			
			if AssetType == Enum.AssetType.EyebrowAccessory or AssetType == Enum.AssetType.EyelashAccessory then return end
		end
		local Handle = p2.renderMeshesData.Handle
		
		if Handle == nil then return end
		local Handle1 = p2.innerCagesData.Handle
		local Handle2 = p2.outerCagesData.Handle
		
		if Handle1 == nil or Handle2 == nil then return end
		local AverageEditableCageMeshDistance: number = UGCValidationService:CalculateAverageEditableCageMeshDistance(Handle1.editable, Handle2.editable, Handle.editable, Handle1.origin, Handle2.origin)
		
		if GetFIntUGCValidateCageMeshDistanceThresholdModule() < AverageEditableCageMeshDistance * 100 or AverageEditableCageMeshDistance < 0 then
			if AverageEditableCageMeshDistance < 0 then
				p1:fail(ErrorSourceStringsModule.Keys.CageMeshDistanceBounded_MeshOutsideCage, {})
				
				return
			end
			p1:fail(ErrorSourceStringsModule.Keys.CageMeshDistanceBounded_DistanceTooHigh, {
				distance = string.format("%.2f", AverageEditableCageMeshDistance)
			})
		end
	end
}