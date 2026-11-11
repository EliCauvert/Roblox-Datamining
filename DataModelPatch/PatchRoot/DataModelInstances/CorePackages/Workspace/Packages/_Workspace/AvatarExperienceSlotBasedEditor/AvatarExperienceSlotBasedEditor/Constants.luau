local _ = require(script.Parent.Types)
local AvatarEditorSubcategoriesModule = require(script.Parent.Enums.AvatarEditorSubcategories)
local InventoryFiltersModule = require(script.Parent.Enums.InventoryFilters)
local SlotTypeModule = require(script.Parent.Enums.SlotType)
local ConstantsModule = {}
local CategoriesModule = require(script.Parent.Enums.Categories)
local Parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagRemoveClassicHeadsAndFaces = AvatarExperienceFlagsModule.FFlagRemoveClassicHeadsAndFaces
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local FFlagAXMigrateBuilderIcons = AvatarExperienceFlagsModule.FFlagAXMigrateBuilderIcons
local FFlagAXSlotsDesktopRedesign = AvatarExperienceFlagsModule.FFlagAXSlotsDesktopRedesign
local FFlagAXInventoryDurablesExpiredFilter = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesExpiredFilter
local FFlagAXCustomizeBackgrounds = AvatarExperienceFlagsModule.FFlagAXCustomizeBackgrounds
local FFlagAXDownrankMakeupCustomize = AvatarExperienceFlagsModule.FFlagAXDownrankMakeupCustomize
local IconName = require(Parent.Foundation).Enums.IconName
local IconVariant = require(Parent.Foundation).Enums.IconVariant
local Character = {
	FullBody = if FFlagAXMigrateBuilderIcons then {
		name = IconName.PersonStanding,
		variant = IconVariant.Filled
	} else "icons/menu/clothing/body_on",
	ClassicHead = if FFlagAXMigrateBuilderIcons then { name = IconName.HeadBlank, variant = IconVariant.Filled } else "icons/menu/clothing/classicHead_on",
	Hair = if FFlagAXMigrateBuilderIcons then { name = IconName.HeadFemale, variant = IconVariant.Filled } else "icons/menu/clothing/hair_on",
	Faces = if FFlagAXMigrateBuilderIcons then {
		name = IconName.FaceWinking,
		variant = IconVariant.Filled
	} else "icons/menu/clothing/faces_on",
	Clothing = if FFlagAXMigrateBuilderIcons then {
		name = IconName.ClothesHanger,
		variant = IconVariant.Filled
	} else "icons/menu/clothing/clothing_on",
	Jackets = if FFlagAXMigrateBuilderIcons then { name = IconName.Jacket, variant = IconVariant.Filled } else "icons/menu/clothing/jackets_on",
	Shirts = if FFlagAXMigrateBuilderIcons then { name = IconName.Shirt, variant = IconVariant.Filled } else "icons/menu/clothing/shirts_on",
	Pants = if FFlagAXMigrateBuilderIcons then { name = IconName.Pants, variant = IconVariant.Filled } else "icons/menu/clothing/pants_on",
	Shoes = if FFlagAXMigrateBuilderIcons then { name = IconName.Shoe, variant = IconVariant.Filled } else "icons/menu/clothing/shoes_on",
	ClassicTShirts = if FFlagAXMigrateBuilderIcons then {
		name = IconName.Tshirt_2dText,
		variant = IconVariant.Filled
	} else "icons/menu/clothing/classicTshirts_on",
	ClassicShirts = if FFlagAXMigrateBuilderIcons then {
		name = IconName.Shirt_2dText,
		variant = IconVariant.Filled
	} else "icons/menu/clothing/classicShirts_on",
	ClassicPants = if FFlagAXMigrateBuilderIcons then {
		name = IconName.Pants_2dText,
		variant = IconVariant.Filled
	} else "icons/menu/clothing/classicPants_on",
	Accessories = if FFlagAXMigrateBuilderIcons then { name = IconName.BowTie, variant = IconVariant.Filled } else "icons/menu/clothing/accessories_off",
	Head = if FFlagAXMigrateBuilderIcons then { name = IconName.HatFedora, variant = IconVariant.Filled } else "icons/menu/clothing/hats_on",
	Face = if FFlagAXMigrateBuilderIcons then { name = IconName.Glasses, variant = IconVariant.Filled } else "icons/menu/clothing/eyes_on",
	Neck = if FFlagAXMigrateBuilderIcons then { name = IconName.Necklace, variant = IconVariant.Filled } else "icons/menu/clothing/neck_off",
	Shoulder = if FFlagAXMigrateBuilderIcons then { name = IconName.Parrot, variant = IconVariant.Filled } else "icons/menu/clothing/shoulder_on",
	Front = if FFlagAXMigrateBuilderIcons then { name = IconName.Purse, variant = IconVariant.Filled } else "icons/menu/clothing/front_on",
	Back = if FFlagAXMigrateBuilderIcons then {
		name = IconName.ButterflyWings,
		variant = IconVariant.Filled
	} else "icons/menu/clothing/back_on",
	Waist = if FFlagAXMigrateBuilderIcons then { name = IconName.Belt, variant = IconVariant.Filled } else "icons/menu/clothing/waist_on",
	Gear = if FFlagAXMigrateBuilderIcons then { name = IconName.Sword, variant = IconVariant.Filled } else "icons/menu/clothing/gear_on",
	Animation = if FFlagAXMigrateBuilderIcons then {
		name = IconName.PersonTeleport,
		variant = IconVariant.Filled
	} else "icons/menu/clothing/animation_off",
	Idle = if FFlagAXMigrateBuilderIcons then {
		name = IconName.PersonStanding,
		variant = IconVariant.Filled
	} else "icons/menu/clothing/idle_on",
	Walk = if FFlagAXMigrateBuilderIcons then {
		name = IconName.PersonWalking,
		variant = IconVariant.Filled
	} else "icons/menu/clothing/walk_off",
	Jump = if FFlagAXMigrateBuilderIcons then {
		name = IconName.PersonJumping,
		variant = IconVariant.Filled
	} else "icons/menu/clothing/jump_off",
	Fall = if FFlagAXMigrateBuilderIcons then {
		name = IconName.PersonFalling,
		variant = IconVariant.Filled
	} else "icons/menu/clothing/fall_off",
	Climb = if FFlagAXMigrateBuilderIcons then {
		name = IconName.PersonClimbing,
		variant = IconVariant.Filled
	} else "icons/menu/clothing/climb_off",
	Swim = if FFlagAXMigrateBuilderIcons then {
		name = IconName.PersonSwimming,
		variant = IconVariant.Filled
	} else "icons/menu/clothing/swim_off",
	Emote = if FFlagAXMigrateBuilderIcons then {
		name = IconName.SquareFaceWavingHand,
		variant = IconVariant.Filled
	} else "icons/controls/emoteOn",
	Reset = if FFlagAXMigrateBuilderIcons then {
		name = IconName.ArrowSpinClockwise,
		variant = IconVariant.Regular
	} else "icons/actions/reset",
	Undo = if FFlagAXMigrateBuilderIcons then {
		name = IconName.ArrowCurlToLeft,
		variant = IconVariant.Regular
	} else "icons/actions/edit/undo",
	Redo = if FFlagAXMigrateBuilderIcons then {
		name = IconName.ArrowCurlToRight,
		variant = IconVariant.Regular
	} else "icons/actions/edit/redo",
	Torso = if FFlagAXMigrateBuilderIcons then { name = IconName.Torso, variant = IconVariant.Filled } else "icons/menu/clothing/torsos_on",
	Arm = if FFlagAXMigrateBuilderIcons then { name = IconName.Arm, variant = IconVariant.Filled } else "icons/menu/clothing/arms_on",
	Leg = if FFlagAXMigrateBuilderIcons then { name = IconName.Leg, variant = IconVariant.Filled } else "icons/menu/clothing/legs_on",
	Inventory = if FFlagAXMigrateBuilderIcons then { name = IconName.Backpack, variant = IconVariant.Regular } else "icons/menu/inventoryOff",
	Adjust = if FFlagAXMigrateBuilderIcons then {
		name = IconName.ThreeSlidersHorizontal,
		variant = IconVariant.Regular
	} else "icons/actions/adjust",
	Success = if FFlagAXMigrateBuilderIcons then { name = IconName.CheckLarge, variant = IconVariant.Filled } else "icons/status/success_small",
	Add = if FFlagAXMigrateBuilderIcons then {
		name = IconName.CirclePlus,
		variant = IconVariant.Regular
	} else "icons/actions/edit/add",
	Build = if FFlagAXMigrateBuilderIcons then {
		name = IconName.PersonStandingDualArrowsVertical,
		variant = IconVariant.Filled
	} else "icons/menu/clothing/build_on",
	Eyelashes = if FFlagAXMigrateBuilderIcons then { name = IconName.Eyelashes, variant = IconVariant.Regular } else IconName.Eyelashes,
	Eyebrows = if FFlagAXMigrateBuilderIcons then { name = IconName.Eyebrows, variant = IconVariant.Regular } else IconName.Eyebrows,
	Backgrounds = { name = IconName.Image, variant = IconVariant.Filled }
}
local BodyAssetTypes = {
	Enum.AssetType.LeftLeg, Enum.AssetType.RightLeg, Enum.AssetType.LeftArm,
	Enum.AssetType.RightArm, Enum.AssetType.Torso, Enum.AssetType.Head,
	Enum.AssetType.DynamicHead
}
local List = {
	CategoriesModule.All,
	CategoriesModule.Avatars,
	CategoriesModule.Body
}

if FFlagAXCustomizeMakeupSupport and not FFlagAXDownrankMakeupCustomize then
	table.insert(List, CategoriesModule.Makeup)
end
table.insert(List, CategoriesModule.Clothing)
table.insert(List, CategoriesModule.Accessories)

if FFlagAXCustomizeBackgrounds then
	table.insert(List, CategoriesModule.Backgrounds)
end
table.insert(List, CategoriesModule.Animations)
table.insert(List, CategoriesModule.Emotes)

if FFlagAXDownrankMakeupCustomize then
	table.insert(List, CategoriesModule.Makeup)
end
local t = {}

for i, value in List do
	t[value] = i - 1
end
ConstantsModule.Categories = CategoriesModule
ConstantsModule.SlotEditorCategories = {
	[CategoriesModule.All] = {
		name = "All",
		hide = true,
		nameTranslationKey = if FFlagAXSlotsDesktopRedesign then "Feature.Avatar.Heading.All" else "Feature.Catalog.Label.Avatars",
		index = t[CategoriesModule.All],
		slots = {}
	},
	[CategoriesModule.Avatars] = {
		name = "Avatars",
		nameTranslationKey = "Feature.Catalog.Label.Avatars",
		index = t[CategoriesModule.Avatars],
		slots = {}
	},
	[CategoriesModule.Body] = {
		name = "Body",
		nameTranslationKey = "Feature.Catalog.Label.Body",
		index = t[CategoriesModule.Body],
		slots = if FFlagRemoveClassicHeadsAndFaces then {
			{
				name = "Body",
				nameTranslationKey = "Feature.Catalog.Label.FullBody",
				editorSubcategory = AvatarEditorSubcategoriesModule.PurchasedCharacters,
				assetTypes = {}
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Hair",
				icon = Character.Hair,
				editorSubcategory = AvatarEditorSubcategoriesModule.Hair,
				assetTypes = { Enum.AvatarAssetType.HairAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Head",
				icon = Character.ClassicHead,
				editorSubcategory = AvatarEditorSubcategoriesModule.Heads,
				assetTypes = { Enum.AvatarAssetType.DynamicHead }
			},
			{
				name = "Build",
				nameTranslationKey = "Feature.Avatar.Label.Build",
				assetTypes = {},
				icon = Character.Build,
				editorSubcategory = AvatarEditorSubcategoriesModule.Build
			},
			{
				name = "Skin",
				nameTranslationKey = "Feature.Avatar.Label.Skin",
				editorSubcategory = AvatarEditorSubcategoriesModule.Skin,
				assetTypes = {}
			}
		} else {
			{
				name = "Body",
				nameTranslationKey = "Feature.Catalog.Label.FullBody",
				editorSubcategory = AvatarEditorSubcategoriesModule.PurchasedCharacters,
				assetTypes = {}
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Hair",
				icon = Character.Hair,
				editorSubcategory = AvatarEditorSubcategoriesModule.Hair,
				assetTypes = { Enum.AvatarAssetType.HairAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Head",
				icon = Character.ClassicHead,
				editorSubcategory = AvatarEditorSubcategoriesModule.Heads,
				assetTypes = {
					Enum.AvatarAssetType.DynamicHead,
					Enum.AvatarAssetType.Head
				}
			},
			{
				name = "Classic Face",
				nameTranslationKey = "Feature.Avatar.Label.Face",
				icon = Character.Faces,
				editorSubcategory = AvatarEditorSubcategoriesModule.ClassicFaces,
				assetTypes = { Enum.AvatarAssetType.Face }
			},
			{
				name = "Build",
				nameTranslationKey = "Feature.Avatar.Label.Build",
				assetTypes = {},
				icon = Character.Build,
				editorSubcategory = AvatarEditorSubcategoriesModule.Build
			},
			{
				name = "Skin",
				nameTranslationKey = "Feature.Avatar.Label.Skin",
				editorSubcategory = AvatarEditorSubcategoriesModule.Skin,
				assetTypes = {}
			}
		}
	},
	[CategoriesModule.Makeup] = if FFlagAXCustomizeMakeupSupport then {
		name = "Makeup",
		nameTranslationKey = "Feature.Avatar.Label.Makeup",
		resetSlotOnClearAll = true,
		index = t[CategoriesModule.Makeup],
		slots = {
			{
				nameTranslationKey = "Feature.Avatar.Label.Eyelashes",
				hide = true,
				icon = Character.Eyelashes,
				editorSubcategory = AvatarEditorSubcategoriesModule.MakeupLooks,
				eligibleSubcategories = {
					AvatarEditorSubcategoriesModule.MakeupLooks,
					AvatarEditorSubcategoriesModule.EyeMakeup,
					AvatarEditorSubcategoriesModule.FaceMakeup,
					AvatarEditorSubcategoriesModule.LipMakeup
				},
				assetTypes = {}
			},
			{
				layerLimit = 6,
				name = "Makeup",
				nameTranslationKey = "Feature.Avatar.Label.MakeupLayer",
				deselectable = true,
				slotType = SlotTypeModule.LayeredSlot,
				eligibleSubcategories = {
					AvatarEditorSubcategoriesModule.EyeMakeup,
					AvatarEditorSubcategoriesModule.FaceMakeup,
					AvatarEditorSubcategoriesModule.LipMakeup
				},
				editorSubcategory = AvatarEditorSubcategoriesModule.EyeMakeup,
				assetTypes = {
					Enum.AvatarAssetType.EyeMakeup,
					Enum.AvatarAssetType.FaceMakeup,
					Enum.AvatarAssetType.LipMakeup
				}
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Eyelashes",
				deselectable = true,
				icon = Character.Eyelashes,
				editorSubcategory = AvatarEditorSubcategoriesModule.Eyelashes,
				assetTypes = { Enum.AvatarAssetType.EyelashAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Eyebrows",
				deselectable = true,
				icon = Character.Eyebrows,
				editorSubcategory = AvatarEditorSubcategoriesModule.Eyebrows,
				assetTypes = { Enum.AvatarAssetType.EyebrowAccessory }
			}
		}
	} else nil,
	[CategoriesModule.Clothing] = {
		name = "Clothing",
		nameTranslationKey = "Feature.Catalog.Label.Clothing",
		index = t[CategoriesModule.Clothing],
		slots = {
			{
				nameTranslationKey = "Feature.Avatar.Label.Top",
				icon = Character.Shirts,
				editorSubcategory = AvatarEditorSubcategoriesModule.Tops,
				assetTypes = {
					Enum.AvatarAssetType.ShirtAccessory,
					Enum.AvatarAssetType.TShirtAccessory,
					Enum.AvatarAssetType.SweaterAccessory
				}
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Outerwear",
				icon = Character.Jackets,
				editorSubcategory = AvatarEditorSubcategoriesModule.Outerwear,
				assetTypes = { Enum.AvatarAssetType.JacketAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Bottom",
				icon = Character.Pants,
				editorSubcategory = AvatarEditorSubcategoriesModule.Bottoms,
				assetTypes = {
					Enum.AvatarAssetType.PantsAccessory,
					Enum.AvatarAssetType.ShortsAccessory,
					Enum.AvatarAssetType.DressSkirtAccessory
				}
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Shoes",
				icon = Character.Shoes,
				editorSubcategory = AvatarEditorSubcategoriesModule.Shoes,
				assetTypes = { Enum.AvatarAssetType.RightShoeAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.ShirtClassic",
				icon = Character.ClassicShirts,
				editorSubcategory = AvatarEditorSubcategoriesModule.ClassicShirts,
				assetTypes = { Enum.AvatarAssetType.Shirt }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.PantsClassic",
				icon = Character.ClassicPants,
				editorSubcategory = AvatarEditorSubcategoriesModule.ClassicPants,
				assetTypes = { Enum.AvatarAssetType.Pants }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.TShirtClassic",
				icon = Character.ClassicTShirts,
				editorSubcategory = AvatarEditorSubcategoriesModule.ClassicTShirts,
				assetTypes = { Enum.AvatarAssetType.TShirt }
			}
		}
	},
	[CategoriesModule.Accessories] = {
		name = "Accessories",
		nameTranslationKey = "Feature.Catalog.LabelAccessories",
		index = t[CategoriesModule.Accessories],
		slots = {
			{
				name = "Head",
				nameTranslationKey = "Feature.Avatar.Label.Head",
				icon = Character.Head,
				editorSubcategory = AvatarEditorSubcategoriesModule.Hats,
				assetTypes = { Enum.AvatarAssetType.Hat }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Face",
				icon = Character.Face,
				editorSubcategory = AvatarEditorSubcategoriesModule.Face,
				assetTypes = { Enum.AvatarAssetType.FaceAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Neck",
				icon = Character.Neck,
				editorSubcategory = AvatarEditorSubcategoriesModule.Neck,
				assetTypes = { Enum.AvatarAssetType.NeckAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Back",
				icon = Character.Back,
				editorSubcategory = AvatarEditorSubcategoriesModule.Back,
				assetTypes = { Enum.AvatarAssetType.BackAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Waist",
				icon = Character.Waist,
				editorSubcategory = AvatarEditorSubcategoriesModule.Waist,
				assetTypes = { Enum.AvatarAssetType.WaistAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Shoulder",
				icon = Character.Shoulder,
				editorSubcategory = AvatarEditorSubcategoriesModule.Shoulder,
				assetTypes = { Enum.AvatarAssetType.ShoulderAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Front",
				icon = Character.Front,
				editorSubcategory = AvatarEditorSubcategoriesModule.Front,
				assetTypes = { Enum.AvatarAssetType.FrontAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Gear",
				icon = Character.Gear,
				editorSubcategory = AvatarEditorSubcategoriesModule.Gear,
				assetTypes = { Enum.AvatarAssetType.Gear }
			}
		}
	},
	[CategoriesModule.Backgrounds] = if FFlagAXCustomizeBackgrounds then {
		name = "Backgrounds",
		nameTranslationKey = "Feature.Catalog.Label.Backgrounds",
		index = t[CategoriesModule.Backgrounds],
		slots = {}
	} else nil,
	[CategoriesModule.Animations] = {
		name = "Animations",
		nameTranslationKey = "Feature.Avatar.Heading.Animations",
		index = t[CategoriesModule.Animations],
		slots = {
			{
				nameTranslationKey = "Feature.Avatar.Label.AnimationFullSet",
				icon = Character.Animation,
				editorSubcategory = AvatarEditorSubcategoriesModule.AnimationFullSets,
				assetTypes = { Enum.AvatarAssetType.IdleAnimation }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Idle",
				icon = Character.Idle,
				editorSubcategory = AvatarEditorSubcategoriesModule.IdleAnimations,
				assetTypes = { Enum.AvatarAssetType.IdleAnimation }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Walk",
				icon = Character.Walk,
				editorSubcategory = AvatarEditorSubcategoriesModule.WalkAnimations,
				assetTypes = { Enum.AvatarAssetType.WalkAnimation }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Run",
				icon = Character.Animation,
				editorSubcategory = AvatarEditorSubcategoriesModule.RunAnimations,
				assetTypes = { Enum.AvatarAssetType.RunAnimation }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Jump",
				icon = Character.Jump,
				editorSubcategory = AvatarEditorSubcategoriesModule.JumpAnimations,
				assetTypes = { Enum.AvatarAssetType.JumpAnimation }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Fall",
				icon = Character.Fall,
				editorSubcategory = AvatarEditorSubcategoriesModule.FallAnimations,
				assetTypes = { Enum.AvatarAssetType.FallAnimation }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Climb",
				icon = Character.Climb,
				editorSubcategory = AvatarEditorSubcategoriesModule.ClimbAnimations,
				assetTypes = { Enum.AvatarAssetType.ClimbAnimation }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Swim",
				icon = Character.Swim,
				editorSubcategory = AvatarEditorSubcategoriesModule.SwimAnimations,
				assetTypes = { Enum.AvatarAssetType.SwimAnimation }
			}
		}
	},
	[CategoriesModule.Emotes] = {
		name = "Emotes",
		nameTranslationKey = "Feature.Catalog.Label.Emotes",
		index = t[CategoriesModule.Emotes],
		slots = {}
	}
}
ConstantsModule.Icons = Character
ConstantsModule.BodyAssetTypes = BodyAssetTypes
ConstantsModule.InventoryFilterToAvailabilityStatus = if FFlagAXInventoryDurablesExpiredFilter then { [InventoryFiltersModule.Expired] = 2 } else nil

return ConstantsModule