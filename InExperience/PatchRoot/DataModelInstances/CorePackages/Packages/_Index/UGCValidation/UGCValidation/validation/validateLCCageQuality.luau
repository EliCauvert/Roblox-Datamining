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

return function(p0, p1, p2) --[[ line: 18 | named "validateLCCageQuality" ]]
	-- upvalues: getCageMeshInfosModule (ref), getFFlagUGCValidateMigrateCageGeometryModule (ref), validateVerticesSimilarityModule (ref), validateLCCagingRelevancyModule (ref), validateRenderMeshInsideOuterCageMeshModule (ref), getFFlagUGCValidationEyebrowEyelashSupportModule (ref), validateCageMeshDistanceModule (ref), validateCageUVDuplicatesModule (ref), validateModifiedCageAreaModule (ref), getFStringLCCageQualityDocumentationLinkModule (ref)
	local var10 = true
	local t = {}
	local wrapLayer = p0:FindFirstChild("Handle"):FindFirstChildOfClass("WrapLayer")
	assert(wrapLayer, "calling validateInstanceTree() means we would not get this far if there was no WrapLayer")
	local var13, var14, var15 = getCageMeshInfosModule(p0, p2)
	
	if not var13 or var15 == nil then
		return false, var14
	end
	local list = { var15[1], var15[2] }
	local var17, var18 = unpack(list)
	local _ = false
	local _ = {}
	
	if not getFFlagUGCValidateMigrateCageGeometryModule() then
		for i, v in list do
			local var19, var20 = validateVerticesSimilarityModule(v, p2, Vector3.new(1, 1, 1), v.fullName)
			local var21 = var20
			
			if not var19 and var21 ~= nil then
				var10 = false
				
				for i_1, v_1 in var21 do
					table.insert(t, v_1)
				end
			end
		end
	end
	local var22, var23 = validateLCCagingRelevancyModule(var17, var18, p1, wrapLayer.ReferenceOrigin.Position, wrapLayer.CageOrigin.Position, p2)
	
	if not var22 and var23 ~= nil then
		var10 = false
		
		for i, v in var23 do
			table.insert(t, v)
		end
	end
	local var24, var25 = validateRenderMeshInsideOuterCageMeshModule(wrapLayer, var18, p1, p2)
	local var26 = var25
	
	if not var24 then
		table.insert(t, table.concat(var26, "\n"))
		var10 = false
	end
	if not getFFlagUGCValidateMigrateCageGeometryModule() then
		if getFFlagUGCValidationEyebrowEyelashSupportModule() then
			local assetTypeEnum = p2.assetTypeEnum
			
			if assetTypeEnum ~= Enum.AssetType.EyebrowAccessory and assetTypeEnum ~= Enum.AssetType.EyelashAccessory then
				local var27, var28 = validateCageMeshDistanceModule(var17, var18, p1, wrapLayer.ReferenceOrigin, wrapLayer.CageOrigin, p2)
				local var29 = var28
				
				if not var27 then
					table.insert(t, table.concat(var29, "\n"))
					var10 = false
				end
			end
		else
			local var30, var31 = validateCageMeshDistanceModule(var17, var18, p1, wrapLayer.ReferenceOrigin, wrapLayer.CageOrigin, p2)
			local var32 = var31
			
			if not var30 then
				table.insert(t, table.concat(var32, "\n"))
				var10 = false
			end
		end
	end
	local var33, var34 = validateCageUVDuplicatesModule(var17, var18, p1, p2)
	
	if not var33 then
		table.insert(t, table.concat(var34, "\n"))
		var10 = false
	end
	local var35, var36 = validateModifiedCageAreaModule.validate(var17, wrapLayer.ReferenceOrigin, var18, wrapLayer.CageOrigin, p1, p2)
	
	if not var35 then
		table.insert(t, table.concat(var36, "\n"))
		var10 = false
	end
	if var10 then
		return true
	elseif getFStringLCCageQualityDocumentationLinkModule() ~= "" then
		table.insert(t, string.format("[Caging best practices](%s)", getFStringLCCageQualityDocumentationLinkModule()))
	end
	return false, t
end