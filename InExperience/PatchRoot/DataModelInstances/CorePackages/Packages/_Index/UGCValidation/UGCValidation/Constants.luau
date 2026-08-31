local parent = script.Parent
local cryoModule = require(parent.Parent.Cryo)
local validationRulesUtilModule = require(parent.util.ValidationRulesUtil)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local getFFlagUGCValidationFixConstantsTypoLegModule = require(parent.flags.getFFlagUGCValidationFixConstantsTypoLeg)
local getFFlagUGCValidationEyebrowEyelashSupportModule = require(parent.flags.getFFlagUGCValidationEyebrowEyelashSupport)
local getFFlagUGCValidateCheckHSROwnerModule = require(parent.flags.getFFlagUGCValidateCheckHSROwner)
local getFFlagUGCValidateCheckTexturePackOwnerModule = require(parent.flags.getFFlagUGCValidateCheckTexturePackOwner)
local getFFlagUGCValidationAnimationPackSupportModule = require(parent.flags.getFFlagUGCValidationAnimationPackSupport)
local UGCValidateMakeupDecalUVProperties = game:DefineFastFlag("UGCValidateMakeupDecalUVProperties", false)
local getFFlagUGCValidationAllowEngineDefaultPartSurfacesModule = require(parent.flags.getFFlagUGCValidationAllowEngineDefaultPartSurfaces)
local getFFlagUGCValidateAllowEmissivesModule = require(parent.flags.getFFlagUGCValidateAllowEmissives)
local getFFlagUGCValidateMakeupCategoryParityModule = require(parent.flags.getFFlagUGCValidateMakeupCategoryParity)
local getFFlagUGCValidateDisallowAeroMeshDataModule = require(parent.flags.getFFlagUGCValidateDisallowAeroMeshData)

local function _(p1)
	local t = {}
	
	for i, v in pairs(p1) do
		t[v] = true
	end
	return t
end

local t = {
	MAX_HAT_TRIANGLES = validationRulesUtilModule:getRules().MeshRules.AccessoryMaxTriangles,
	MAX_TEXTURE_SIZE = validationRulesUtilModule:getRules().TextureRules.MaxTextureSize
}
local t_1 = {}

for i, v in pairs({ Enum.Material.Plastic }) do
	t_1[v] = true
end
t.MATERIAL_WHITELIST = t_1
t.BANNED_CLASS_NAMES = {
	"Script", "LocalScript", "ModuleScript", "ParticleEmitter", "Fire", "Smoke",
	"Sparkles"
}
t.R6_BODY_PARTS = {
	"Torso",
	"Left Leg",
	"Right Leg",
	"Left Arm",
	"Right Arm"
}
t.R15_BODY_PARTS = {
	"Head", "UpperTorso", "LowerTorso", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot",
	"RightUpperLeg", "RightLowerLeg", "RightFoot", "LeftUpperArm", "LeftLowerArm",
	"LeftHand", "RightUpperArm", "RightLowerArm", "RightHand"
}
t.R15_CAGE_PARTS = {
	"Head_OuterCage", "UpperTorso_OuterCage", "LowerTorso_OuterCage",
	"LeftUpperLeg_OuterCage", "LeftLowerLeg_OuterCage", "LeftFoot_OuterCage",
	"RightUpperLeg_OuterCage", "RightLowerLeg_OuterCage", "RightFoot_OuterCage",
	"LeftUpperArm_OuterCage", "LeftLowerArm_OuterCage", "LeftHand_OuterCage",
	"RightUpperArm_OuterCage", "RightLowerArm_OuterCage", "RightHand_OuterCage"
}
t.NAMED_R15_BODY_PARTS = {}

for i_1, v_1 in t.R15_BODY_PARTS do
	t.NAMED_R15_BODY_PARTS[v_1] = v_1
end
t.NAMED_R15_BODY_PARTS.Head = "Head"
setmetatable(t.NAMED_R15_BODY_PARTS, {
	__index = function()
		error("NAMED_R15_BODY_PARTS key does not exist")
		
		return nil
	end
})
t.R15_STANDARD_JOINT_NAMES = {
	Root = true,
	HumanoidRootNode = true,
	DynamicHead = true,
	Head = true,
	UpperTorso = true,
	LowerTorso = true,
	LeftUpperLeg = true,
	LeftLowerLeg = true,
	LeftFoot = true,
	RightUpperLeg = true,
	RightLowerLeg = true,
	RightFoot = true,
	LeftUpperArm = true,
	LeftLowerArm = true,
	LeftHand = true,
	RightUpperArm = true,
	RightLowerArm = true,
	RightHand = true
}
t.ALLOWED_SKINNING_TRANSFER_JOINT_NAMES = { RBX_Leader = true, RBX_Follower = true }

for i_1, v_2 in t.R15_BODY_PARTS do
	t.R15_STANDARD_JOINT_NAMES[v_2] = true
end
t.UGC_BODY_PARTS = {
	"Head", "UpperTorso", "LowerTorso", "LeftUpperLeg", "LeftLowerLeg", "LeftHand",
	"RightUpperArm", "RightLowerArm", "RightHand", "LeftUpperArm", "LeftLowerArm",
	"LeftFoot", "RightUpperLeg", "RightLowerLeg", "RightFoot", "EyebrowAccessory",
	"EyelashAccessory", "HairAccessory"
}
t.UGC_BODY_PART_NAMES_TO_ASSET_TYPE = {
	Head = Enum.AssetType.DynamicHead,
	UpperTorso = Enum.AssetType.Torso,
	LowerTorso = Enum.AssetType.Torso,
	LeftUpperArm = Enum.AssetType.LeftArm,
	LeftLowerArm = Enum.AssetType.LeftArm,
	LeftHand = Enum.AssetType.LeftArm,
	RightUpperArm = Enum.AssetType.RightArm,
	RightLowerArm = Enum.AssetType.RightArm,
	RightHand = Enum.AssetType.RightArm,
	LeftUpperLeg = Enum.AssetType.LeftLeg,
	LeftLowerLeg = Enum.AssetType.LeftLeg,
	LeftFoot = Enum.AssetType.LeftLeg,
	RightUpperLeg = Enum.AssetType.RightLeg,
	RightLowerLeg = Enum.AssetType.RightLeg,
	RightFoot = Enum.AssetType.RightLeg,
	EyebrowAccessory = Enum.AssetType.EyebrowAccessory,
	EyelashAccessory = Enum.AssetType.EyelashAccessory,
	HairAccessory = Enum.AssetType.HairAccessory
}
t.UGC_SHOE_NAMES_TO_ASSET_TYPE = {
	LeftShoeAccessory = Enum.AssetType.LeftShoeAccessory,
	RightShoeAccessory = Enum.AssetType.RightShoeAccessory
}
t.BUNDLE_TO_ASSET_MAPPING = {
	[Enum.BundleType.BodyParts] = t.UGC_BODY_PART_NAMES_TO_ASSET_TYPE,
	[Enum.BundleType.BodyParts] = t.UGC_SHOE_NAMES_TO_ASSET_TYPE
}
t.ASSET_TYPES_THAT_SKIP_FOLDER = {
	Enum.AssetType.DynamicHead,
	Enum.AssetType.EyebrowAccessory,
	Enum.AssetType.EyelashAccessory,
	Enum.AssetType.HairAccessory
}
t.FOLDER_NAMES = {
	R6 = "R6",
	R15ArtistIntent = "R15ArtistIntent",
	R15Fixed = "R15Fixed"
}
t.EXTRA_BANNED_NAMES = { "Head", "HumanoidRootPart", "Humanoid" }

for i_3, v_3 in ipairs({
	"Body Colors", "Shirt Graphic", "Shirt", "Pants", "Health", "Animate"
}) do
	table.insert(t.EXTRA_BANNED_NAMES, v_3)
end
t.BANNED_NAMES = {}

for i_4, v_4 in { t.R6_BODY_PARTS, t.R15_BODY_PARTS, t.EXTRA_BANNED_NAMES } do
	for i_5, v_5 in v_4 do
		t.BANNED_NAMES[v_5] = true
	end
end
t.ASSET_STATUS = {
	UNKNOWN = "Unknown",
	REVIEW_PENDING = "ReviewPending",
	MODERATED = "Moderated"
}
t.MAKEUP_INFO = validationRulesUtilModule:getMakeupRules()
t.ASSET_TYPE_INFO = {}
validationRulesUtilModule:getAccessoryRules(t.ASSET_TYPE_INFO)
t.FULL_BODY_BOUNDS = validationRulesUtilModule:getFullBodyRulesBounds()
t.AvatarPartScaleTypes = {
	Classic = true,
	ProportionsSlender = true,
	ProportionsNormal = true
}
validationRulesUtilModule:getBodyPartRules(t.ASSET_TYPE_INFO)
t.BODYPART_TO_PARENT = {
	Head = nil,
	LowerTorso = nil,
	UpperTorso = "LowerTorso",
	LeftUpperArm = nil,
	LeftLowerArm = "LeftUpperArm",
	LeftHand = "LeftLowerArm",
	LeftUpperLeg = nil,
	LeftLowerLeg = "LeftUpperLeg",
	RightUpperArm = nil,
	RightLowerArm = "RightUpperArm",
	RightHand = "RightLowerArm",
	RightUpperLeg = nil,
	RightLowerLeg = "RightUpperLeg"
}

if getFFlagUGCValidationFixConstantsTypoLegModule() then
	t.BODYPART_TO_PARENT.RightFoot = "RightLowerLeg"
	t.BODYPART_TO_PARENT.LeftFoot = "LeftLowerLeg"
else
	t.BODYPART_TO_PARENT.RightLeg = "RightLowerLeg"
	t.BODYPART_TO_PARENT.LeftLeg = "LeftLowerLeg"
end
t.RenderVsWrapMeshMaxDiff = validationRulesUtilModule:getRules().MeshRules.CageMeshMaxDistanceFromRenderMesh
t.COMPARISON_METHODS = {
	SMALLER = "<",
	SMALLER_EQ = "<=",
	FUZZY_EQ = "=",
	EXACT_EQ = "==",
	GREATER_EQ = ">=",
	GREATER = ">",
	FOUND_IN = "one of the following:"
}
setmetatable(t.COMPARISON_METHODS, {
	__index = function(_, p2)
		return error("Invalid COMPARISON_METHOD " .. tostring(p2))
	end
})
t.INCLUSION_METHODS = {
	RUN_ON_ALL = "RUN_ON_ALL",
	INCLUSION_LIST = "INCLUSION_LIST",
	EXCLUSION_LIST = "EXCLUSION_LIST"
}
setmetatable(t.INCLUSION_METHODS, {
	__index = function(_, p2)
		return error("Invalid INCLUSION_METHOD " .. tostring(p2))
	end
})
t.PROPERTIES = {
	Instance = { Archivable = true },
	Attachment = { Visible = false },
	Decal = {
		Transparency = 0,
		Color3 = Color3.new(1, 1, 1),
		UVOffset = if UGCValidateMakeupDecalUVProperties then Vector2.new(0, 0) else nil,
		UVScale = if UGCValidateMakeupDecalUVProperties then Vector2.new(1, 1) else nil
	},
	SpecialMesh = {
		Offset = Vector3.new(0, 0, 0),
		VertexColor = Vector3.new(1, 1, 1),
		MeshType = Enum.MeshType.FileMesh
	},
	BasePart = {
		Anchored = false,
		CollisionGroupId = 0,
		CustomPhysicalProperties = cryoModule.None,
		Elasticity = 0.5,
		Friction = 0.3,
		LocalTransparencyModifier = 0,
		Massless = false,
		Reflectance = 0,
		RootPriority = 0,
		RotVelocity = Vector3.new(0, 0, 0),
		Velocity = Vector3.new(0, 0, 0),
		BackParamA = -0.5,
		BackParamB = 0.5,
		BackSurfaceInput = Enum.InputType.NoInput,
		BottomParamA = -0.5,
		BottomParamB = 0.5,
		BottomSurfaceInput = Enum.InputType.NoInput,
		FrontParamA = -0.5,
		FrontParamB = 0.5,
		FrontSurfaceInput = Enum.InputType.NoInput,
		LeftParamA = -0.5,
		LeftParamB = 0.5,
		LeftSurfaceInput = Enum.InputType.NoInput,
		RightParamA = -0.5,
		RightParamB = 0.5,
		RightSurfaceInput = Enum.InputType.NoInput,
		TopParamA = -0.5,
		TopParamB = 0.5,
		TopSurfaceInput = Enum.InputType.NoInput,
		BackSurface = Enum.SurfaceType.Smooth,
		BottomSurface = if getFFlagUGCValidationAllowEngineDefaultPartSurfacesModule() then {
			[t.COMPARISON_METHODS.FOUND_IN] = { Enum.SurfaceType.Smooth, Enum.SurfaceType.Inlet }
		} else Enum.SurfaceType.Smooth,
		FrontSurface = Enum.SurfaceType.Smooth,
		LeftSurface = Enum.SurfaceType.Smooth,
		RightSurface = Enum.SurfaceType.Smooth,
		TopSurface = if getFFlagUGCValidationAllowEngineDefaultPartSurfacesModule() then {
			[t.COMPARISON_METHODS.FOUND_IN] = { Enum.SurfaceType.Smooth, Enum.SurfaceType.Studs }
		} else Enum.SurfaceType.Smooth,
		Transparency = { [t.COMPARISON_METHODS.EXACT_EQ] = 0 },
		Color = {
			[t.COMPARISON_METHODS.FUZZY_EQ] = BrickColor.new("Medium stone grey").Color,
			[t.INCLUSION_METHODS.EXCLUSION_LIST] = {
				Enum.AssetType.DynamicHead, Enum.AssetType.Torso, Enum.AssetType.LeftArm,
				Enum.AssetType.RightArm, Enum.AssetType.LeftLeg, Enum.AssetType.RightLeg
			}
		}
	},
	Part = { Shape = Enum.PartType.Block },
	MeshPart = {
		FluidFidelity = if getFFlagUGCValidateDisallowAeroMeshDataModule() then Enum.FluidFidelity.Automatic else nil
	},
	SurfaceAppearance = {
		AlphaMode = if getFFlagUGCValidationEyebrowEyelashSupportModule() then {
			{
				[t.COMPARISON_METHODS.FOUND_IN] = { Enum.AlphaMode.Overlay, Enum.AlphaMode.Transparency },
				[t.INCLUSION_METHODS.INCLUSION_LIST] = {
					Enum.AssetType.EyelashAccessory,
					Enum.AssetType.EyebrowAccessory
				}
			},
			{
				[t.COMPARISON_METHODS.EXACT_EQ] = Enum.AlphaMode.Overlay,
				[t.INCLUSION_METHODS.EXCLUSION_LIST] = {
					Enum.AssetType.EyelashAccessory,
					Enum.AssetType.EyebrowAccessory
				}
			}
		} else Enum.AlphaMode.Overlay,
		EmissiveMaskContent = if getFFlagUGCValidateAllowEmissivesModule() then nil else Content.none,
		EmissiveStrength = if getFFlagUGCValidateAllowEmissivesModule() then {
			[t.COMPARISON_METHODS.GREATER_EQ] = 0,
			[t.COMPARISON_METHODS.SMALLER_EQ] = 40
		} else 1,
		EmissiveTint = if getFFlagUGCValidateAllowEmissivesModule() then nil else Color3.new(1, 1, 1)
	},
	WrapLayer = {
		Enabled = true,
		CageOrigin = {
			PositionMagnitude = { [t.COMPARISON_METHODS.SMALLER_EQ] = 10 },
			Orientation = { [t.COMPARISON_METHODS.EXACT_EQ] = Vector3.new(0, 0, 0) }
		},
		ReferenceOrigin = {
			PositionMagnitude = { [t.COMPARISON_METHODS.SMALLER_EQ] = 10 },
			Orientation = { [t.COMPARISON_METHODS.EXACT_EQ] = Vector3.new(0, 0, 0) }
		},
		ImportOrigin = {
			PositionMagnitude = { [t.COMPARISON_METHODS.SMALLER_EQ] = 8 }
		},
		BindOffset = {
			Position = { [t.COMPARISON_METHODS.EXACT_EQ] = Vector3.new(0, 0, 0) },
			Orientation = { [t.COMPARISON_METHODS.EXACT_EQ] = Vector3.new(0, 0, 0) }
		}
	},
	WrapTarget = {
		CageOrigin = {
			PositionMagnitude = { [t.COMPARISON_METHODS.SMALLER_EQ] = 10 },
			Orientation = { [t.COMPARISON_METHODS.EXACT_EQ] = Vector3.new(0, 0, 0) }
		},
		ImportOrigin = {
			PositionMagnitude = { [t.COMPARISON_METHODS.SMALLER_EQ] = 8 }
		}
	}
}
t.CONTENT_ID_FIELDS = {
	SpecialMesh = { "MeshId", "TextureId" },
	MeshPart = { "MeshId", "TextureID" },
	SurfaceAppearance = { "ColorMap", "MetalnessMap", "NormalMap", "RoughnessMap" },
	Decal = { "ColorMap", "MetalnessMap", "NormalMap", "RoughnessMap" },
	WrapLayer = { "CageMeshId", "ReferenceMeshId" },
	WrapTarget = { "CageMeshId" },
	Animation = { "AnimationId" }
}
t.CONTENT_FIELDS_WITHOUT_CONTENTID = { SurfaceAppearance = { "EmissiveMaskContent" } }

if getFFlagUGCValidateCheckTexturePackOwnerModule() then
	table.insert(t.CONTENT_ID_FIELDS.SurfaceAppearance, "TexturePack")
end
if getFFlagUGCValidateCheckHSROwnerModule() then
	table.insert(t.CONTENT_ID_FIELDS.WrapLayer, "HSRAssetId")
end
t.CONTENT_ID_REQUIRED_FIELDS = {
	SpecialMesh = { MeshId = true, TextureId = true },
	MeshPart = { MeshId = true },
	WrapTarget = { CageMeshId = true },
	Animation = { AnimationId = true }
}
t.CONTENT_ID_EDITABLE_PROPERTY = {
	MeshPart = { MeshId = "MeshContent", TextureID = "TextureContent" },
	WrapTarget = { CageMeshId = "CageMeshContent" },
	WrapLayer = {
		CageMeshId = "CageMeshContent",
		ReferenceMeshId = "ReferenceMeshContent"
	},
	SurfaceAppearance = {
		ColorMap = "ColorMapContent",
		MetalnessMap = "MetalnessMapContent",
		NormalMap = "NormalMapContent",
		RoughnessMap = "RoughnessMapContent"
	}
}
t.CONTENT_TYPED_PROPERTIES_BY_CLASS = {
	MeshPart = { "MeshContent", "TextureContent" },
	WrapTarget = { "CageMeshContent" },
	WrapLayer = { "CageMeshContent", "ReferenceMeshContent" },
	SurfaceAppearance = {
		"ColorMapContent",
		"MetalnessMapContent",
		"NormalMapContent",
		"RoughnessMapContent",
		"EmissiveMaskContent"
	},
	Decal = {
		"ColorMapContent",
		"MetalnessMapContent",
		"NormalMapContent",
		"RoughnessMapContent"
	},
	WrapTextureTransfer = { "ReferenceCageMeshContent" }
}
t.MESH_CONTENT_ID_FIELDS = {
	SpecialMesh = { "MeshId" },
	MeshPart = { "MeshId" },
	WrapTarget = { "CageMeshId" },
	WrapLayer = { "CageMeshId", "ReferenceMeshId" }
}
t.TEXTURE_CONTENT_ID_FIELDS = {
	SpecialMesh = { "TextureId" },
	MeshPart = { "TextureID" },
	SurfaceAppearance = { "ColorMap", "MetalnessMap", "NormalMap", "RoughnessMap" },
	Decal = { "ColorMap", "MetalnessMap", "NormalMap", "RoughnessMap" }
}
t.ASSET_RENDER_MESH_MAX_TRIANGLES = {
	DynamicHead = validationRulesUtilModule:getBodyPartMaxTrianglesRule(Enum.AssetType.DynamicHead),
	LeftArm = validationRulesUtilModule:getBodyPartMaxTrianglesRule(Enum.AssetType.LeftArm),
	RightArm = validationRulesUtilModule:getBodyPartMaxTrianglesRule(Enum.AssetType.RightArm),
	Torso = validationRulesUtilModule:getBodyPartMaxTrianglesRule(Enum.AssetType.Torso),
	LeftLeg = validationRulesUtilModule:getBodyPartMaxTrianglesRule(Enum.AssetType.LeftLeg),
	RightLeg = validationRulesUtilModule:getBodyPartMaxTrianglesRule(Enum.AssetType.RightLeg)
}
t.WRAP_TARGET_CAGE_MESH_UV_COUNTS = {
	Head = 343,
	LeftUpperArm = 77,
	LeftLowerArm = 77,
	LeftHand = 86,
	RightUpperArm = 77,
	RightLowerArm = 77,
	RightHand = 86,
	UpperTorso = 257,
	LowerTorso = 105,
	LeftUpperLeg = 88,
	LeftLowerLeg = 88,
	LeftFoot = 86,
	RightUpperLeg = 88,
	RightLowerLeg = 88,
	RightFoot = 86
}
t.PACKAGE_CONTENT_ID_FIELDS = cryoModule.Dictionary.join(t.CONTENT_ID_FIELDS, {
	Sound = { "SoundId" },
	Decal = { "Texture" },
	VideoFrame = { "Video" },
	PackageLink = { "PackageId" },
	CharacterMesh = {
		"baseTextureAssetId",
		"overlayTextureAssetId",
		"meshAssetId"
	},
	Tool = { "TextureId" },
	Sky = {
		"SkyUp", "SkyLf", "SkyRt", "SkyBk", "SkyFt", "SkyDn", "Sun", "Moon"
	},
	Trail = { "texture" },
	Beam = { "texture" },
	ShirtGraphic = { "Graphic" },
	Shirt = { "ShirtTemplate" },
	Pants = { "PantsTemplate" },
	AdGui = { "FallbackImage" }
})
t.ExperienceAuthHeaderKey = "RBX-ExperienceAuthorization"
t.ContentType = "Content-Type"
t.ApplicationJson = "application/json"
t.GUIDAttributeName = "RBXGUID"
t.GUIDAttributeMaxLength = 100
t.EmoteIsUGCAttributeName = "RBXisUGCEmote"
t.EmoteMaxPartTranslationAttributeName = "RBXmaxPartTranslation"
t.AlternateMeshIdAttributeName = "RBX_ALT_MESH_ID"
t.MESH_CONTENT_TYPE = {
	RENDER_MESH = "RenderMesh",
	OUTER_CAGE = "OuterCage",
	INNER_CAGE = "InnerCage"
}
t.MESH_CONTENT_TYPE_TO_FIELD_NAME = {
	[t.MESH_CONTENT_TYPE.RENDER_MESH] = "MeshId",
	[t.MESH_CONTENT_TYPE.OUTER_CAGE] = "CageMeshId",
	[t.MESH_CONTENT_TYPE.INNER_CAGE] = "ReferenceMeshId"
}

if getFFlagUGCValidationAnimationPackSupportModule() then
	t.ANIMATION_ASSET_INFO = {
		[Enum.AssetType.ClimbAnimation] = {
			modelName = "ClimbAnimation",
			stringValueNames = { "climb" }
		},
		[Enum.AssetType.FallAnimation] = {
			modelName = "FallAnimation",
			stringValueNames = { "fall" }
		},
		[Enum.AssetType.IdleAnimation] = {
			modelName = "IdleAnimation",
			stringValueNames = { "idle" }
		},
		[Enum.AssetType.JumpAnimation] = {
			modelName = "JumpAnimation",
			stringValueNames = { "jump" }
		},
		[Enum.AssetType.RunAnimation] = { modelName = "RunAnimation", stringValueNames = { "run" } },
		[Enum.AssetType.SwimAnimation] = {
			modelName = "SwimAnimation",
			stringValueNames = { "swim", "swimidle" }
		},
		[Enum.AssetType.WalkAnimation] = {
			modelName = "WalkAnimation",
			stringValueNames = { "walk" }
		}
	}
end
t.AllAssetUploadCategories = {
	validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
	validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
	validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
	validationEnumsModule.UploadCategory.RIGID_ACCESSORY,
	validationEnumsModule.UploadCategory.EMOTE_ANIMATION
}

if getFFlagUGCValidationAnimationPackSupportModule() then
	table.insert(t.AllAssetUploadCategories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.AllAssetUploadCategoriesIncludingMakeup = {}

for i_5, v_5 in t.AllAssetUploadCategories do
	table.insert(t.AllAssetUploadCategoriesIncludingMakeup, v_5)
end
table.insert(t.AllAssetUploadCategoriesIncludingMakeup, validationEnumsModule.UploadCategory.MAKEUP)

if getFFlagUGCValidateMakeupCategoryParityModule() then
	table.insert(t.AllAssetUploadCategories, validationEnumsModule.UploadCategory.MAKEUP)
end
t.AllBundleUploadCategories = {
	validationEnumsModule.UploadCategory.FULL_BODY,
	validationEnumsModule.UploadCategory.BOTH_SHOES
}

if getFFlagUGCValidationAnimationPackSupportModule() then
	table.insert(t.AllBundleUploadCategories, validationEnumsModule.UploadCategory.ANIMATION_PACK)
end
t.AllUploadCategories = {}

for i_6, v_6 in validationEnumsModule.UploadCategory do
	table.insert(t.AllUploadCategories, v_6)
end
t.AssetUploadsWithFolderStructure = {
	[Enum.AssetType.Torso] = true,
	[Enum.AssetType.LeftArm] = true,
	[Enum.AssetType.RightArm] = true,
	[Enum.AssetType.LeftLeg] = true,
	[Enum.AssetType.RightLeg] = true
}
t.SkinningTransferRequiredTypes = {
	[Enum.AssetType.EyebrowAccessory] = true,
	[Enum.AssetType.EyelashAccessory] = true
}

return t