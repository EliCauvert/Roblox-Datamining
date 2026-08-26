local parent = script.Parent.Parent
local getCageMeshInfosModule = require(parent.validation.getCageMeshInfos)
local getFStringLCCageQualityDocumentationLinkModule = require(parent.flags.getFStringLCCageQualityDocumentationLink)
local getFFlagUGCValidationEyebrowEyelashSupportModule = require(parent.flags.getFFlagUGCValidationEyebrowEyelashSupport)
local getFFlagUGCValidateMigrateCageGeometryModule = require(parent.flags.getFFlagUGCValidateMigrateCageGeometry)
local validateVerticesSimilarityModule = require(parent.validation.validateVerticesSimilarity)
local validateLCCagingRelevancyModule = require(parent.validation.validateLCCagingRelevancy)
local validateRenderMeshInsideOuterCageMeshModule = require(parent.validation.validateRenderMeshInsideOuterCageMesh)
local validateCageMeshDistanceModule = require(parent.validation.validateCageMeshDistance)
local validateCageUVDuplicatesModule = require(parent.validation.validateCageUVDuplicates)
local validateModifiedCageAreaModule = require(parent.validation.ValidateModifiedCageArea)
local _ = require(parent.util.Types)

return function(p1, p2, p3)
	-- upvalues: getCageMeshInfosModule (ref), getFFlagUGCValidateMigrateCageGeometryModule (ref), validateVerticesSimilarityModule (ref), validateLCCagingRelevancyModule (ref), validateRenderMeshInsideOuterCageMeshModule (ref), getFFlagUGCValidationEyebrowEyelashSupportModule (ref), validateCageMeshDistanceModule (ref), validateCageUVDuplicatesModule (ref), validateModifiedCageAreaModule (ref), getFStringLCCageQualityDocumentationLinkModule (ref)
	local var1 = true
	local t = {}
	local wrapLayer = p1:FindFirstChild("Handle"):FindFirstChildOfClass("WrapLayer")
	assert(wrapLayer, "calling validateInstanceTree() means we would not get this far if there was no WrapLayer")
	local var2, var3, var4 = getCageMeshInfosModule(p1, p3)
	
	if not var2 or var4 == nil then
		return false, var3
	end
	local list = { var4[1], var4[2] }
	local var5, var6 = unpack(list)
	local _ = false
	local _ = {}
	
	if not getFFlagUGCValidateMigrateCageGeometryModule() then
		for i, v in list do
			local var7, var8 = validateVerticesSimilarityModule(v, p3, Vector3.new(1, 1, 1), v.fullName)
			local var9 = var8
			
			if not var7 and var9 ~= nil then
				var1 = false
				
				for i_1, v_1 in var9 do
					table.insert(t, v_1)
				end
			end
		end
	end
	local var10, var11 = validateLCCagingRelevancyModule(var5, var6, p2, wrapLayer.ReferenceOrigin.Position, wrapLayer.CageOrigin.Position, p3)
	
	if not var10 and var11 ~= nil then
		var1 = false
		
		for i, v in var11 do
			table.insert(t, v)
		end
	end
	local var12, var13 = validateRenderMeshInsideOuterCageMeshModule(wrapLayer, var6, p2, p3)
	local var14 = var13
	
	if not var12 then
		table.insert(t, table.concat(var14, "\n"))
		var1 = false
	end
	if not getFFlagUGCValidateMigrateCageGeometryModule() then
		if getFFlagUGCValidationEyebrowEyelashSupportModule() then
			local assetTypeEnum = p3.assetTypeEnum
			
			if assetTypeEnum ~= Enum.AssetType.EyebrowAccessory and assetTypeEnum ~= Enum.AssetType.EyelashAccessory then
				local var15, var16 = validateCageMeshDistanceModule(var5, var6, p2, wrapLayer.ReferenceOrigin, wrapLayer.CageOrigin, p3)
				local var17 = var16
				
				if not var15 then
					table.insert(t, table.concat(var17, "\n"))
					var1 = false
				end
			end
		else
			local var18, var19 = validateCageMeshDistanceModule(var5, var6, p2, wrapLayer.ReferenceOrigin, wrapLayer.CageOrigin, p3)
			local var20 = var19
			
			if not var18 then
				table.insert(t, table.concat(var20, "\n"))
				var1 = false
			end
		end
	end
	local var21, var22 = validateCageUVDuplicatesModule(var5, var6, p2, p3)
	
	if not var21 then
		table.insert(t, table.concat(var22, "\n"))
		var1 = false
	end
	local var23, var24 = validateModifiedCageAreaModule.validate(var5, wrapLayer.ReferenceOrigin, var6, wrapLayer.CageOrigin, p2, p3)
	
	if not var23 then
		table.insert(t, table.concat(var24, "\n"))
		var1 = false
	end
	if var1 then
		return true
	elseif getFStringLCCageQualityDocumentationLinkModule() ~= "" then
		table.insert(t, string.format("[Caging best practices](%s)", getFStringLCCageQualityDocumentationLinkModule()))
	end
	return false, t
end