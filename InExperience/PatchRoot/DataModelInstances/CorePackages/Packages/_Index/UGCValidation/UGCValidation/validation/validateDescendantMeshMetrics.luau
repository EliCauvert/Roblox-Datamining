local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local validateCoplanarIntersectionModule = require(parent.validation.validateCoplanarIntersection)
local validateCageUVsModule = require(parent.validation.validateCageUVs)
local validateMeshVertColorsModule = require(parent.validation.validateMeshVertColors)
local validateCageUVTriangleAreaModule = require(parent.validation.validateCageUVTriangleArea)
local validateMeshTriangleAreaModule = require(parent.validation.validateMeshTriangleArea)
local validateCageUVValuesModule = require(parent.validation.validateCageUVValues)
local validateTotalSurfaceAreaModule = require(parent.validation.validateTotalSurfaceArea)
local validateSkinningTransferModule = require(parent.validation.validateSkinningTransfer)
local getFFlagUGCValidateMigrateCageUVModule = require(parent.flags.getFFlagUGCValidateMigrateCageUV)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local getMeshMinMaxModule = require(parent.util.getMeshMinMax)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local floatEqualsModule = require(parent.util.floatEquals)
local getExpectedPartSizeModule = require(parent.util.getExpectedPartSize)
local getFFlagUGCValidateCoplanarTriTestBodyModule = require(parent.flags.getFFlagUGCValidateCoplanarTriTestBody)
local getFIntUGCValidateTriangleLimitToleranceModule = require(parent.flags.getFIntUGCValidateTriangleLimitTolerance)
local getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule = require(parent.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning)
local getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule = require(parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality)
local getFFlagUGCValidateMigrateMeshGeometryModule = require(parent.flags.getFFlagUGCValidateMigrateMeshGeometry)

local function validateIsSkinned(p1, p2, p3, p4)
	-- upvalues: constantsModule (ref), analyticsModule (ref), getEditableMeshFromContextModule (ref), UGCValidationService (ref)
	local alternateMeshIdAttributeNameAttribute = p1:GetAttribute(constantsModule.AlternateMeshIdAttributeName)
	
	if not p1.HasSkinnedMesh and (alternateMeshIdAttributeNameAttribute == nil or alternateMeshIdAttributeNameAttribute == "" or not p3) then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_NoSkinningInfo, nil, p4)
		
		return false, {
			`Missing skinning data for {p1.Name}.MeshId. You need to skin your model.`
		}
	end
	local ok, status = pcall(function()
		-- upvalues: getEditableMeshFromContextModule (copy), p1 (ref), p4 (ref), UGCValidationService (copy)
		local var1, var2 = getEditableMeshFromContextModule(p1, "MeshId", p4)
		
		if not var1 then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:ValidateSkinnedEditableMesh(var2)
	end)
	
	if ok then
		if status then
			return true
		end
		local name = `Detected mismatch between model and skinned data for {p1.Name}. You need to re-skin your model to fix this issue.`
		
		if p2 then
			error(name)
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_HasSkinnedMeshMismatch, nil, p4)
		
		return false, { name }
	elseif p2 then
		error("Failed to retrieve mesh data to validate skinned mesh")
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_FailedToLoadMesh, nil, p4)
	
	return false, { "Failed to retrieve mesh data to validate skinned mesh" }
end

local function validateTotalAssetTriangles(vectorA, vectorB, p5)
	-- upvalues: constantsModule (ref), getEditableMeshFromContextModule (ref), analyticsModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), getFIntUGCValidateTriangleLimitToleranceModule (ref)
	local isServer = p5.isServer
	local var1 = assert(constantsModule.ASSET_RENDER_MESH_MAX_TRIANGLES[vectorB.Name])
	local var2, var3, var4 = (function()
		-- upvalues: vectorA (ref), getEditableMeshFromContextModule (copy), p5 (ref), analyticsModule (copy), pcallDeferredModule (copy), UGCValidationService (copy)
		local var5 = 0
		
		for i, v in vectorA do
			if v.instance.ClassName == "MeshPart" then
				assert(v.fieldName == "MeshId")
				local var6, var7 = getEditableMeshFromContextModule(v.instance, v.fieldName, p5)
				
				if var6 then
					local var8, var9 = pcallDeferredModule(function()
						-- upvalues: UGCValidationService (copy), var7 (ref)
						return UGCValidationService:GetEditableMeshTriCount(var7)
					end, p5)
					
					if var8 then
						var5 += var9
						continue
					end
					return false, string.format("Failed to execute check for triangle face information for mesh '%s'. Make sure mesh exists and try again.", v.instance.Name)
				end
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_FailedToLoadMesh, nil, p5)
				
				return false, string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", v.instance.Name)
			end
		end
		return true, nil, var5
	end)()
	
	if var2 then
		if var1 + var1 * (getFIntUGCValidateTriangleLimitToleranceModule() / 100) < var4 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_TooManyTriangles, nil, p5)
			
			return false, {
				string.format("Mesh resolution of '%d' for '%s' is higher than max supported number of triangles '%d'. You need to retopologize your model to reduce the triangle count.", var4, vectorB.Name, var1)
			}
		end
		return true
	elseif isServer then
		error(var3)
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_FailedToCalculateTriangles, nil, p5)
	
	return false, { var3 }
end

local function validateMeshIsAtOrigin(p6, p7, p8, p9)
	-- upvalues: analyticsModule (ref)
	if (p7 + (p8 - p7) / 2).Magnitude > 0.001 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_TooFarFromOrigin, nil, p9)
		
		return false, {
			string.format("Bounds for the mesh '%s' are not centered at the origin. The max allowed distance is '%f'", p6.fullName, 0.001)
		}
	end
	return true
end

return function(p6, p7)
	-- upvalues: failureReasonsAccumulatorModule (ref), parseContentIdsModule (ref), constantsModule (ref), getFFlagUGCValidateMigrateMeshGeometryModule (ref), validateTotalAssetTriangles (ref), analyticsModule (ref), getEditableMeshFromContextModule (ref), getMeshMinMaxModule (ref), validateMeshIsAtOrigin (ref), floatEqualsModule (ref), getExpectedPartSizeModule (ref), validateTotalSurfaceAreaModule (ref), getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (ref), getFFlagUGCValidateCoplanarTriTestBodyModule (ref), validateCoplanarIntersectionModule (ref), validateMeshVertColorsModule (ref), validateIsSkinned (ref), getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule (ref), validateSkinningTransferModule (ref), validateMeshTriangleAreaModule (ref), getFFlagUGCValidateMigrateCageUVModule (ref), validateCageUVsModule (ref), validateCageUVTriangleAreaModule (ref), validateCageUVValuesModule (ref)
	local isServer = p7.isServer
	assert(p7.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateDescendantMeshMetrics")
	local assetTypeEnum = p7.assetTypeEnum
	local allowEditableInstances = p7.allowEditableInstances
	local var5 = failureReasonsAccumulatorModule.new()
	local var6 = parseContentIdsModule.parse(p6, constantsModule.MESH_CONTENT_ID_FIELDS, p7)
	local currentTime = tick()
	
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		var5:updateReasons(validateTotalAssetTriangles(var6, assetTypeEnum, p7))
	end
	analyticsModule.recordScriptTime("validateTotalAssetTriangles", currentTime, p7)
	
	for i, v in var6 do
		local t = {
			fullName = v.instance:GetFullName(),
			fieldName = v.fieldName,
			contentId = v.instance[v.fieldName],
			context = v.instance.Name
		}
		local var7, var8 = getEditableMeshFromContextModule(v.instance, v.fieldName, p7)
		
		if var7 then
			t.editableMesh = var8
			
			if v.instance.ClassName ~= "MeshPart" then
				if v.instance.ClassName == "WrapTarget" then
					assert(v.fieldName == "CageMeshId")
					t.fullName ..= "OuterCage"
					
					if not getFFlagUGCValidateMigrateCageUVModule() then
						var5:updateReasons(validateCageUVsModule(t, v.instance, p7))
					end
					if not getFFlagUGCValidateMigrateCageUVModule() then
						var5:updateReasons(validateCageUVTriangleAreaModule(t, p7))
					end
					if not getFFlagUGCValidateMigrateCageUVModule() then
						var5:updateReasons(validateCageUVValuesModule(t, v.instance, p7))
					end
					if not getFFlagUGCValidateMigrateMeshGeometryModule() then
						var5:updateReasons(validateMeshTriangleAreaModule(t, p7))
					end
				end
			end
			assert(v.fieldName == "MeshId")
			local var9, var10, var11, var12 = getMeshMinMaxModule(t, p7)
			
			if not var9 then
				var5:updateReasons(false, var10)
			end
			if var9 then
				local currentTime_1 = tick()
				var5:updateReasons(validateMeshIsAtOrigin(t, var11, var12, p7))
				analyticsModule.recordScriptTime("validateMeshIsAtOrigin", currentTime_1, p7)
			end
			if var11 and var12 then
				local var13 = var12 - var11
				
				if floatEqualsModule(var13.X, 0) or floatEqualsModule(var13.Y, 0) or floatEqualsModule(var13.Z, 0) then
					var5:updateReasons(false, {
						"Mesh size is zero for " .. t.fullName .. ". You need to rescale your mesh."
					})
				else
					local var14 = getExpectedPartSizeModule(v.instance, p7) / var13
					
					if not getFFlagUGCValidateMigrateMeshGeometryModule() then
						var5:updateReasons(validateTotalSurfaceAreaModule(t, var14, p7))
					end
					if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and getFFlagUGCValidateCoplanarTriTestBodyModule() then
						var5:updateReasons(validateCoplanarIntersectionModule(t, var14, p7))
					end
				end
			end
			if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
				var5:updateReasons(validateMeshVertColorsModule(t, true, p7))
			end
			local currentTime_1 = tick()
			var5:updateReasons(validateIsSkinned(v.instance, isServer, allowEditableInstances, p7))
			analyticsModule.recordScriptTime("validateIsSkinned", currentTime_1, p7)
			
			if not getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule() then
				var5:updateReasons(validateSkinningTransferModule(v.instance, p7))
			end
			if not getFFlagUGCValidateMigrateMeshGeometryModule() then
				var5:updateReasons(validateMeshTriangleAreaModule(t, p7))
			end
		end
		return false, {
			string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", v.instance.Name)
		}
	end
	return var5:getFinalResults()
end