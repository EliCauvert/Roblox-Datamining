local parent = script.Parent
local _ = require(parent.util.Types)
local runService = game:GetService("RunService")
local UGCValidationService = game:GetService("UGCValidationService")
local var1 = if runService:IsStudio() then game:GetService("StudioService") else nil
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local getEngineFeatureEngineUGCValidationReportScriptTimeModule = require(parent.flags.getEngineFeatureEngineUGCValidationReportScriptTime)
local getEngineFeatureEngineUGCValidationIECTelemetryModule = require(parent.flags.getEngineFeatureEngineUGCValidationIECTelemetry)
local getEngineFeatureEngineUGCValidateRigidNonSkinnedModule = require(parent.flags.getEngineFeatureEngineUGCValidateRigidNonSkinned)
local getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule = require(parent.flags.getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBounds)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local getFFlagUGCValidateHSRMeshIdsModule = require(parent.flags.getFFlagUGCValidateHSRMeshIds)
local getFFlagUGCValidationEyebrowEyelashSupportModule = require(parent.flags.getFFlagUGCValidationEyebrowEyelashSupport)
local getFFlagUGCValidateCurveAnimRotationSpeedModule = require(parent.flags.getFFlagUGCValidateCurveAnimRotationSpeed)
local getFFlagUGCValidateTexturePackModule = require(parent.flags.getFFlagUGCValidateTexturePack)

local function joinTables(...)
	local t = {}
	
	for i_1 = 1, select("#", ...) do
		for i, v in select(i_1, ...) do
			t[i] = v
		end
	end
	return t
end

local t = {
	ErrorType = {
		resetPhysicsData_FailedToLoadMesh = "resetPhysicsData_FailedToLoadMesh",
		validateAccurateBoundingBox = "validateAccurateBoundingBox",
		validateAssetBounds_AssetSizeTooBig = "validateAssetBounds_AssetSizeTooBig",
		validateAssetBounds_AssetSizeTooSmall = "validateAssetBounds_AssetSizeTooSmall",
		validateAssetBounds_InconsistentAvatarPartScaleType = "validateAssetBounds_InconsistentAvatarPartScaleType",
		validateScaleType_InvalidAvatarPartScaleType = "validateScaleType_InvalidAvatarPartScaleType",
		validateAssetCreator_DependencyNotOwnedByCreator = "validateAssetCreator_DependencyNotOwnedByCreator",
		validateAssetCreator_FailedToLoad = "validateAssetCreator_FailedToLoad",
		validateAssetCreator_TooManyDependencies = "validateAssetCreator_TooManyDependencies",
		validateAssetTransparency_AssetTransparencyThresholds = "validateAssetTransparency_AssetTransparencyThresholds",
		validateAttributes = "validateAttributes",
		validateBodyPartChildAttachmentBounds_InvalidAttachmentPosition = "validateBodyPartChildAttachmentBounds_InvalidAttachmentPosition",
		validateBodyPartCollisionFidelity = "validateBodyPartCollisionFidelity",
		validateBodyPartMeshBounds_FailedToLoadMesh = "validateBodyPartMeshBounds_FailedToLoadMesh",
		validateCageUVs_TestExecutedSuccessfully = "validateCageUVs_TestExecutedSuccessfully",
		validateCageUVs_TestPassed = "validateCageUVs_TestPassed",
		validateCageUVTriangleArea_FailedToLoadMesh = "validateCageUVTriangleArea_FailedToLoadMesh",
		validateCageUVTriangleArea_ZeroAreaTriangle = "validateCageUVTriangleArea_ZeroAreaTriangle",
		validateCageUVValues_FailedToLoadMesh = "validateCageUVValues_FailedToLoadMesh",
		validateCageUVValues_UnexpectedUVValue = "validateCageUVValues_UnexpectedUVValue",
		validateCanLoad = "validateCanLoad",
		validateDependencies_IsNotApproved = "validateDependencies_IsNotApproved",
		validateDependencies_IsRestrictedUserId = "validateDependencies_IsRestrictedUserId",
		validateDependencies_IsReviewing = "validateDependencies_IsReviewing",
		validateDependencies_ParseFailure = "validateDependencies_ParseFailure",
		validateDescendantMeshMetrics_FailedToCalculateTriangles = "validateDescendantMeshMetrics_FailedToCalculateTriangles",
		validateDescendantMeshMetrics_FailedToLoadMesh = "validateDescendantMeshMetrics_FailedToLoadMesh",
		validateDescendantMeshMetrics_HasSkinnedMeshMismatch = "validateDescendantMeshMetrics_HasSkinnedMeshMismatch",
		validateDescendantMeshMetrics_NoSkinningInfo = "validateDescendantMeshMetrics_NoSkinningInfo",
		validateDescendantMeshMetrics_TooFarFromOrigin = "validateDescendantMeshMetrics_TooFarFromOrigin",
		validateDescendantMeshMetrics_TooManyTriangles = "validateDescendantMeshMetrics_TooManyTriangles",
		validateDynamicHeadMeshPartFormat_FailedToLoadMesh = "validateDynamicHeadMeshPartFormat_FailedToLoadMesh",
		validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh = "validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh",
		validateFullBody_IncorrectAssetTypeSet = "validateFullBody_IncorrectAssetTypeSet",
		validateFullBody_InstancesMissing = "validateFullBody_InstancesMissing",
		validateFullBody_MeshIdsMissing = "validateFullBody_MeshIdsMissing",
		validateHSR_HSRDataNotReady = "validateHSR_HSRDataNotReady",
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
		validateMaterials = "validateMaterials",
		validateMeshBounds_FailedToExecute = "validateMeshBounds_FailedToExecute",
		validateMeshBounds_FailedToLoadMesh = "validateMeshBounds_FailedToLoadMesh",
		validateMeshBounds_TooLarge = "validateMeshBounds_TooLarge",
		validateMeshComparison = "validateMeshComparison",
		validateMeshPartAccessory_DoubleSided = "validateMeshPartAccessory_DoubleSided",
		validateMeshPartAccessory_FailedToLoadMesh = "validateMeshPartAccessory_FailedToLoadMesh",
		validateMeshPartAccessory_NoMeshId = "validateMeshPartAccessory_NoMeshId",
		validateMeshPartBodyPart_ValidateWithSchema = "validateMeshPartBodyPart_ValidateWithSchema",
		validateMeshTriangleArea_FailedToLoadMesh = "validateMeshTriangleArea_FailedToLoadMesh",
		validateMeshTriangleArea_NoArea = "validateMeshTriangleArea_NoArea",
		validateMeshTriangles_FailedToExecute = "validateMeshTriangles_FailedToExecute",
		validateMeshTriangles_FailedToLoadMesh = "validateMeshTriangles_FailedToLoadMesh",
		validateMeshTriangles_TooManyTriangles = "validateMeshTriangles_TooManyTriangles",
		validateMeshVertexColors_FailedToLoadMesh = "validateMeshVertexColors_FailedToLoadMesh",
		validateMeshVertexColors_NonNeutralVertexColors = "validateMeshVertexColors_NonNeutralVertexColors",
		validateModeration_AssetsHaveNotPassedModeration = "validateModeration_AssetsHaveNotPassedModeration",
		validateModeration_CouldNotFetchModerationDetails = "validateModeration_CouldNotFetchModerationDetails",
		validateModeration_FailedToParse = "validateModeration_FailedToParse",
		validateModeration_ValidateUser = "validateModeration_ValidateUser",
		validatePackage_FailedToParse = "validatePackage_FailedToParse",
		validateProperties_PropertyDoesNotExist = "validateProperties_PropertyDoesNotExist",
		validateProperties_PropertyMismatch = "validateProperties_PropertyMismatch",
		validateSingleInstance_MultipleInstances = "validateSingleInstance_MultipleInstances",
		validateSingleInstance_ZeroInstances = "validateSingleInstance_ZeroInstances",
		validateSurfaceAppearances_InvalidAlphaMode = "validateSurfaceAppearances_InvalidAlphaMode",
		validateSurfaceAppearances_MeshPartHasTexture = "validateSurfaceAppearances_MeshPartHasTexture",
		validateSurfaceAppearances_MissingSurfaceAppearance = "validateSurfaceAppearances_MissingSurfaceAppearance",
		validateTags = "validateTags",
		validateTextureSize_FailedToExecute = "validateTextureSize_FailedToExecute",
		validateTextureSize_FailedToLoadTexture = "validateTextureSize_FailedToLoadTexture",
		validateTextureSize_InvalidTextureId = "validateTextureSize_InvalidTextureId",
		validateTextureSize_TextureTooBig = "validateTextureSize_TextureTooBig",
		validateTextureTransparency_InvalidTextureId = "validateTextureTransparency_InvalidTextureId",
		validateTextureTransparency_TransparentTexture = "validateTextureTransparency_TransparentTexture",
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
		validateBodyPartCage_FailedToExecute = "validateBodyPartCage_FailedToExecute",
		validateBodyPartCage_VertsAreTooFarInFrontOfRenderMesh = "validateBodyPartCage_VertsAreTooFarInFrontOfRenderMesh",
		validateCurveAnimation_IncorrectNumericalData = "validateCurveAnimation_IncorrectNumericalData",
		validateCurveAnimation_PositionalMovement = "validateCurveAnimation_PositionalMovement",
		validateVerticesSimilarity_FailedToExecute = "validateVerticesSimilarity_FailedToExecute",
		validateVerticesSimilarity_MaxSimilarityExceeded = "validateVerticesSimilarity_MaxSimilarityExceeded",
		validateCagingRelevancy_FailedToExecute = "validateCagingRelevancy_FailedToExecute",
		validateCagingRelevancy_IrrelevantCaging = "validateCagingRelevancy_IrrelevantCaging",
		validateCageMeshDistance_FailedToExecute = "validateCageMeshDistance_FailedToExecute",
		validateCageMeshDistance_OuterCageToMeshDistance = "validateCageMeshDistance_OuterCageToMeshDistance",
		validateCageUVDuplicate_FailedToExecute = "validateCageUVDuplicate_FailedToExecute",
		validateCageUVDuplicate_UnexpectedUVValue = "validateCageUVDuplicate_UnexpectedUVValue",
		validatePartSizeWithinRenderSizeLimits_SizeExceeded = "validatePartSizeWithinRenderSizeLimits_SizeExceeded",
		validateLayeredClothingAccessory_HandleIsScaled = "validateLayeredClothingAccessory_HandleIsScaled",
		resetPhysicsData_LargeMass = "resetPhysicsData_LargeMass",
		validateBodyAttPosRelativeToParent_PartAboveParent = "validateBodyAttPosRelativeToParent_PartAboveParent",
		validateBodyAttPosRelativeToParent_ParentBelowPart = "validateBodyAttPosRelativeToParent_ParentBelowPart",
		validateBodyBlockingTests_ZeroMeshSize = "validateBodyBlockingTests_ZeroMeshSize",
		validateFullBody_ZeroMeshSize = "validateFullBody_ZeroMeshSize",
		validateMeshBounds_Shifted = "validateMeshBounds_Shifted",
		validateBodyPartChildAttachmentOrientations_RotatedRig = "validateBodyPartChildAttachmentOrientations_RotatedRig",
		validateBodyPartChildAttachmentOrientations_RotatedGrip = "validateBodyPartChildAttachmentOrientations_RotatedGrip",
		validateBodyPartChildAttachmentOrientations_RotatedBasic = "validateBodyPartChildAttachmentOrientations_RotatedBasic",
		validateDeformedLayeredClothingInRenderBounds_FailedToExecute = "validateDeformedLayeredClothingInRenderBounds_FailedToExecute",
		validateDeformedLayeredClothingInRenderBounds_ClothingOutOfBounds = "validateDeformedLayeredClothingInRenderBounds_ClothingOutOfBounds",
		validateEmoteAnimation_FailedToDownloadCurveAnimation = "validateEmoteAnimation_FailedToDownloadCurveAnimation",
		validateCurveAnimation_AnimationHierarchyIsIncorrect = "validateCurveAnimation_AnimationHierarchyIsIncorrect",
		validateCurveAnimation_AnimationContainsNoJointManipulation = "validateCurveAnimation_AnimationContainsNoJointManipulation",
		validateCurveAnimation_UnacceptableLength = "validateCurveAnimation_UnacceptableLength",
		validateCurveAnimation_UnacceptableSizeBounds = "validateCurveAnimation_UnacceptableSizeBounds",
		validateCurveAnimation_UnacceptableFrameDelta = "validateCurveAnimation_UnacceptableFrameDelta"
	}
}

if getFFlagUGCValidateTexturePackModule() then
	t.ErrorType.validateTexturePack_InvalidTexturePackURL = "validateTexturePack_InvalidTexturePackURL"
	t.ErrorType.validateTexturePack_FailedToDownloadTexturePack = "validateTexturePack_FailedToDownloadTexturePack"
	t.ErrorType.validateTexturePack_TexturePackMismatch = "validateTexturePack_TexturePackMismatch"
end
t.ErrorType.validateLegsSeparation_InvalidAttachmentPosition = "validateLegsSeparation_InvalidAttachmentPosition"
t.ErrorType.validateLegsSeparation_LegsOverlap = "validateLegsSeparation_LegsOverlap"

if getEngineFeatureEngineUGCValidateRigidNonSkinnedModule() then
	t.ErrorType.validateRigidMeshSkinning_FailedToDownload = "validateRigidMeshSkinning_FailedToDownload"
	t.ErrorType.validateRigidMeshSkinning_BonesFoundInMesh = "validateRigidMeshSkinning_BonesFoundInMesh"
end
if getFFlagUGCValidateCurveAnimRotationSpeedModule() then
	t.ErrorType.validateCurveAnimation_UnacceptableFrameRotationDelta = "validateCurveAnimation_UnacceptableFrameRotationDelta"
end
t.ErrorType.validateCurveAnimation_IncorrectAnimationRigData = "validateCurveAnimation_IncorrectAnimationRigData"
t.ErrorType.validateMeshSizeProperty_FailedToLoadMesh = "validateMeshSizeProperty_FailedToLoadMesh"
t.ErrorType.validateMeshSizeProperty_Mismatch = "validateMeshSizeProperty_Mismatch"
t.ErrorType.validateBodyPartVertsSkinnedToR15_FailedToFetchSkinning = "validateBodyPartVertsSkinnedToR15_FailedToFetchSkinning"
t.ErrorType.validateBodyPartVertsSkinnedToR15_BodyIsSkinnedToFakeJoints = "validateBodyPartVertsSkinnedToR15_BodyIsSkinnedToFakeJoints"
t.ErrorType.validateSkinningTransfer_FailedToExecute = "validateSkinningTransfer_FailedToExecute"
t.ErrorType.validateSkinningTransfer_BodyPartsWithSpecialJoints = "validateSkinningTransfer_BodyPartsWithSpecialJoints"
t.ErrorType.validateSkinningTransfer_SkinningTransferOverride = "validateSkinningTransfer_SkinningTransferOverride"
t.ErrorType.validateSkinningTransfer_Weights = "validateSkinningTransfer_Weights"

if getFFlagUGCValidationEyebrowEyelashSupportModule() then
	t.ErrorType.validateSkinningTransfer_RequiredAssetTypes = "validateSkinningTransfer_RequiredAssetTypes"
end
if getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
	t.ErrorType.validatePropertiesSensible_IncorrectPropertiesFound = "validatePropertiesSensible_IncorrectPropertiesFound"
end
t.ErrorType.validateHSR_FileDataInvalid = "validateHSR_FileDataInvalid"

if getFFlagUGCValidateHSRMeshIdsModule() then
	t.ErrorType.validataHSR_HSRMeshIdsMismatch = "validataHSR_HSRMeshIdsMismatch"
end
t.ErrorType.validateMakeupDecal_FailedToLoadTexture = "validateMakeupDecal_FailedToLoadTexture"
t.ErrorType.validateMakeupDecal_NoColorMap = "validateMakeupDecal_NoColorMap"
t.ErrorType.validateMakeupDecal_UVZoneError = "validateMakeupDecal_UVZoneError"
t.ErrorType.validateWrapTextureTransfer_FailedToLoadCage = "validateWrapTextureTransfer_FailedToLoadCage"
t.ErrorType.validateWrapTextureTransfer_NoCage = "validateWrapTextureTransfer_NoCage"
t.ErrorType.validateWrapTextureTransfer_FailedToLoadUV = "validateWrapTextureTransfer_FailedToLoadUV"
t.ErrorType.validateWrapTextureTransfer_InvalidUV = "validateWrapTextureTransfer_InvalidUV"
t.ErrorType.validateWrapTextureTransfer_InvalidMinBound = "validateWrapTextureTransfer_InvalidMinBound"
t.ErrorType.validateWrapTextureTransfer_InvalidMaxBound = "validateWrapTextureTransfer_InvalidMaxBound"

if getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBoundsModule() then
	t.ErrorType.validateFACSJointTransformsWithinBounds_Error = "validateFACSJointTransformsWithinBounds_Error"
	t.ErrorType.validateFACSJointTransformsWithinBounds_OOB = "validateFACSJointTransformsWithinBounds_OOB"
end
setmetatable(t.ErrorType, {
	__index = function(_, p1)
		return `UNREGISTERED_{p1}`
	end
})
t.metadata = {}

function t.setMetadata(value)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in value do
		t_1[i] = tostring(v)
	end
	t.metadata = t_1
end

function t.shouldReportIECTelemetry(p1)
	-- upvalues: getEngineFeatureEngineUGCValidationIECTelemetryModule (ref), runService (ref)
	return if getEngineFeatureEngineUGCValidationIECTelemetryModule() then if p1 then runService:IsStudio() or not p1.allowEditableInstances or not p1.isServer else false else false
end

function t.reportCounter(p1, p2, p3)
	-- upvalues: t (ref), UGCValidationService (ref)
	if t.shouldReportIECTelemetry(p3) then
		UGCValidationService:ReportUGCValidationCounter(p1, p2)
	end
end

function t.reportFailure(p1, p2, p3)
	-- upvalues: runService (ref), joinTables (ref), t (ref), rbxAnalyticsService (ref), var1 (ref), UGCValidationService (ref)
	rbxAnalyticsService:SendEventDeferred(if runService:IsStudio() then "studio" else "rcc", "ugcValidation", "failure", joinTables(t.metadata, p2 or {}, {
		errorType = p1,
		studioSid = rbxAnalyticsService:GetSessionId(),
		clientId = rbxAnalyticsService:GetClientId(),
		placeId = game.PlaceId,
		userId = if var1 then var1:GetUserId() else 0
	}))
	
	if t.shouldReportIECTelemetry(p3) then
		UGCValidationService:ReportUGCValidationFailureTelemetry(p1)
	end
end

function t.reportThumbnailing(p1, p2)
	-- upvalues: runService (ref), joinTables (ref), t (ref), rbxAnalyticsService (ref), var1 (ref)
	rbxAnalyticsService:SendEventDeferred(if runService:IsStudio() then "studio" else "rcc", "ugcValidation", "thumbnailing", joinTables(t.metadata, p2 or {}, {
		time = p1,
		studioSid = rbxAnalyticsService:GetSessionId(),
		clientId = rbxAnalyticsService:GetClientId(),
		placeId = game.PlaceId,
		userId = if var1 then var1:GetUserId() else 0
	}))
end

function t.recordScriptTime(p1, p2, p3)
	-- upvalues: getEngineFeatureEngineUGCValidationReportScriptTimeModule (ref)
	if not getEngineFeatureEngineUGCValidationReportScriptTimeModule() then return end
	if not p3.scriptTimes then
		p3.scriptTimes = {}
	end
	local scriptTimes = p3.scriptTimes
	
	if not scriptTimes[p1] then
		scriptTimes[p1] = 0
	end
	scriptTimes[p1] += tick() - p2
end

function t.reportScriptTimes(p1)
	-- upvalues: getEngineFeatureEngineUGCValidationReportScriptTimeModule (ref), runService (ref), t (ref), UGCValidationService (ref)
	if not getEngineFeatureEngineUGCValidationReportScriptTimeModule() then return end
	if p1.isServer and not runService:IsStudio() and p1.scriptTimes then
		assert(t.metadata, "Metadata is never nil")
		local entrypoint = t.metadata.entrypoint
		local var2 = "FullBody"
		
		if p1.assetTypeEnum then
			var2 = p1.assetTypeEnum.Name
		elseif entrypoint and type(entrypoint) == "string" and #entrypoint > 0 then
			var2 = entrypoint
		end
		UGCValidationService:ReportUGCValidationTelemetry(var2, p1.scriptTimes)
	end
end

return t