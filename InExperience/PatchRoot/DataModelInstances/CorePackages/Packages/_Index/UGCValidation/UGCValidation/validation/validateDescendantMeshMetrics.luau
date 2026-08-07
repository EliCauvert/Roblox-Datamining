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

local function validateIsSkinned(p0, p1, p2, p3) --[[ line: 40 ]]
	-- upvalues: constantsModule (ref), analyticsModule (ref), getEditableMeshFromContextModule (ref), UGCValidationService (ref)
	local alternateMeshIdAttributeNameAttribute = p0:GetAttribute(constantsModule.AlternateMeshIdAttributeName)
	
	if not p0.HasSkinnedMesh and (alternateMeshIdAttributeNameAttribute == nil or alternateMeshIdAttributeNameAttribute == "" or not p2) then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_NoSkinningInfo, nil, p3)
		
		return false, {
			`Missing skinning data for {p0.Name}.MeshId. You need to skin your model.`
		}
	end
	local ok, status = pcall(function() --[[ line: 58 ]]
		-- upvalues: getEditableMeshFromContextModule (copy), p0 (ref), p3 (ref), UGCValidationService (copy)
		local var29, var30 = getEditableMeshFromContextModule(p0, "MeshId", p3)
		
		if not var29 then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:ValidateSkinnedEditableMesh(var30)
	end)
	
	if ok then
		if status then
			return true
		end
		local name = `Detected mismatch between model and skinned data for {p0.Name}. You need to re-skin your model to fix this issue.`
		
		if p1 then
			error(name)
		end
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_HasSkinnedMeshMismatch, nil, p3)
		
		return false, { name }
	elseif p1 then
		error("Failed to retrieve mesh data to validate skinned mesh")
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_FailedToLoadMesh, nil, p3)
	
	return false, { "Failed to retrieve mesh data to validate skinned mesh" }
end

local function validateTotalAssetTriangles(vectorA, vectorB, p4) --[[ line: 101 ]]
	-- upvalues: constantsModule (ref), getEditableMeshFromContextModule (ref), analyticsModule (ref), pcallDeferredModule (ref), UGCValidationService (ref), getFIntUGCValidateTriangleLimitToleranceModule (ref)
	local isServer = p4.isServer
	local var31 = assert(constantsModule.ASSET_RENDER_MESH_MAX_TRIANGLES[vectorB.Name])
	local var32, var33, var34 = (function() --[[ line: 109 | named "calculateTotalAssetTriangles" ]]
		-- upvalues: vectorA (ref), getEditableMeshFromContextModule (copy), p4 (ref), analyticsModule (copy), pcallDeferredModule (copy), UGCValidationService (copy)
		local var35 = 0
		
		for i, v in vectorA do
			if v.instance.ClassName == "MeshPart" then
				assert(v.fieldName == "MeshId")
				local var36, var37 = getEditableMeshFromContextModule(v.instance, v.fieldName, p4)
				
				if var36 then
					local var38, var39 = pcallDeferredModule(function() --[[ line: 132 ]]
						-- upvalues: UGCValidationService (copy), var37 (ref)
						return UGCValidationService:GetEditableMeshTriCount(var37)
					end, p4)
					
					if var38 then
						var35 += var39
						continue
					end
					return false, string.format("Failed to execute check for triangle face information for mesh '%s'. Make sure mesh exists and try again.", v.instance.Name)
				end
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_FailedToLoadMesh, nil, p4)
				
				return false, string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", v.instance.Name)
			end
		end
		return true, nil, var35
	end)()
	
	if var32 then
		if var31 + var31 * (getFIntUGCValidateTriangleLimitToleranceModule() / 100) < var34 then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_TooManyTriangles, nil, p4)
			
			return false, {
				string.format("Mesh resolution of '%d' for '%s' is higher than max supported number of triangles '%d'. You need to retopologize your model to reduce the triangle count.", var34, vectorB.Name, var31)
			}
		end
		return true
	elseif isServer then
		error(var33)
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_FailedToCalculateTriangles, nil, p4)
	
	return false, { var33 }
end

local function validateMeshIsAtOrigin(p5, p6, p7, p8) --[[ line: 187 ]]
	-- upvalues: analyticsModule (ref)
	if (p6 + (p7 - p6) / 2).Magnitude > 0.001 then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateDescendantMeshMetrics_TooFarFromOrigin, nil, p8)
		
		return false, {
			string.format("Bounds for the mesh '%s' are not centered at the origin. The max allowed distance is '%f'", p5.fullName, 0.001)
		}
	end
	return true
end

return function(p9, p10) --[[ line: 218 | named "validateDescendantMeshMetrics" ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), parseContentIdsModule (ref), constantsModule (ref), getFFlagUGCValidateMigrateMeshGeometryModule (ref), validateTotalAssetTriangles (ref), analyticsModule (ref), getEditableMeshFromContextModule (ref), getMeshMinMaxModule (ref), validateMeshIsAtOrigin (ref), floatEqualsModule (ref), getExpectedPartSizeModule (ref), validateTotalSurfaceAreaModule (ref), getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (ref), getFFlagUGCValidateCoplanarTriTestBodyModule (ref), validateCoplanarIntersectionModule (ref), validateMeshVertColorsModule (ref), validateIsSkinned (ref), getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule (ref), validateSkinningTransferModule (ref), validateMeshTriangleAreaModule (ref), getFFlagUGCValidateMigrateCageUVModule (ref), validateCageUVsModule (ref), validateCageUVTriangleAreaModule (ref), validateCageUVValuesModule (ref)
	local isServer = p10.isServer
	assert(p10.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateDescendantMeshMetrics")
	local assetTypeEnum = p10.assetTypeEnum
	local allowEditableInstances = p10.allowEditableInstances
	local var40 = failureReasonsAccumulatorModule.new()
	local var41 = parseContentIdsModule.parse(p9, constantsModule.MESH_CONTENT_ID_FIELDS, p10)
	local currentTime = tick()
	
	if not getFFlagUGCValidateMigrateMeshGeometryModule() then
		var40:updateReasons(validateTotalAssetTriangles(var41, assetTypeEnum, p10))
	end
	analyticsModule.recordScriptTime("validateTotalAssetTriangles", currentTime, p10)
	
	for i, v in var41 do
		local t = {
			fullName = v.instance:GetFullName(),
			fieldName = v.fieldName,
			contentId = v.instance[v.fieldName],
			context = v.instance.Name
		}
		local var44, var45 = getEditableMeshFromContextModule(v.instance, v.fieldName, p10)
		
		if var44 then
			t.editableMesh = var45
			
			if v.instance.ClassName ~= "MeshPart" then
				if v.instance.ClassName == "WrapTarget" then
					assert(v.fieldName == "CageMeshId")
					t.fullName ..= "OuterCage"
					
					if not getFFlagUGCValidateMigrateCageUVModule() then
						var40:updateReasons(validateCageUVsModule(t, v.instance, p10))
					end
					if not getFFlagUGCValidateMigrateCageUVModule() then
						var40:updateReasons(validateCageUVTriangleAreaModule(t, p10))
					end
					if not getFFlagUGCValidateMigrateCageUVModule() then
						var40:updateReasons(validateCageUVValuesModule(t, v.instance, p10))
					end
					if not getFFlagUGCValidateMigrateMeshGeometryModule() then
						var40:updateReasons(validateMeshTriangleAreaModule(t, p10))
					end
				end
			end
			assert(v.fieldName == "MeshId")
			local var46, var47, var48, var49 = getMeshMinMaxModule(t, p10)
			
			if not var46 then
				var40:updateReasons(false, var47)
			end
			if var46 then
				local currentTime_1 = tick()
				var40:updateReasons(validateMeshIsAtOrigin(t, var48, var49, p10))
				analyticsModule.recordScriptTime("validateMeshIsAtOrigin", currentTime_1, p10)
			end
			if var48 and var49 then
				local var51 = var49 - var48
				
				if floatEqualsModule(var51.X, 0) or floatEqualsModule(var51.Y, 0) or floatEqualsModule(var51.Z, 0) then
					var40:updateReasons(false, {
						"Mesh size is zero for " .. t.fullName .. ". You need to rescale your mesh."
					})
				else
					local var52 = getExpectedPartSizeModule(v.instance, p10) / var51
					
					if not getFFlagUGCValidateMigrateMeshGeometryModule() then
						var40:updateReasons(validateTotalSurfaceAreaModule(t, var52, p10))
					end
					if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and getFFlagUGCValidateCoplanarTriTestBodyModule() then
						var40:updateReasons(validateCoplanarIntersectionModule(t, var52, p10))
					end
				end
			end
			if not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
				var40:updateReasons(validateMeshVertColorsModule(t, true, p10))
			end
			local currentTime_1 = tick()
			var40:updateReasons(validateIsSkinned(v.instance, isServer, allowEditableInstances, p10))
			analyticsModule.recordScriptTime("validateIsSkinned", currentTime_1, p10)
			
			if not getEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule() then
				var40:updateReasons(validateSkinningTransferModule(v.instance, p10))
			end
			if not getFFlagUGCValidateMigrateMeshGeometryModule() then
				var40:updateReasons(validateMeshTriangleAreaModule(t, p10))
			end
		end
		return false, {
			string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", v.instance.Name)
		}
	end
	return var40:getFinalResults()
end