local Parent = script.Parent
local CryoModule = require(Parent.Parent.Cryo)
local ValidationRulesUtilModule = require(Parent.util.ValidationRulesUtil)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local GetFFlagUGCValidationEyebrowEyelashSupportModule = require(Parent.flags.getFFlagUGCValidationEyebrowEyelashSupport)
local GetFFlagUGCValidateCheckHSROwnerModule = require(Parent.flags.getFFlagUGCValidateCheckHSROwner)
local GetFFlagUGCValidateCheckTexturePackOwnerModule = require(Parent.flags.getFFlagUGCValidateCheckTexturePackOwner)
local UGCValidateMakeupDecalUVProperties = game:DefineFastFlag("UGCValidateMakeupDecalUVProperties", false)
local GetFFlagUGCValidateMakeupCategoryParityModule = require(Parent.flags.getFFlagUGCValidateMakeupCategoryParity)
local GetFFlagUGCValidateDisallowAeroMeshDataModule = require(Parent.flags.getFFlagUGCValidateDisallowAeroMeshData)

local function _(List)
	local t = {}
	
	for _, value in pairs(List) do
		t[value] = true
	end
	return t
end

local config = {
	MAX_HAT_TRIANGLES = ValidationRulesUtilModule:getRules().MeshRules.AccessoryMaxTriangles,
	MAX_TEXTURE_SIZE = ValidationRulesUtilModule:getRules().TextureRules.MaxTextureSize
}
local t = {}

for _, value in pairs({ Enum.Material.Plastic }) do
	t[value] = true
end
config.MATERIAL_WHITELIST = t
config.BANNED_CLASS_NAMES = {
	"Script", "LocalScript", "ModuleScript", "ParticleEmitter", "Fire", "Smoke",
	"Sparkles"
}
config.R6_BODY_PARTS = {
	"Torso",
	"Left Leg",
	"Right Leg",
	"Left Arm",
	"Right Arm"
}
config.R15_BODY_PARTS = {
	"Head", "UpperTorso", "LowerTorso", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot",
	"RightUpperLeg", "RightLowerLeg", "RightFoot", "LeftUpperArm", "LeftLowerArm",
	"LeftHand", "RightUpperArm", "RightLowerArm", "RightHand"
}
config.R15_CAGE_PARTS = {
	"Head_OuterCage", "UpperTorso_OuterCage", "LowerTorso_OuterCage",
	"LeftUpperLeg_OuterCage", "LeftLowerLeg_OuterCage", "LeftFoot_OuterCage",
	"RightUpperLeg_OuterCage", "RightLowerLeg_OuterCage", "RightFoot_OuterCage",
	"LeftUpperArm_OuterCage", "LeftLowerArm_OuterCage", "LeftHand_OuterCage",
	"RightUpperArm_OuterCage", "RightLowerArm_OuterCage", "RightHand_OuterCage"
}
config.NAMED_R15_BODY_PARTS = {}

for _, r15BODYPART in config.R15_BODY_PARTS do
	config.NAMED_R15_BODY_PARTS[r15BODYPART] = r15BODYPART
end
config.NAMED_R15_BODY_PARTS.Head = "Head"
setmetatable(config.NAMED_R15_BODY_PARTS, {
	__index = function()
		error("NAMED_R15_BODY_PARTS key does not exist")
		
		return nil
	end
})
config.R15_STANDARD_JOINT_NAMES = {
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
config.ALLOWED_SKINNING_TRANSFER_JOINT_NAMES = { RBX_Leader = true, RBX_Follower = true }

for _, r15BODYPART1 in config.R15_BODY_PARTS do
	config.R15_STANDARD_JOINT_NAMES[r15BODYPART1] = true
end
config.UGC_BODY_PARTS = {
	"Head", "UpperTorso", "LowerTorso", "LeftUpperLeg", "LeftLowerLeg", "LeftHand",
	"RightUpperArm", "RightLowerArm", "RightHand", "LeftUpperArm", "LeftLowerArm",
	"LeftFoot", "RightUpperLeg", "RightLowerLeg", "RightFoot", "EyebrowAccessory",
	"EyelashAccessory", "HairAccessory"
}
config.UGC_BODY_PART_NAMES_TO_ASSET_TYPE = {
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
config.UGC_SHOE_NAMES_TO_ASSET_TYPE = {
	LeftShoeAccessory = Enum.AssetType.LeftShoeAccessory,
	RightShoeAccessory = Enum.AssetType.RightShoeAccessory
}
config.BUNDLE_TO_ASSET_MAPPING = {
	[Enum.BundleType.BodyParts] = config.UGC_BODY_PART_NAMES_TO_ASSET_TYPE,
	[Enum.BundleType.BodyParts] = config.UGC_SHOE_NAMES_TO_ASSET_TYPE
}
config.ASSET_TYPES_THAT_SKIP_FOLDER = {
	Enum.AssetType.DynamicHead,
	Enum.AssetType.EyebrowAccessory,
	Enum.AssetType.EyelashAccessory,
	Enum.AssetType.HairAccessory
}
config.FOLDER_NAMES = {
	R6 = "R6",
	R15ArtistIntent = "R15ArtistIntent",
	R15Fixed = "R15Fixed"
}
config.EXTRA_BANNED_NAMES = { "Head", "HumanoidRootPart", "Humanoid" }

for _, value1 in ipairs({
	"Body Colors", "Shirt Graphic", "Shirt", "Pants", "Health", "Animate"
}) do
	table.insert(config.EXTRA_BANNED_NAMES, value1)
end
config.BANNED_NAMES = {}

for _, value2 in {
	config.R6_BODY_PARTS,
	config.R15_BODY_PARTS,
	config.EXTRA_BANNED_NAMES
} do
	for _, value3 in value2 do
		config.BANNED_NAMES[value3] = true
	end
end
config.ASSET_STATUS = {
	UNKNOWN = "Unknown",
	REVIEW_PENDING = "ReviewPending",
	MODERATED = "Moderated"
}
config.MAKEUP_INFO = ValidationRulesUtilModule:getMakeupRules()
config.ASSET_TYPE_INFO = {}
ValidationRulesUtilModule:getAccessoryRules(config.ASSET_TYPE_INFO)
config.FULL_BODY_BOUNDS = ValidationRulesUtilModule:getFullBodyRulesBounds()
config.AvatarPartScaleTypes = {
	Classic = true,
	ProportionsSlender = true,
	ProportionsNormal = true
}
ValidationRulesUtilModule:getBodyPartRules(config.ASSET_TYPE_INFO)
config.BODYPART_TO_PARENT = {
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
config.BODYPART_TO_PARENT.RightFoot = "RightLowerLeg"
config.BODYPART_TO_PARENT.LeftFoot = "LeftLowerLeg"
config.RenderVsWrapMeshMaxDiff = ValidationRulesUtilModule:getRules().MeshRules.CageMeshMaxDistanceFromRenderMesh
config.COMPARISON_METHODS = {
	SMALLER = "<",
	SMALLER_EQ = "<=",
	FUZZY_EQ = "=",
	EXACT_EQ = "==",
	GREATER_EQ = ">=",
	GREATER = ">",
	FOUND_IN = "one of the following:"
}
setmetatable(config.COMPARISON_METHODS, {
	__index = function(_, p1)
		return error("Invalid COMPARISON_METHOD " .. tostring(p1))
	end
})
config.INCLUSION_METHODS = {
	RUN_ON_ALL = "RUN_ON_ALL",
	INCLUSION_LIST = "INCLUSION_LIST",
	EXCLUSION_LIST = "EXCLUSION_LIST"
}
setmetatable(config.INCLUSION_METHODS, {
	__index = function(_, p1)
		return error("Invalid INCLUSION_METHOD " .. tostring(p1))
	end
})
config.PROPERTIES = {
	Instance = { Archivable = true },
	Attachment = { Visible = false },
	Decal = {
		Transparency = 0,
		Color3 = Color3.new(1, 1, 1),
		UVOffset = if UGCValidateMakeupDecalUVProperties then Vector2.new(0, 0) else nil,
		UVScale = if UGCValidateMakeupDecalUVProperties then Vector2.new(1, 1) else nil
	},
	SpecialMesh = {
		Offset = vector.create(0, 0, 0),
		VertexColor = vector.create(1, 1, 1),
		MeshType = Enum.MeshType.FileMesh
	},
	BasePart = {
		Anchored = false,
		CollisionGroupId = 0,
		CustomPhysicalProperties = CryoModule.None,
		Elasticity = 0.5,
		Friction = 0.3,
		LocalTransparencyModifier = 0,
		Massless = false,
		Reflectance = 0,
		RootPriority = 0,
		RotVelocity = vector.create(0, 0, 0),
		Velocity = vector.create(0, 0, 0),
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
		BottomSurface = {
			[config.COMPARISON_METHODS.FOUND_IN] = { Enum.SurfaceType.Smooth, Enum.SurfaceType.Inlet }
		},
		FrontSurface = Enum.SurfaceType.Smooth,
		LeftSurface = Enum.SurfaceType.Smooth,
		RightSurface = Enum.SurfaceType.Smooth,
		TopSurface = {
			[config.COMPARISON_METHODS.FOUND_IN] = { Enum.SurfaceType.Smooth, Enum.SurfaceType.Studs }
		},
		Transparency = { [config.COMPARISON_METHODS.EXACT_EQ] = 0 },
		Color = {
			[config.COMPARISON_METHODS.FUZZY_EQ] = BrickColor.new("Medium stone grey").Color,
			[config.INCLUSION_METHODS.EXCLUSION_LIST] = {
				Enum.AssetType.DynamicHead, Enum.AssetType.Torso, Enum.AssetType.LeftArm,
				Enum.AssetType.RightArm, Enum.AssetType.LeftLeg, Enum.AssetType.RightLeg
			}
		}
	},
	Part = { Shape = Enum.PartType.Block },
	MeshPart = {
		FluidFidelity = if GetFFlagUGCValidateDisallowAeroMeshDataModule() then Enum.FluidFidelity.Automatic else nil
	},
	SurfaceAppearance = {
		AlphaMode = if GetFFlagUGCValidationEyebrowEyelashSupportModule() then {
			{
				[config.COMPARISON_METHODS.FOUND_IN] = { Enum.AlphaMode.Overlay, Enum.AlphaMode.Transparency },
				[config.INCLUSION_METHODS.INCLUSION_LIST] = {
					Enum.AssetType.EyelashAccessory,
					Enum.AssetType.EyebrowAccessory
				}
			},
			{
				[config.COMPARISON_METHODS.EXACT_EQ] = Enum.AlphaMode.Overlay,
				[config.INCLUSION_METHODS.EXCLUSION_LIST] = {
					Enum.AssetType.EyelashAccessory,
					Enum.AssetType.EyebrowAccessory
				}
			}
		} else Enum.AlphaMode.Overlay,
		EmissiveStrength = {
			[config.COMPARISON_METHODS.GREATER_EQ] = 0,
			[config.COMPARISON_METHODS.SMALLER_EQ] = 40
		}
	},
	WrapLayer = {
		Enabled = true,
		CageOrigin = {
			PositionMagnitude = { [config.COMPARISON_METHODS.SMALLER_EQ] = 10 },
			Orientation = {
				[config.COMPARISON_METHODS.EXACT_EQ] = vector.create(0, 0, 0)
			}
		},
		ReferenceOrigin = {
			PositionMagnitude = { [config.COMPARISON_METHODS.SMALLER_EQ] = 10 },
			Orientation = {
				[config.COMPARISON_METHODS.EXACT_EQ] = vector.create(0, 0, 0)
			}
		},
		ImportOrigin = {
			PositionMagnitude = { [config.COMPARISON_METHODS.SMALLER_EQ] = 8 }
		},
		BindOffset = {
			Position = {
				[config.COMPARISON_METHODS.EXACT_EQ] = vector.create(0, 0, 0)
			},
			Orientation = {
				[config.COMPARISON_METHODS.EXACT_EQ] = vector.create(0, 0, 0)
			}
		}
	},
	WrapTarget = {
		CageOrigin = {
			PositionMagnitude = { [config.COMPARISON_METHODS.SMALLER_EQ] = 10 },
			Orientation = {
				[config.COMPARISON_METHODS.EXACT_EQ] = vector.create(0, 0, 0)
			}
		},
		ImportOrigin = {
			PositionMagnitude = { [config.COMPARISON_METHODS.SMALLER_EQ] = 8 }
		}
	}
}
config.CONTENT_ID_FIELDS = {
	SpecialMesh = { "MeshId", "TextureId" },
	MeshPart = { "MeshId", "TextureID" },
	SurfaceAppearance = { "ColorMap", "MetalnessMap", "NormalMap", "RoughnessMap" },
	Decal = { "ColorMap", "MetalnessMap", "NormalMap", "RoughnessMap" },
	WrapLayer = { "CageMeshId", "ReferenceMeshId" },
	WrapTarget = { "CageMeshId" },
	Animation = { "AnimationId" }
}
config.CONTENT_FIELDS_WITHOUT_CONTENTID = { SurfaceAppearance = { "EmissiveMaskContent" } }

if GetFFlagUGCValidateCheckTexturePackOwnerModule() then
	table.insert(config.CONTENT_ID_FIELDS.SurfaceAppearance, "TexturePack")
end
if GetFFlagUGCValidateCheckHSROwnerModule() then
	table.insert(config.CONTENT_ID_FIELDS.WrapLayer, "HSRAssetId")
end
config.CONTENT_ID_REQUIRED_FIELDS = {
	SpecialMesh = { MeshId = true, TextureId = true },
	MeshPart = { MeshId = true },
	WrapTarget = { CageMeshId = true },
	Animation = { AnimationId = true }
}
config.CONTENT_ID_EDITABLE_PROPERTY = {
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
config.CONTENT_TYPED_PROPERTIES_BY_CLASS = {
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
config.MESH_CONTENT_ID_FIELDS = {
	SpecialMesh = { "MeshId" },
	MeshPart = { "MeshId" },
	WrapTarget = { "CageMeshId" },
	WrapLayer = { "CageMeshId", "ReferenceMeshId" }
}
config.TEXTURE_CONTENT_ID_FIELDS = {
	SpecialMesh = { "TextureId" },
	MeshPart = { "TextureID" },
	SurfaceAppearance = { "ColorMap", "MetalnessMap", "NormalMap", "RoughnessMap" },
	Decal = { "ColorMap", "MetalnessMap", "NormalMap", "RoughnessMap" }
}
config.ASSET_RENDER_MESH_MAX_TRIANGLES = {
	DynamicHead = ValidationRulesUtilModule:getBodyPartMaxTrianglesRule(Enum.AssetType.DynamicHead),
	LeftArm = ValidationRulesUtilModule:getBodyPartMaxTrianglesRule(Enum.AssetType.LeftArm),
	RightArm = ValidationRulesUtilModule:getBodyPartMaxTrianglesRule(Enum.AssetType.RightArm),
	Torso = ValidationRulesUtilModule:getBodyPartMaxTrianglesRule(Enum.AssetType.Torso),
	LeftLeg = ValidationRulesUtilModule:getBodyPartMaxTrianglesRule(Enum.AssetType.LeftLeg),
	RightLeg = ValidationRulesUtilModule:getBodyPartMaxTrianglesRule(Enum.AssetType.RightLeg)
}
config.WRAP_TARGET_CAGE_MESH_UV_COUNTS = {
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
config.PACKAGE_CONTENT_ID_FIELDS = CryoModule.Dictionary.join(config.CONTENT_ID_FIELDS, {
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
config.ExperienceAuthHeaderKey = "RBX-ExperienceAuthorization"
config.ContentType = "Content-Type"
config.ApplicationJson = "application/json"
config.GUIDAttributeName = "RBXGUID"
config.GUIDAttributeMaxLength = 100
config.EmoteIsUGCAttributeName = "RBXisUGCEmote"
config.EmoteMaxPartTranslationAttributeName = "RBXmaxPartTranslation"
config.AlternateMeshIdAttributeName = "RBX_ALT_MESH_ID"
config.MESH_CONTENT_TYPE = {
	RENDER_MESH = "RenderMesh",
	OUTER_CAGE = "OuterCage",
	INNER_CAGE = "InnerCage"
}
config.MESH_CONTENT_TYPE_TO_FIELD_NAME = {
	[config.MESH_CONTENT_TYPE.RENDER_MESH] = "MeshId",
	[config.MESH_CONTENT_TYPE.OUTER_CAGE] = "CageMeshId",
	[config.MESH_CONTENT_TYPE.INNER_CAGE] = "ReferenceMeshId"
}
config.ANIMATION_ASSET_INFO = {
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
config.AllAssetUploadCategories = {
	ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
	ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD,
	ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
	ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
	ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY,
	ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION
}
table.insert(config.AllAssetUploadCategories, ValidationEnumsModule.UploadCategory.ANIMATION)
config.AllAssetUploadCategoriesIncludingMakeup = {}

for _, allAssetUploadCategory in config.AllAssetUploadCategories do
	table.insert(config.AllAssetUploadCategoriesIncludingMakeup, allAssetUploadCategory)
end
table.insert(config.AllAssetUploadCategoriesIncludingMakeup, ValidationEnumsModule.UploadCategory.MAKEUP)

if GetFFlagUGCValidateMakeupCategoryParityModule() then
	table.insert(config.AllAssetUploadCategories, ValidationEnumsModule.UploadCategory.MAKEUP)
end
config.AllBundleUploadCategories = {
	ValidationEnumsModule.UploadCategory.FULL_BODY,
	ValidationEnumsModule.UploadCategory.BOTH_SHOES
}
table.insert(config.AllBundleUploadCategories, ValidationEnumsModule.UploadCategory.ANIMATION_PACK)
config.AllUploadCategories = {}

for _, value4 in ValidationEnumsModule.UploadCategory do
	table.insert(config.AllUploadCategories, value4)
end
config.AssetUploadsWithFolderStructure = {
	[Enum.AssetType.Torso] = true,
	[Enum.AssetType.LeftArm] = true,
	[Enum.AssetType.RightArm] = true,
	[Enum.AssetType.LeftLeg] = true,
	[Enum.AssetType.RightLeg] = true
}
config.SkinningTransferRequiredTypes = {
	[Enum.AssetType.EyebrowAccessory] = true,
	[Enum.AssetType.EyelashAccessory] = true
}

return config