local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Symbol = require(CorePackages.Workspace.Packages.AppCommonLib).Symbol
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local ItemTypeEnum = AvatarExperienceCommonModule.Enums.ItemTypeEnum
local FullView = AvatarExperienceCommonModule.Enums.FullView
local _ = require(Modules.AvatarExperience.Common.Types)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local Constants = AvatarExperienceCommonModule.Constants
local FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule = require(Modules.AvatarExperience.Flags.FFlagUseUpdatedBackgroundSceneSettingsOnMobile)
local AXItemDetails3DPreviewIXPModule = require(Modules.AvatarExperience.Experiments.AXItemDetails3DPreviewIXP)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local GetFFlagAXSupportShoesInItemViewportModule = require(Modules.AvatarExperience.Flags.GetFFlagAXSupportShoesInItemViewport)
local AXEnableSearchLandingFocusedPageFullViewDefault = game:DefineFastFlag("AXEnableSearchLandingFocusedPageFullViewDefault", false)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXEditorSubcategoryFilters = AvatarExperienceFlagsModule.FFlagAXEditorSubcategoryFilters
local FFlagAXSlotsInventoryLoadableGridView = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsInventoryLoadableGridView
local FFlagParseHeadShapeFromAPIResponse = AvatarExperienceFlagsModule.FFlagParseHeadShapeFromAPIResponse
local FFlagAXIncreaseDefaultPeekViewHeight = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXIncreaseDefaultPeekViewHeight
local FFlagIncreaseMarketplaceContentHeight = SharedFlagsModule.FFlagIncreaseMarketplaceContentHeight
local AXCatalogMainNavHeight = game:DefineFastInt("AXCatalogMainNavHeight", 40)
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local FFlagAXCatalogOffersBannerEnabled = AvatarExperienceFlagsModule.FFlagAXCatalogOffersBannerEnabled
local FFlagAXMoveCatalogFilterToL1Navigation = AvatarExperienceFlagsModule.FFlagAXMoveCatalogFilterToL1Navigation
local FFlagAXEyebrowEyelashToMakeupCategory = AvatarExperienceFlagsModule.FFlagAXEyebrowEyelashToMakeupCategory
local FFlagLuaAppForceVrAppPanelWidthRollout = SharedFlagsModule.FFlagLuaAppForceVrAppPanelWidthRollout
local FFlagHeadRefinementFacialAnimationToggle = AvatarExperienceFlagsModule.FFlagHeadRefinementFacialAnimationToggle
local FFlagAXCatalogBackgroundsSupport = AvatarExperienceFlagsModule.FFlagAXCatalogBackgroundsSupport
local AXMigrateMainNavHeightToFInt = game:DefineFastFlag("AXMigrateMainNavHeightToFInt", false)
local AXMainNavHeight = game:DefineFastInt("AXMainNavHeight", 40)
local FIntMaquettesAppPanelDistanceMultiplierPercentageRatio = SharedFlagsModule.GetFIntMaquettesAppPanelDistanceMultiplierPercentage() / 100
local Asset = {
	_150x150 = "w=150&h=150",
	_420x420 = "w=420&h=420",
	_300x450 = "w=300&h=450"
}
local ConstantsModule = {
	WidgetListHorizontalMargin = 15,
	WidgetListVerticalMargin = 10,
	PageButtonCornerRadius = 12,
	SponsoredItemsRow = game:DefineFastInt("AXSponsoredItemsRow", 7),
	CatalogThumbnailTypeToSize = { Asset = Asset, BundleThumbnail = Asset, Look = Asset },
	DefaultCatalogCategoryId = AvatarExperienceCommonModule.Enums.CatalogCategories.Recommended:rawValue(),
	DeviceType = { Android = "Android", IOS = "iOS", Other = "Other" },
	BlockyBundleId = 356,
	NumRecommendedItems = 6,
	AnalyticsTag = "LuaAvatarExperience",
	ContentFeedAnalyticsTag = "ContentFeed",
	ProfileAnalyticsTag = "LuaProfile",
	DefaultRigPosition = vector.create(11.777738571166992, 6.766530990600586, 0.2743154764175415),
	AvatarType = { R6 = "R6", R15 = "R15" },
	ItemPromptType = {
		OpenPurchasePrompt = "OpenPurchasePrompt",
		OpenGoToAvatarEditorPrompt = "OpenGoToAvatarEditorPrompt",
		OpenPremiumUpsellPrompt = "OpenPremiumUpsellPrompt",
		Disabled = "Disabled",
		SoldOut = "SoldOut"
	},
	ItemTilePadding = 10,
	ItemTileTitleMaxLines = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus then 1 else 2,
	EditorItemTileTitleMaxLines = if FFlagAXSlotsInventoryLoadableGridView then 1 else nil,
	ItemTileInnerPadding = 4,
	ItemTileTallAspectRatio = 0.7,
	ItemTileSquareAspectRatio = 1,
	LookTileAspectRatio = 0.7,
	CreatorNameItemTilePadding = 0,
	CreatorNameItemTileTitleMaxLines = 1,
	ImpressionsDetectionInterval = 1,
	FocusType = {
		Legs = "Legs",
		Face = "Face",
		Arms = "Arms",
		Head = "Head",
		Neck = "Neck",
		Waist = "Waist",
		Shoulders = "Shoulders",
		Makeup = "Makeup"
	},
	AssetCategories = {
		Animation = "Animation",
		Body = "Body",
		Clothing = "Clothing",
		Accessory = "Accessory",
		Emotes = "Emotes"
	},
	PageType = {
		Normal = "Normal",
		Animation = "Animation",
		BodyColors = "BodyColors",
		BodyStyle = "BodyStyle",
		Avatars = "Avatars",
		Emotes = "Emotes",
		Other = "Other",
		AllAnimation = "AllAnimation",
		MakeupLooks = if FFlagAXCustomizeMakeupSupport then "MakeupLooks" else nil
	},
	ParticleType = {
		CatalogToAvatarEditor = "CatalogToAvatarEditor",
		AvatarEditorToCatalog = "AvatarEditorToCatalog",
		None = "None"
	},
	BackgroundType = {
		LargerShapes = "LargerShapes",
		NoShapesNoWalls = "NoShapesNoWalls",
		Walls = "Walls"
	},
	NavigationDirection = { IS_LEFT = "IS_LEFT", IS_RIGHT = "IS_RIGHT" },
	ShimmerCardsToDisplay = 30,
	UserInventoryKey = "avatar.inventory.",
	OutfitsKey = "avatar.outfits.",
	OutfitInfoKey = "avatar.outfit.info.",
	RecommendedItemsKey = "avatar.recommendedItems.",
	GetAvatarRulesKey = "avatareditor.getavatarrules",
	SearchCatalogKey = "avatar.search.",
	AvatarHomeRecKey = "avatar.home.recommendations",
	NewOutfitNotificationKey = "avatar.newOutfitNotification",
	NewDHOutfitNotificationKey = "avatar.newDHOutfitNotification",
	PeekHeaderHeight = 25,
	PeekHeaderMinHeight = 5,
	MainNavHeight = if AXMigrateMainNavHeightToFInt then AXMainNavHeight else 60,
	CatalogMainNavHeight = if require(Modules.AvatarExperience.Flags.GetFFlagAXEnableCategoryPills)() or FFlagAXMoveCatalogFilterToL1Navigation then AXCatalogMainNavHeight else nil,
	SubNavHeight = 40,
	MainNavPhotoboothHeight = 36,
	PillBarHeight = 52,
	CatalogOffersBannerPeekClosedExtraHeight = if FFlagAXCatalogOffersBannerEnabled then 48 else nil,
	FocusedWidgetTitleHeight = 52,
	ScrollYPositionDetectableEpsilon = 1,
	LooksDetailsTabBarHeight = 50,
	LandscapeNavWidth = 0.6,
	LandscapeUiMargin = 24,
	LandscapeSceneWidth = 0.4,
	LoadableGridViewCellPadding = 10,
	PortraitSceneHeight = if FFlagIncreaseMarketplaceContentHeight then 0.29 elseif FFlagAXIncreaseDefaultPeekViewHeight then 0.36 else 0.4,
	LandingPagePortraitSceneHeight = 0.5,
	LandingPagePortraitMinItemsHeightPix = 300,
	LandingPageMinTopFrameHeightPix = 100,
	LandingPageMinBottomFrameHeightPix = 65,
	PageButtonForegroundMinHeightPix = 100,
	SceneButtonSize = 44,
	SceneButtonCornerRadius = UDim.new(0, 8),
	SceneButtonHorizontalPadding = 24,
	DynamicHeadSplashMaxViews = 3,
	AccessoryAssetTypes = {
		[Enum.AccessoryType.Hat] = true,
		[Enum.AccessoryType.Face] = true,
		[Enum.AccessoryType.Neck] = true,
		[Enum.AccessoryType.Shoulder] = true,
		[Enum.AccessoryType.Front] = true,
		[Enum.AccessoryType.Back] = true,
		[Enum.AccessoryType.Waist] = true
	},
	BypassAccessoryLimitsAccessoryAssetTypeIdStrings = {
		[tostring(Enum.AssetType.Hat.Value)] = true,
		[tostring(Enum.AssetType.FaceAccessory.Value)] = true,
		[tostring(Enum.AssetType.NeckAccessory.Value)] = true,
		[tostring(Enum.AssetType.ShoulderAccessory.Value)] = true,
		[tostring(Enum.AssetType.FrontAccessory.Value)] = true,
		[tostring(Enum.AssetType.BackAccessory.Value)] = true,
		[tostring(Enum.AssetType.WaistAccessory.Value)] = true
	},
	ContextWidgetsAllowedRoutes = { AvatarScreen.Catalog },
	DraftLookId = "DraftLook",
	WearAfterPurchasePostPurchaseActionKey = "wearAfterPurchase",
	SaveAsCharacterPostPurchaseActionKey = "saveAsCharacter"
}

if FFlagAXCustomizeMakeupSupport then
	ConstantsModule.AssetCategories.Makeup = "Makeup"
end
if FFlagAXCatalogBackgroundsSupport then
	ConstantsModule.AssetCategories.Backgrounds = "Backgrounds"
end
ConstantsModule.BundleTypeIdStrings = Constants.BUNDLE_TYPE_ID_STRINGS
ConstantsModule.BundleTypeIdStringToName = Constants.BUNDLE_TYPE_ID_STRING_TO_NAME
ConstantsModule.BundleTypeIdStringToNameForBackend = Constants.BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND
ConstantsModule.BundleTypeNameToIdStringForCatalogHydration = {
	BodyParts = "1",
	AvatarAnimations = "2",
	Shoes = "3",
	DynamicHead = "4"
}

if FFlagAXInventoryDurablesSupport and FFlagAXEditorSubcategoryFilters then
	ConstantsModule.BundleTypeIdStringsForBackend = {
		[ConstantsModule.BundleTypeIdStrings.BodyParts] = "1",
		[ConstantsModule.BundleTypeIdStrings.DynamicHead] = "2",
		[ConstantsModule.BundleTypeIdStrings.Avatars] = "3",
		[ConstantsModule.BundleTypeIdStrings.Shoes] = "4",
		[ConstantsModule.BundleTypeIdStrings.Animations] = "5"
	}
elseif FFlagAXEditorSubcategoryFilters then
	ConstantsModule.BundleTypeIdStringsForBackend = {
		[ConstantsModule.BundleTypeIdStrings.BodyParts] = "1",
		[ConstantsModule.BundleTypeIdStrings.DynamicHead] = "2",
		[ConstantsModule.BundleTypeIdStrings.Shoes] = "4",
		[ConstantsModule.BundleTypeIdStrings.Animations] = "5"
	}
else
	ConstantsModule.BundleTypeIdStringsForBackend = {
		[ConstantsModule.BundleTypeIdStrings.BodyParts] = "1",
		[ConstantsModule.BundleTypeIdStrings.DynamicHead] = "2",
		[ConstantsModule.BundleTypeIdStrings.Shoes] = "3",
		[ConstantsModule.BundleTypeIdStrings.Animations] = "4"
	}
end
ConstantsModule.AssetTypeIdStrings = Constants.ASSET_TYPE_NAME_TO_ID_STRING
ConstantsModule.AssetTypeIdStringToName = Constants.ASSET_TYPE_ID_STRING_TO_NAME
ConstantsModule.DynamicHeadAssetTypes = {
	[ConstantsModule.AssetTypeIdStrings.EyebrowAccessory] = true,
	[ConstantsModule.AssetTypeIdStrings.EyelashAccessory] = true,
	[ConstantsModule.AssetTypeIdStrings.MoodAnimation] = true,
	[ConstantsModule.AssetTypeIdStrings.DynamicHead] = true
}
ConstantsModule.OutfitTypes = AvatarExperienceCommonModule.Enums.OutfitTypes
ConstantsModule.BundleTypeIdStringToOutfitType = {
	[ConstantsModule.BundleTypeIdStrings.BodyParts] = ConstantsModule.OutfitTypes.Avatar,
	[ConstantsModule.BundleTypeIdStrings.DynamicHead] = ConstantsModule.OutfitTypes.DynamicHead,
	[ConstantsModule.BundleTypeIdStrings.Shoes] = ConstantsModule.OutfitTypes.Shoes,
	[ConstantsModule.BundleTypeIdStrings.Animations] = if GetFFlagAXEnableSlotBasedEditorModule() then ConstantsModule.OutfitTypes.Animations else nil
}
ConstantsModule.InventoryTypeToBundleTypeId = {
	Body = ConstantsModule.BundleTypeIdStrings.BodyParts,
	DynamicHead = ConstantsModule.BundleTypeIdStrings.DynamicHead,
	Shoes = ConstantsModule.BundleTypeIdStrings.Shoes,
	Animations = ConstantsModule.BundleTypeIdStrings.Animations
}
ConstantsModule.ItemTileType = {
	AvatarEditorTile = "AvatarEditorTile",
	BodyColorButton = "BodyColorButton",
	BundleItemTile = "BundleItemTile",
	BundleItemTileNoText = "BundleItemTileNoText",
	CatalogItemTile = "CatalogItemTile",
	RecommendedCatalogItemTile = "RecommendedCatalogItemTile",
	TallCatalogItemTile = "TallCatalogItemTile",
	LookItemTile = "LookItemTile"
}
ConstantsModule.ItemType = ItemTypeEnum
ConstantsModule.LookType = Constants.LOOK_TYPE

function ConstantsModule.confirmItemType(Asset)
	-- upvalues: ConstantsModule (copy)
	return if Asset == ConstantsModule.ItemType.Asset then ConstantsModule.ItemType.Asset elseif Asset == ConstantsModule.ItemType.Bundle then ConstantsModule.ItemType.Bundle elseif Asset == ConstantsModule.ItemType.Outfit then ConstantsModule.ItemType.Asset else nil
end

ConstantsModule.AnalyticsContext = {
	[AvatarScreen.AvatarExperienceLandingPage] = AvatarScreen.AvatarExperienceLandingPage,
	[AvatarScreen.Catalog] = AvatarScreen.Catalog,
	[AvatarScreen.CatalogSearch] = AvatarScreen.CatalogSearch,
	[AvatarScreen.AvatarEditor] = AvatarScreen.AvatarEditor,
	[AvatarScreen.ProfilePictureEditorEmotes] = AvatarScreen.ProfilePictureEditorEmotes,
	[AvatarScreen.AccessoryAdjustment] = AvatarScreen.AccessoryAdjustment,
	[AvatarScreen.AvatarRefinement] = AvatarScreen.AvatarRefinement,
	[AvatarScreen.AdjustAccessoryView] = AvatarScreen.AdjustAccessoryView,
	[AvatarScreen.LayeredClothingSort] = AvatarScreen.LayeredClothingSort,
	[AvatarScreen.LayeredMakeupSort] = if FFlagAXCustomizeMakeupSupport then AvatarScreen.LayeredMakeupSort else nil,
	[AvatarScreen.CatalogSearchLanding] = AvatarScreen.CatalogSearchLanding,
	[AvatarScreen.MySharedAvatars] = AvatarScreen.MySharedAvatars,
	[AvatarScreen.FavoritesSaved] = AvatarScreen.FavoritesSaved,
	[AvatarScreen.HeadRefinement] = AvatarScreen.HeadRefinement,
	[AvatarScreen.SearchLandingFocusedWidgetPage] = AvatarScreen.SearchLandingFocusedWidgetPage,
	[AvatarScreen.BodyShape] = if GetFFlagAXEnableSlotBasedEditorModule() then AvatarScreen.BodyShape else nil,
	[AvatarScreen.AvatarSwitcher] = if GetFFlagAXEnableSlotBasedEditorModule() then AvatarScreen.AvatarSwitcher else nil,
	[AvatarScreen.EditEmotes] = if GetFFlagAXEnableSlotBasedEditorModule() then AvatarScreen.EditEmotes else nil,
	[AvatarScreen.TryOnItem] = AvatarScreen.TryOnItem,
	[AvatarScreen.Photobooth] = if AvatarExperienceFlagsModule.FFlagAXPhotoboothFunctionality then AvatarScreen.Photobooth else nil
}
ConstantsModule.PagePlayParticleType = {
	[AvatarScreen.AvatarEditor] = ConstantsModule.ParticleType.CatalogToAvatarEditor,
	[AvatarScreen.MySharedAvatars] = ConstantsModule.ParticleType.CatalogToAvatarEditor,
	[AvatarScreen.ProfilePictureEditorEmotes] = ConstantsModule.ParticleType.CatalogToAvatarEditor,
	[AvatarScreen.ProfilePictureEditorCamera] = ConstantsModule.ParticleType.None,
	[AvatarScreen.ProfilePictureEditorFinal] = ConstantsModule.ParticleType.None,
	[AvatarScreen.AvatarBackground] = ConstantsModule.ParticleType.None,
	[AvatarScreen.Catalog] = ConstantsModule.ParticleType.AvatarEditorToCatalog
}
ConstantsModule.PageBackgroundType = {
	[AvatarScreen.AvatarEditor] = ConstantsModule.BackgroundType.LargerShapes,
	[AvatarScreen.MySharedAvatars] = ConstantsModule.BackgroundType.LargerShapes,
	[AvatarScreen.ProfilePictureEditorEmotes] = ConstantsModule.BackgroundType.LargerShapes,
	[AvatarScreen.ProfilePictureEditorCamera] = ConstantsModule.BackgroundType.NoShapesNoWalls,
	[AvatarScreen.ProfilePictureEditorFinal] = ConstantsModule.BackgroundType.NoShapesNoWalls,
	[AvatarScreen.AvatarBackground] = ConstantsModule.BackgroundType.Walls,
	[AvatarScreen.Catalog] = if FFlagUseUpdatedBackgroundSceneSettingsOnMobileModule then ConstantsModule.BackgroundType.LargerShapes else ConstantsModule.BackgroundType.Walls,
	[AvatarScreen.AvatarExperienceLandingPage] = ConstantsModule.BackgroundType.Walls
}
ConstantsModule.AttachmentName = {
	BodyBackAttachment = "BodyBackAttachment",
	BodyFrontAttachment = "BodyFrontAttachment",
	Bone = "Bone",
	FaceCenterAttachment = "FaceCenterAttachment",
	FaceFrontAttachment = "FaceFrontAttachment",
	HairAttachment = "HairAttachment",
	HatAttachment = "HatAttachment",
	LeftAnkleRigAttachment = "LeftAnkleRigAttachment",
	LeftCollarAttachment = "LeftCollarAttachment",
	LeftElbowRigAttachment = "LeftElbowRigAttachment",
	LeftFootAttachment = "LeftFootAttachment",
	LeftGripAttachment = "LeftGripAttachment",
	LeftHipRigAttachment = "LeftHipRigAttachment",
	LeftKneeRigAttachment = "LeftKneeRigAttachment",
	LeftShoulderAttachment = "LeftShoulderAttachment",
	LeftShoulderRigAttachment = "LeftShoulderRigAttachment",
	LeftWristRigAttachment = "LeftWristRigAttachment",
	NeckAttachment = "NeckAttachment",
	NeckRigAttachment = "NeckRigAttachment",
	RightAnkleRigAttachment = "RightAnkleRigAttachment",
	RightCollarAttachment = "RightCollarAttachment",
	RightElbowRigAttachment = "RightElbowRigAttachment",
	RightFootAttachment = "RightFootAttachment",
	RightGripAttachment = "RightGripAttachment",
	RightHipRigAttachment = "RightHipRigAttachment",
	RightKneeRigAttachment = "RightKneeRigAttachment",
	RightShoulderAttachment = "RightShoulderAttachment",
	RightShoulderRigAttachment = "RightShoulderRigAttachment",
	RightWristRigAttachment = "RightWristRigAttachment",
	RootRigAttachment = "RootRigAttachment",
	WaistBackAttachment = "WaistBackAttachment",
	WaistCenterAttachment = "WaistCenterAttachment",
	WaistFrontAttachment = "WaistFrontAttachment",
	WaistRigAttachment = "WaistRigAttachment"
}
ConstantsModule.PartName = {
	Head = "Head",
	Makeup = "Makeup",
	R6_BODY_PARTS = {
		Torso = "Torso",
		LeftLeg = "Left Leg",
		RightLeg = "Right Leg",
		LeftArm = "Left Arm",
		RightArm = "Right Arm"
	},
	R15_BODY_PARTS = {
		UpperTorso = "UpperTorso",
		LowerTorso = "LowerTorso",
		LeftUpperLeg = "LeftUpperLeg",
		LeftLowerLeg = "LeftLowerLeg",
		LeftFoot = "LeftFoot",
		RightUpperLeg = "RightUpperLeg",
		RightLowerLeg = "RightLowerLeg",
		RightFoot = "RightFoot",
		LeftUpperArm = "LeftUpperArm",
		LeftLowerArm = "LeftLowerArm",
		LeftHand = "LeftHand",
		RightUpperArm = "RightUpperArm",
		RightLowerArm = "RightLowerArm",
		RightHand = "RightHand"
	}
}
ConstantsModule.AssetTypeIdToPartsAndAttachments = {
	[ConstantsModule.AvatarType.R6] = {
		[ConstantsModule.AssetTypeIdStrings.Hat] = {
			{
				Part = ConstantsModule.PartName.Head,
				Attachment = ConstantsModule.AttachmentName.HatAttachment
			}
		},
		[ConstantsModule.AssetTypeIdStrings.HairAccessory] = {
			{
				Part = ConstantsModule.PartName.Head,
				Attachment = ConstantsModule.AttachmentName.HairAttachment
			}
		},
		[ConstantsModule.AssetTypeIdStrings.FaceAccessory] = {
			{
				Part = ConstantsModule.PartName.Head,
				Attachment = ConstantsModule.AttachmentName.FaceFrontAttachment
			}
		},
		[ConstantsModule.AssetTypeIdStrings.NeckAccessory] = { { Part = ConstantsModule.PartName.Head } },
		[ConstantsModule.AssetTypeIdStrings.FrontAccessory] = { { Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso } },
		[ConstantsModule.AssetTypeIdStrings.BackAccessory] = { { Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso } },
		[ConstantsModule.AssetTypeIdStrings.WaistAccessory] = { { Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso } },
		[ConstantsModule.AssetTypeIdStrings.Shirt] = {
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.RightArm },
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.LeftArm },
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso }
		},
		[ConstantsModule.AssetTypeIdStrings.TShirt] = {
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.RightArm },
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.LeftArm },
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso }
		},
		[ConstantsModule.AssetTypeIdStrings.Pants] = {
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.RightLeg },
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.LeftLeg }
		},
		[ConstantsModule.AssetTypeIdStrings.Head] = { { Part = ConstantsModule.PartName.Head } },
		[ConstantsModule.AssetTypeIdStrings.Face] = { { Part = ConstantsModule.PartName.Head } },
		[ConstantsModule.AssetTypeIdStrings.Torso] = { { Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso } },
		[ConstantsModule.AssetTypeIdStrings.RightArm] = {
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.RightArm }
		},
		[ConstantsModule.AssetTypeIdStrings.LeftArm] = {
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.LeftArm }
		},
		[ConstantsModule.AssetTypeIdStrings.RightLeg] = {
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.RightLeg }
		},
		[ConstantsModule.AssetTypeIdStrings.LeftLeg] = {
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.LeftLeg }
		},
		[ConstantsModule.AssetTypeIdStrings.ClimbAnimation] = { { Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso } },
		[ConstantsModule.AssetTypeIdStrings.FallAnimation] = { { Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso } },
		[ConstantsModule.AssetTypeIdStrings.IdleAnimation] = { { Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso } },
		[ConstantsModule.AssetTypeIdStrings.JumpAnimation] = { { Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso } },
		[ConstantsModule.AssetTypeIdStrings.RunAnimation] = { { Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso } },
		[ConstantsModule.AssetTypeIdStrings.SwimAnimation] = { { Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso } },
		[ConstantsModule.AssetTypeIdStrings.WalkAnimation] = { { Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso } },
		[ConstantsModule.AssetTypeIdStrings.TShirtAccessory] = { { Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso } },
		[ConstantsModule.AssetTypeIdStrings.ShirtAccessory] = { { Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso } },
		[ConstantsModule.AssetTypeIdStrings.PantsAccessory] = {
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.RightLeg },
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.LeftLeg }
		},
		[ConstantsModule.AssetTypeIdStrings.JacketAccessory] = { { Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso } },
		[ConstantsModule.AssetTypeIdStrings.SweaterAccessory] = { { Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso } },
		[ConstantsModule.AssetTypeIdStrings.ShortsAccessory] = {
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.RightLeg },
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.LeftLeg }
		},
		[ConstantsModule.AssetTypeIdStrings.LeftShoeAccessory] = {
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.LeftLeg }
		},
		[ConstantsModule.AssetTypeIdStrings.RightShoeAccessory] = {
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.RightLeg }
		},
		[ConstantsModule.AssetTypeIdStrings.DressSkirtAccessory] = {
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.RightLeg },
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.LeftLeg }
		}
	},
	[ConstantsModule.AvatarType.R15] = {
		[ConstantsModule.AssetTypeIdStrings.Hat] = {
			{
				Part = ConstantsModule.PartName.Head,
				Attachment = ConstantsModule.AttachmentName.HatAttachment
			}
		},
		[ConstantsModule.AssetTypeIdStrings.HairAccessory] = {
			{
				Part = ConstantsModule.PartName.Head,
				Attachment = ConstantsModule.AttachmentName.HairAttachment
			}
		},
		[ConstantsModule.AssetTypeIdStrings.FaceAccessory] = {
			{
				Part = ConstantsModule.PartName.Head,
				Attachment = ConstantsModule.AttachmentName.FaceFrontAttachment
			}
		},
		[ConstantsModule.AssetTypeIdStrings.NeckAccessory] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso,
				Attachment = ConstantsModule.AttachmentName.NeckAttachment
			}
		},
		[ConstantsModule.AssetTypeIdStrings.FrontAccessory] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso,
				Attachment = ConstantsModule.AttachmentName.BodyFrontAttachment
			}
		},
		[ConstantsModule.AssetTypeIdStrings.BackAccessory] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso,
				Attachment = ConstantsModule.AttachmentName.BodyBackAttachment
			}
		},
		[ConstantsModule.AssetTypeIdStrings.WaistAccessory] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LowerTorso,
				Attachment = ConstantsModule.AttachmentName.WaistCenterAttachment
			}
		},
		[ConstantsModule.AssetTypeIdStrings.Shirt] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.RightUpperArm
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LeftUpperArm
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso
			}
		},
		[ConstantsModule.AssetTypeIdStrings.TShirt] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.RightUpperArm
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LeftUpperArm
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso
			}
		},
		[ConstantsModule.AssetTypeIdStrings.Pants] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.RightUpperLeg
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.RightLowerLeg
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LeftUpperLeg
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LeftLowerLeg
			}
		},
		[ConstantsModule.AssetTypeIdStrings.Head] = { { Part = ConstantsModule.PartName.Head } },
		[ConstantsModule.AssetTypeIdStrings.Face] = { { Part = ConstantsModule.PartName.Head } },
		[ConstantsModule.AssetTypeIdStrings.Torso] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso
			}
		},
		[ConstantsModule.AssetTypeIdStrings.RightArm] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.RightUpperArm
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.RightLowerArm
			}
		},
		[ConstantsModule.AssetTypeIdStrings.LeftArm] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LeftUpperArm
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LeftLowerArm
			}
		},
		[ConstantsModule.AssetTypeIdStrings.RightLeg] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.RightUpperLeg
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.RightLowerLeg
			}
		},
		[ConstantsModule.AssetTypeIdStrings.LeftLeg] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LeftUpperLeg
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LeftLowerLeg
			}
		},
		[ConstantsModule.AssetTypeIdStrings.ClimbAnimation] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso
			}
		},
		[ConstantsModule.AssetTypeIdStrings.FallAnimation] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso
			}
		},
		[ConstantsModule.AssetTypeIdStrings.IdleAnimation] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso
			}
		},
		[ConstantsModule.AssetTypeIdStrings.JumpAnimation] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso
			}
		},
		[ConstantsModule.AssetTypeIdStrings.RunAnimation] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso
			}
		},
		[ConstantsModule.AssetTypeIdStrings.SwimAnimation] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso
			}
		},
		[ConstantsModule.AssetTypeIdStrings.WalkAnimation] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso
			}
		},
		[ConstantsModule.AssetTypeIdStrings.TShirtAccessory] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso
			}
		},
		[ConstantsModule.AssetTypeIdStrings.ShirtAccessory] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso
			}
		},
		[ConstantsModule.AssetTypeIdStrings.PantsAccessory] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.RightUpperLeg
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.RightLowerLeg
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LeftUpperLeg
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LeftLowerLeg
			}
		},
		[ConstantsModule.AssetTypeIdStrings.JacketAccessory] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso
			}
		},
		[ConstantsModule.AssetTypeIdStrings.SweaterAccessory] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso
			}
		},
		[ConstantsModule.AssetTypeIdStrings.ShortsAccessory] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.RightUpperLeg
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LeftUpperLeg
			}
		},
		[ConstantsModule.AssetTypeIdStrings.LeftShoeAccessory] = {
			{ Part = ConstantsModule.PartName.R15_BODY_PARTS.LeftFoot }
		},
		[ConstantsModule.AssetTypeIdStrings.RightShoeAccessory] = {
			{ Part = ConstantsModule.PartName.R15_BODY_PARTS.RightFoot }
		},
		[ConstantsModule.AssetTypeIdStrings.DressSkirtAccessory] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.RightUpperLeg
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LeftUpperLeg
			}
		}
	}
}
ConstantsModule.AvatarTypeFocusGroups = {
	[ConstantsModule.AvatarType.R15] = {
		[ConstantsModule.FocusType.Legs] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.RightUpperLeg
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LeftUpperLeg
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.RightLowerLeg
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LeftLowerLeg
			}
		},
		[ConstantsModule.FocusType.Face] = {
			{
				Part = ConstantsModule.PartName.Head,
				Attachment = ConstantsModule.AttachmentName.FaceFrontAttachment
			}
		},
		[ConstantsModule.FocusType.Makeup] = { { Part = ConstantsModule.PartName.Makeup } },
		[ConstantsModule.FocusType.Arms] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso
			}
		},
		[ConstantsModule.FocusType.Head] = {
			{
				Part = ConstantsModule.PartName.Head,
				Attachment = ConstantsModule.AttachmentName.HatAttachment
			},
			{
				Part = ConstantsModule.PartName.Head,
				Attachment = ConstantsModule.AttachmentName.NeckRigAttachment
			}
		},
		[ConstantsModule.FocusType.Neck] = {
			{ Part = ConstantsModule.PartName.Head },
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.UpperTorso
			}
		},
		[ConstantsModule.FocusType.Waist] = {
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LowerTorso
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.RightUpperLeg
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LeftUpperLeg
			}
		},
		[ConstantsModule.FocusType.Shoulders] = {
			{ Part = ConstantsModule.PartName.Head },
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.RightUpperArm
			},
			{
				Part = ConstantsModule.PartName.R15_BODY_PARTS.LeftUpperArm
			}
		}
	},
	[ConstantsModule.AvatarType.R6] = {
		[ConstantsModule.FocusType.Legs] = {
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.RightLeg },
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.LeftLeg }
		},
		[ConstantsModule.FocusType.Face] = {
			{
				Part = ConstantsModule.PartName.Head,
				Attachment = ConstantsModule.AttachmentName.FaceFrontAttachment
			}
		},
		[ConstantsModule.FocusType.Arms] = { { Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso } },
		[ConstantsModule.FocusType.Head] = {
			{
				Part = ConstantsModule.PartName.Head,
				Attachment = ConstantsModule.AttachmentName.HatAttachment
			},
			{
				Part = ConstantsModule.PartName.Head,
				Attachment = ConstantsModule.AttachmentName.NeckRigAttachment
			}
		},
		[ConstantsModule.FocusType.Neck] = {
			{ Part = ConstantsModule.PartName.Head },
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso }
		},
		[ConstantsModule.FocusType.Waist] = {
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.Torso },
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.RightLeg },
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.LeftLeg }
		},
		[ConstantsModule.FocusType.Shoulders] = {
			{ Part = ConstantsModule.PartName.Head },
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.RightArm },
			{ Part = ConstantsModule.PartName.R6_BODY_PARTS.LeftArm }
		}
	}
}
ConstantsModule.AssetTypeIdToCategory = {
	[ConstantsModule.AssetTypeIdStrings.TShirt] = ConstantsModule.AssetCategories.Clothing,
	[ConstantsModule.AssetTypeIdStrings.Hat] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.HairAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.FaceAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.NeckAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.ShoulderAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.FrontAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.BackAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.WaistAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.Shirt] = ConstantsModule.AssetCategories.Clothing,
	[ConstantsModule.AssetTypeIdStrings.Pants] = ConstantsModule.AssetCategories.Clothing,
	[ConstantsModule.AssetTypeIdStrings.Gear] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.Head] = ConstantsModule.AssetCategories.Body,
	[ConstantsModule.AssetTypeIdStrings.Face] = ConstantsModule.AssetCategories.Body,
	[ConstantsModule.AssetTypeIdStrings.Torso] = ConstantsModule.AssetCategories.Body,
	[ConstantsModule.AssetTypeIdStrings.RightArm] = ConstantsModule.AssetCategories.Body,
	[ConstantsModule.AssetTypeIdStrings.LeftArm] = ConstantsModule.AssetCategories.Body,
	[ConstantsModule.AssetTypeIdStrings.RightLeg] = ConstantsModule.AssetCategories.Body,
	[ConstantsModule.AssetTypeIdStrings.LeftLeg] = ConstantsModule.AssetCategories.Body,
	[ConstantsModule.AssetTypeIdStrings.ClimbAnimation] = ConstantsModule.AssetCategories.Animation,
	[ConstantsModule.AssetTypeIdStrings.FallAnimation] = ConstantsModule.AssetCategories.Animation,
	[ConstantsModule.AssetTypeIdStrings.IdleAnimation] = ConstantsModule.AssetCategories.Animation,
	[ConstantsModule.AssetTypeIdStrings.JumpAnimation] = ConstantsModule.AssetCategories.Animation,
	[ConstantsModule.AssetTypeIdStrings.RunAnimation] = ConstantsModule.AssetCategories.Animation,
	[ConstantsModule.AssetTypeIdStrings.SwimAnimation] = ConstantsModule.AssetCategories.Animation,
	[ConstantsModule.AssetTypeIdStrings.WalkAnimation] = ConstantsModule.AssetCategories.Animation,
	[ConstantsModule.AssetTypeIdStrings.EmoteAnimation] = ConstantsModule.AssetCategories.Animation,
	[ConstantsModule.AssetTypeIdStrings.TShirtAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.ShirtAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.PantsAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.JacketAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.SweaterAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.ShortsAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.LeftShoeAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.RightShoeAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.DressSkirtAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.MoodAnimation] = ConstantsModule.AssetCategories.Animation,
	[ConstantsModule.AssetTypeIdStrings.EyebrowAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.EyelashAccessory] = ConstantsModule.AssetCategories.Accessory,
	[ConstantsModule.AssetTypeIdStrings.DynamicHead] = ConstantsModule.AssetCategories.Body
}

if FFlagAXCustomizeMakeupSupport then
	ConstantsModule.AssetTypeIdToCategory[ConstantsModule.AssetTypeIdStrings.FaceMakeup] = ConstantsModule.AssetCategories.Makeup
	ConstantsModule.AssetTypeIdToCategory[ConstantsModule.AssetTypeIdStrings.LipMakeup] = ConstantsModule.AssetCategories.Makeup
	ConstantsModule.AssetTypeIdToCategory[ConstantsModule.AssetTypeIdStrings.EyeMakeup] = ConstantsModule.AssetCategories.Makeup
end
if FFlagAXEyebrowEyelashToMakeupCategory then
	ConstantsModule.AssetTypeIdToCategory[ConstantsModule.AssetTypeIdStrings.EyebrowAccessory] = ConstantsModule.AssetCategories.Makeup
	ConstantsModule.AssetTypeIdToCategory[ConstantsModule.AssetTypeIdStrings.EyelashAccessory] = ConstantsModule.AssetCategories.Makeup
end
if FFlagAXCatalogBackgroundsSupport then
	ConstantsModule.AssetTypeIdToCategory[ConstantsModule.AssetTypeIdStrings.AvatarBackground] = ConstantsModule.AssetCategories.Backgrounds
end
ConstantsModule.GradientBackgroundAssetTypeIds = {
	[ConstantsModule.AssetTypeIdStrings.TShirtAccessory] = true,
	[ConstantsModule.AssetTypeIdStrings.ShirtAccessory] = true,
	[ConstantsModule.AssetTypeIdStrings.PantsAccessory] = true,
	[ConstantsModule.AssetTypeIdStrings.JacketAccessory] = true,
	[ConstantsModule.AssetTypeIdStrings.SweaterAccessory] = true,
	[ConstantsModule.AssetTypeIdStrings.ShortsAccessory] = true,
	[ConstantsModule.AssetTypeIdStrings.LeftShoeAccessory] = true,
	[ConstantsModule.AssetTypeIdStrings.RightShoeAccessory] = true,
	[ConstantsModule.AssetTypeIdStrings.DressSkirtAccessory] = true
}
ConstantsModule.AssetCategoriesLocalized = {
	[ConstantsModule.AssetCategories.Animation] = "Feature.Catalog.Label.Animation",
	[ConstantsModule.AssetCategories.Body] = "Feature.Catalog.Label.Body",
	[ConstantsModule.AssetCategories.Clothing] = "Feature.Avatar.Heading.Clothing",
	[ConstantsModule.AssetCategories.Accessory] = "Feature.Avatar.Label.Accessory",
	[ConstantsModule.AssetCategories.Emotes] = "Feature.Catalog.Label.Emotes"
}

if FFlagAXCustomizeMakeupSupport then
	ConstantsModule.AssetCategoriesLocalized[ConstantsModule.AssetCategories.Makeup] = "Feature.Catalog.Label.Makeup"
end
if FFlagAXCatalogBackgroundsSupport then
	ConstantsModule.AssetCategoriesLocalized[ConstantsModule.AssetCategories.Backgrounds] = "Feature.Avatar.Label.Backgrounds"
end
ConstantsModule.AssetTypeLocalized = {
	[ConstantsModule.AssetTypeIdStrings.TShirt] = "Feature.Avatar.Label.ClassicTShirts",
	[ConstantsModule.AssetTypeIdStrings.Hat] = "Feature.Avatar.Label.Hat",
	[ConstantsModule.AssetTypeIdStrings.HairAccessory] = "Feature.Avatar.Label.Hair",
	[ConstantsModule.AssetTypeIdStrings.FaceAccessory] = "Feature.Avatar.Label.Face",
	[ConstantsModule.AssetTypeIdStrings.NeckAccessory] = "Feature.Avatar.Label.Neck",
	[ConstantsModule.AssetTypeIdStrings.ShoulderAccessory] = "Feature.Avatar.Label.Shoulder",
	[ConstantsModule.AssetTypeIdStrings.FrontAccessory] = "Feature.Avatar.Label.Front",
	[ConstantsModule.AssetTypeIdStrings.BackAccessory] = "Feature.Avatar.Label.Back",
	[ConstantsModule.AssetTypeIdStrings.WaistAccessory] = "Feature.Avatar.Label.Waist",
	[ConstantsModule.AssetTypeIdStrings.Shirt] = "Feature.Avatar.Label.ClassicShirts",
	[ConstantsModule.AssetTypeIdStrings.Pants] = "Feature.Avatar.Label.ClassicPants",
	[ConstantsModule.AssetTypeIdStrings.Gear] = "Feature.Avatar.Label.Gear",
	[ConstantsModule.AssetTypeIdStrings.Head] = "Feature.Avatar.Label.Head",
	[ConstantsModule.AssetTypeIdStrings.Face] = "Feature.Avatar.Label.Face",
	[ConstantsModule.AssetTypeIdStrings.Torso] = "Feature.Avatar.Label.Torso",
	[ConstantsModule.AssetTypeIdStrings.RightArm] = "Feature.Avatar.Label.RightArms",
	[ConstantsModule.AssetTypeIdStrings.LeftArm] = "Feature.Avatar.Label.LeftArms",
	[ConstantsModule.AssetTypeIdStrings.LeftLeg] = "Feature.Avatar.Label.LeftLegs",
	[ConstantsModule.AssetTypeIdStrings.RightLeg] = "Feature.Avatar.Label.RightLegs",
	[ConstantsModule.AssetTypeIdStrings.ClimbAnimation] = "Feature.Avatar.Label.Climb",
	[ConstantsModule.AssetTypeIdStrings.FallAnimation] = "Feature.Avatar.Label.Fall",
	[ConstantsModule.AssetTypeIdStrings.IdleAnimation] = "Feature.Avatar.Label.Idle",
	[ConstantsModule.AssetTypeIdStrings.JumpAnimation] = "Feature.Avatar.Label.Jump",
	[ConstantsModule.AssetTypeIdStrings.RunAnimation] = "Feature.Avatar.Label.Run",
	[ConstantsModule.AssetTypeIdStrings.SwimAnimation] = "Feature.Avatar.Label.Swim",
	[ConstantsModule.AssetTypeIdStrings.WalkAnimation] = "Feature.Avatar.Label.Walk",
	[ConstantsModule.AssetTypeIdStrings.EmoteAnimation] = "Feature.Avatar.Label.Emote",
	[ConstantsModule.AssetTypeIdStrings.TShirtAccessory] = "Feature.Avatar.Label.TShirt",
	[ConstantsModule.AssetTypeIdStrings.ShirtAccessory] = "Feature.Avatar.Label.Shirt",
	[ConstantsModule.AssetTypeIdStrings.PantsAccessory] = "Feature.Avatar.Label.Pants",
	[ConstantsModule.AssetTypeIdStrings.JacketAccessory] = "Feature.Avatar.Label.Jacket",
	[ConstantsModule.AssetTypeIdStrings.SweaterAccessory] = "Feature.Avatar.Label.Sweater",
	[ConstantsModule.AssetTypeIdStrings.ShortsAccessory] = "Feature.Avatar.Label.Shorts",
	[ConstantsModule.AssetTypeIdStrings.LeftShoeAccessory] = "Feature.Avatar.Label.LeftShoe",
	[ConstantsModule.AssetTypeIdStrings.RightShoeAccessory] = "Feature.Avatar.Label.RightShoe",
	[ConstantsModule.AssetTypeIdStrings.DressSkirtAccessory] = "Feature.Avatar.Label.DressesAndSkirts",
	[ConstantsModule.AssetTypeIdStrings.EyelashAccessory] = "Feature.Catalog.Label.Eyelash",
	[ConstantsModule.AssetTypeIdStrings.EyebrowAccessory] = "Feature.Catalog.Label.Eyebrow",
	[ConstantsModule.AssetTypeIdStrings.MoodAnimation] = "Feature.Avatar.Label.Mood",
	[ConstantsModule.AssetTypeIdStrings.DynamicHead] = "Feature.Avatar.Label.DynamicHead"
}

if FFlagAXCustomizeMakeupSupport then
	ConstantsModule.AssetTypeLocalized[ConstantsModule.AssetTypeIdStrings.FaceMakeup] = "Feature.Catalog.Label.FaceMakeup"
	ConstantsModule.AssetTypeLocalized[ConstantsModule.AssetTypeIdStrings.LipMakeup] = "Feature.Catalog.Label.LipMakeup"
	ConstantsModule.AssetTypeLocalized[ConstantsModule.AssetTypeIdStrings.EyeMakeup] = "Feature.Catalog.Label.EyeMakeup"
end
if FFlagAXCatalogBackgroundsSupport then
	ConstantsModule.AssetTypeLocalized[ConstantsModule.AssetTypeIdStrings.AvatarBackground] = "Feature.Avatar.Label.Backgrounds"
end
if FFlagHeadRefinementFacialAnimationToggle then
	ConstantsModule.StaticFacialAnimation = "StaticFacialAnimation"
end
ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp = {
	[tostring(Enum.AssetType.TShirt.Value)] = "GraphicTShirt",
	[tostring(Enum.AssetType.Hat.Value)] = "HatAccessory",
	[tostring(Enum.AssetType.Shirt.Value)] = "Shirt",
	[tostring(Enum.AssetType.Pants.Value)] = "Pants",
	[tostring(Enum.AssetType.Head.Value)] = "Head",
	[tostring(Enum.AssetType.Face.Value)] = "Face",
	[tostring(Enum.AssetType.Torso.Value)] = "Torso",
	[tostring(Enum.AssetType.RightArm.Value)] = "RightArm",
	[tostring(Enum.AssetType.LeftArm.Value)] = "LeftArm",
	[tostring(Enum.AssetType.LeftLeg.Value)] = "LeftLeg",
	[tostring(Enum.AssetType.RightLeg.Value)] = "RightLeg",
	[tostring(Enum.AssetType.HairAccessory.Value)] = "HairAccessory",
	[tostring(Enum.AssetType.FaceAccessory.Value)] = "FaceAccessory",
	[tostring(Enum.AssetType.NeckAccessory.Value)] = "NeckAccessory",
	[tostring(Enum.AssetType.ShoulderAccessory.Value)] = "ShouldersAccessory",
	[tostring(Enum.AssetType.FrontAccessory.Value)] = "FrontAccessory",
	[tostring(Enum.AssetType.BackAccessory.Value)] = "BackAccessory",
	[tostring(Enum.AssetType.WaistAccessory.Value)] = "WaistAccessory",
	[tostring(Enum.AssetType.ClimbAnimation.Value)] = "ClimbAnimation",
	[tostring(Enum.AssetType.FallAnimation.Value)] = "FallAnimation",
	[tostring(Enum.AssetType.IdleAnimation.Value)] = "IdleAnimation",
	[tostring(Enum.AssetType.JumpAnimation.Value)] = "JumpAnimation",
	[tostring(Enum.AssetType.RunAnimation.Value)] = "RunAnimation",
	[tostring(Enum.AssetType.SwimAnimation.Value)] = "SwimAnimation",
	[tostring(Enum.AssetType.WalkAnimation.Value)] = "WalkAnimation",
	[tostring(Enum.AssetType.MoodAnimation.Value)] = "MoodAnimation",
	[tostring(Enum.AssetType.DynamicHead.Value)] = "Head"
}
ConstantsModule.HumanoidDescriptionScaleToName = {
	bodyType = "BodyTypeScale",
	head = "HeadScale",
	height = "HeightScale",
	proportion = "ProportionScale",
	depth = "DepthScale",
	width = "WidthScale"
}
ConstantsModule.BodyPartForSkinColoringIdToHumanoidDescription = {
	headColor3 = "HeadColor",
	leftArmColor3 = "LeftArmColor",
	leftLegColor3 = "LeftLegColor",
	rightArmColor3 = "RightArmColor",
	rightLegColor3 = "RightLegColor",
	torsoColor3 = "TorsoColor"
}

if FFlagParseHeadShapeFromAPIResponse then
	ConstantsModule.BodyPartNameToEnum = {
		Head = Enum.BodyPart.Head,
		LeftArm = Enum.BodyPart.LeftArm,
		LeftLeg = Enum.BodyPart.LeftLeg,
		RightArm = Enum.BodyPart.RightArm,
		RightLeg = Enum.BodyPart.RightLeg,
		Torso = Enum.BodyPart.Torso
	}
end
ConstantsModule.GamepadInputTypes = {
	[Enum.UserInputType.Keyboard] = true,
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}
ConstantsModule.ThumbstickDeadzone = 0.2
ConstantsModule.SceneGamepad = {
	FullViewIndicatorTag = Symbol.named("FullViewIndicatorTag")
}
ConstantsModule.AnimationCategoryCameraZoomRadius = 5
ConstantsModule.SceneRowHeight = 28
ConstantsModule.LayeredClothingOrder = Constants.LAYERED_CLOTHING_ORDER
ConstantsModule.LCIgnoredForSorting = {
	[ConstantsModule.AssetTypeIdStrings.HairAccessory] = true,
	[ConstantsModule.AssetTypeIdStrings.EyebrowAccessory] = true,
	[ConstantsModule.AssetTypeIdStrings.EyelashAccessory] = true
}
ConstantsModule.AssetTypeIdToAccessoryTypeEnum = Constants.ASSET_TYPE_TO_ACCESSORY_TYPE
ConstantsModule.AccessoryTypeEnumToAssetTypeId = Constants.ACCESSORY_TYPE_TO_ASSET_TYPE
ConstantsModule.LayeredAssetTypes = Constants.LAYERED_ASSET_TYPES
ConstantsModule.AssetCategory = { LCTops = "LCTops", LCBottoms = "LCBottoms" }
ConstantsModule.NavOuterPadding = 6
ConstantsModule.NavInnerPadding = 6
ConstantsModule.NavButtonElementPadding = 4
ConstantsModule.NavButtonElementMargin = 4
ConstantsModule.NavCornerSize = 8
ConstantsModule.NavButtonBorderSize = 2
ConstantsModule.NavSubButtonInnerPadding = 4
ConstantsModule.MinTileWidthToFontHeightRatio = 6
ConstantsModule.SmallRadioButtonHeight = 56
ConstantsModule.SortAndFiltersRowHeight = 45
ConstantsModule.SortAndFiltersSmallRowHeight = 32
ConstantsModule.SortAndFiltersSectionPadding = 8
ConstantsModule.FullViewPageDefaults = {
	[AvatarScreen.AccessoryAdjustment] = FullView.None,
	[AvatarScreen.LayeredClothingSort] = FullView.None,
	[AvatarScreen.LayeredMakeupSort] = if FFlagAXCustomizeMakeupSupport then FullView.None else nil,
	[AvatarScreen.AvatarEditor] = FullView.None,
	[AvatarScreen.AvatarExperienceLandingPage] = FullView.None,
	[AvatarScreen.Catalog] = FullView.None,
	[AvatarScreen.CatalogSearch] = FullView.None,
	[AvatarScreen.ProfilePictureEditorEmotes] = FullView.None,
	[AvatarScreen.MySharedAvatars] = FullView.None,
	[AvatarScreen.FavoritesSaved] = FullView.None,
	[AvatarScreen.SearchLandingFocusedWidgetPage] = if AXEnableSearchLandingFocusedPageFullViewDefault then FullView.None else nil,
	[AvatarScreen.BodyShape] = if GetFFlagAXEnableSlotBasedEditorModule() then FullView.None else nil,
	[AvatarScreen.AvatarSwitcher] = if GetFFlagAXEnableSlotBasedEditorModule() then FullView.None else nil,
	[AvatarScreen.EditEmotes] = if GetFFlagAXEnableSlotBasedEditorModule() then FullView.None else nil,
	[AvatarScreen.Photobooth] = if AvatarExperienceFlagsModule.FFlagAXPhotoboothFunctionality then FullView.SceneFullView else nil
}
local v1 = if FFlagLuaAppForceVrAppPanelWidthRollout then 0.9 else nil
local v2 = if FFlagLuaAppForceVrAppPanelWidthRollout then -1.2 else nil
local Z = if FFlagLuaAppForceVrAppPanelWidthRollout then -2 * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio + v2 else -2 * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio
local Z1: number = if FFlagLuaAppForceVrAppPanelWidthRollout then -4.4 * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio + v2 else -4.4 * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio
local X = if FFlagLuaAppForceVrAppPanelWidthRollout then 3.2 * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio * v1 else 3.2 * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio
local FIntMaquettesAppPanelDistanceMultiplierPercentageRatioRatio = (3.52 * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio - 3.52) / 2
ConstantsModule.VR = {
	SPACE_BETWEEN_STACKED_PANELS = 0.01,
	PANELS_HEIGHT_OFFSET = 4.6,
	PanelInfo = {
		Left = {
			PartSize = Vector2.new(2.2, 3.52) * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio,
			Offset = CFrame.lookAt(Vector3.new(-X, 4.6, Z), vector.create(0, 4.599999904632568, 0)),
			VirtualScreenSize = Vector2.new(360, 704)
		},
		Right = {
			PartSize = Vector2.new(2.2, 3.52) * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio,
			Offset = CFrame.lookAt(Vector3.new(X, 4.6, Z), vector.create(0, 4.599999904632568, 0)),
			VirtualScreenSize = Vector2.new(360, 704)
		},
		Center = {
			PartSize = Vector2.new(3, 3.52) * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio,
			Offset = CFrame.lookAt(Vector3.new(0, 4.6, Z1), vector.create(0, 4.599999904632568, 0)),
			VirtualScreenSize = Vector2.new(600, 704)
		}
	},
	AvatarEditorNavBarSize = Vector2.new(2.5, 0.3) * FIntMaquettesAppPanelDistanceMultiplierPercentageRatio,
	AvatarEditorNavBarPosition = Vector3.new(0, 6.9 + FIntMaquettesAppPanelDistanceMultiplierPercentageRatioRatio, Z1),
	AvatarEditorNavBarOrientation = Vector3.new(0, 7 + FIntMaquettesAppPanelDistanceMultiplierPercentageRatioRatio, 0),
	AvatarEditorNavBarResolution = Vector2.new(650, 75)
}
ConstantsModule.Counter = {
	PREFIX = "AvatarExperience_",
	TopLevelViews = "TopLevelViews",
	CatalogView = "CatalogView",
	SearchView = "SearchView",
	EditorView = "EditorView",
	CatalogItemDetailsView = "CatalogItemDetailsView",
	SearchItemDetailsView = "SearchItemDetailsView",
	CatalogFiltersView = "CatalogFiltersView",
	SearchFiltersView = "SearchFiltersView",
	SearchLandingView = "SearchLandingView",
	TryOnItemView = "TryOnItemView",
	OthersView = "OthersView",
	TopLevelErrors = {
		CatalogViewError = "CatalogViewError",
		SearchViewError = "SearchViewError",
		EditorViewError = "EditorViewError",
		CatalogItemDetailsViewError = "CatalogItemDetailsViewError",
		SearchItemDetailsViewError = "SearchItemDetailsViewError",
		CatalogFiltersViewError = "CatalogFiltersViewError",
		SearchFiltersViewError = "SearchFiltersViewError",
		UnknownViewError = "UnknownViewError"
	},
	TopLevelLatency = {
		Name = "TopLevelLatency",
		CatalogViewLatency = "CatalogViewLatency",
		SearchViewLatency = "SearchViewLatency",
		EditorViewLatency = "EditorViewLatency",
		CatalogItemDetailsViewLatency = "CatalogItemDetailsViewLatency",
		SearchItemDetailsViewLatency = "SearchItemDetailsViewLatency",
		CatalogFiltersViewLatency = "CatalogFiltersViewLatency",
		SearchFiltersViewLatency = "SearchFiltersViewLatency",
		UnknownViewLatency = "UnknownViewLatency"
	},
	TopLevelFPS = {
		Catalog = "tracking-pattern:catalog-view",
		Search = "tracking-pattern:search-view",
		Editor = "tracking-pattern:editor-view",
		CatalogItemDetails = "tracking-pattern:catalog-item-details-view",
		SearchItemDetails = "tracking-pattern:search-item-details-view",
		CatalogFilters = "tracking-pattern:catalog-filters-view",
		SearchFilters = "tracking-pattern:search-filters-view",
		Unknown = "tracking-pattern:unknown-view-latency"
	},
	TopLevelFPSForCatSubCat = {
		Catalog = "catalog-category-changed",
		Editor = "editor-category-changed"
	},
	TopLevelPageInitialView = {
		Catalog = "Catalog",
		Editor = "Editor",
		SlotBasedEditor = "SlotBasedEditor"
	},
	PopularLooksWidgetHomeView = "PopularLooksWidgetHomeView",
	PopularLooksWidgetHomeTileClicked = "PopularLooksWidgetHomeTileClicked",
	PopularLooksWidgetSearchTileClicked = "PopularLooksWidgetSearchTileClicked",
	PopularLooksWidgetHomeBuyClicked = "PopularLooksWidgetHomeBuyClicked",
	PopularLooksWidgetSearchBuyClicked = "PopularLooksWidgetSearchBuyClicked",
	AvatarWidget = {
		AvatarsWidgetSearchBuyClicked = "AvatarsWidgetSearchBuyClicked",
		AvatarsWidgetHomeBuyClicked = "AvatarsWidgetHomeBuyClicked",
		AvatarsWidgetBuyClickedInsufficientRobux = "AvatarsWidgetBuyClickedInsufficientRobux",
		AvatarsWidgetBuyClickedNoItemsToPurchase = "AvatarsWidgetBuyClickedNoItemsToPurchase",
		AvatarsWidgetBuyClickedMissingLookId = "AvatarsWidgetBuyClickedMissingLookId"
	},
	CatalogRefresh = { StaleResults = "CatalogRefreshStaleResults" },
	AvatarEditorServiceErrors = {
		GetRecommendedAssets = "AvatarEditorServiceGetRecommendedAssetsError",
		GetOutfits = "AvatarEditorServiceGetOutfitsError",
		CreateOutfit = "AvatarEditorServiceCreateOutfitError",
		GetAvatarRules = "AvatarEditorServiceGetAvatarRulesError",
		GetInventory = "AvatarEditorServiceGetInventoryError",
		SearchCatalog = "AvatarEditorServiceSearchCatalogError",
		GetBatchItemDetails = "AvatarEditorServiceGetBatchItemDetailsError",
		GetRecommendedBundles = "AvatarEditorServiceGetRecommendedBundlesError",
		NoPromptSetFavorite = "AvatarEditorServiceNoPromptSetFavoriteError",
		NoPromptSaveAvatarThumbnailCustomization = "AvatarEditorServiceNoPromptSaveAvatarThumbnailCustomizationError",
		NoPromptCreateOutfit = "AvatarEditorServiceNoPromptCreateOutfitError",
		GetOutfitDetails = "AvatarEditorServiceGetOutfitDetailsError",
		FetchAssetOrBundleInfo = "AvatarEditorServiceFetchAssetOrBundleInfoError",
		FetchBundleInfo = "AvatarEditorServiceFetchBundleInfoError",
		GetAssetFavorite = "AvatarEditorServiceGetAssetFavoriteError",
		GetBundleFavorite = "AvatarEditorServiceGetBundleFavoriteError",
		SetBundleFavorite = "AvatarEditorServiceSetBundleFavoriteError",
		SetAssetFavorite = "AvatarEditorServiceSetAssetFavoriteError",
		ConformToAvatarRules = "AvatarEditorServiceConformToAvatarRulesError",
		NoPromptSaveAvatar = "AvatarEditorServiceNoPromptSaveAvatarError",
		PromptSaveAvatarCompleted = "AvatarEditorServicePromptSaveAvatarCompletedError",
		NoPromptApplyProfileConfiguration = "AvatarEditorServiceNoPromptApplyProfileConfigurationError",
		PromptApplyProfileConfigurationCompleted = "AvatarEditorServicePromptApplyProfileConfigurationCompletedError",
		GetProfileConfiguration = "AvatarEditorServiceGetProfileConfigurationError"
	},
	LookComposer = {
		PreviewLook = "LookComposerPreviewLook",
		CreateLook = "LookComposerCreateLook"
	},
	MySharedAvatars = {
		ReloadTriggedInPage = "MySharedAvatarsReloadTriggedInPage",
		FetchMySharedAvatarsError = "MySharedAvatarsFetchMySharedAvatarsError",
		FetchMySharedAvatarsNewPage = "MySharedAvatarsFetchMySharedAvatarsNewPage",
		MySharedAvatarsDeleteAvatarError = "MySharedAvatarsDeleteAvatarError"
	},
	ShareButtonProfileration = {
		ShareButtonClicked = "ShareButtonProliferationButtonClicked",
		Experiment = "ShareButtonProliferationExperiment"
	},
	Errors = {
		NoInternetConnectionErrorSearchView = "NoInternetConnectionErrorSearchView",
		NoInternetConnectionErrorCatalogView = "NoInternetConnectionErrorCatalogView",
		PurchaseLooksProductError = "PurchaseLooksProductError",
		FetchFaeFeatureAccessError = "FetchFaeFeatureAccessError",
		SduiTapActiveStoreMissing = "SduiTapActiveStoreMissing"
	},
	GetOrGenerateShortShareLink = {
		Success = "GetOrGenerateShortShareLinkSuccess",
		Invalid = "GetOrGenerateShortShareLinkInvalid",
		Failure = "GetOrGenerateShortShareLinkFailure",
		HookSuccess = "GetOrGenerateShortShareLinkSuccessFromHook",
		HookInvalid = "GetOrGenerateShortShareLinkInvalidFromHook",
		HookFailure = "GetOrGenerateShortShareLinkFailureFromHook",
		LinkCopied = "GetOrGenerateShortShareLinkLinkCopied"
	},
	ContextFrame = {
		Open = "ContextFrameOpen",
		ViewDetailsPageClick = "ContextFrameViewDetailsPageClick",
		DeleteAvatarClick = "ContextFrameDeleteAvatarClick"
	},
	Toasts = { NoFaceHead = "ToastsNoFaceHead" },
	Latency = {
		Organic = {
			Thumbnails = "OrganicThumbnailLatency",
			Tiles = "OrganicTilesLatency"
		},
		Widget = {
			Thumbnails = "WidgetThumbnailLatency",
			Tiles = "WidgetTilesLatency"
		},
		Network = {
			FetchWidgetInfo = "NetworkFetchWidgetInfoLatency",
			ApiFetchCatalogSearch = "NetworkApiFetchCatalogSearchLatency",
			FetchSponsoredItems = "NetworkFetchSponsoredItemsLatency"
		}
	},
	AvatarInventory = {
		ReceivedDuplicateItem = "AvatarInventoryReceivedDuplicateItem"
	},
	SaveManager = {
		Attempt = "SaveManagerAttempt",
		Success = "SaveManagerSuccess",
		BlockedByOngoingSave = "SaveManagerBlockedByOngoingSave",
		Failure = "SaveManagerFailure"
	},
	CategoryButtonTooltip = {
		Seen = "CategoryButtonTooltipSeen",
		AutoDismiss = "CategoryButtonTooltipAutoDismiss",
		ClickDismiss = "CategoryButtonTooltipClickDismiss"
	},
	AvatarsTabError = "AvatarsTabError",
	FetchCatalogSearchForLooksError = "FetchCatalogSearchForLooksError",
	PrefetchMarketplace = {
		appLaunched = "PrefetchMarketplaceAppLaunched",
		isRecentMarketplaceUser = "PrefetchIsRecentMarketplaceUser",
		enteredMarketplaceAndIsRecentUser = "PrefetchEnteredMarketplaceAndIsRecentUser",
		inExperimentAndIsRecentUserAndEnteredMarketplace = "PrefetchInExperimentAndIsRecentUserAndEnteredMarketplace",
		inExperimentAndIsRecentUserAndEnteredMarketplaceThumbnails = "PrefetchInExperimentAndIsRecentUserAndEnteredMarketplaceThumbnails",
		inTreatmentAndHasPrefetchedMarketplace = "PrefetchInTreatmentAndHasPrefetchedMarketplace",
		enteredMarketplaceButPrefetchFailed = "PrefetchEnteredMarketplaceButPrefetchFailed"
	},
	FetchMarketplace = {
		ExitAndReEnterRefreshCounter = "FetchMarketplaceExitAndReEnterRefreshCounter",
		ExitAndReEnterRefreshTreatment = "FetchMarketplaceExitAndReEnterRefreshTreatment"
	},
	LayerExposure = { CatalogView = "CatalogViewLayerExposure" },
	NilGuard = {
		CharacterManager_initAvatarScalesChangedConnection_characterManagerEvents = "NilGuard_CharacterManager_initAvatarScalesChangedConnection_characterManagerEvents",
		CharacterManager_initBodyColorsChangedConnection_characterManagerEvents = "NilGuard_CharacterManager_initBodyColorsChangedConnection_characterManagerEvents",
		CharacterManager_initAdjustmentChangedConnection_characterManagerEvents = "NilGuard_CharacterManager_initAdjustmentChangedConnection_characterManagerEvents"
	},
	Catalog = if FFlagAXCatalogCategoriesSDUI or FFlagAXMigrateAllTabToSduiDev then {
		Errors = {
			FetchCatalogCategoriesError = "FetchCatalogCategoriesError",
			FetchMarketplaceSduiError = "FetchMarketplaceSduiError"
		}
	} else nil
}
ConstantsModule.MemStorageKeys = {
	ColdStart = { CatalogAndCatalogSearch = "AXColdStartCatalogAndSearch" }
}
ConstantsModule.ModerationStatus = { PendingModeration = "Pending", Moderated = "Moderated" }
ConstantsModule.HeadRefinementCameraCategory = {
	Name = "Head",
	Title = "Head",
	CameraFocus = ConstantsModule.FocusType.Head,
	CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Special.HeadRefinement
}
ConstantsModule.LayeredMakeupCameraCategory = {
	Name = "Makeup",
	Title = "Makeup",
	CameraZoomRadius = 4,
	CameraFocus = ConstantsModule.FocusType.Makeup
}

if AXItemDetails3DPreviewIXPModule.isEnabled() then
	ConstantsModule.ItemViewportAssetTypes = {
		[ConstantsModule.AssetTypeIdStrings.Hat] = true,
		[ConstantsModule.AssetTypeIdStrings.HairAccessory] = true,
		[ConstantsModule.AssetTypeIdStrings.FaceAccessory] = true,
		[ConstantsModule.AssetTypeIdStrings.NeckAccessory] = true,
		[ConstantsModule.AssetTypeIdStrings.ShoulderAccessory] = true,
		[ConstantsModule.AssetTypeIdStrings.FrontAccessory] = true,
		[ConstantsModule.AssetTypeIdStrings.BackAccessory] = true,
		[ConstantsModule.AssetTypeIdStrings.WaistAccessory] = true,
		[ConstantsModule.AssetTypeIdStrings.TShirtAccessory] = true,
		[ConstantsModule.AssetTypeIdStrings.ShirtAccessory] = true,
		[ConstantsModule.AssetTypeIdStrings.PantsAccessory] = true,
		[ConstantsModule.AssetTypeIdStrings.JacketAccessory] = true,
		[ConstantsModule.AssetTypeIdStrings.SweaterAccessory] = true,
		[ConstantsModule.AssetTypeIdStrings.ShortsAccessory] = true,
		[ConstantsModule.AssetTypeIdStrings.LeftShoeAccessory] = true,
		[ConstantsModule.AssetTypeIdStrings.RightShoeAccessory] = true,
		[ConstantsModule.AssetTypeIdStrings.DressSkirtAccessory] = true,
		[ConstantsModule.AssetTypeIdStrings.EyebrowAccessory] = not FFlagAXEyebrowEyelashToMakeupCategory or nil,
		[ConstantsModule.AssetTypeIdStrings.EyelashAccessory] = not FFlagAXEyebrowEyelashToMakeupCategory or nil
	}
	ConstantsModule.ItemViewportBundleTypes = {
		[ConstantsModule.BundleTypeIdStrings.BodyParts] = true,
		[ConstantsModule.BundleTypeIdStrings.DynamicHead] = true,
		[ConstantsModule.BundleTypeIdStrings.Shoes] = if GetFFlagAXSupportShoesInItemViewportModule() then true else nil
	}
end
ConstantsModule.RobloxCreatorName = "Roblox"
ConstantsModule.NavigationParams = { fromSurface = "fromSurface" }

return ConstantsModule