local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)
local AllBodyPartForSkinColoringIds = {
	"headColor3", "leftArmColor3", "leftLegColor3", "rightArmColor3",
	"rightLegColor3", "torsoColor3"
}

return {
	allBodyPartForSkinColoringIds = AllBodyPartForSkinColoringIds,
	AvatarType = { R6 = "R6", R15 = "R15" },
	AvatarSettings = {
		minDeltaBodyColorDifference = "minDeltaBodyColorDifference",
		scalesRules = "scalesRules",
		accessoryRefinementTypes = "accessoryRefinementTypes",
		accessoryRefinementLowerBounds = "accessoryRefinementLowerBounds",
		accessoryRefinementUpperBounds = "accessoryRefinementUpperBounds"
	},
	RecommendationsType = {
		All = "All",
		Asset = "Asset",
		BodyParts = "BodyParts",
		AvatarLooks = "AvatarLooks",
		AvatarAnimations = "AvatarAnimations",
		Shoes = "Shoes",
		DynamicHeads = "DynamicHeads",
		None = "None"
	},
	EmoteSlotsCount = 8,
	DefaultUserRecommendationsFetchSize = game:DefineFastInt("DefaultInfiniteScrollRecommendationsFetchSize", 120),
	RecommendationsExpirationTime = 300,
	ShimmerColorCardsToDisplay = 30,
	ItemFetchLimit = 25,
	ItemFetchSortOrder = "Desc",
	ItemsGridMetrics = { minimumItemsPerRow = 4, minimumItemWidth = 140 },
	ItemsGridTopPadding = 15,
	ItemsGridTopPaddingNew = 10,
	ItemsGridSidePadding = 30,
	ItemsGridBottomPadding = 24,
	ItemsGridBottomPaddingNew = 12,
	CreateOutfitKey = "avatar.createOutfit",
	UpdateOutfitKey = "avatar.updateOutfit",
	RenameOutfitKey = "avatar.renameOutfit",
	DeleteOutfitsKey = "avatar.deleteOutfit",
	GetAvatarDataKey = "avatareditor.getavatardata",
	GetMySharedAvatarsKey = "avatareditor.getmysharedavatars",
	AddOutfitButton = "ADD_OUTFIT_BUTTON",
	CharacterKey = "Character",
	HeadAndBody = "HeadAndBody",
	EditableCharacterKey = "EditableCharacter",
	PurchasedCharacterKey = "PurchasedCharacter",
	MakeupOutfitKey = "MakeupOutfit",
	ReachedLastPage = "LastPage",
	Outfits = "Outfits",
	OutfitOrAsset = { Outfit = "Outfit", Asset = "Asset" },
	MaxPreloadEditableCharacters = 50,
	MaxHats = 3,
	BodyPartButtonData = {
		{
			textKey = "Feature.Avatar.Label.BodyColorAllLimbs",
			bodyPartForSkinColoringIds = AllBodyPartForSkinColoringIds
		},
		{
			textKey = "Feature.Avatar.Label.BodyColorHead",
			bodyPartForSkinColoringIds = { "headColor3" }
		},
		{
			textKey = "Feature.Avatar.Label.BodyColorTorso",
			bodyPartForSkinColoringIds = { "torsoColor3" }
		},
		{
			textKey = "Feature.Avatar.Label.BodyColorLeftArm",
			bodyPartForSkinColoringIds = { "leftArmColor3" }
		},
		{
			textKey = "Feature.Avatar.Label.BodyColorRightArm",
			bodyPartForSkinColoringIds = { "rightArmColor3" }
		},
		{
			textKey = "Feature.Avatar.Label.BodyColorLeftLeg",
			bodyPartForSkinColoringIds = { "leftLegColor3" }
		},
		{
			textKey = "Feature.Avatar.Label.BodyColorRightLeg",
			bodyPartForSkinColoringIds = { "rightLegColor3" }
		}
	},
	ColorPickerViewSettings = { StandardView = "Standard", AdvancedView = "Advanced" },
	DefaultBodyColorRanges = {
		{
			Color3.fromRGB(49, 44, 37),
			Color3.fromRGB(61, 46, 36),
			Color3.fromRGB(78, 55, 49)
		},
		{
			Color3.fromRGB(62, 53, 42),
			Color3.fromRGB(75, 56, 46),
			Color3.fromRGB(96, 57, 45)
		},
		{
			Color3.fromRGB(90, 76, 46),
			Color3.fromRGB(86, 66, 54),
			Color3.fromRGB(92, 66, 49),
			Color3.fromRGB(94, 64, 53)
		},
		{
			Color3.fromRGB(82, 69, 54),
			Color3.fromRGB(90, 76, 66),
			Color3.fromRGB(98, 70, 58)
		},
		{
			Color3.fromRGB(116, 87, 62), Color3.fromRGB(124, 92, 70),
			Color3.fromRGB(115, 92, 61), Color3.fromRGB(137, 110, 74),
			Color3.fromRGB(138, 102, 70), Color3.fromRGB(140, 95, 77),
			Color3.fromRGB(118, 82, 67)
		},
		{
			Color3.fromRGB(199, 172, 120),
			Color3.fromRGB(188, 155, 93),
			Color3.fromRGB(170, 138, 98),
			Color3.fromRGB(173, 130, 96),
			Color3.fromRGB(174, 121, 102)
		},
		{
			Color3.fromRGB(145, 123, 90),
			Color3.fromRGB(175, 148, 131),
			Color3.fromRGB(149, 121, 119)
		},
		{
			Color3.fromRGB(215, 197, 154),
			Color3.fromRGB(218, 182, 142),
			Color3.fromRGB(211, 167, 131),
			Color3.fromRGB(212, 158, 140),
			Color3.fromRGB(204, 142, 105)
		},
		{
			Color3.fromRGB(230, 199, 158),
			Color3.fromRGB(229, 186, 152),
			Color3.fromRGB(234, 184, 146),
			Color3.fromRGB(232, 186, 170)
		},
		{
			Color3.fromRGB(255, 204, 153), Color3.fromRGB(238, 203, 173),
			Color3.fromRGB(240, 212, 185), Color3.fromRGB(237, 213, 180),
			Color3.fromRGB(239, 220, 191), Color3.fromRGB(243, 223, 212),
			Color3.fromRGB(240, 205, 196)
		},
		{
			Color3.fromHex("111111"), Color3.fromHex("A3A2A5"), Color3.fromHex("ADABAC"),
			Color3.fromHex("CDCDCD"), Color3.fromHex("F2F3F3"), Color3.fromHex("F9F9F9")
		},
		{
			Color3.fromHex("1F0403"), Color3.fromHex("520600"), Color3.fromHex("6F2A25"),
			Color3.fromHex("C4281C"), Color3.fromHex("B43A34"), Color3.fromHex("FF0000"),
			Color3.fromHex("D25A59"), Color3.fromHex("FF9F9D"), Color3.fromHex("FFB8B5")
		},
		{
			Color3.fromHex("251302"), Color3.fromHex("5D3002"), Color3.fromHex("A85502"),
			Color3.fromHex("A05F35"), Color3.fromHex("FFCC99"), Color3.fromHex("FBF0E6")
		},
		{
			Color3.fromHex("271403"), Color3.fromHex("AA5500"), Color3.fromHex("D5733D"),
			Color3.fromHex("DB8641"), Color3.fromHex("DA8541"), Color3.fromHex("FFAF00"),
			Color3.fromHex("F2E7DE")
		},
		{
			Color3.fromHex("241D03"),
			Color3.fromHex("F9D96D"),
			Color3.fromHex("FDEA8D"),
			Color3.fromHex("FAF7EC")
		},
		{
			Color3.fromHex("1C1B03"), Color3.fromHex("5B6C54"), Color3.fromHex("7F8E64"),
			Color3.fromHex("A4BD47"), Color3.fromHex("C1BE42"), Color3.fromHex("FFFF00"),
			Color3.fromHex("FFFFCC"), Color3.fromHex("F8F7E1")
		},
		{
			Color3.fromHex("052303"), Color3.fromHex("3D791C"), Color3.fromHex("4B974B"),
			Color3.fromHex("51994C"), Color3.fromHex("00FF00"), Color3.fromHex("CCFFCC"),
			Color3.fromHex("D9E9D8")
		},
		{
			Color3.fromHex("0A1C02"),
			Color3.fromHex("27462D"),
			Color3.fromHex("287F47"),
			Color3.fromHex("789082"),
			Color3.fromHex("E8F9E1")
		},
		{
			Color3.fromHex("01090D"), Color3.fromHex("002060"), Color3.fromHex("0000FF"),
			Color3.fromHex("05ADED"), Color3.fromHex("04AFEC"), Color3.fromHex("AFDDFF"),
			Color3.fromHex("DDEEF4")
		},
		{
			Color3.fromHex("021515"), Color3.fromHex("0C9485"), Color3.fromHex("12EED4"),
			Color3.fromHex("01FFFD"), Color3.fromHex("00FFFF"), Color3.fromHex("62FCFB"),
			Color3.fromHex("9FF3E9"), Color3.fromHex("DEF8F7")
		},
		{
			Color3.fromHex("011016"), Color3.fromHex("1B2A35"), Color3.fromHex("2154B9"),
			Color3.fromHex("0D69AC"), Color3.fromHex("618CBD"), Color3.fromHex("6E99CA"),
			Color3.fromHex("B4D2E4"), Color3.fromHex("CCDDF0")
		},
		{
			Color3.fromHex("160310"), Color3.fromHex("A92FA3"), Color3.fromHex("FF66CC"),
			Color3.fromHex("FF98DC"), Color3.fromHex("FF99DD"), Color3.fromHex("E8BAC8"),
			Color3.fromHex("F6DDEE")
		},
		{
			Color3.fromHex("0E041C"),
			Color3.fromHex("6225D1"),
			Color3.fromHex("B27EFE"),
			Color3.fromHex("B480FF"),
			Color3.fromHex("DECFF4")
		},
		{
			Color3.fromHex("1F0A26"), Color3.fromHex("6B327C"), Color3.fromHex("7C478E"),
			Color3.fromHex("8C5B9F"), Color3.fromHex("A982B6"), Color3.fromHex("EAD6F0")
		},
		{
			Color3.fromHex("220320"), Color3.fromHex("6A0369"), Color3.fromHex("A92FA3"),
			Color3.fromHex("FF00BF"), Color3.fromHex("CF8ACB"), Color3.fromHex("F1DDF0")
		}
	},
	BodyColorsSliderFrameHeight = 50,
	BodyColorsSliderTrackHeight = 24,
	SkinColorGridPadding = 12,
	SkinColorSliderPadding = 24,
	DefaultBodyColorBrickId = 194,
	DefaultBodyColor3 = Color3.fromRGB(163, 162, 165),
	AvatarShareErrorMessagesKeys = {},
	BrokenAvatarThumbnail = "rbxasset://textures/ui/AvatarExperience/broken-avatar-200px.png"
}