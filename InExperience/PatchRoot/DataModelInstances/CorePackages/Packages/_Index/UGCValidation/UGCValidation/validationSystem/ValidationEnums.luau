local ValidationEnumsModule = {}

local function createEnumMetatable(p1) --[[ Line: 8 ]]
	return {
		__metatable = "This metatable is protected",
		__index = function(_, p2) --[[ Line: 10 ]]
			-- upvalues: p1 (copy)
			error("Invalid ValidationEnums." .. p1 .. " enum value: " .. tostring(p2))
		end,
		__newindex = function(_, _, _) --[[ Line: 13 ]]
			error("Cannot add new keys to ValidationEnums")
		end
	}
end

local function finalizeEnumTable(Text) --[[ Line: 20 ]]
	-- upvalues: ValidationEnumsModule (copy), createEnumMetatable (copy)
	if ValidationEnumsModule[Text] == nil then
		error(Text .. " enum table is not found")
	end
	for i, value in ValidationEnumsModule[Text] do
		if typeof(i) ~= "string" then
			error(Text .. " enum table has non string key " .. tostring(i))
		elseif i ~= value then
			error(Text .. " enum table has non-matching key and value for key " .. tostring(i))
		end
	end
	setmetatable(ValidationEnumsModule[Text], (createEnumMetatable(Text)))
end

ValidationEnumsModule.ValidationModule = {
	ExpectedRootSchema = "ExpectedRootSchema",
	SingleInstanceSelected = "SingleInstanceSelected",
	SerializedAssetSizeBounded = "SerializedAssetSizeBounded",
	NoExtraTags = "NoExtraTags",
	AttributesAllowed = "AttributesAllowed",
	MaterialsAllowed = "MaterialsAllowed",
	PropertyRequirementsValid = "PropertyRequirementsValid",
	ArchivableRequired = "ArchivableRequired",
	PropertiesSensible = "PropertiesSensible",
	InstanceTreeMatchesSchema = "InstanceTreeMatchesSchema",
	DescendantIdsAllowed = "DescendantIdsAllowed",
	DescendantIdsPublished = "DescendantIdsPublished",
	ScaleTypeValid = "ScaleTypeValid",
	CollisionFidelityCorrect = "CollisionFidelityCorrect",
	AttachmentBoundsValid = "AttachmentBoundsValid",
	AttachmentOrientationsValid = "AttachmentOrientationsValid",
	HSRAssetStructureValid = "HSRAssetStructureValid",
	HSRMeshIdsMatch = "HSRMeshIdsMatch",
	ThumbnailConfigValid = "ThumbnailConfigValid",
	DescendantIdsNotMissing = "DescendantIdsNotMissing",
	ContentNotEditable = "ContentNotEditable",
	NoFACSOverrideData = "NoFACSOverrideData",
	FacsHeadConsistency = "FacsHeadConsistency",
	DynamicHeadFacsPresent = "DynamicHeadFacsPresent",
	DynamicHeadControlsActive = "DynamicHeadControlsActive",
	FacsJointBoundsValid = "FacsJointBoundsValid",
	FacsJointCountBounded = "FacsJointCountBounded",
	HrdBonesFollowSchema = "HrdBonesFollowSchema",
	HrdPropertiesSensible = "HrdPropertiesSensible",
	TposeAdjustmentSensible = "TposeAdjustmentSensible",
	BoneCFramesInBounds = "BoneCFramesInBounds",
	JointRotationAttachmentsLimited = "JointRotationAttachmentsLimited",
	MoveableAttachmentsExist = "MoveableAttachmentsExist",
	FacsNotDrivingSchema = "FacsNotDrivingSchema",
	BodySkinnedToSchema = "BodySkinnedToSchema",
	RigidSkinnedToSchema = "RigidSkinnedToSchema",
	LCSkinnedToSchema = "LCSkinnedToSchema",
	TextureSizeBounded = "TextureSizeBounded",
	SurfaceAppearanceTexturesBounded = "SurfaceAppearanceTexturesBounded",
	AssetOpacityValid = "AssetOpacityValid",
	SurfaceAppearanceOpacityValid = "SurfaceAppearanceOpacityValid",
	MeshBoundsValid = "MeshBoundsValid",
	TriangleCountBounded = "TriangleCountBounded",
	SurfaceAreaBounded = "SurfaceAreaBounded",
	VertexDensityBounded = "VertexDensityBounded",
	TriangleAreaValid = "TriangleAreaValid",
	SurfaceAppearancePresent = "SurfaceAppearancePresent",
	TexturePackConsistent = "TexturePackConsistent",
	VertexColorsOpaque = "VertexColorsOpaque",
	NoCoplanarTriangles = "NoCoplanarTriangles",
	PoseCorrect = "PoseCorrect",
	LegsSeparated = "LegsSeparated",
	BoundingBoxAccurate = "BoundingBoxAccurate",
	BodyBlockingTestsPass = "BodyBlockingTestsPass",
	CageUVCountValid = "CageUVCountValid",
	CageUVValuesCorrect = "CageUVValuesCorrect",
	CageUVAreaValid = "CageUVAreaValid",
	CageUVNoDuplicates = "CageUVNoDuplicates",
	CageModifiedAreaValid = "CageModifiedAreaValid",
	AssetBoundsValid = "AssetBoundsValid",
	BodyMeshSizesConsistent = "BodyMeshSizesConsistent",
	ExtentsWithinParent = "ExtentsWithinParent",
	IndividualMeshPartBoundsValid = "IndividualMeshPartBoundsValid",
	MeshSizePropertyCorrect = "MeshSizePropertyCorrect",
	LCDeformationWithinBounds = "LCDeformationWithinBounds",
	VerticesNotCoincident = "VerticesNotCoincident",
	CageMeshDistanceBounded = "CageMeshDistanceBounded",
	BodyPartCageDistanceValid = "BodyPartCageDistanceValid",
	LCWithinRenderBounds = "LCWithinRenderBounds",
	WrapTextureValid = "WrapTextureValid",
	MakeupDecalValid = "MakeupDecalValid",
	LeaderSkinnedVertsNearCageIslands = "LeaderSkinnedVertsNearCageIslands",
	CurveAnimDataAvailable = "CurveAnimDataAvailable",
	CurveAnimHierarchyCorrect = "CurveAnimHierarchyCorrect",
	CurveAnimRigDataPresent = "CurveAnimRigDataPresent",
	CurveAnimMarkerCurvesLimited = "CurveAnimMarkerCurvesLimited",
	CurveAnimNoScripts = "CurveAnimNoScripts",
	CurveAnimAllowedTypes = "CurveAnimAllowedTypes",
	CurveAnimNumericalDataValid = "CurveAnimNumericalDataValid",
	CurveAnimTagsValid = "CurveAnimTagsValid",
	EmoteAnimationAttributesAccurate = "EmoteAnimationAttributesAccurate",
	CurveAnimJointsManipulated = "CurveAnimJointsManipulated",
	CurveAnimFrameDataSensible = "CurveAnimFrameDataSensible",
	CurveAnimJointsAnimated = "CurveAnimJointsAnimated",
	CurveAnimPositionBounded = "CurveAnimPositionBounded",
	CurveAnimLengthBounded = "CurveAnimLengthBounded",
	CurveAnimBoundsValid = "CurveAnimBoundsValid",
	CurveAnimSpeedBounded = "CurveAnimSpeedBounded",
	CurveAnimRotationBounded = "CurveAnimRotationBounded",
	CurveAnimJointRotationLimited = "CurveAnimJointRotationLimited",
	AnimationWeightPositive = "AnimationWeightPositive",
	AnimationPackNoDuplicateIds = "AnimationPackNoDuplicateIds",
	CurveAnimBonesAllowed = "CurveAnimBonesAllowed",
	CurveAnimBonesRotationOnly = "CurveAnimBonesRotationOnly",
	CurveAnimBonesHaveValidNames = "CurveAnimBonesHaveValidNames",
	CurveAnimBonesHaveValidParents = "CurveAnimBonesHaveValidParents",
	CurveAnimPartsRotateOnlyIfBones = "CurveAnimPartsRotateOnlyIfBones",
	CurveAnimBoneHierarchyValid = "CurveAnimBoneHierarchyValid",
	CurveAnimLoopingRequired = "CurveAnimLoopingRequired",
	CurveAnimStrictSchema = "CurveAnimStrictSchema",
	EmissiveMapAllowed = "EmissiveMapAllowed",
	EmissiveAreaChecks = "EmissiveAreaChecks"
}
ValidationEnumsModule.SharedDataMember = {
	jobId = "jobId",
	entrypointInput = "entrypointInput",
	rootInstance = "rootInstance",
	uploadCategory = "uploadCategory",
	uploadEnum = "uploadEnum",
	consumerConfig = "consumerConfig",
	aqsFetchMetrics = "aqsFetchMetrics",
	r15LegacyDuplicateRoot = "r15LegacyDuplicateRoot",
	aqsSummaryData = "aqsSummaryData",
	renderMeshesData = "renderMeshesData",
	innerCagesData = "innerCagesData",
	outerCagesData = "outerCagesData",
	meshTextures = "meshTextures",
	curveAnimations = "curveAnimations",
	curveAnimComputedFrames = "curveAnimComputedFrames",
	contentIds = "contentIds",
	hsrAssets = "hsrAssets",
	curveAnimBoneData = "curveAnimBoneData",
	fullBodyPartsMetrics = "fullBodyPartsMetrics"
}
finalizeEnumTable("SharedDataMember")
ValidationEnumsModule.ValidationConfig = {
	categories = "categories",
	fflag = "fflag",
	shadowFlag = "shadowFlag",
	prereqTests = "prereqTests",
	requiredData = "requiredData",
	conditionalData = "conditionalData",
	knownAqsUserErrors = "knownAqsUserErrors",
	expectedFailures = "expectedFailures",
	run = "run"
}
finalizeEnumTable("ValidationConfig")
ValidationEnumsModule.AssetQualityFetchStatus = {
	assetQualityFetchNA = "assetQualityFetchNA",
	assetQualityFetchInProgress = "assetQualityFetchInProgress",
	assetQualityFetchSuccess = "assetQualityFetchSuccess",
	assetQualityFetchFailure = "assetQualityFetchFailure"
}
finalizeEnumTable("AssetQualityFetchStatus")
ValidationEnumsModule.ConsumerEnv = { Studio = "Studio", Backend = "Backend", IEC = "IEC" }
finalizeEnumTable("ConsumerEnv")
ValidationEnumsModule.ValidationEnv = { Studio = "Studio", Backend = "Backend", IEC = "IEC" }
finalizeEnumTable("ValidationEnv")
ValidationEnumsModule.Status = {
	CANNOT_START = "CANNOT_START",
	TIMEOUT = "TIMEOUT",
	ERROR = "ERROR",
	FAIL = "FAIL",
	PASS = "PASS",
	IN_PROGRESS = "IN_PROGRESS"
}
finalizeEnumTable("Status")
ValidationEnumsModule.AssetQualityCheck = {
	Measure_Dynamic_Head = "Measure_Dynamic_Head",
	Measure_Cage_Distance_Head = "Measure_Cage_Distance_Head",
	Measure_Cage_Mesh_Distance = "Measure_Cage_Mesh_Distance",
	Measure_Cage_Mesh_Distance_Avatar = "Measure_Cage_Mesh_Distance_Avatar",
	Measure_Cage_UV = "Measure_Cage_UV",
	Measure_Cage_UV_Avatar = "Measure_Cage_UV_Avatar",
	Measure_Cage_Relevancy = "Measure_Cage_Relevancy",
	Measure_Mesh_Outside_OuterCage = "Measure_Mesh_Outside_OuterCage",
	Measure_Degen_Triangles = "Measure_Degen_Triangles",
	Measure_Mesh_Manifold = "Measure_Mesh_Manifold",
	Measure_Mesh_Watertight = "Measure_Mesh_Watertight",
	Measure_Triangle_Intersection = "Measure_Triangle_Intersection",
	Measure_UV_Bound = "Measure_UV_Bound",
	Measure_Vertex_Similarity = "Measure_Vertex_Similarity",
	Measure_Joint_Number = "Measure_Joint_Number",
	Measure_Texture_Complexity = "Measure_Texture_Complexity",
	Measure_Texture_Resolution = "Measure_Texture_Resolution",
	Measure_Mesh_Island_Volume = "Measure_Mesh_Island_Volume",
	Measure_Mesh_Island_ML = "Measure_Mesh_Island_ML",
	Measure_Animation_Duration = "Measure_Animation_Duration",
	Measure_Cage_Part_Placement = "Measure_Cage_Part_Placement"
}
finalizeEnumTable("AssetQualityCheck")
finalizeEnumTable("ValidationModule")
ValidationEnumsModule.UploadCategory = {
	TORSO_AND_LIMBS = "TORSO_AND_LIMBS",
	DYNAMIC_HEAD = "DYNAMIC_HEAD",
	LAYERED_CLOTHING = "LAYERED_CLOTHING",
	EYEBROW_EYELASH = "EYEBROW_EYELASH",
	RIGID_ACCESSORY = "RIGID_ACCESSORY",
	EMOTE_ANIMATION = "EMOTE_ANIMATION",
	MAKEUP = "MAKEUP",
	FULL_BODY = "FULL_BODY",
	BOTH_SHOES = "BOTH_SHOES",
	ANIMATION_PACK = "ANIMATION_PACK",
	ANIMATION = "ANIMATION"
}
finalizeEnumTable("UploadCategory")

return ValidationEnumsModule