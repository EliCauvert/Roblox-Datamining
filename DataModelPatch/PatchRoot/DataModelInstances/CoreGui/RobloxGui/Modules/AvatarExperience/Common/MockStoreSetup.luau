local CorePackages = game:GetService("CorePackages")
local DashModule = require(CorePackages.Packages.Dash)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.Types)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local CreateMockNavigationStateFunction = require(CorePackages.Workspace.Packages.NavigationRodux).TestUtils.createMockNavigationState
local PPEThumbnailTypeModule = require(Modules.AvatarExperience.ProfilePictureEditor.PPEThumbnailType)
local ConstantsModule2 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local SortAndFiltersModule = require(Modules.AvatarExperience.Catalog.Reducers.SortAndFilters)
local AssetInfoModule = require(Modules.AvatarExperience.Common.Models.AssetInfo)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local MockStoreSetupModule = {}
MockStoreSetupModule.__index = MockStoreSetupModule
MockStoreSetupModule.DynamicHeadMoodAnimationAssetId = "10687293613"
MockStoreSetupModule.DylanDefaultHeadAssetId = "10687288296"
MockStoreSetupModule.DylanDefaultOutfitId = "11164330909"
MockStoreSetupModule.GeckoMoodAnimationAssetId = "10647852134"
MockStoreSetupModule.GeckoBundleId = "965"
MockStoreSetupModule.GeckoOutfitId = "11625687672"
MockStoreSetupModule.DylanDefaultBundleId = "945"
MockStoreSetupModule.YellowSciFiJacketAssetId = "11449307353"
MockStoreSetupModule.NinjaIdleAnimationAssetId = "658832408"
MockStoreSetupModule.DefaultLocalUserId = "129687796"
MockStoreSetupModule.BodybuilderEmoteAssetId = "3994130516"
MockStoreSetupModule.BodybuilderKeyframeSequenceAssetId = "10713990381"
MockStoreSetupModule.PirateAnimationBundleId = "55"
MockStoreSetupModule.PirateIdleAnimationAssetId = "837024662"
MockStoreSetupModule.PirateRunAnimationAssetId = "837023444"
MockStoreSetupModule.PirateJumpAnimationAssetId = "837024350"
MockStoreSetupModule.DummySearchUid = "test_uuid"
MockStoreSetupModule.DummyKeyword = "test"
MockStoreSetupModule.DunceHatAssetId = "12536385254"
MockStoreSetupModule.PirateOutfitId = "132923221"
MockStoreSetupModule.NumPirateAnimations = 0
MockStoreSetupModule.UnusedItemId = "1011011010"
local BundleInfo = {
	[MockStoreSetupModule.PirateRunAnimationAssetId] = { assetType = "53" },
	["837023892"] = { assetType = "55" },
	["837024147"] = { assetType = "50" },
	[MockStoreSetupModule.PirateJumpAnimationAssetId] = { assetType = "52" },
	[MockStoreSetupModule.PirateIdleAnimationAssetId] = { assetType = "51" },
	["837025054"] = { assetType = "54" },
	["837025325"] = { assetType = "48" }
}

for _, _ in BundleInfo do
	MockStoreSetupModule.NumPirateAnimations += 1
end
local List = {}

for Id, _ in BundleInfo do
	table.insert(List, { id = Id, type = ConstantsModule.ItemType.Asset })
end
table.insert(List, {
	id = MockStoreSetupModule.PirateOutfitId,
	type = ConstantsModule.ItemType.Outfit
})

function MockStoreSetupModule.new(p1)
	-- upvalues: MockStoreSetupModule (copy)
	local t = {}
	setmetatable(t, MockStoreSetupModule)
	t.state = if p1 then p1 else {}
	t.itemRecency = 0
	
	return t
end

MockStoreSetupModule.basicScales = {
	bodyType = 1,
	depth = 1,
	head = 1,
	height = 1,
	proportion = 0,
	width = 1
}

function MockStoreSetupModule.makeBodyColors(HeadColorId)
	return {
		headColorId = HeadColorId,
		leftArmColorId = HeadColorId,
		leftLegColorId = HeadColorId,
		rightArmColorId = HeadColorId,
		rightLegColorId = HeadColorId,
		torsoColorId = HeadColorId
	}
end

function MockStoreSetupModule.makeBodyColor3s(HeadColor3)
	return {
		headColor3 = HeadColor3,
		torsoColor3 = HeadColor3,
		rightArmColor3 = HeadColor3,
		leftArmColor3 = HeadColor3,
		rightLegColor3 = HeadColor3,
		leftLegColor3 = HeadColor3
	}
end

function MockStoreSetupModule.makeSkeletonOutfitInfo()
	-- upvalues: ConstantsModule (copy), MockStoreSetupModule (copy)
	return {
		avatarType = "R15",
		containsDynamicHead = false,
		isEditable = false,
		name = "SkeletonOutfit",
		outfitId = "1234",
		updateCounter = 0,
		assets = {},
		outfitType = ConstantsModule.OutfitTypes.Avatar,
		bodyColor3s = MockStoreSetupModule.basicBodyColor3s,
		bodyColors = MockStoreSetupModule.basicBodyColors,
		scales = MockStoreSetupModule.basicScales
	}
end

function MockStoreSetupModule.makeSkeletonTryOnItem()
	-- upvalues: ConstantsModule (copy)
	return {
		version = "1",
		itemId = "dummy",
		selectedInTryOnManager = true,
		isUnequipped = false,
		receivedBundleInfo = false,
		itemRecency = 0,
		itemType = ConstantsModule.ItemType.Asset,
		itemSubType = ConstantsModule.AssetTypeIdStrings.JacketAccessory
	}
end

MockStoreSetupModule.basicBodyColors = MockStoreSetupModule.makeBodyColors(ConstantsModule1.DefaultBodyColorBrickId)
MockStoreSetupModule.basicBodyColor3s = MockStoreSetupModule.makeBodyColor3s(ConstantsModule1.DefaultBodyColor3)

function MockStoreSetupModule:getState()
	return self.state
end

function MockStoreSetupModule:addCameraButtonStatus(Enabled)
	-- upvalues: DashModule (copy)
	self.state = DashModule.joinDeep({
		AvatarExperience = { CameraButton = { enabled = Enabled } }
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addCameraButtonErrorOccurred(ErrorOccurred)
	-- upvalues: DashModule (copy)
	self.state = DashModule.joinDeep({
		AvatarExperience = { CameraButton = { errorOccurred = ErrorOccurred } }
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addFetchStatus(p1, p2)
	-- upvalues: DashModule (copy)
	self.state = DashModule.joinDeep({
		AvatarExperience = {
			AvatarEditor = { UserInventoryRecommendationsFetchStatus = { [p1] = p2 } }
		}
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addCurrentCharacter(CurrentCharacter, p1)
	-- upvalues: ConstantsModule2 (copy), DashModule (copy)
	if not CurrentCharacter then
		local Players = game:GetService("Players")
		local R6 = if p1 then Enum.HumanoidRigType.R6 else Enum.HumanoidRigType.R15
		CurrentCharacter = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then Players:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), R6) else Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), R6)
	end
	assert(CurrentCharacter, "character is not nil.")
	CurrentCharacter.Parent = workspace
	self.state = DashModule.joinDeep({
		AvatarExperience = {
			AvatarEditor = {
				Character = {
					AvatarType = if p1 then ConstantsModule2.AvatarType.R6 else ConstantsModule2.AvatarType.R15
				}
			},
			AvatarScene = { Character = { CurrentCharacter = CurrentCharacter } }
		}
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addPPEStartState()
	-- upvalues: PPEThumbnailTypeModule (copy), DashModule (copy)
	self.state = DashModule.joinDeep({
		AvatarExperience = {
			ProfilePictureEditor = {
				ProfilePictureParams = {
					ppeEmoteLoadingCount = 0,
					ppeVersion = {
						[PPEThumbnailTypeModule.Closeup] = 0,
						[PPEThumbnailTypeModule.FullBody] = 0
					}
				}
			}
		}
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addLocalUserId(LocalUserId)
	-- upvalues: MockStoreSetupModule (copy), DashModule (copy)
	if not LocalUserId then
		LocalUserId = MockStoreSetupModule.DefaultLocalUserId
	end
	self.state = DashModule.joinDeep({ LocalUserId = LocalUserId }, self.state)
	
	return self
end

function MockStoreSetupModule:addEquippedItem(DynamicHead, p1)
	-- upvalues: DashModule (copy)
	self.state = DashModule.joinDeep({
		AvatarExperience = {
			AvatarEditor = { Character = { EquippedAssets = { [DynamicHead] = p1 } } }
		}
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addEquippedNinjaIdleAnimation()
	-- upvalues: ConstantsModule (copy), MockStoreSetupModule (copy)
	return self:addEquippedItem(ConstantsModule.AssetTypeIdStrings.IdleAnimation, {
		[MockStoreSetupModule.NinjaIdleAnimationAssetId] = { isLayered = false, version = "nil" }
	})
end

function MockStoreSetupModule:addEquippedYellowSciFiJacket()
	-- upvalues: ConstantsModule (copy), MockStoreSetupModule (copy)
	return self:addEquippedItem(ConstantsModule.AssetTypeIdStrings.JacketAccessory, {
		[MockStoreSetupModule.YellowSciFiJacketAssetId] = {
			isLayered = true,
			order = 12,
			version = "1",
			type = Enum.AccessoryType.Jacket
		}
	})
end

function MockStoreSetupModule:addEquippedHat()
	-- upvalues: ConstantsModule (copy), MockStoreSetupModule (copy)
	return self:addEquippedItem(ConstantsModule.AssetTypeIdStrings.Hat, {
		[MockStoreSetupModule.DunceHatAssetId] = {
			isLayered = false,
			version = "1",
			type = Enum.AccessoryType.Hat
		}
	})
end

function MockStoreSetupModule:addEquippedShirt()
	-- upvalues: ConstantsModule (copy)
	return self:addEquippedItem(ConstantsModule.AssetTypeIdStrings.ShirtAccessory, {
		["9512497883"] = {
			isLayered = true,
			order = 10,
			version = "1",
			type = Enum.AccessoryType.Shirt
		}
	})
end

function MockStoreSetupModule:addEquippedGear()
	-- upvalues: ConstantsModule (copy)
	return self:addEquippedItem(ConstantsModule.AssetTypeIdStrings.Gear, { ["1132887630"] = { version = "1" } })
end

function MockStoreSetupModule:addEquippedDynamicHead()
	-- upvalues: ConstantsModule (copy), MockStoreSetupModule (copy)
	return self:addEquippedItem(ConstantsModule.AssetTypeIdStrings.DynamicHead, {
		[MockStoreSetupModule.DylanDefaultHeadAssetId] = { isLayered = false, version = "nil" }
	})
end

function MockStoreSetupModule:addEquippedMoodAnimation()
	-- upvalues: ConstantsModule (copy), MockStoreSetupModule (copy)
	return self:addEquippedItem(ConstantsModule.AssetTypeIdStrings.MoodAnimation, {
		[MockStoreSetupModule.DynamicHeadMoodAnimationAssetId] = { isLayered = false, version = "nil" }
	})
end

function MockStoreSetupModule:addOutfitTryOnItem(GeckoBundleId, SkeletonTryOnItem)
	-- upvalues: DashModule (copy)
	SkeletonTryOnItem.itemRecency = self.itemRecency
	self.itemRecency += 1
	self.state = DashModule.joinDeep({
		AvatarExperience = {
			AvatarScene = {
				OutfitTryOn = {
					TryOnItems = {
						[`{GeckoBundleId}-{SkeletonTryOnItem.itemType}`] = SkeletonTryOnItem
					}
				}
			}
		}
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addOutfitTryOnLastToggledItem(LastToggledItem)
	-- upvalues: DashModule (copy)
	self.state = DashModule.joinDeep({
		AvatarExperience = {
			AvatarScene = { OutfitTryOn = { LastToggledItem = LastToggledItem } }
		}
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addOutfitTryOnItemAsAsset(ItemId, ItemSubType)
	-- upvalues: MockStoreSetupModule (copy), ConstantsModule (copy), DashModule (copy)
	local SkeletonTryOnItem = MockStoreSetupModule.makeSkeletonTryOnItem()
	SkeletonTryOnItem.itemId = ItemId
	SkeletonTryOnItem.itemType = ConstantsModule.ItemType.Asset
	SkeletonTryOnItem.itemSubType = ItemSubType
	SkeletonTryOnItem.itemRecency = self.itemRecency
	self.itemRecency += 1
	self.state = DashModule.joinDeep({
		AvatarExperience = {
			AvatarScene = {
				OutfitTryOn = { TryOnItems = { [ItemId] = SkeletonTryOnItem } }
			}
		}
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addOutfitTryOnItemAsPartsBundleAsset(ItemId, p1, AssetType)
	-- upvalues: MockStoreSetupModule (copy), ConstantsModule (copy), DashModule (copy)
	local SkeletonTryOnItem = MockStoreSetupModule.makeSkeletonTryOnItem()
	SkeletonTryOnItem.itemId = ItemId
	SkeletonTryOnItem.itemType = ConstantsModule.ItemType.Bundle
	SkeletonTryOnItem.itemSubType = ConstantsModule.BundleTypeIdStrings.BodyParts
	SkeletonTryOnItem.itemRecency = self.itemRecency
	SkeletonTryOnItem.bundleInfo = { [p1] = { assetType = AssetType } }
	self.itemRecency += 1
	self.state = DashModule.joinDeep({
		AvatarExperience = {
			AvatarScene = {
				OutfitTryOn = { TryOnItems = { [p1] = SkeletonTryOnItem } }
			}
		}
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addDylanDefaultOutfitTryOnItem()
	-- upvalues: MockStoreSetupModule (copy), ConstantsModule (copy)
	return self:addOutfitTryOnItem(MockStoreSetupModule.DylanDefaultBundleId, {
		isUnequipped = false,
		itemRecency = 0,
		receivedBundleInfo = false,
		selectedInTryOnManager = true,
		version = "1",
		bundleInfo = {
			[MockStoreSetupModule.DylanDefaultHeadAssetId] = {
				assetType = ConstantsModule.AssetTypeIdStrings.DynamicHead
			},
			[MockStoreSetupModule.DynamicHeadMoodAnimationAssetId] = {
				assetType = ConstantsModule.AssetTypeIdStrings.MoodAnimation
			}
		},
		itemId = MockStoreSetupModule.DylanDefaultBundleId,
		itemSubType = ConstantsModule.BundleTypeIdStrings.DynamicHead,
		itemType = ConstantsModule.ItemType.Bundle
	})
end

function MockStoreSetupModule:addGeckoOutfitTryOnItem()
	-- upvalues: MockStoreSetupModule (copy), ConstantsModule (copy)
	return self:addOutfitTryOnItem(MockStoreSetupModule.GeckoBundleId, {
		isUnequipped = false,
		itemRecency = 7,
		receivedBundleInfo = false,
		selectedInTryOnManager = true,
		version = "1",
		bundleInfo = {
			["10407915508"] = {
				assetType = ConstantsModule.AssetTypeIdStrings.DynamicHead
			},
			[MockStoreSetupModule.GeckoMoodAnimationAssetId] = {
				assetType = ConstantsModule.AssetTypeIdStrings.MoodAnimation
			},
			["2510230574"] = { assetType = "48" },
			["2510233257"] = { assetType = "50" },
			["2510235063"] = { assetType = "51" },
			["2510236649"] = { assetType = "52" },
			["2510238627"] = { assetType = "53" },
			["2510240941"] = { assetType = "54" },
			["2510242378"] = { assetType = "55" },
			["7200822331"] = { assetType = "29" },
			["7200822888"] = { assetType = "30" },
			["7200823471"] = { assetType = "28" },
			["7200824015"] = { assetType = "31" },
			["7200824885"] = { assetType = "27" },
			["7200826678"] = { assetType = "47" }
		},
		itemId = MockStoreSetupModule.GeckoBundleId,
		itemSubType = ConstantsModule.BundleTypeIdStrings.BodyParts,
		itemType = ConstantsModule.ItemType.Bundle
	})
end

function MockStoreSetupModule:addPirateAnimationOutfitTryOnItem()
	-- upvalues: MockStoreSetupModule (copy), BundleInfo (copy), ConstantsModule (copy)
	return self:addOutfitTryOnItem(MockStoreSetupModule.PirateAnimationBundleId, {
		isUnequipped = false,
		itemRecency = 0,
		receivedBundleInfo = true,
		selectedInTryOnManager = true,
		version = "1",
		bundleInfo = BundleInfo,
		itemId = MockStoreSetupModule.PirateAnimationBundleId,
		itemSubType = ConstantsModule.BundleTypeIdStrings.Animations,
		itemType = ConstantsModule.ItemType.Bundle
	})
end

function MockStoreSetupModule:addPirateAnimationOutfitTryOnLastToggledItem()
	-- upvalues: MockStoreSetupModule (copy), ConstantsModule (copy)
	local SkeletonTryOnItem = MockStoreSetupModule.makeSkeletonTryOnItem()
	SkeletonTryOnItem.itemId = MockStoreSetupModule.PirateAnimationBundleId
	SkeletonTryOnItem.itemType = ConstantsModule.ItemType.Bundle
	
	return self:addOutfitTryOnLastToggledItem(SkeletonTryOnItem)
end

function MockStoreSetupModule:addDHWithNoMoodOutfitTryOnItem()
	-- upvalues: MockStoreSetupModule (copy), ConstantsModule (copy)
	return self:addOutfitTryOnItem(MockStoreSetupModule.GeckoBundleId, {
		isUnequipped = false,
		itemRecency = 7,
		itemSubType = "1",
		receivedBundleInfo = false,
		selectedInTryOnManager = true,
		version = "1",
		bundleInfo = {
			["10407915508"] = {
				assetType = ConstantsModule.AssetTypeIdStrings.DynamicHead
			},
			["2510230574"] = { assetType = "48" },
			["2510233257"] = { assetType = "50" },
			["2510235063"] = { assetType = "51" },
			["2510236649"] = { assetType = "52" },
			["2510238627"] = { assetType = "53" },
			["2510240941"] = { assetType = "54" },
			["2510242378"] = { assetType = "55" },
			["7200822331"] = { assetType = "29" },
			["7200822888"] = { assetType = "30" },
			["7200823471"] = { assetType = "28" },
			["7200824015"] = { assetType = "31" },
			["7200824885"] = { assetType = "27" },
			["7200826678"] = { assetType = "47" }
		},
		itemId = MockStoreSetupModule.GeckoBundleId,
		itemType = ConstantsModule.ItemType.Bundle
	})
end

function MockStoreSetupModule:addTryOnAnimation(AnimationPreview)
	-- upvalues: DashModule (copy)
	self.state = DashModule.joinDeep({
		AvatarExperience = {
			AvatarScene = { TryOn = { AnimationPreview = AnimationPreview } }
		}
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addPirateTryOnAnimation()
	-- upvalues: MockStoreSetupModule (copy)
	return self:addTryOnAnimation(MockStoreSetupModule.PirateIdleAnimationAssetId)
end

function MockStoreSetupModule:addAssetInfo(DunceHat)
	-- upvalues: DashModule (copy)
	local Id = DunceHat.id
	assert(Id ~= nil, "assetInfo should have an id")
	self.state = DashModule.joinDeep({
		AvatarExperience = { Common = { AssetInfos = { [Id] = DunceHat } } }
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addBundleInfo(p1)
	-- upvalues: DashModule (copy)
	local Id = p1.id
	assert(Id ~= nil, "bundleInfo should have an id")
	self.state = DashModule.joinDeep({
		AvatarExperience = { Common = { BundleInfos = { [Id] = p1 } } }
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addPirateAnimationAssetInfos()
	-- upvalues: BundleInfo (copy), AssetInfoModule (copy)
	for Id, value in BundleInfo do
		local MockResult = AssetInfoModule.mock()
		MockResult.id = Id
		MockResult.assetType = value.assetType
		self = self:addAssetInfo(MockResult)
	end
	return self
end

function MockStoreSetupModule:addDunceHatAssetInfo()
	-- upvalues: AssetInfoModule (copy), MockStoreSetupModule (copy)
	return self:addAssetInfo((AssetInfoModule.fromGetCatalogItemData({
		receivedCatalogData = true,
		name = "Dunce Hat",
		description = "Go sit in the corner",
		price = 69,
		favoriteCount = 7486,
		isOwned = false,
		isPurchasable = true,
		id = MockStoreSetupModule.DunceHatAssetId,
		assetType = Enum.AvatarAssetType.Hat.Name,
		product = { id = "1379526016" },
		creator = {
			id = "13805545",
			name = "BRICK UGC",
			type = "Group",
			hasVerifiedBadge = true
		},
		itemStatus = {},
		itemRestrictions = {}
	})))
end

function MockStoreSetupModule:addDylanDefaultBundleInfo()
	-- upvalues: MockStoreSetupModule (copy), ConstantsModule (copy)
	return self:addBundleInfo({
		description = "A look that never goes out of style.",
		expectedSellerId = "1",
		favoriteCount = 196358,
		isOwned = true,
		isPublicDomain = true,
		isPurchasable = false,
		name = "Dylan Default",
		priceInRobux = 0,
		priceStatus = "Free",
		receivedBundleDetails = true,
		receivedCatalogData = true,
		receivedFromSortResults = true,
		bundleType = tostring(Enum.BundleType.DynamicHead.Value),
		id = MockStoreSetupModule.DylanDefaultBundleId,
		itemStatus = {},
		itemType = ConstantsModule.ItemType.Bundle,
		items = {
			[1] = {
				id = MockStoreSetupModule.DylanDefaultHeadAssetId,
				type = ConstantsModule.ItemType.Asset
			},
			[2] = {
				id = MockStoreSetupModule.DynamicHeadMoodAnimationAssetId,
				type = ConstantsModule.ItemType.Asset
			},
			[3] = {
				id = MockStoreSetupModule.DylanDefaultOutfitId,
				type = ConstantsModule.ItemType.Outfit
			}
		}
	})
end

function MockStoreSetupModule:addGeckoBundleInfo()
	-- upvalues: ConstantsModule (copy), MockStoreSetupModule (copy)
	return self:addBundleInfo({
		description = "Some geckos have been seen running across the surface of water. Other geckos refer to them as \"overachievers.\"",
		expectedSellerId = "1",
		favoriteCount = 24889,
		isOwned = false,
		isPublicDomain = false,
		isPurchasable = true,
		name = "Galloping Gecko",
		priceInRobux = 500,
		receivedBundleDetails = true,
		receivedCatalogData = true,
		receivedFromSortResults = true,
		bundleType = ConstantsModule.BundleTypeIdStrings.BodyParts,
		creator = {
			hasVerifiedBadge = true,
			id = "1",
			name = "Roblox",
			type = "User"
		},
		id = MockStoreSetupModule.GeckoBundleId,
		itemRestrictions = {},
		itemStatus = {},
		itemType = ConstantsModule.ItemType.Bundle,
		items = {
			[1] = { id = "7200822331", type = ConstantsModule.ItemType.Asset },
			[2] = { id = "7200822888", type = ConstantsModule.ItemType.Asset },
			[3] = { id = "7200823471", type = ConstantsModule.ItemType.Asset },
			[4] = { id = "7200824015", type = ConstantsModule.ItemType.Asset },
			[5] = { id = "7200824885", type = ConstantsModule.ItemType.Asset },
			[6] = {
				id = "10407915508",
				type = ConstantsModule.ItemType.Asset
			},
			[7] = { id = "7200826678", type = ConstantsModule.ItemType.Asset },
			[8] = { id = "2510230574", type = ConstantsModule.ItemType.Asset },
			[9] = { id = "2510233257", type = ConstantsModule.ItemType.Asset },
			[10] = { id = "2510235063", type = ConstantsModule.ItemType.Asset },
			[11] = { id = "2510236649", type = ConstantsModule.ItemType.Asset },
			[12] = { id = "2510238627", type = ConstantsModule.ItemType.Asset },
			[13] = { id = "2510240941", type = ConstantsModule.ItemType.Asset },
			[14] = { id = "2510242378", type = ConstantsModule.ItemType.Asset },
			[15] = {
				id = MockStoreSetupModule.GeckoMoodAnimationAssetId,
				type = ConstantsModule.ItemType.Asset
			},
			[16] = {
				id = MockStoreSetupModule.GeckoOutfitId,
				type = ConstantsModule.ItemType.Outfit
			},
			[17] = {
				id = "11625698220",
				type = ConstantsModule.ItemType.Outfit
			}
		},
		product = {
			id = "1324726369",
			isForSale = true,
			type = "productType"
		}
	})
end

function MockStoreSetupModule:addPirateAnimationBundleInfo()
	-- upvalues: ConstantsModule (copy), List (copy)
	return self:addBundleInfo({
		bundleType = "2",
		description = "This animation pack only works with R15 avatars. Arr, I'll wipe the deck with ya blasted swabbies!",
		expectedSellerId = "1",
		favoriteCount = 99606,
		id = "55",
		isOwned = true,
		isPublicDomain = false,
		isPurchasable = false,
		name = "Pirate Animation Package",
		priceInRobux = 750,
		receivedBundleDetails = true,
		receivedCatalogData = true,
		receivedFromSortResults = true,
		creator = {
			hasVerifiedBadge = true,
			id = "1",
			name = "Roblox",
			type = "User"
		},
		itemRestrictions = {},
		itemStatus = {},
		itemType = ConstantsModule.ItemType.Bundle,
		items = List,
		product = {
			id = "1324726369",
			isForSale = true,
			type = "productType"
		}
	})
end

function MockStoreSetupModule:addOutfitInfo(DylanDefaultOutfitId, SkeletonOutfitInfo)
	-- upvalues: DashModule (copy)
	self.state = DashModule.joinDeep({
		AvatarExperience = {
			AvatarEditor = {
				OutfitInfos = { [DylanDefaultOutfitId] = SkeletonOutfitInfo }
			}
		}
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addDylanDefaultOutfitInfo()
	-- upvalues: MockStoreSetupModule (copy), ConstantsModule (copy)
	local SkeletonOutfitInfo = MockStoreSetupModule.makeSkeletonOutfitInfo()
	SkeletonOutfitInfo.assets = {
		[ConstantsModule.AssetTypeIdStrings.MoodAnimation] = {
			[MockStoreSetupModule.DynamicHeadMoodAnimationAssetId] = { isLayered = false, version = "nil" }
		},
		[ConstantsModule.AssetTypeIdStrings.DynamicHead] = {
			[MockStoreSetupModule.DylanDefaultHeadAssetId] = { isLayered = false, version = "nil" }
		}
	}
	SkeletonOutfitInfo.containsDynamicHead = true
	SkeletonOutfitInfo.name = "Dylan Default"
	SkeletonOutfitInfo.outfitId = MockStoreSetupModule.DylanDefaultOutfitId
	SkeletonOutfitInfo.outfitType = ConstantsModule.OutfitTypes.DynamicHead
	
	return self:addOutfitInfo(MockStoreSetupModule.DylanDefaultOutfitId, SkeletonOutfitInfo)
end

function MockStoreSetupModule:addGeckoOutfitInfo()
	-- upvalues: MockStoreSetupModule (copy), ConstantsModule (copy)
	local SkeletonOutfitInfo = MockStoreSetupModule.makeSkeletonOutfitInfo()
	SkeletonOutfitInfo.assets = {
		["27"] = { ["7200824885"] = { isLayered = false, version = "nil" } },
		["28"] = { ["7200823471"] = { isLayered = false, version = "nil" } },
		["29"] = { ["7200822331"] = { isLayered = false, version = "nil" } },
		["30"] = { ["7200822888"] = { isLayered = false, version = "nil" } },
		["31"] = { ["7200824015"] = { isLayered = false, version = "nil" } },
		["47"] = { ["7200826678"] = { isLayered = false, version = "nil" } },
		["48"] = { ["2510230574"] = { isLayered = false, version = "nil" } },
		["50"] = { ["2510233257"] = { isLayered = false, version = "nil" } },
		["51"] = { ["2510235063"] = { isLayered = false, version = "nil" } },
		["52"] = { ["2510236649"] = { isLayered = false, version = "nil" } },
		["53"] = { ["2510238627"] = { isLayered = false, version = "nil" } },
		["54"] = { ["2510240941"] = { isLayered = false, version = "nil" } },
		["55"] = { ["2510242378"] = { isLayered = false, version = "nil" } },
		[ConstantsModule.AssetTypeIdStrings.MoodAnimation] = {
			[MockStoreSetupModule.GeckoMoodAnimationAssetId] = { isLayered = false, version = "nil" }
		},
		[ConstantsModule.AssetTypeIdStrings.DynamicHead] = { ["10407915508"] = { isLayered = false, version = "nil" } }
	}
	SkeletonOutfitInfo.outfitType = ConstantsModule.OutfitTypes.Avatar
	SkeletonOutfitInfo.name = "Galloping Gecko"
	SkeletonOutfitInfo.outfitId = MockStoreSetupModule.GeckoOutfitId
	SkeletonOutfitInfo.containsDynamicHead = true
	
	return self:addOutfitInfo(MockStoreSetupModule.GeckoOutfitId, SkeletonOutfitInfo)
end

function MockStoreSetupModule:addPirateAnimationOutfitInfo()
	-- upvalues: MockStoreSetupModule (copy)
	local SkeletonOutfitInfo = MockStoreSetupModule.makeSkeletonOutfitInfo()
	SkeletonOutfitInfo.assets = {
		["48"] = { ["837025325"] = { isLayered = false, version = "nil" } },
		["50"] = { ["837024147"] = { isLayered = false, version = "nil" } },
		["51"] = {
			[MockStoreSetupModule.PirateIdleAnimationAssetId] = { isLayered = false, version = "nil" }
		},
		["52"] = {
			[MockStoreSetupModule.PirateJumpAnimationAssetId] = { isLayered = false, version = "nil" }
		},
		["53"] = {
			[MockStoreSetupModule.PirateRunAnimationAssetId] = { isLayered = false, version = "nil" }
		},
		["54"] = { ["837025054"] = { isLayered = false, version = "nil" } },
		["55"] = { ["837023892"] = { isLayered = false, version = "nil" } }
	}
	SkeletonOutfitInfo.name = "Pirate Animation Package"
	SkeletonOutfitInfo.outfitId = MockStoreSetupModule.PirateOutfitId
	
	return self:addOutfitInfo(MockStoreSetupModule.PirateOutfitId, SkeletonOutfitInfo)
end

function MockStoreSetupModule:addCategory(Category)
	-- upvalues: DashModule (copy)
	self.state = DashModule.joinDeep({
		AvatarExperience = { AvatarEditor = { Categories = { category = Category } } }
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addEquippedEmote(SelectedSlot, AssetId)
	-- upvalues: DashModule (copy)
	self.state = DashModule.joinDeep({
		AvatarExperience = {
			AvatarEditor = {
				EquippedEmotes = {
					selectedSlot = SelectedSlot,
					slotInfo = { { assetId = AssetId } }
				}
			}
		}
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addBodybuilderEquippedEmote()
	-- upvalues: MockStoreSetupModule (copy)
	return self:addEquippedEmote(1, MockStoreSetupModule.BodybuilderEmoteAssetId)
end

function MockStoreSetupModule:addIsInAx()
	-- upvalues: CreateMockNavigationStateFunction (copy), AvatarScreen (copy), DashModule (copy)
	self.state = DashModule.joinDeep({
		Navigation = CreateMockNavigationStateFunction(AvatarScreen.AvatarExperienceRoot)
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addPPEFinalPageFullView()
	-- upvalues: PPEThumbnailTypeModule (copy), DashModule (copy)
	self.state = DashModule.joinDeep({
		AvatarExperience = {
			ProfilePictureEditor = {
				FinalPageViewMode = { finalPageViewMode = PPEThumbnailTypeModule.FullBody }
			}
		}
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addSelectedPPEEmote(EmoteAssetId)
	-- upvalues: DashModule (copy)
	self.state = DashModule.joinDeep({
		AvatarExperience = {
			ProfilePictureEditor = { ProfilePictureParams = { emoteAssetId = EmoteAssetId } }
		}
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addBodyBuilderSelectedPPEEmote()
	-- upvalues: MockStoreSetupModule (copy)
	return self:addSelectedPPEEmote(MockStoreSetupModule.BodybuilderEmoteAssetId)
end

function MockStoreSetupModule:addAvatarEditorCategoryAndSubcategory(Category, Subcategory)
	-- upvalues: DashModule (copy)
	self.state = DashModule.joinDeep({
		AvatarExperience = {
			AvatarEditor = {
				Categories = { category = Category, subcategory = Subcategory }
			}
		}
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addAvatarEditorCategoryAndSubcategoryByName(Name, Name1)
	-- upvalues: GetAvatarEditorCategoriesModule (copy)
	local Category = nil
	local Subcategory = nil
	
	for i, value in GetAvatarEditorCategoriesModule() do
		if value.Name == Name then
			Category = i
			
			if not Name1 then break end
			assert(value.Subcategories, "category.Subcategories should be non-nil")
			
			for i1, subcategory in value.Subcategories do
				if subcategory.Name == Name1 then
					Subcategory = i1
					break
				end
			end
			break
		end
	end
	assert(Category, "categoryIndex should be non-nil")
	
	if Name1 then
		assert(Subcategory, "subcategoryIndex should be non-nil")
	end
	return self:addAvatarEditorCategoryAndSubcategory(Category, Subcategory)
end

function MockStoreSetupModule:addSortAndFilters()
	-- upvalues: SortAndFiltersModule (copy), DashModule (copy)
	self.state = DashModule.joinDeep({
		AvatarExperience = {
			Catalog = { SortAndFilters = SortAndFiltersModule(nil, {}) }
		}
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addSearchInCatalog(Items)
	-- upvalues: MockStoreSetupModule (copy), DashModule (copy)
	self.state = DashModule.joinDeep({
		AvatarExperience = {
			Search = {
				SearchesInCatalog = {
					[MockStoreSetupModule.DummySearchUid] = {
						keyword = MockStoreSetupModule.DummyKeyword,
						items = Items
					}
				}
			}
		}
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addItemDetailsPeekViewState(ViewState)
	-- upvalues: DashModule (copy)
	self.state = DashModule.joinDeep({
		AvatarExperience = {
			Common = { ItemDetailsPeekView = { viewState = ViewState } }
		}
	}, self.state)
	
	return self
end

function MockStoreSetupModule:addFetchingStatus(p1, p2)
	-- upvalues: DashModule (copy)
	self.state = DashModule.joinDeep({ FetchingStatus = { [p1] = p2 } }, self.state)
	
	return self
end

return MockStoreSetupModule