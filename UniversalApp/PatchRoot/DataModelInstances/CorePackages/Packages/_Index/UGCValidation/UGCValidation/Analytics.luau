local Parent = script.Parent
local _ = require(Parent.util.Types)
local RunService = game:GetService("RunService")
local UGCValidationService = game:GetService("UGCValidationService")
local StudioService = if RunService:IsStudio() then game:GetService("StudioService") else nil
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local GetEngineFeatureEngineUGCValidationReportScriptTimeModule = require(Parent.flags.getEngineFeatureEngineUGCValidationReportScriptTime)
local GetEngineFeatureEngineUGCValidationIECTelemetryModule = require(Parent.flags.getEngineFeatureEngineUGCValidationIECTelemetry)
local GetEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule = require(Parent.flags.getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBounds)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local GetFFlagUGCValidationEyebrowEyelashSupportModule = require(Parent.flags.getFFlagUGCValidationEyebrowEyelashSupport)

local function joinTables(...) --[[ Line: 25 ]]
	local t = {}
	
	for i = 1, select("#", ...) do
		for i1, value in select(i, ...) do
			t[i1] = value
		end
	end
	return t
end

local AnalyticsModule = {
	ErrorType = {
		resetPhysicsData_FailedToLoadMesh = "resetPhysicsData_FailedToLoadMesh",
		validateAccurateBoundingBox = "validateAccurateBoundingBox",
		validateScaleType_InvalidAvatarPartScaleType = "validateScaleType_InvalidAvatarPartScaleType",
		validateAssetCreator_DependencyNotOwnedByCreator = "validateAssetCreator_DependencyNotOwnedByCreator",
		validateAssetCreator_FailedToLoad = "validateAssetCreator_FailedToLoad",
		validateAssetCreator_TooManyDependencies = "validateAssetCreator_TooManyDependencies",
		validateAssetTransparency_AssetTransparencyThresholds = "validateAssetTransparency_AssetTransparencyThresholds",
		validateBodyPartCollisionFidelity = "validateBodyPartCollisionFidelity",
		validateCanLoad = "validateCanLoad",
		validateDependencies_IsNotApproved = "validateDependencies_IsNotApproved",
		validateDependencies_IsRestrictedUserId = "validateDependencies_IsRestrictedUserId",
		validateDependencies_IsReviewing = "validateDependencies_IsReviewing",
		validateDependencies_ParseFailure = "validateDependencies_ParseFailure",
		validateDescendantMeshMetrics_FailedToLoadMesh = "validateDescendantMeshMetrics_FailedToLoadMesh",
		validateDescendantMeshMetrics_HasSkinnedMeshMismatch = "validateDescendantMeshMetrics_HasSkinnedMeshMismatch",
		validateDescendantMeshMetrics_NoSkinningInfo = "validateDescendantMeshMetrics_NoSkinningInfo",
		validateDescendantMeshMetrics_TooFarFromOrigin = "validateDescendantMeshMetrics_TooFarFromOrigin",
		validateDynamicHeadMeshPartFormat_FailedToLoadMesh = "validateDynamicHeadMeshPartFormat_FailedToLoadMesh",
		validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh = "validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh",
		validateFullBody_IncorrectAssetTypeSet = "validateFullBody_IncorrectAssetTypeSet",
		validateFullBody_InstancesMissing = "validateFullBody_InstancesMissing",
		validateFullBody_MeshIdsMissing = "validateFullBody_MeshIdsMissing",
		validateHSR_NoWrapLayer = "validateHSR_NoWrapLayer",
		validateInstanceTree = "validateInstanceTree",
		validateInstanceTree_InvalidDescendants = "validateInstanceTree_InvalidDescendants",
		validateLayeredClothingAccessory_AssetTypeNotAllowedAsLayeredClothing = "validateLayeredClothingAccessory_AssetTypeNotAllowedAsLayeredClothing",
		validateLayeredClothingAccessory_FailedToLoadMesh = "validateLayeredClothingAccessory_FailedToLoadMesh",
		validateLayeredClothingAccessory_NoInnerCageId = "validateLayeredClothingAccessory_NoInnerCageId",
		validateLayeredClothingAccessory_NoMeshId = "validateLayeredClothingAccessory_NoMeshId",
		validateLayeredClothingAccessory_NoOuterCageId = "validateLayeredClothingAccessory_NoOuterCageId",
		validateLayeredClothingAccessory_NoWrapLayer = "validateLayeredClothingAccessory_NoWrapLayer",
		validateLayeredClothingAccessoryMeshPartAssetFormatMatch_MeshIdMismatch = "validateLayeredClothingAccessoryMeshPartAssetFormatMatch_MeshIdMismatch",
		validateLayeredClothingAccessoryMeshPartAssetFormatMatch_TextureIdMismatch = "validateLayeredClothingAccessoryMeshPartAssetFormatMatch_TextureIdMismatch",
		validateLegacyAccessory_AssetTypeNotAllowedAsRigidAccessory = "validateLegacyAccessory_AssetTypeNotAllowedAsRigidAccessory",
		validateLegacyAccessoryMeshPartAssetFormatMatch_MeshIdMismatch = "validateLegacyAccessoryMeshPartAssetFormatMatch_MeshIdMismatch",
		validateLegacyAccessoryMeshPartAssetFormatMatch_TextureIdMismatch = "validateLegacyAccessoryMeshPartAssetFormatMatch_TextureIdMismatch",
		validateLimbsAndTorso_FolderInfoMismatch = "validateLimbsAndTorso_FolderInfoMismatch",
		validateLimbsAndTorso_R6FolderHasChildren = "validateLimbsAndTorso_R6FolderHasChildren",
		validateLimbsAndTorso_TopLevelFolders = "validateLimbsAndTorso_TopLevelFolders",
		validateMeshBounds_FailedToExecute = "validateMeshBounds_FailedToExecute",
		validateMeshBounds_FailedToLoadMesh = "validateMeshBounds_FailedToLoadMesh",
		validateMeshBounds_TooLarge = "validateMeshBounds_TooLarge",
		validateMeshPartAccessory_DoubleSided = "validateMeshPartAccessory_DoubleSided",
		validateMeshPartAccessory_FailedToLoadMesh = "validateMeshPartAccessory_FailedToLoadMesh",
		validateMeshPartAccessory_NoMeshId = "validateMeshPartAccessory_NoMeshId",
		validateMeshPartBodyPart_ValidateWithSchema = "validateMeshPartBodyPart_ValidateWithSchema",
		validateMeshTriangles_FailedToExecute = "validateMeshTriangles_FailedToExecute",
		validateMeshTriangles_FailedToLoadMesh = "validateMeshTriangles_FailedToLoadMesh",
		validateMeshTriangles_TooManyTriangles = "validateMeshTriangles_TooManyTriangles",
		validateMeshVertexColors_FailedToLoadMesh = "validateMeshVertexColors_FailedToLoadMesh",
		validateMeshVertexColors_NonNeutralVertexColors = "validateMeshVertexColors_NonNeutralVertexColors",
		validatePackage_FailedToParse = "validatePackage_FailedToParse",
		validateSingleInstance_MultipleInstances = "validateSingleInstance_MultipleInstances",
		validateSingleInstance_ZeroInstances = "validateSingleInstance_ZeroInstances",
		validateSurfaceAppearances_InvalidAlphaMode = "validateSurfaceAppearances_InvalidAlphaMode",
		validateTags = "validateTags",
		validateThumbnailConfiguration_InvalidTarget = "validateThumbnailConfiguration_InvalidTarget",
		validateThumbnailConfiguration_OutsideView = "validateThumbnailConfiguration_OutsideView",
		validateVertexDensity_FailedToExecute = "validateVertexDensity_FailedToExecute",
		validateVertexDensity_MaxDensityExceeded = "validateVertexDensity_MaxDensityExceeded",
		validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls = "validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls",
		validateRenderMeshInsideOuterCageMesh_FailedToExecute = "validateRenderMeshInsideOuterCageMesh_FailedToExecute",
		validateRenderMeshInsideOuterCageMesh_MaxOutsideCageMeshExceeded = "validateRenderMeshInsideOuterCageMesh_MaxOutsideCageMeshExceeded",
		validateLayeredClothingAccessory_CageOriginOutOfBounds = "validateLayeredClothingAccessory_CageOriginOutOfBounds",
		validateBodyPart_CageOriginOutOfBounds = "validateBodyPart_CageOriginOutOfBounds",
		validateTotalSurfaceArea_FailedToExecute = "validateTotalSurfaceArea_FailedToExecute",
		validateTotalSurfaceArea_maxTotalSurfaceAreaExceeded = "validateTotalSurfaceArea_maxTotalSurfaceAreaExceeded",
		validateCoplanarIntersection_FailedToExecute = "validateCoplanarIntersection_FailedToExecute",
		validateCoplanarIntersection_CoplanarIntersection = "validateCoplanarIntersection_CoplanarIntersection",
		validateExcludedModifiedCageUVs_FailedToExecute = "validateExcludedModifiedCageUVs_FailedToExecute",
		validateExcludedModifiedCageUVs_UnexpectedUVValue = "validateExcludedModifiedCageUVs_UnexpectedUVValue",
		validateMainModifiedCageUVs_FailedToExecute = "validateMainModifiedCageUVs_FailedToExecute",
		validateMainModifiedCageUVs_TooFewModifiedUVsFound = "validateMainModifiedCageUVs_TooFewModifiedUVsFound",
		validateRenderMeshInsideModifiedOuterCageArea_FailedToExecute = "validateRenderMeshInsideModifiedOuterCageArea_FailedToExecute",
		validateRenderMeshInsideModifiedOuterCageArea_RenderMeshNotPositionedCorrectly = "validateRenderMeshInsideModifiedOuterCageArea_RenderMeshNotPositionedCorrectly",
		validateCagingRelevancy_FailedToExecute = "validateCagingRelevancy_FailedToExecute",
		validateCagingRelevancy_IrrelevantCaging = "validateCagingRelevancy_IrrelevantCaging",
		validateCageMeshDistance_FailedToExecute = "validateCageMeshDistance_FailedToExecute",
		validateCageMeshDistance_OuterCageToMeshDistance = "validateCageMeshDistance_OuterCageToMeshDistance",
		validatePartSizeWithinRenderSizeLimits_SizeExceeded = "validatePartSizeWithinRenderSizeLimits_SizeExceeded",
		validateLayeredClothingAccessory_HandleIsScaled = "validateLayeredClothingAccessory_HandleIsScaled",
		resetPhysicsData_LargeMass = "resetPhysicsData_LargeMass",
		validateBodyAttPosRelativeToParent_PartAboveParent = "validateBodyAttPosRelativeToParent_PartAboveParent",
		validateBodyAttPosRelativeToParent_ParentBelowPart = "validateBodyAttPosRelativeToParent_ParentBelowPart",
		validateBodyBlockingTests_ZeroMeshSize = "validateBodyBlockingTests_ZeroMeshSize",
		validateFullBody_ZeroMeshSize = "validateFullBody_ZeroMeshSize",
		validateMeshBounds_Shifted = "validateMeshBounds_Shifted",
		validateDeformedLayeredClothingInRenderBounds_FailedToExecute = "validateDeformedLayeredClothingInRenderBounds_FailedToExecute",
		validateDeformedLayeredClothingInRenderBounds_ClothingOutOfBounds = "validateDeformedLayeredClothingInRenderBounds_ClothingOutOfBounds"
	}
}

if require(Parent.flags.getFFlagUGCValidateTexturePack)() then
	AnalyticsModule.ErrorType.validateTexturePack_InvalidTexturePackURL = "validateTexturePack_InvalidTexturePackURL"
	AnalyticsModule.ErrorType.validateTexturePack_FailedToDownloadTexturePack = "validateTexturePack_FailedToDownloadTexturePack"
	AnalyticsModule.ErrorType.validateTexturePack_TexturePackMismatch = "validateTexturePack_TexturePackMismatch"
end
AnalyticsModule.ErrorType.validateMeshSizeProperty_FailedToLoadMesh = "validateMeshSizeProperty_FailedToLoadMesh"
AnalyticsModule.ErrorType.validateMeshSizeProperty_Mismatch = "validateMeshSizeProperty_Mismatch"
AnalyticsModule.ErrorType.validateBodyPartVertsSkinnedToR15_FailedToFetchSkinning = "validateBodyPartVertsSkinnedToR15_FailedToFetchSkinning"
AnalyticsModule.ErrorType.validateBodyPartVertsSkinnedToR15_BodyIsSkinnedToFakeJoints = "validateBodyPartVertsSkinnedToR15_BodyIsSkinnedToFakeJoints"
AnalyticsModule.ErrorType.validateSkinningTransfer_FailedToExecute = "validateSkinningTransfer_FailedToExecute"
AnalyticsModule.ErrorType.validateSkinningTransfer_BodyPartsWithSpecialJoints = "validateSkinningTransfer_BodyPartsWithSpecialJoints"
AnalyticsModule.ErrorType.validateSkinningTransfer_SkinningTransferOverride = "validateSkinningTransfer_SkinningTransferOverride"
AnalyticsModule.ErrorType.validateSkinningTransfer_Weights = "validateSkinningTransfer_Weights"

if GetFFlagUGCValidationEyebrowEyelashSupportModule() then
	AnalyticsModule.ErrorType.validateSkinningTransfer_RequiredAssetTypes = "validateSkinningTransfer_RequiredAssetTypes"
end
if GetEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
	AnalyticsModule.ErrorType.validatePropertiesSensible_IncorrectPropertiesFound = "validatePropertiesSensible_IncorrectPropertiesFound"
end
AnalyticsModule.ErrorType.validateHSR_FileDataInvalid = "validateHSR_FileDataInvalid"
AnalyticsModule.ErrorType.validataHSR_HSRMeshIdsMismatch = "validataHSR_HSRMeshIdsMismatch"

if GetEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule() then
	AnalyticsModule.ErrorType.validateFACSJointTransformsWithinBounds_Error = "validateFACSJointTransformsWithinBounds_Error"
	AnalyticsModule.ErrorType.validateFACSJointTransformsWithinBounds_OOB = "validateFACSJointTransformsWithinBounds_OOB"
end
setmetatable(AnalyticsModule.ErrorType, {
	__index = function(_, p1): string --[[ Line: 170 ]]
		return `UNREGISTERED_{p1}`
	end
})
AnalyticsModule.metadata = {}

function AnalyticsModule.setMetadata(List) --[[ Line: 177 ]]
	-- upvalues: AnalyticsModule (copy)
	local Metadata = {}
	
	for i, value in List do
		Metadata[i] = tostring(value)
	end
	AnalyticsModule.metadata = Metadata
end

function AnalyticsModule.shouldReportIECTelemetry(p1) --[[ Line: 185 ]]
	-- upvalues: GetEngineFeatureEngineUGCValidationIECTelemetryModule (copy), RunService (copy)
	return if GetEngineFeatureEngineUGCValidationIECTelemetryModule() and p1 then not RunService:IsStudio() and p1.allowEditableInstances and p1.isServer else false
end

function AnalyticsModule.reportCounter(Success, ValidationType, p1) --[[ Line: 201 ]]
	-- upvalues: AnalyticsModule (copy), UGCValidationService (copy)
	if AnalyticsModule.shouldReportIECTelemetry(p1) then
		UGCValidationService:ReportUGCValidationCounter(Success, ValidationType)
	end
end

function AnalyticsModule.reportFailure(ErrorType, p1, p2) --[[ Line: 207 ]]
	-- upvalues: RunService (copy), joinTables (copy), AnalyticsModule (copy), RbxAnalyticsService (copy), StudioService (copy), UGCValidationService (copy)
	RbxAnalyticsService:SendEventDeferred(if RunService:IsStudio() then "studio" else "rcc", "ugcValidation", "failure", (joinTables(AnalyticsModule.metadata, p1 or {}, {
		errorType = ErrorType,
		studioSid = RbxAnalyticsService:GetSessionId(),
		clientId = RbxAnalyticsService:GetClientId(),
		placeId = game.PlaceId,
		userId = if StudioService then StudioService:GetUserId() else 0
	})))
	
	if AnalyticsModule.shouldReportIECTelemetry(p2) then
		UGCValidationService:ReportUGCValidationFailureTelemetry(ErrorType)
	end
end

function AnalyticsModule.reportThumbnailing(Time, p1) --[[ Line: 227 ]]
	-- upvalues: RunService (copy), joinTables (copy), AnalyticsModule (copy), RbxAnalyticsService (copy), StudioService (copy)
	RbxAnalyticsService:SendEventDeferred(if RunService:IsStudio() then "studio" else "rcc", "ugcValidation", "thumbnailing", (joinTables(AnalyticsModule.metadata, p1 or {}, {
		time = Time,
		studioSid = RbxAnalyticsService:GetSessionId(),
		clientId = RbxAnalyticsService:GetClientId(),
		placeId = game.PlaceId,
		userId = if StudioService then StudioService:GetUserId() else 0
	})))
end

function AnalyticsModule.recordScriptTime(Key, p1, p2) --[[ Line: 239 ]]
	-- upvalues: GetEngineFeatureEngineUGCValidationReportScriptTimeModule (copy)
	if not GetEngineFeatureEngineUGCValidationReportScriptTimeModule() then return end
	if not p2.scriptTimes then
		p2.scriptTimes = {}
	end
	local ScriptTimes = p2.scriptTimes
	
	if not ScriptTimes[Key] then
		ScriptTimes[Key] = 0
	end
	ScriptTimes[Key] += tick() - p1
end

function AnalyticsModule.reportScriptTimes(p1) --[[ Line: 257 ]]
	-- upvalues: GetEngineFeatureEngineUGCValidationReportScriptTimeModule (copy), RunService (copy), AnalyticsModule (copy), UGCValidationService (copy)
	if not GetEngineFeatureEngineUGCValidationReportScriptTimeModule() then return end
	if p1.isServer and not RunService:IsStudio() and p1.scriptTimes then
		assert(AnalyticsModule.metadata, "Metadata is never nil")
		local Entrypoint = AnalyticsModule.metadata.entrypoint
		UGCValidationService:ReportUGCValidationTelemetry(if p1.assetTypeEnum then p1.assetTypeEnum.Name elseif Entrypoint and type(Entrypoint) == "string" and #Entrypoint > 0 then Entrypoint else "FullBody", p1.scriptTimes)
	end
end

return AnalyticsModule