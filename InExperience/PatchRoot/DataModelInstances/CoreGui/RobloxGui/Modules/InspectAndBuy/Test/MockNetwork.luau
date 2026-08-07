local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local promiseModule = require(corePackagesService.Packages.Promise)
local playabilityStatusEnum = require(corePackagesService.Workspace.Packages.DiscoveryTypes).PlayabilityStatusEnum
local t = {
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
local t_1 = {
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
local humanoidDescription = Instance.new("HumanoidDescription")
humanoidDescription.HatAccessory = 1
humanoidDescription.LeftArm = 2
humanoidDescription.ClimbAnimation = 3
humanoidDescription.BodyTypeScale = 0.3
humanoidDescription.LeftLegColor = Color3.new(0, 0, 0)
humanoidDescription.GraphicTShirt = 4
local humanoidDescription_1 = Instance.new("HumanoidDescription")
humanoidDescription_1:SetEmotes({ Wave = { 1 }, Laugh = { 2 }, Cheer = { 3 } })
local humanoidDescription_2 = Instance.new("HumanoidDescription")
local t_2 = { assetId = 123, userId = 401784814, created = "" }
local t_3 = {
	Name = "test name",
	Description = "test description",
	PriceInRobux = 100,
	AssetId = 100425207,
	AssetTypeId = 8,
	ProductId = 18929548,
	Creator = { Id = 1, Name = "TEST CREATOR" }
}
local t_4 = {
	Owned = true,
	IsPurchasable = false,
	Id = 100425207,
	ItemType = "Asset"
}
local t_5 = {
	purchasable = false,
	reason = "InsufficientFunds",
	price = 200,
	assetId = 10
}
local t_6 = {
	universeId = 13,
	isPlayable = true,
	playabilityStatus = playabilityStatusEnum.Playable
}
local t_7 = { name = "fakename", id = 13, rootPlaceId = 17 }

local function getRobloxProductInfo(p0) --[[ line: 145 ]]
	-- upvalues: cryoModule (ref), t_3 (ref), promiseModule (ref)
	return promiseModule.resolve(cryoModule.Dictionary.join(t_3, { AssetId = p0 }))
end

local function getProductInfo(p1) --[[ line: 150 ]]
	-- upvalues: cryoModule (ref), t_3 (ref), promiseModule (ref)
	local var36 = cryoModule.Dictionary.join(t_3, { AssetId = p1 })
	var36.Creator.Id = 2
	
	return promiseModule.resolve(var36)
end

local function getItemDetails(p2, p3) --[[ line: 156 ]]
	-- upvalues: cryoModule (ref), t_4 (ref), promiseModule (ref)
	return promiseModule.resolve(cryoModule.Dictionary.join(t_4, { Id = p2, ItemType = p3 }))
end

local function getBatchItemDetails(p4) --[[ line: 161 ]]
	-- upvalues: cryoModule (ref), t_4 (ref), promiseModule (ref)
	local t = {}
	
	for i, v in ipairs(p4) do
		table.insert(t, cryoModule.Dictionary.join(t_4, { Id = v }))
	end
	return promiseModule.resolve(t)
end

local t_8 = { data = { { assetId = 17, creatingUniverseId = 13 } } }

local function getVersionInfo(p5) --[[ line: 183 ]]
	-- upvalues: cryoModule (ref), t_8 (ref), promiseModule (ref)
	return promiseModule.resolve(cryoModule.Dictionary.join(t_8, { AssetId = p5 }))
end

local function getExperiencePlayability(p6) --[[ line: 188 ]]
	-- upvalues: cryoModule (ref), t_6 (ref), promiseModule (ref)
	return promiseModule.resolve({ cryoModule.Dictionary.join(t_6, { universeId = p6 }) })
end

local function getExperienceInfo(p7) --[[ line: 193 ]]
	-- upvalues: cryoModule (ref), t_7 (ref), promiseModule (ref)
	return promiseModule.resolve({ data = { cryoModule.Dictionary.join(t_7, { id = p7 }) } })
end

local function getAssetBundles(_) --[[ line: 198 ]]
	-- upvalues: promiseModule (ref), t_1 (ref)
	return promiseModule.resolve(t_1)
end

local function getPlayerName(_) --[[ line: 202 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve("TEST")
end

local function createFavoriteForAsset(_) --[[ line: 206 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve()
end

local function createFavoriteForBundle(_) --[[ line: 210 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve()
end

local function deleteFavoriteForAsset(_) --[[ line: 214 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve()
end

local function deleteFavoriteForBundle(_) --[[ line: 218 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve()
end

local function getAssetFavoriteCount(_) --[[ line: 222 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve(120)
end

local function getBundleFavoriteCount(_) --[[ line: 226 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve(120)
end

local function getFavoriteForAsset(value) --[[ line: 230 ]]
	-- upvalues: promiseModule (ref), t_2 (ref)
	return if value == "GetFavoriteModel" then promiseModule.resolve(t_2) else promiseModule.resolve("null")
end

local function getFavoriteForBundle(p8) --[[ line: 238 ]]
	-- upvalues: promiseModule (ref), t_2 (ref)
	return if p8 == "GetFavoriteModel" then promiseModule.resolve(t_2) else promiseModule.resolve("null")
end

local function getEconomyProductInfo(_) --[[ line: 246 ]]
	-- upvalues: promiseModule (ref), t_5 (ref)
	return promiseModule.resolve(t_5)
end

local function getModelFromUserId(_) --[[ line: 250 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve()
end

local function networkFailure(_, _) --[[ line: 254 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.reject("Failed to access network service")
end

local t_9 = {}
t_9.__index = t_9

function t_9.new(p9, p10) --[[ line: 261 ]]
	-- upvalues: networkFailure (ref), getProductInfo (ref), getRobloxProductInfo (ref), getPlayerName (ref), getAssetBundles (ref), createFavoriteForAsset (ref), createFavoriteForBundle (ref), deleteFavoriteForAsset (ref), deleteFavoriteForBundle (ref), getAssetFavoriteCount (ref), getBundleFavoriteCount (ref), getFavoriteForAsset (ref), getFavoriteForBundle (ref), getEconomyProductInfo (ref), getModelFromUserId (ref), getVersionInfo (ref), getExperiencePlayability (ref), getExperienceInfo (ref), getItemDetails (ref), getBatchItemDetails (ref)
	local var38 = if p9 then {
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
		getProductInfo = if p10 then getProductInfo else getRobloxProductInfo,
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
	setmetatable(var38, {
		__tostring = function() --[[ line: 309 ]]
			return "MockService(Network)"
		end
	})
	
	return var38
end

function t_9.GetMockAssetData() --[[ line: 317 ]]
	-- upvalues: t (ref)
	return t
end

function t_9.GetMockHumanoidDescription() --[[ line: 321 ]]
	-- upvalues: humanoidDescription (ref)
	return humanoidDescription
end

function t_9.GetMockHumanoidDescriptionEmpty() --[[ line: 325 ]]
	-- upvalues: humanoidDescription_2 (ref)
	return humanoidDescription_2
end

function t_9.GetMockPlayerName() --[[ line: 329 ]]
	return "TEST"
end

function t_9.GetMockAssetBundlesData() --[[ line: 333 ]]
	-- upvalues: t_1 (ref)
	return t_1
end

function t_9.GetMockFavoriteCount() --[[ line: 337 ]]
	return 120
end

function t_9.GetFavoriteModelId() --[[ line: 341 ]]
	return "GetFavoriteModel"
end

function t_9.GetProductInfo() --[[ line: 345 ]]
	-- upvalues: t_3 (ref)
	return t_3
end

function t_9.GetEconomyProductInfo() --[[ line: 349 ]]
	-- upvalues: t_5 (ref)
	return t_5
end

function t_9.GetMockHumanoidDescriptionEmotes() --[[ line: 353 ]]
	-- upvalues: humanoidDescription_1 (ref)
	return humanoidDescription_1
end

function t_9.GetVersionInfo() --[[ line: 357 ]]
	-- upvalues: t_8 (ref)
	return t_8
end

function t_9.GetExperiencePlayability() --[[ line: 361 ]]
	-- upvalues: t_6 (ref)
	return { t_6 }
end

function t_9.GetExperienceInfo() --[[ line: 365 ]]
	-- upvalues: t_7 (ref)
	return { data = { t_7 } }
end

return t_9