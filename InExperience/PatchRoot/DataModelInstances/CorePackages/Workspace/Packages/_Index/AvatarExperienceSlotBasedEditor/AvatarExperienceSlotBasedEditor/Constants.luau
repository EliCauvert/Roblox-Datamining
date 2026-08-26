local _ = require(script.Parent.Types)
local avatarEditorSubcategoriesModule = require(script.Parent.Enums.AvatarEditorSubcategories)
local inventoryFiltersModule = require(script.Parent.Enums.InventoryFilters)
local slotTypeModule = require(script.Parent.Enums.SlotType)
local t = {}
local categoriesModule = require(script.Parent.Enums.Categories)
local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagRemoveClassicHeadsAndFaces = avatarExperienceFlagsModule.FFlagRemoveClassicHeadsAndFaces
local fFlagAXMigrateBuilderIcons = avatarExperienceFlagsModule.FFlagAXMigrateBuilderIcons
local fFlagAXSlotsDesktopRedesign = avatarExperienceFlagsModule.FFlagAXSlotsDesktopRedesign
local fFlagAXInventoryDurablesExpiredFilter = avatarExperienceFlagsModule.FFlagAXInventoryDurablesExpiredFilter
local fFlagAXCustomizeBackgrounds = avatarExperienceFlagsModule.FFlagAXCustomizeBackgrounds
local fFlagAXDownrankMakeupCustomize = avatarExperienceFlagsModule.FFlagAXDownrankMakeupCustomize
local iconName = require(parent.Foundation).Enums.IconName
local iconVariant = require(parent.Foundation).Enums.IconVariant
local t_1 = {
	FullBody = if fFlagAXMigrateBuilderIcons then {
		name = iconName.PersonStanding,
		variant = iconVariant.Filled
	} else "icons/menu/clothing/body_on",
	ClassicHead = if fFlagAXMigrateBuilderIcons then { name = iconName.HeadBlank, variant = iconVariant.Filled } else "icons/menu/clothing/classicHead_on",
	Hair = if fFlagAXMigrateBuilderIcons then { name = iconName.HeadFemale, variant = iconVariant.Filled } else "icons/menu/clothing/hair_on",
	Faces = if fFlagAXMigrateBuilderIcons then {
		name = iconName.FaceWinking,
		variant = iconVariant.Filled
	} else "icons/menu/clothing/faces_on",
	Clothing = if fFlagAXMigrateBuilderIcons then {
		name = iconName.ClothesHanger,
		variant = iconVariant.Filled
	} else "icons/menu/clothing/clothing_on",
	Jackets = if fFlagAXMigrateBuilderIcons then { name = iconName.Jacket, variant = iconVariant.Filled } else "icons/menu/clothing/jackets_on",
	Shirts = if fFlagAXMigrateBuilderIcons then { name = iconName.Shirt, variant = iconVariant.Filled } else "icons/menu/clothing/shirts_on",
	Pants = if fFlagAXMigrateBuilderIcons then { name = iconName.Pants, variant = iconVariant.Filled } else "icons/menu/clothing/pants_on",
	Shoes = if fFlagAXMigrateBuilderIcons then { name = iconName.Shoe, variant = iconVariant.Filled } else "icons/menu/clothing/shoes_on",
	ClassicTShirts = if fFlagAXMigrateBuilderIcons then {
		name = iconName.Tshirt_2dText,
		variant = iconVariant.Filled
	} else "icons/menu/clothing/classicTshirts_on",
	ClassicShirts = if fFlagAXMigrateBuilderIcons then {
		name = iconName.Shirt_2dText,
		variant = iconVariant.Filled
	} else "icons/menu/clothing/classicShirts_on",
	ClassicPants = if fFlagAXMigrateBuilderIcons then {
		name = iconName.Pants_2dText,
		variant = iconVariant.Filled
	} else "icons/menu/clothing/classicPants_on",
	Accessories = if fFlagAXMigrateBuilderIcons then { name = iconName.BowTie, variant = iconVariant.Filled } else "icons/menu/clothing/accessories_off",
	Head = if fFlagAXMigrateBuilderIcons then { name = iconName.HatFedora, variant = iconVariant.Filled } else "icons/menu/clothing/hats_on",
	Face = if fFlagAXMigrateBuilderIcons then { name = iconName.Glasses, variant = iconVariant.Filled } else "icons/menu/clothing/eyes_on",
	Neck = if fFlagAXMigrateBuilderIcons then { name = iconName.Necklace, variant = iconVariant.Filled } else "icons/menu/clothing/neck_off",
	Shoulder = if fFlagAXMigrateBuilderIcons then { name = iconName.Parrot, variant = iconVariant.Filled } else "icons/menu/clothing/shoulder_on",
	Front = if fFlagAXMigrateBuilderIcons then { name = iconName.Purse, variant = iconVariant.Filled } else "icons/menu/clothing/front_on",
	Back = if fFlagAXMigrateBuilderIcons then {
		name = iconName.ButterflyWings,
		variant = iconVariant.Filled
	} else "icons/menu/clothing/back_on",
	Waist = if fFlagAXMigrateBuilderIcons then { name = iconName.Belt, variant = iconVariant.Filled } else "icons/menu/clothing/waist_on",
	Gear = if fFlagAXMigrateBuilderIcons then { name = iconName.Sword, variant = iconVariant.Filled } else "icons/menu/clothing/gear_on",
	Animation = if fFlagAXMigrateBuilderIcons then {
		name = iconName.PersonTeleport,
		variant = iconVariant.Filled
	} else "icons/menu/clothing/animation_off",
	Idle = if fFlagAXMigrateBuilderIcons then {
		name = iconName.PersonStanding,
		variant = iconVariant.Filled
	} else "icons/menu/clothing/idle_on",
	Walk = if fFlagAXMigrateBuilderIcons then {
		name = iconName.PersonWalking,
		variant = iconVariant.Filled
	} else "icons/menu/clothing/walk_off",
	Jump = if fFlagAXMigrateBuilderIcons then {
		name = iconName.PersonJumping,
		variant = iconVariant.Filled
	} else "icons/menu/clothing/jump_off",
	Fall = if fFlagAXMigrateBuilderIcons then {
		name = iconName.PersonFalling,
		variant = iconVariant.Filled
	} else "icons/menu/clothing/fall_off",
	Climb = if fFlagAXMigrateBuilderIcons then {
		name = iconName.PersonClimbing,
		variant = iconVariant.Filled
	} else "icons/menu/clothing/climb_off",
	Swim = if fFlagAXMigrateBuilderIcons then {
		name = iconName.PersonSwimming,
		variant = iconVariant.Filled
	} else "icons/menu/clothing/swim_off",
	Emote = if fFlagAXMigrateBuilderIcons then {
		name = iconName.SquareFaceWavingHand,
		variant = iconVariant.Filled
	} else "icons/controls/emoteOn",
	Reset = if fFlagAXMigrateBuilderIcons then {
		name = iconName.ArrowSpinClockwise,
		variant = iconVariant.Regular
	} else "icons/actions/reset",
	Undo = if fFlagAXMigrateBuilderIcons then {
		name = iconName.ArrowCurlToLeft,
		variant = iconVariant.Regular
	} else "icons/actions/edit/undo",
	Redo = if fFlagAXMigrateBuilderIcons then {
		name = iconName.ArrowCurlToRight,
		variant = iconVariant.Regular
	} else "icons/actions/edit/redo",
	Torso = if fFlagAXMigrateBuilderIcons then { name = iconName.Torso, variant = iconVariant.Filled } else "icons/menu/clothing/torsos_on",
	Arm = if fFlagAXMigrateBuilderIcons then { name = iconName.Arm, variant = iconVariant.Filled } else "icons/menu/clothing/arms_on",
	Leg = if fFlagAXMigrateBuilderIcons then { name = iconName.Leg, variant = iconVariant.Filled } else "icons/menu/clothing/legs_on",
	Inventory = if fFlagAXMigrateBuilderIcons then { name = iconName.Backpack, variant = iconVariant.Regular } else "icons/menu/inventoryOff",
	Adjust = if fFlagAXMigrateBuilderIcons then {
		name = iconName.ThreeSlidersHorizontal,
		variant = iconVariant.Regular
	} else "icons/actions/adjust",
	Success = if fFlagAXMigrateBuilderIcons then { name = iconName.CheckLarge, variant = iconVariant.Filled } else "icons/status/success_small",
	Add = if fFlagAXMigrateBuilderIcons then {
		name = iconName.CirclePlus,
		variant = iconVariant.Regular
	} else "icons/actions/edit/add",
	Build = if fFlagAXMigrateBuilderIcons then {
		name = iconName.PersonStandingDualArrowsVertical,
		variant = iconVariant.Filled
	} else "icons/menu/clothing/build_on",
	Eyelashes = if fFlagAXMigrateBuilderIcons then { name = iconName.Eyelashes, variant = iconVariant.Regular } else iconName.Eyelashes,
	Eyebrows = if fFlagAXMigrateBuilderIcons then { name = iconName.Eyebrows, variant = iconVariant.Regular } else iconName.Eyebrows,
	Backgrounds = { name = iconName.Image, variant = iconVariant.Filled }
}
local list = {
	Enum.AssetType.LeftLeg, Enum.AssetType.RightLeg, Enum.AssetType.LeftArm,
	Enum.AssetType.RightArm, Enum.AssetType.Torso, Enum.AssetType.Head,
	Enum.AssetType.DynamicHead
}
local list_1 = {
	categoriesModule.All,
	categoriesModule.Avatars,
	categoriesModule.Body
}

if not fFlagAXDownrankMakeupCustomize then
	table.insert(list_1, categoriesModule.Makeup)
end
table.insert(list_1, categoriesModule.Clothing)
table.insert(list_1, categoriesModule.Accessories)

if fFlagAXCustomizeBackgrounds then
	table.insert(list_1, categoriesModule.Backgrounds)
end
table.insert(list_1, categoriesModule.Animations)
table.insert(list_1, categoriesModule.Emotes)

if fFlagAXDownrankMakeupCustomize then
	table.insert(list_1, categoriesModule.Makeup)
end
local t_2 = {}

for i, v in list_1 do
	t_2[v] = i - 1
end
local t_3 = {
	[categoriesModule.All] = {
		name = "All",
		hide = true,
		nameTranslationKey = if fFlagAXSlotsDesktopRedesign then "Feature.Avatar.Heading.All" else "Feature.Catalog.Label.Avatars",
		index = t_2[categoriesModule.All],
		slots = {}
	},
	[categoriesModule.Avatars] = {
		name = "Avatars",
		nameTranslationKey = "Feature.Catalog.Label.Avatars",
		index = t_2[categoriesModule.Avatars],
		slots = {}
	},
	[categoriesModule.Body] = {
		name = "Body",
		nameTranslationKey = "Feature.Catalog.Label.Body",
		index = t_2[categoriesModule.Body],
		slots = if not fFlagRemoveClassicHeadsAndFaces then {
			{
				name = "Body",
				nameTranslationKey = "Feature.Catalog.Label.FullBody",
				editorSubcategory = avatarEditorSubcategoriesModule.PurchasedCharacters,
				assetTypes = {}
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Hair",
				icon = t_1.Hair,
				editorSubcategory = avatarEditorSubcategoriesModule.Hair,
				assetTypes = { Enum.AvatarAssetType.HairAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Head",
				icon = t_1.ClassicHead,
				editorSubcategory = avatarEditorSubcategoriesModule.Heads,
				assetTypes = {
					Enum.AvatarAssetType.DynamicHead,
					Enum.AvatarAssetType.Head
				}
			},
			{
				name = "Classic Face",
				nameTranslationKey = "Feature.Avatar.Label.Face",
				icon = t_1.Faces,
				editorSubcategory = avatarEditorSubcategoriesModule.ClassicFaces,
				assetTypes = { Enum.AvatarAssetType.Face }
			},
			{
				name = "Build",
				nameTranslationKey = "Feature.Avatar.Label.Build",
				assetTypes = {},
				icon = t_1.Build,
				editorSubcategory = avatarEditorSubcategoriesModule.Build
			},
			{
				name = "Skin",
				nameTranslationKey = "Feature.Avatar.Label.Skin",
				editorSubcategory = avatarEditorSubcategoriesModule.Skin,
				assetTypes = {}
			}
		} else {
			{
				name = "Body",
				nameTranslationKey = "Feature.Catalog.Label.FullBody",
				editorSubcategory = avatarEditorSubcategoriesModule.PurchasedCharacters,
				assetTypes = {}
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Hair",
				icon = t_1.Hair,
				editorSubcategory = avatarEditorSubcategoriesModule.Hair,
				assetTypes = { Enum.AvatarAssetType.HairAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Head",
				icon = t_1.ClassicHead,
				editorSubcategory = avatarEditorSubcategoriesModule.Heads,
				assetTypes = { Enum.AvatarAssetType.DynamicHead }
			},
			{
				name = "Build",
				nameTranslationKey = "Feature.Avatar.Label.Build",
				assetTypes = {},
				icon = t_1.Build,
				editorSubcategory = avatarEditorSubcategoriesModule.Build
			},
			{
				name = "Skin",
				nameTranslationKey = "Feature.Avatar.Label.Skin",
				editorSubcategory = avatarEditorSubcategoriesModule.Skin,
				assetTypes = {}
			}
		}
	},
	[categoriesModule.Makeup] = {
		name = "Makeup",
		nameTranslationKey = "Feature.Avatar.Label.Makeup",
		resetSlotOnClearAll = true,
		index = t_2[categoriesModule.Makeup],
		slots = {
			{
				nameTranslationKey = "Feature.Avatar.Label.Eyelashes",
				hide = true,
				icon = t_1.Eyelashes,
				editorSubcategory = avatarEditorSubcategoriesModule.MakeupLooks,
				eligibleSubcategories = {
					avatarEditorSubcategoriesModule.MakeupLooks,
					avatarEditorSubcategoriesModule.EyeMakeup,
					avatarEditorSubcategoriesModule.FaceMakeup,
					avatarEditorSubcategoriesModule.LipMakeup
				},
				assetTypes = {}
			},
			{
				layerLimit = 6,
				name = "Makeup",
				nameTranslationKey = "Feature.Avatar.Label.MakeupLayer",
				deselectable = true,
				slotType = slotTypeModule.LayeredSlot,
				eligibleSubcategories = {
					avatarEditorSubcategoriesModule.EyeMakeup,
					avatarEditorSubcategoriesModule.FaceMakeup,
					avatarEditorSubcategoriesModule.LipMakeup
				},
				editorSubcategory = avatarEditorSubcategoriesModule.EyeMakeup,
				assetTypes = {
					Enum.AvatarAssetType.EyeMakeup,
					Enum.AvatarAssetType.FaceMakeup,
					Enum.AvatarAssetType.LipMakeup
				}
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Eyelashes",
				deselectable = true,
				icon = t_1.Eyelashes,
				editorSubcategory = avatarEditorSubcategoriesModule.Eyelashes,
				assetTypes = { Enum.AvatarAssetType.EyelashAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Eyebrows",
				deselectable = true,
				icon = t_1.Eyebrows,
				editorSubcategory = avatarEditorSubcategoriesModule.Eyebrows,
				assetTypes = { Enum.AvatarAssetType.EyebrowAccessory }
			}
		}
	},
	[categoriesModule.Clothing] = {
		name = "Clothing",
		nameTranslationKey = "Feature.Catalog.Label.Clothing",
		index = t_2[categoriesModule.Clothing],
		slots = {
			{
				nameTranslationKey = "Feature.Avatar.Label.Top",
				icon = t_1.Shirts,
				editorSubcategory = avatarEditorSubcategoriesModule.Tops,
				assetTypes = {
					Enum.AvatarAssetType.ShirtAccessory,
					Enum.AvatarAssetType.TShirtAccessory,
					Enum.AvatarAssetType.SweaterAccessory
				}
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Outerwear",
				icon = t_1.Jackets,
				editorSubcategory = avatarEditorSubcategoriesModule.Outerwear,
				assetTypes = { Enum.AvatarAssetType.JacketAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Bottom",
				icon = t_1.Pants,
				editorSubcategory = avatarEditorSubcategoriesModule.Bottoms,
				assetTypes = {
					Enum.AvatarAssetType.PantsAccessory,
					Enum.AvatarAssetType.ShortsAccessory,
					Enum.AvatarAssetType.DressSkirtAccessory
				}
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Shoes",
				icon = t_1.Shoes,
				editorSubcategory = avatarEditorSubcategoriesModule.Shoes,
				assetTypes = { Enum.AvatarAssetType.RightShoeAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.ShirtClassic",
				icon = t_1.ClassicShirts,
				editorSubcategory = avatarEditorSubcategoriesModule.ClassicShirts,
				assetTypes = { Enum.AvatarAssetType.Shirt }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.PantsClassic",
				icon = t_1.ClassicPants,
				editorSubcategory = avatarEditorSubcategoriesModule.ClassicPants,
				assetTypes = { Enum.AvatarAssetType.Pants }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.TShirtClassic",
				icon = t_1.ClassicTShirts,
				editorSubcategory = avatarEditorSubcategoriesModule.ClassicTShirts,
				assetTypes = { Enum.AvatarAssetType.TShirt }
			}
		}
	},
	[categoriesModule.Accessories] = {
		name = "Accessories",
		nameTranslationKey = "Feature.Catalog.LabelAccessories",
		index = t_2[categoriesModule.Accessories],
		slots = {
			{
				name = "Head",
				nameTranslationKey = "Feature.Avatar.Label.Head",
				icon = t_1.Head,
				editorSubcategory = avatarEditorSubcategoriesModule.Hats,
				assetTypes = { Enum.AvatarAssetType.Hat }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Face",
				icon = t_1.Face,
				editorSubcategory = avatarEditorSubcategoriesModule.Face,
				assetTypes = { Enum.AvatarAssetType.FaceAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Neck",
				icon = t_1.Neck,
				editorSubcategory = avatarEditorSubcategoriesModule.Neck,
				assetTypes = { Enum.AvatarAssetType.NeckAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Back",
				icon = t_1.Back,
				editorSubcategory = avatarEditorSubcategoriesModule.Back,
				assetTypes = { Enum.AvatarAssetType.BackAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Waist",
				icon = t_1.Waist,
				editorSubcategory = avatarEditorSubcategoriesModule.Waist,
				assetTypes = { Enum.AvatarAssetType.WaistAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Shoulder",
				icon = t_1.Shoulder,
				editorSubcategory = avatarEditorSubcategoriesModule.Shoulder,
				assetTypes = { Enum.AvatarAssetType.ShoulderAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Front",
				icon = t_1.Front,
				editorSubcategory = avatarEditorSubcategoriesModule.Front,
				assetTypes = { Enum.AvatarAssetType.FrontAccessory }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Gear",
				icon = t_1.Gear,
				editorSubcategory = avatarEditorSubcategoriesModule.Gear,
				assetTypes = { Enum.AvatarAssetType.Gear }
			}
		}
	},
	[categoriesModule.Backgrounds] = if not fFlagAXCustomizeBackgrounds then nil else {
		name = "Backgrounds",
		nameTranslationKey = "Feature.Catalog.Label.Backgrounds",
		index = t_2[categoriesModule.Backgrounds],
		slots = {}
	},
	[categoriesModule.Animations] = {
		name = "Animations",
		nameTranslationKey = "Feature.Avatar.Heading.Animations",
		index = t_2[categoriesModule.Animations],
		slots = {
			{
				nameTranslationKey = "Feature.Avatar.Label.AnimationFullSet",
				icon = t_1.Animation,
				editorSubcategory = avatarEditorSubcategoriesModule.AnimationFullSets,
				assetTypes = { Enum.AvatarAssetType.IdleAnimation }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Idle",
				icon = t_1.Idle,
				editorSubcategory = avatarEditorSubcategoriesModule.IdleAnimations,
				assetTypes = { Enum.AvatarAssetType.IdleAnimation }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Walk",
				icon = t_1.Walk,
				editorSubcategory = avatarEditorSubcategoriesModule.WalkAnimations,
				assetTypes = { Enum.AvatarAssetType.WalkAnimation }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Run",
				icon = t_1.Animation,
				editorSubcategory = avatarEditorSubcategoriesModule.RunAnimations,
				assetTypes = { Enum.AvatarAssetType.RunAnimation }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Jump",
				icon = t_1.Jump,
				editorSubcategory = avatarEditorSubcategoriesModule.JumpAnimations,
				assetTypes = { Enum.AvatarAssetType.JumpAnimation }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Fall",
				icon = t_1.Fall,
				editorSubcategory = avatarEditorSubcategoriesModule.FallAnimations,
				assetTypes = { Enum.AvatarAssetType.FallAnimation }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Climb",
				icon = t_1.Climb,
				editorSubcategory = avatarEditorSubcategoriesModule.ClimbAnimations,
				assetTypes = { Enum.AvatarAssetType.ClimbAnimation }
			},
			{
				nameTranslationKey = "Feature.Avatar.Label.Swim",
				icon = t_1.Swim,
				editorSubcategory = avatarEditorSubcategoriesModule.SwimAnimations,
				assetTypes = { Enum.AvatarAssetType.SwimAnimation }
			}
		}
	},
	[categoriesModule.Emotes] = {
		name = "Emotes",
		nameTranslationKey = "Feature.Catalog.Label.Emotes",
		index = t_2[categoriesModule.Emotes],
		slots = {}
	}
}
local var1 = if fFlagAXInventoryDurablesExpiredFilter then { [inventoryFiltersModule.Expired] = 2 } else nil
t.Categories = categoriesModule
t.SlotEditorCategories = t_3
t.Icons = t_1
t.BodyAssetTypes = list
t.InventoryFilterToAvailabilityStatus = var1
t.ActionBarHeight = 64

return t