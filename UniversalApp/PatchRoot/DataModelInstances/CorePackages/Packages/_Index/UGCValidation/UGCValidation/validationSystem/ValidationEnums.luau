local t = {}

local function createEnumMetatable(p0) --[[ line: 8 ]]
	return {
		__metatable = "This metatable is protected",
		__index = function(_, p1) --[[ line: 10 ]]
			-- upvalues: p0 (ref)
			error("Invalid ValidationEnums." .. p0 .. " enum value: " .. tostring(p1))
		end,
		__newindex = function(_, _, _) --[[ line: 13 ]]
			error("Cannot add new keys to ValidationEnums")
		end
	}
end

local function finalizeEnumTable(p2) --[[ line: 20 ]]
	-- upvalues: t (ref), createEnumMetatable (ref)
	if t[p2] == nil then
		error(p2 .. " enum table is not found")
	end
	for i, v in t[p2] do
		if typeof(i) ~= "string" then
			error(p2 .. " enum table has non string key " .. tostring(i))
		elseif i ~= v then
			error(p2 .. " enum table has non-matching key and value for key " .. tostring(i))
		end
	end
	setmetatable(t[p2], createEnumMetatable(p2))
end

t.ValidationModule = {
	ExpectedRootSchema = "ExpectedRootSchema",
	SingleInstanceSelected = "SingleInstanceSelected",
	NoExtraTags = "NoExtraTags",
	AttributesAllowed = "AttributesAllowed",
	MaterialsAllowed = "MaterialsAllowed",
	PropertyRequirementsValid = "PropertyRequirementsValid",
	PropertiesSensible = "PropertiesSensible",
	InstanceTreeMatchesSchema = "InstanceTreeMatchesSchema",
	DescendantIdsAllowed = "DescendantIdsAllowed",
	ScaleTypeValid = "ScaleTypeValid",
	CollisionFidelityCorrect = "CollisionFidelityCorrect",
	AttachmentBoundsValid = "AttachmentBoundsValid",
	AttachmentOrientationsValid = "AttachmentOrientationsValid",
	HSRAssetStructureValid = "HSRAssetStructureValid",
	HSRMeshIdsMatch = "HSRMeshIdsMatch",
	ThumbnailConfigValid = "ThumbnailConfigValid",
	DescendantIdsNotMissing = "DescendantIdsNotMissing",
	NoFACSOverrideData = "NoFACSOverrideData",
	FacsHeadConsistency = "FacsHeadConsistency",
	DynamicHeadFacsPresent = "DynamicHeadFacsPresent",
	DynamicHeadControlsActive = "DynamicHeadControlsActive",
	FacsJointBoundsValid = "FacsJointBoundsValid",
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
	CurveAnimBonesAllowed = "CurveAnimBonesAllowed",
	CurveAnimBonesRotationOnly = "CurveAnimBonesRotationOnly",
	CurveAnimBonesHaveValidNames = "CurveAnimBonesHaveValidNames",
	CurveAnimBonesHaveValidParents = "CurveAnimBonesHaveValidParents",
	CurveAnimPartsRotateOnlyIfBones = "CurveAnimPartsRotateOnlyIfBones",
	CurveAnimBoneHierarchyValid = "CurveAnimBoneHierarchyValid",
	CurveAnimLoopingRequired = "CurveAnimLoopingRequired",
	EmissiveMapAllowed = "EmissiveMapAllowed"
}
t.SharedDataMember = {
	jobId = "jobId",
	entrypointInput = "entrypointInput",
	rootInstance = "rootInstance",
	uploadCategory = "uploadCategory",
	uploadEnum = "uploadEnum",
	consumerConfig = "consumerConfig",
	aqsFetchMetrics = "aqsFetchMetrics",
	aqsSummaryData = "aqsSummaryData",
	renderMeshesData = "renderMeshesData",
	innerCagesData = "innerCagesData",
	outerCagesData = "outerCagesData",
	meshTextures = "meshTextures",
	curveAnimations = "curveAnimations",
	curveAnimComputedFrames = "curveAnimComputedFrames",
	contentIds = "contentIds",
	hsrAssets = "hsrAssets",
	curveAnimBoneData = "curveAnimBoneData"
}
finalizeEnumTable("SharedDataMember")
t.ValidationConfig = {
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
t.AssetQualityFetchStatus = {
	assetQualityFetchNA = "assetQualityFetchNA",
	assetQualityFetchInProgress = "assetQualityFetchInProgress",
	assetQualityFetchSuccess = "assetQualityFetchSuccess",
	assetQualityFetchFailure = "assetQualityFetchFailure"
}
finalizeEnumTable("AssetQualityFetchStatus")
t.ConsumerEnv = { Studio = "Studio", Backend = "Backend", IEC = "IEC" }
finalizeEnumTable("ConsumerEnv")
t.Status = {
	CANNOT_START = "CANNOT_START",
	TIMEOUT = "TIMEOUT",
	ERROR = "ERROR",
	FAIL = "FAIL",
	PASS = "PASS",
	IN_PROGRESS = "IN_PROGRESS"
}
finalizeEnumTable("Status")
t.AssetQualityCheck = {
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
	Measure_Animation_Duration = "Measure_Animation_Duration"
}
finalizeEnumTable("AssetQualityCheck")
finalizeEnumTable("ValidationModule")
t.UploadCategory = {
	TORSO_AND_LIMBS = "TORSO_AND_LIMBS",
	DYNAMIC_HEAD = "DYNAMIC_HEAD",
	LAYERED_CLOTHING = "LAYERED_CLOTHING",
	RIGID_ACCESSORY = "RIGID_ACCESSORY",
	EMOTE_ANIMATION = "EMOTE_ANIMATION",
	MAKEUP = "MAKEUP",
	FULL_BODY = "FULL_BODY",
	BOTH_SHOES = "BOTH_SHOES",
	ANIMATION_PACK = "ANIMATION_PACK",
	ANIMATION = "ANIMATION"
}
finalizeEnumTable("UploadCategory")

return t