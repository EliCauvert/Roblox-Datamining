local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local PromiseModule = require(CorePackages.Packages.Promise)
local PlayabilityStatusEnum = require(CorePackages.Workspace.Packages.DiscoveryTypes).PlayabilityStatusEnum
local config = {
	[1] = {
		id = 100425207,
		name = "Reinforced Wizard",
		assetType = { id = 8, name = "Hat" }
	},
	[2] = {
		id = 2510238627,
		name = "Rthro Run",
		assetType = { id = 53, name = "Run Animation" }
	},
	[3] = {
		id = 2807164805,
		name = "Mech Golem - Head",
		assetType = { id = 17, name = "Head" }
	}
}
local config1 = {
	data = {
		[1] = {
			id = 451,
			name = "test name",
			description = "test description",
			bundleType = "testBundleType",
			items = {
				[1] = { owned = false, id = 2510230574, name = "test asset name" },
				[2] = {
					owned = false,
					id = 2510233257,
					name = "test asset name 2"
				},
				[3] = {
					owned = false,
					type = "UserOutfit",
					id = 2510233258,
					name = "Outfit"
				}
			},
			creator = { id = 1, name = "test creator name" },
			product = { id = 480872498, isForSale = true, priceInRobux = 250 }
		}
	}
}
local HumanoidDescription = Instance.new("HumanoidDescription")
HumanoidDescription.HatAccessory = 1
HumanoidDescription.LeftArm = 2
HumanoidDescription.ClimbAnimation = 3
HumanoidDescription.BodyTypeScale = 0.3
HumanoidDescription.LeftLegColor = Color3.new(0, 0, 0)
HumanoidDescription.GraphicTShirt = 4
local HumanoidDescription1 = Instance.new("HumanoidDescription")
HumanoidDescription1:SetEmotes({ Wave = { 1 }, Laugh = { 2 }, Cheer = { 3 } })
local HumanoidDescription2 = Instance.new("HumanoidDescription")
local config2 = { assetId = 123, userId = 401784814, created = "" }
local config3 = {
	Name = "test name",
	Description = "test description",
	PriceInRobux = 100,
	AssetId = 100425207,
	AssetTypeId = 8,
	ProductId = 18929548,
	Creator = { Id = 1, Name = "TEST CREATOR" }
}
local config4 = {
	Owned = true,
	IsPurchasable = false,
	Id = 100425207,
	ItemType = "Asset"
}
local config5 = {
	purchasable = false,
	reason = "InsufficientFunds",
	price = 200,
	assetId = 10
}
local config6 = {
	universeId = 13,
	isPlayable = true,
	playabilityStatus = PlayabilityStatusEnum.Playable
}
local config7 = { name = "fakename", id = 13, rootPlaceId = 17 }

local function getRobloxProductInfo(AssetId)
	-- upvalues: CryoModule (copy), config3 (copy), PromiseModule (copy)
	return PromiseModule.resolve((CryoModule.Dictionary.join(config3, { AssetId = AssetId })))
end

local function getProductInfo(AssetId)
	-- upvalues: CryoModule (copy), config3 (copy), PromiseModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config3, { AssetId = AssetId })
	JoinResult.Creator.Id = 2
	
	return PromiseModule.resolve(JoinResult)
end

local function getItemDetails(Id, ItemType)
	-- upvalues: CryoModule (copy), config4 (copy), PromiseModule (copy)
	return PromiseModule.resolve((CryoModule.Dictionary.join(config4, { Id = Id, ItemType = ItemType })))
end

local function getBatchItemDetails(Ids)
	-- upvalues: CryoModule (copy), config4 (copy), PromiseModule (copy)
	local JoinResults = {}
	
	for _, id in ipairs(Ids) do
		table.insert(JoinResults, CryoModule.Dictionary.join(config4, { Id = id }))
	end
	return PromiseModule.resolve(JoinResults)
end

local config8 = { data = { { assetId = 17, creatingUniverseId = 13 } } }

local function getVersionInfo(AssetId)
	-- upvalues: CryoModule (copy), config8 (copy), PromiseModule (copy)
	return PromiseModule.resolve((CryoModule.Dictionary.join(config8, { AssetId = AssetId })))
end

local function getExperiencePlayability(UniverseId)
	-- upvalues: CryoModule (copy), config6 (copy), PromiseModule (copy)
	return PromiseModule.resolve({
		(CryoModule.Dictionary.join(config6, { universeId = UniverseId }))
	})
end

local function getExperienceInfo(Id)
	-- upvalues: CryoModule (copy), config7 (copy), PromiseModule (copy)
	return PromiseModule.resolve({
		data = { (CryoModule.Dictionary.join(config7, { id = Id })) }
	})
end

local function getAssetBundles(_)
	-- upvalues: PromiseModule (copy), config1 (copy)
	return PromiseModule.resolve(config1)
end

local function getPlayerName(_)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve("TEST")
end

local function createFavoriteForAsset(_)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve()
end

local function createFavoriteForBundle(_)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve()
end

local function deleteFavoriteForAsset(_)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve()
end

local function deleteFavoriteForBundle(_)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve()
end

local function getAssetFavoriteCount(_)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve(120)
end

local function getBundleFavoriteCount(_)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve(120)
end

local function getFavoriteForAsset(p1)
	-- upvalues: PromiseModule (copy), config2 (copy)
	return if p1 == "GetFavoriteModel" then PromiseModule.resolve(config2) else PromiseModule.resolve("null")
end

local function getFavoriteForBundle(p1)
	-- upvalues: PromiseModule (copy), config2 (copy)
	return if p1 == "GetFavoriteModel" then PromiseModule.resolve(config2) else PromiseModule.resolve("null")
end

local function getEconomyProductInfo(_)
	-- upvalues: PromiseModule (copy), config5 (copy)
	return PromiseModule.resolve(config5)
end

local function getModelFromUserId(_)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve()
end

local function networkFailure(_, _)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.reject("Failed to access network service")
end

local MockNetworkModule = {}
MockNetworkModule.__index = MockNetworkModule

function MockNetworkModule.new(p1, p2)
	-- upvalues: networkFailure (copy), getProductInfo (copy), getRobloxProductInfo (copy), getPlayerName (copy), getAssetBundles (copy), createFavoriteForAsset (copy), createFavoriteForBundle (copy), deleteFavoriteForAsset (copy), deleteFavoriteForBundle (copy), getAssetFavoriteCount (copy), getBundleFavoriteCount (copy), getFavoriteForAsset (copy), getFavoriteForBundle (copy), getEconomyProductInfo (copy), getModelFromUserId (copy), getVersionInfo (copy), getExperiencePlayability (copy), getExperienceInfo (copy), getItemDetails (copy), getBatchItemDetails (copy)
	local Config = if p1 then {
		getProductInfo = networkFailure,
		getPlayerName = networkFailure,
		getAssetBundles = networkFailure,
		createFavoriteForAsset = networkFailure,
		createFavoriteForBundle = networkFailure,
		deleteFavoriteForAsset = networkFailure,
		deleteFavoriteForBundle = networkFailure,
		getAssetFavoriteCount = networkFailure,
		getBundleFavoriteCount = networkFailure,
		getFavoriteForAsset = networkFailure,
		getFavoriteForBundle = networkFailure,
		getEconomyProductInfo = networkFailure,
		getModelFromUserId = networkFailure,
		getVersionInfo = networkFailure,
		getExperiencePlayability = networkFailure,
		getExperienceInfo = networkFailure,
		getItemDetails = networkFailure,
		getBatchItemDetails = networkFailure
	} else {
		getProductInfo = p2 and getProductInfo or getRobloxProductInfo,
		getPlayerName = getPlayerName,
		getAssetBundles = getAssetBundles,
		createFavoriteForAsset = createFavoriteForAsset,
		createFavoriteForBundle = createFavoriteForBundle,
		deleteFavoriteForAsset = deleteFavoriteForAsset,
		deleteFavoriteForBundle = deleteFavoriteForBundle,
		getAssetFavoriteCount = getAssetFavoriteCount,
		getBundleFavoriteCount = getBundleFavoriteCount,
		getFavoriteForAsset = getFavoriteForAsset,
		getFavoriteForBundle = getFavoriteForBundle,
		getEconomyProductInfo = getEconomyProductInfo,
		getModelFromUserId = getModelFromUserId,
		getVersionInfo = getVersionInfo,
		getExperiencePlayability = getExperiencePlayability,
		getExperienceInfo = getExperienceInfo,
		getItemDetails = getItemDetails,
		getBatchItemDetails = getBatchItemDetails
	}
	setmetatable(Config, {
		__tostring = function(): string
			return "MockService(Network)"
		end
	})
	
	return Config
end

function MockNetworkModule.GetMockAssetData()
	-- upvalues: config (copy)
	return config
end

function MockNetworkModule.GetMockHumanoidDescription()
	-- upvalues: HumanoidDescription (copy)
	return HumanoidDescription
end

function MockNetworkModule.GetMockHumanoidDescriptionEmpty()
	-- upvalues: HumanoidDescription2 (copy)
	return HumanoidDescription2
end

function MockNetworkModule.GetMockPlayerName(): string
	return "TEST"
end

function MockNetworkModule.GetMockAssetBundlesData()
	-- upvalues: config1 (copy)
	return config1
end

function MockNetworkModule.GetMockFavoriteCount(): number
	return 120
end

function MockNetworkModule.GetFavoriteModelId(): string
	return "GetFavoriteModel"
end

function MockNetworkModule.GetProductInfo()
	-- upvalues: config3 (copy)
	return config3
end

function MockNetworkModule.GetEconomyProductInfo()
	-- upvalues: config5 (copy)
	return config5
end

function MockNetworkModule.GetMockHumanoidDescriptionEmotes()
	-- upvalues: HumanoidDescription1 (copy)
	return HumanoidDescription1
end

function MockNetworkModule.GetVersionInfo()
	-- upvalues: config8 (copy)
	return config8
end

function MockNetworkModule.GetExperiencePlayability()
	-- upvalues: config6 (copy)
	return { config6 }
end

function MockNetworkModule.GetExperienceInfo()
	-- upvalues: config7 (copy)
	return { data = { config7 } }
end

return MockNetworkModule