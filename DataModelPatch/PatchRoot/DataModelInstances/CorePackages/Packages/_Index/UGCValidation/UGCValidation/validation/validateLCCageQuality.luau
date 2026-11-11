local Parent = script.Parent.Parent
local GetCageMeshInfosModule = require(Parent.validation.getCageMeshInfos)
local GetFStringLCCageQualityDocumentationLinkModule = require(Parent.flags.getFStringLCCageQualityDocumentationLink)
local GetFFlagUGCValidationEyebrowEyelashSupportModule = require(Parent.flags.getFFlagUGCValidationEyebrowEyelashSupport)
local GetFFlagUGCValidateMigrateCageGeometryModule = require(Parent.flags.getFFlagUGCValidateMigrateCageGeometry)
local ValidateVerticesSimilarityModule = require(Parent.validation.validateVerticesSimilarity)
local ValidateLCCagingRelevancyModule = require(Parent.validation.validateLCCagingRelevancy)
local ValidateRenderMeshInsideOuterCageMeshModule = require(Parent.validation.validateRenderMeshInsideOuterCageMesh)
local ValidateCageMeshDistanceModule = require(Parent.validation.validateCageMeshDistance)
local ValidateCageUVDuplicatesModule = require(Parent.validation.validateCageUVDuplicates)
local ValidateModifiedCageAreaModule = require(Parent.validation.ValidateModifiedCageArea)
local _ = require(Parent.util.Types)

return function(Object, p1, p2)
	-- upvalues: GetCageMeshInfosModule (copy), GetFFlagUGCValidateMigrateCageGeometryModule (copy), ValidateVerticesSimilarityModule (copy), ValidateLCCagingRelevancyModule (copy), ValidateRenderMeshInsideOuterCageMeshModule (copy), GetFFlagUGCValidationEyebrowEyelashSupportModule (copy), ValidateCageMeshDistanceModule (copy), ValidateCageUVDuplicatesModule (copy), ValidateModifiedCageAreaModule (copy), GetFStringLCCageQualityDocumentationLinkModule (copy)
	local Flag = true
	local List = {}
	local WrapLayer = Object:FindFirstChild("Handle"):FindFirstChildOfClass("WrapLayer")
	assert(WrapLayer, "calling validateInstanceTree() means we would not get this far if there was no WrapLayer")
	local CageMeshInfosModule, CageMeshInfosModule2, CageMeshInfosModule3 = GetCageMeshInfosModule(Object, p2)
	
	if not CageMeshInfosModule or CageMeshInfosModule3 == nil then
		return false, CageMeshInfosModule2
	end
	local list = { CageMeshInfosModule3[1], CageMeshInfosModule3[2] }
	local Unpacked, Unpacked2 = unpack(list)
	
	if not GetFFlagUGCValidateMigrateCageGeometryModule() then
		for _, value in list do
			local ValidateVerticesSimilarityModuleResult, ValidateVerticesSimilarityModuleResult2 = ValidateVerticesSimilarityModule(value, p2, vector.create(1, 1, 1), value.fullName)
			
			if not ValidateVerticesSimilarityModuleResult and ValidateVerticesSimilarityModuleResult2 ~= nil then
				Flag = false
				
				for _, value1 in ValidateVerticesSimilarityModuleResult2 do
					table.insert(List, value1)
				end
			end
		end
	end
	local ValidateLCCagingRelevancyModuleResult, ValidateLCCagingRelevancyModuleResult2 = ValidateLCCagingRelevancyModule(Unpacked, Unpacked2, p1, WrapLayer.ReferenceOrigin.Position, WrapLayer.CageOrigin.Position, p2)
	
	if not ValidateLCCagingRelevancyModuleResult and ValidateLCCagingRelevancyModuleResult2 ~= nil then
		Flag = false
		
		for _, value2 in ValidateLCCagingRelevancyModuleResult2 do
			table.insert(List, value2)
		end
	end
	local ValidateRenderMeshInsideOuterCageMeshModuleResult, ValidateRenderMeshInsideOuterCageMeshModuleResult2 = ValidateRenderMeshInsideOuterCageMeshModule(WrapLayer, Unpacked2, p1, p2)
	
	if not ValidateRenderMeshInsideOuterCageMeshModuleResult then
		table.insert(List, table.concat(ValidateRenderMeshInsideOuterCageMeshModuleResult2, "\n"))
		Flag = false
	end
	if not GetFFlagUGCValidateMigrateCageGeometryModule() then
		if GetFFlagUGCValidationEyebrowEyelashSupportModule() then
			local AssetTypeEnum = p2.assetTypeEnum
			
			if AssetTypeEnum ~= Enum.AssetType.EyebrowAccessory and AssetTypeEnum ~= Enum.AssetType.EyelashAccessory then
				local ValidateCageMeshDistanceModuleResult1, ValidateCageMeshDistanceModuleResult2_1 = ValidateCageMeshDistanceModule(Unpacked, Unpacked2, p1, WrapLayer.ReferenceOrigin, WrapLayer.CageOrigin, p2)
				
				if not ValidateCageMeshDistanceModuleResult1 then
					table.insert(List, table.concat(ValidateCageMeshDistanceModuleResult2_1, "\n"))
					Flag = false
				end
			end
		else
			local ValidateCageMeshDistanceModuleResult, ValidateCageMeshDistanceModuleResult2 = ValidateCageMeshDistanceModule(Unpacked, Unpacked2, p1, WrapLayer.ReferenceOrigin, WrapLayer.CageOrigin, p2)
			
			if not ValidateCageMeshDistanceModuleResult then
				table.insert(List, table.concat(ValidateCageMeshDistanceModuleResult2, "\n"))
				Flag = false
			end
		end
	end
	local ValidateCageUVDuplicatesModuleResult, ValidateCageUVDuplicatesModuleResult2 = ValidateCageUVDuplicatesModule(Unpacked, Unpacked2, p1, p2)
	
	if not ValidateCageUVDuplicatesModuleResult then
		table.insert(List, table.concat(ValidateCageUVDuplicatesModuleResult2, "\n"))
		Flag = false
	end
	local ValidateResult, ValidateResult2 = ValidateModifiedCageAreaModule.validate(Unpacked, WrapLayer.ReferenceOrigin, Unpacked2, WrapLayer.CageOrigin, p1, p2)
	
	if not ValidateResult then
		table.insert(List, table.concat(ValidateResult2, "\n"))
		Flag = false
	end
	if Flag then
		return true
	end
	if GetFStringLCCageQualityDocumentationLinkModule() ~= "" then
		table.insert(List, (string.format("[Caging best practices](%s)", GetFStringLCCageQualityDocumentationLinkModule())))
	end
	return false, List
end