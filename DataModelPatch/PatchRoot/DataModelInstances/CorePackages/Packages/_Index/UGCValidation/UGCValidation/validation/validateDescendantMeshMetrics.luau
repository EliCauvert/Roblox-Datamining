local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local ValidateCoplanarIntersectionModule = require(Parent.validation.validateCoplanarIntersection)
local ValidateCageUVsModule = require(Parent.validation.validateCageUVs)
local ValidateMeshVertColorsModule = require(Parent.validation.validateMeshVertColors)
local ValidateCageUVTriangleAreaModule = require(Parent.validation.validateCageUVTriangleArea)
local ValidateMeshTriangleAreaModule = require(Parent.validation.validateMeshTriangleArea)
local ValidateCageUVValuesModule = require(Parent.validation.validateCageUVValues)
local ValidateTotalSurfaceAreaModule = require(Parent.validation.validateTotalSurfaceArea)
local ValidateSkinningTransferModule = require(Parent.validation.validateSkinningTransfer)
local GetFFlagUGCValidateMigrateCageUVModule = require(Parent.flags.getFFlagUGCValidateMigrateCageUV)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local GetMeshMinMaxModule = require(Parent.util.getMeshMinMax)
local GetEditableMeshFromContextModule = require(Parent.util.getEditableMeshFromContext)
local FloatEqualsModule = require(Parent.util.floatEquals)
local GetExpectedPartSizeModule = require(Parent.util.getExpectedPartSize)
local GetFFlagUGCValidateCoplanarTriTestBodyModule = require(Parent.flags.getFFlagUGCValidateCoplanarTriTestBody)
local GetFIntUGCValidateTriangleLimitToleranceModule = require(Parent.flags.getFIntUGCValidateTriangleLimitTolerance)
local GetEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule = require(Parent.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning)
local GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule = require(Parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality)
local GetFFlagUGCValidateMigrateMeshGeometryModule = require(Parent.flags.getFFlagUGCValidateMigrateMeshGeometry)

local function validateIsSkinned(Object, IsServer, AllowEditableInstances, p1)
	-- upvalues: ConstantsModule (copy), AnalyticsModule (copy), GetEditableMeshFromContextModule (copy), UGCValidationService (copy)
	local Attribute = Object:GetAttribute(ConstantsModule.AlternateMeshIdAttributeName)
	
	if not Object.HasSkinnedMesh and (Attribute == nil or Attribute == "" or not AllowEditableInstances) then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDescendantMeshMetrics_NoSkinningInfo, nil, p1)
		
		return false, {
			`Missing skinning data for {Object.Name}.MeshId. You need to skin your model.`
		}
	end
	local Success, Result = pcall(function()
		-- upvalues: GetEditableMeshFromContextModule (upval), Object (copy), p1 (copy), UGCValidationService (upval)
		local MeshId, MeshId2 = GetEditableMeshFromContextModule(Object, "MeshId", p1)
		
		if not MeshId then
			error("Failed to retrieve MeshContent")
		end
		return UGCValidationService:ValidateSkinnedEditableMesh(MeshId2)
	end)
	
	if Success then
		if Result then
			return true
		end
		local Message: string = `Detected mismatch between model and skinned data for {Object.Name}. You need to re-skin your model to fix this issue.`
		
		if IsServer then
			error(Message)
		end
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDescendantMeshMetrics_HasSkinnedMeshMismatch, nil, p1)
		
		return false, { Message }
	else
		if IsServer then
			error("Failed to retrieve mesh data to validate skinned mesh")
		end
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDescendantMeshMetrics_FailedToLoadMesh, nil, p1)
		
		return false, { "Failed to retrieve mesh data to validate skinned mesh" }
	end
end

local function validateTotalAssetTriangles(ParseResult, AssetTypeEnum, p2)
	-- upvalues: ConstantsModule (copy), GetEditableMeshFromContextModule (copy), AnalyticsModule (copy), PcallDeferredModule (copy), UGCValidationService (copy), GetFIntUGCValidateTriangleLimitToleranceModule (copy)
	local IsServer = p2.isServer
	local v1 = assert(ConstantsModule.ASSET_RENDER_MESH_MAX_TRIANGLES[AssetTypeEnum.Name])
	local v2, v3, v4 = (function()
		-- upvalues: ParseResult (copy), GetEditableMeshFromContextModule (upval), p2 (copy), AnalyticsModule (upval), PcallDeferredModule (upval), UGCValidationService (upval)
		local Total = 0
		
		for _, value in ParseResult do
			if value.instance.ClassName == "MeshPart" then
				assert(value.fieldName == "MeshId")
				local EditableMeshFromContextModule, EditableMeshFromContextModule2 = GetEditableMeshFromContextModule(value.instance, value.fieldName, p2)
				
				if not EditableMeshFromContextModule then
					AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDescendantMeshMetrics_FailedToLoadMesh, nil, p2)
					
					return false, string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", value.instance.Name)
				end
				local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
					-- upvalues: UGCValidationService (upval), EditableMeshFromContextModule2 (copy)
					return UGCValidationService:GetEditableMeshTriCount(EditableMeshFromContextModule2)
				end, p2)
				
				if not PcallDeferredModuleResult then
					return false, string.format("Failed to execute check for triangle face information for mesh '%s'. Make sure mesh exists and try again.", value.instance.Name)
				end
				Total += PcallDeferredModuleResult2
			end
		end
		return true, nil, Total
	end)()
	
	if not v2 then
		if IsServer then
			error(v3)
		end
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDescendantMeshMetrics_FailedToCalculateTriangles, nil, p2)
		
		return false, { v3 }
	elseif v1 + v1 * (GetFIntUGCValidateTriangleLimitToleranceModule() / 100) < v4 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDescendantMeshMetrics_TooManyTriangles, nil, p2)
		
		return false, {
			string.format("Mesh resolution of '%d' for '%s' is higher than max supported number of triangles '%d'. You need to retopologize your model to reduce the triangle count.", v4, AssetTypeEnum.Name, v1)
		}
	else
		return true
	end
end

local function validateMeshIsAtOrigin(p3, p4, p5, p6)
	-- upvalues: AnalyticsModule (copy)
	if (p4 + (p5 - p4) / 2).Magnitude > 0.001 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateDescendantMeshMetrics_TooFarFromOrigin, nil, p6)
		
		return false, {
			string.format("Bounds for the mesh '%s' are not centered at the origin. The max allowed distance is '%f'", p3.fullName, 0.001)
		}
	else
		return true
	end
end

return function(p3, p4)
	-- upvalues: FailureReasonsAccumulatorModule (copy), ParseContentIdsModule (copy), ConstantsModule (copy), GetFFlagUGCValidateMigrateMeshGeometryModule (copy), validateTotalAssetTriangles (copy), AnalyticsModule (copy), GetEditableMeshFromContextModule (copy), GetMeshMinMaxModule (copy), validateMeshIsAtOrigin (copy), FloatEqualsModule (copy), GetExpectedPartSizeModule (copy), ValidateTotalSurfaceAreaModule (copy), GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (copy), GetFFlagUGCValidateCoplanarTriTestBodyModule (copy), ValidateCoplanarIntersectionModule (copy), ValidateMeshVertColorsModule (copy), validateIsSkinned (copy), GetEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule (copy), ValidateSkinningTransferModule (copy), ValidateMeshTriangleAreaModule (copy), GetFFlagUGCValidateMigrateCageUVModule (copy), ValidateCageUVsModule (copy), ValidateCageUVTriangleAreaModule (copy), ValidateCageUVValuesModule (copy)
	local IsServer = p4.isServer
	assert(p4.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateDescendantMeshMetrics")
	local AssetTypeEnum = p4.assetTypeEnum
	local AllowEditableInstances = p4.allowEditableInstances
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	local ParseResult = ParseContentIdsModule.parse(p3, ConstantsModule.MESH_CONTENT_ID_FIELDS, p4)
	local CurrentTime = tick()
	
	if not GetFFlagUGCValidateMigrateMeshGeometryModule() then
		NewFailureReasonsAccumulator:updateReasons(validateTotalAssetTriangles(ParseResult, AssetTypeEnum, p4))
	end
	AnalyticsModule.recordScriptTime("validateTotalAssetTriangles", CurrentTime, p4)
	
	for _, value in ParseResult do
		local config = {
			fullName = value.instance:GetFullName(),
			fieldName = value.fieldName,
			contentId = value.instance[value.fieldName],
			context = value.instance.Name
		}
		local EditableMeshFromContextModule, EditableMeshFromContextModule2 = GetEditableMeshFromContextModule(value.instance, value.fieldName, p4)
		
		if not EditableMeshFromContextModule then
			return false, {
				string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", value.instance.Name)
			}
		end
		config.editableMesh = EditableMeshFromContextModule2
		
		if value.instance.ClassName ~= "MeshPart" then
			if value.instance.ClassName == "WrapTarget" then
				assert(value.fieldName == "CageMeshId")
				config.fullName ..= "OuterCage"
				
				if not GetFFlagUGCValidateMigrateCageUVModule() then
					NewFailureReasonsAccumulator:updateReasons(ValidateCageUVsModule(config, value.instance, p4))
				end
				if not GetFFlagUGCValidateMigrateCageUVModule() then
					NewFailureReasonsAccumulator:updateReasons(ValidateCageUVTriangleAreaModule(config, p4))
				end
				if not GetFFlagUGCValidateMigrateCageUVModule() then
					NewFailureReasonsAccumulator:updateReasons(ValidateCageUVValuesModule(config, value.instance, p4))
				end
				if not GetFFlagUGCValidateMigrateMeshGeometryModule() then
					NewFailureReasonsAccumulator:updateReasons(ValidateMeshTriangleAreaModule(config, p4))
				end
				continue
			end
			continue
		end
		assert(value.fieldName == "MeshId")
		local MeshMinMaxModule, MeshMinMaxModule2, MeshMinMaxModule3, MeshMinMaxModule4 = GetMeshMinMaxModule(config, p4)
		
		if not MeshMinMaxModule then
			NewFailureReasonsAccumulator:updateReasons(false, MeshMinMaxModule2)
		end
		if MeshMinMaxModule then
			local CurrentTime1 = tick()
			NewFailureReasonsAccumulator:updateReasons(validateMeshIsAtOrigin(config, MeshMinMaxModule3, MeshMinMaxModule4, p4))
			AnalyticsModule.recordScriptTime("validateMeshIsAtOrigin", CurrentTime1, p4)
		end
		if MeshMinMaxModule3 and MeshMinMaxModule4 then
			local MeshMinMaxModuleDelta = MeshMinMaxModule4 - MeshMinMaxModule3
			
			if FloatEqualsModule(MeshMinMaxModuleDelta.X, 0) or FloatEqualsModule(MeshMinMaxModuleDelta.Y, 0) or FloatEqualsModule(MeshMinMaxModuleDelta.Z, 0) then
				NewFailureReasonsAccumulator:updateReasons(false, {
					"Mesh size is zero for " .. config.fullName .. ". You need to rescale your mesh."
				})
			else
				local ExpectedPartSizeModuleRatio = GetExpectedPartSizeModule(value.instance, p4) / MeshMinMaxModuleDelta
				
				if not GetFFlagUGCValidateMigrateMeshGeometryModule() then
					NewFailureReasonsAccumulator:updateReasons(ValidateTotalSurfaceAreaModule(config, ExpectedPartSizeModuleRatio, p4))
				end
				if not GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and GetFFlagUGCValidateCoplanarTriTestBodyModule() then
					NewFailureReasonsAccumulator:updateReasons(ValidateCoplanarIntersectionModule(config, ExpectedPartSizeModuleRatio, p4))
				end
			end
		end
		if not GetFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
			NewFailureReasonsAccumulator:updateReasons(ValidateMeshVertColorsModule(config, true, p4))
		end
		local CurrentTime2 = tick()
		NewFailureReasonsAccumulator:updateReasons(validateIsSkinned(value.instance, IsServer, AllowEditableInstances, p4))
		AnalyticsModule.recordScriptTime("validateIsSkinned", CurrentTime2, p4)
		
		if not GetEngineFeatureEngineUGCValidationConsolidateAccessorySkinningModule() then
			NewFailureReasonsAccumulator:updateReasons(ValidateSkinningTransferModule(value.instance, p4))
		end
		if not GetFFlagUGCValidateMigrateMeshGeometryModule() then
			NewFailureReasonsAccumulator:updateReasons(ValidateMeshTriangleAreaModule(config, p4))
		end
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end