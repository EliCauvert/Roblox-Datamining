local CorePackages = game:GetService("CorePackages")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local PromiseModule = require(CorePackages.Packages.Promise)
local AvatarEditorService = game:GetService("AvatarEditorService")
local Url = require(CorePackages.Workspace.Packages.Http).Url
local _ = require(CorePackages.Packages.LuauPolyfill)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceInspectAndBuy)
local Formatted = string.format("https://develop.%s", Url.DOMAIN)
local AXEnableIaBRbxClientFeature = game:DefineFastFlag("AXEnableIaBRbxClientFeature", false)
local InspectAndBuyFeature = game:DefineFastString("InspectAndBuyFeature", "InspectAndBuy")

local function _(Options, p1, p2, p3)
	-- upvalues: HttpService (copy)
	return HttpService:RequestInternal(Options):Start(function(p4, p5)
		-- upvalues: p1 (copy), HttpService (upval), p2 (copy), p3 (copy)
		if not p4 or p5.StatusCode ~= 200 then
			p3(p5)
			
			return
		end
		local v1 = true
		local Body = nil
		
		if p1 and p5.Body ~= "null" then
			v1, Body = pcall(HttpService.JSONDecode, HttpService, p5.Body)
		else
			Body = p5.Body
		end
		if v1 then
			p2(Body)
			
			return
		else
			p3("Could not parse JSON.")
		end
	end)
end

local function createYieldingPromise(Options, p1)
	-- upvalues: AXEnableIaBRbxClientFeature (copy), InspectAndBuyFeature (copy), PromiseModule (copy), HttpService (copy)
	if AXEnableIaBRbxClientFeature then
		Options.Headers = Options.Headers or {}
		Options.Headers["rbx-client-feature"] = InspectAndBuyFeature
	end
	return PromiseModule.new(function(Callback1, Callback)
		-- upvalues: Options (copy), p1 (copy), HttpService (upval)
		coroutine.wrap(function()
			-- upvalues: Options (upval), p1 (upval), Callback1 (copy), Callback (copy), HttpService (upval)
			local _ = HttpService:RequestInternal(Options):Start(function(p2, p3)
				-- upvalues: p1 (copy), HttpService (upval), Callback1 (copy), Callback (copy)
				if not p2 or p3.StatusCode ~= 200 then
					Callback(p3)
					
					return
				end
				local v1 = true
				local Body = nil
				
				if p1 and p3.Body ~= "null" then
					v1, Body = pcall(HttpService.JSONDecode, HttpService, p3.Body)
				else
					Body = p3.Body
				end
				if v1 then
					Callback1(Body)
					
					return
				else
					Callback("Could not parse JSON.")
				end
			end)
		end)()
	end)
end

local function getPreviewAvatar(Assets)
	-- upvalues: Url (copy), HttpService (copy), createYieldingPromise (copy)
	return createYieldingPromise({
		Method = "POST",
		Url = Url.APIS_URL .. "look-api/v1/looks/purchase-details",
		Body = HttpService:JSONEncode({ assets = Assets }),
		Headers = { ["Content-Type"] = "application/json" }
	}, true)
end

local function getProductInfo(AssetId)
	-- upvalues: PromiseModule (copy), MarketplaceService (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any, any) -> ())
		-- upvalues: MarketplaceService (upval), AssetId (copy)
		local Success, Result = pcall(function()
			-- upvalues: MarketplaceService (upval), AssetId (upval)
			return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then MarketplaceService:GetProductInfoAsync(AssetId) else MarketplaceService:GetProductInfo(AssetId)
		end)
		
		if Success then
			Callback(Result)
			
			return
		else
			Callback1("Failure in getProductInfo: ", (tostring(Result)))
		end
	end)
end

local function getBatchItemDetails(ItemIds, ItemType)
	-- upvalues: PromiseModule (copy), AvatarEditorService (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any, any) -> ())
		-- upvalues: AvatarEditorService (upval), ItemIds (copy), ItemType (copy)
		local Success, Result = pcall(function()
			-- upvalues: AvatarEditorService (upval), ItemIds (upval), ItemType (upval)
			return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:GetBatchItemDetailsAsync(ItemIds, ItemType) else AvatarEditorService:GetBatchItemDetails(ItemIds, ItemType)
		end)
		
		if Success then
			Callback(Result)
			
			return
		else
			Callback1("Failure in batchGetItemDetails: ", (tostring(Result)))
		end
	end)
end

local function getBatchItemDetailsV2(Items)
	-- upvalues: Url (copy), HttpService (copy), createYieldingPromise (copy)
	return createYieldingPromise({
		Method = "POST",
		Url = Url.CATALOG_URL .. "v1/catalog/items/details",
		Body = HttpService:JSONEncode({ items = Items }),
		Headers = { ["Content-Type"] = "application/json" }
	}, true)
end

local function getItemDetails(ItemId, ItemType)
	-- upvalues: PromiseModule (copy), AvatarEditorService (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any, any) -> ())
		-- upvalues: AvatarEditorService (upval), ItemId (copy), ItemType (copy)
		local Success, Result = pcall(function()
			-- upvalues: AvatarEditorService (upval), ItemId (upval), ItemType (upval)
			return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then AvatarEditorService:GetItemDetailsAsync(ItemId, ItemType) else AvatarEditorService:GetItemDetails(ItemId, ItemType)
		end)
		
		if Success then
			Callback(Result)
			
			return
		else
			Callback1("Failure in getItemDetails: ", (tostring(Result)))
		end
	end)
end

local function getPlayerName(UserId)
	-- upvalues: PromiseModule (copy), Players (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any, any) -> ())
		-- upvalues: Players (upval), UserId (copy)
		local Success, Result = pcall(function()
			-- upvalues: Players (upval), UserId (upval)
			return Players:GetNameFromUserIdAsync(UserId)
		end)
		
		if Success then
			Callback(Result)
			
			return
		else
			Callback1("Failure in getPlayerName: ", (tostring(Result)))
		end
	end)
end

local function getAssetBundles(p1)
	-- upvalues: Url (copy), createYieldingPromise (copy)
	return createYieldingPromise({
		Method = "GET",
		Url = Url.CATALOG_URL .. "v1/assets/" .. tostring(p1) .. "/bundles"
	}, true)
end

local function getHumanoidDescriptionFromCostumeId(OutfitId)
	-- upvalues: PromiseModule (copy), Players (copy)
	return PromiseModule.new(function(Callback, _)
		-- upvalues: Players (upval), OutfitId (copy)
		spawn(function()
			-- upvalues: Players (upval), OutfitId (upval), Callback (copy)
			local HumanoidDescriptionFromOutfitIdAsync = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then Players:GetHumanoidDescriptionFromOutfitIdAsync(OutfitId) else Players:GetHumanoidDescriptionFromOutfitId(OutfitId)
			
			if HumanoidDescriptionFromOutfitIdAsync then
				Callback(HumanoidDescriptionFromOutfitIdAsync)
			end
		end)
	end)
end

local function getAssetFavoriteCount(p1)
	-- upvalues: Url (copy), createYieldingPromise (copy)
	return createYieldingPromise({
		Method = "GET",
		Url = Url.CATALOG_URL .. "v1/favorites/assets/" .. tostring(p1) .. "/count"
	}, false)
end

local function getBundleFavoriteCount(p1)
	-- upvalues: Url (copy), createYieldingPromise (copy)
	return createYieldingPromise({
		Method = "GET",
		Url = Url.CATALOG_URL .. "v1/favorites/bundles/" .. tostring(p1) .. "/count"
	}, false)
end

local function getFavoriteForAsset(p1)
	-- upvalues: Players (copy), Url (copy), createYieldingPromise (copy)
	return createYieldingPromise({
		Method = "GET",
		Url = Url.CATALOG_URL .. "v1/favorites/users/" .. tostring(Players.LocalPlayer.UserId) .. "/assets/" .. tostring(p1) .. "/favorite"
	}, true)
end

local function getFavoriteForBundle(p1)
	-- upvalues: Players (copy), Url (copy), createYieldingPromise (copy)
	return createYieldingPromise({
		Method = "GET",
		Url = Url.CATALOG_URL .. "v1/favorites/users/" .. tostring(Players.LocalPlayer.UserId) .. "/bundles/" .. tostring(p1) .. "/favorite"
	}, true)
end

local function createFavoriteForAsset(p1)
	-- upvalues: Players (copy), Url (copy), HttpService (copy), createYieldingPromise (copy)
	return createYieldingPromise({
		Method = "POST",
		Url = Url.CATALOG_URL .. "v1/favorites/users/" .. tostring(Players.LocalPlayer.UserId) .. "/assets/" .. tostring(p1) .. "/favorite",
		Body = HttpService:JSONEncode({})
	}, true)
end

local function deleteFavoriteForAsset(p1)
	-- upvalues: Players (copy), Url (copy), createYieldingPromise (copy)
	return createYieldingPromise({
		Method = "DELETE",
		Url = Url.CATALOG_URL .. "v1/favorites/users/" .. tostring(Players.LocalPlayer.UserId) .. "/assets/" .. tostring(p1) .. "/favorite"
	}, true)
end

local function createFavoriteForBundle(p1)
	-- upvalues: Players (copy), Url (copy), HttpService (copy), createYieldingPromise (copy)
	return createYieldingPromise({
		Method = "POST",
		Url = Url.CATALOG_URL .. "v1/favorites/users/" .. tostring(Players.LocalPlayer.UserId) .. "/bundles/" .. tostring(p1) .. "/favorite",
		Body = HttpService:JSONEncode({})
	}, true)
end

local function deleteFavoriteForBundle(p1)
	-- upvalues: Players (copy), Url (copy), createYieldingPromise (copy)
	return createYieldingPromise({
		Method = "DELETE",
		Url = Url.CATALOG_URL .. "v1/favorites/users/" .. tostring(Players.LocalPlayer.UserId) .. "/bundles/" .. tostring(p1) .. "/favorite"
	}, true)
end

local function getEconomyProductInfo(p1)
	-- upvalues: Url (copy), createYieldingPromise (copy)
	return createYieldingPromise({
		Method = "GET",
		Url = Url.ECONOMY_URL .. "v1/products/" .. tostring(p1) .. "?showPurchasable=true"
	}, true)
end

local function getModelFromUserId(UserId)
	-- upvalues: PromiseModule (copy), Players (copy)
	return PromiseModule.new(function(Callback, Callback1)
		-- upvalues: Players (upval), UserId (copy)
		spawn(function()
			-- upvalues: Players (upval), UserId (upval), Callback (copy), Callback1 (copy)
			local HumanoidModelFromUserIdAsync = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then Players:CreateHumanoidModelFromUserIdAsync(UserId) else Players:CreateHumanoidModelFromUserId(UserId)
			
			if HumanoidModelFromUserIdAsync then
				Callback(HumanoidModelFromUserIdAsync)
				
				return
			else
				Callback1("Failure in getModelFromUserId")
			end
		end)
	end)
end

local function getCollectibleResellableInstances(p1, p2)
	-- upvalues: Url (copy), createYieldingPromise (copy)
	return createYieldingPromise({
		Method = "GET",
		Url = string.format("%smarketplace-sales/v1/item/%s/resellable-instances?%s", Url.APIS_URL, p1, (Url:makeQueryString({
			ownerType = "User",
			cursor = "",
			limit = 500,
			ownerId = tostring(p2)
		})))
	}, true)
end

local function getVersionInfo(p1)
	-- upvalues: Formatted (copy), createYieldingPromise (copy)
	return createYieldingPromise({
		Method = "GET",
		Url = string.format("%sv1/assets/%s/saved-versions", Formatted, p1)
	}, true)
end

local function getExperiencePlayability(p1)
	-- upvalues: Url (copy), createYieldingPromise (copy)
	return createYieldingPromise({
		Method = "GET",
		Url = string.format("%sv1/games/multiget-playability-status?universeIds=%s", Url.GAME_URL, p1)
	}, true)
end

local function getExperienceInfo(p1)
	-- upvalues: Url (copy), createYieldingPromise (copy)
	return createYieldingPromise({
		Method = "GET",
		Url = string.format("%sv1/games?universeIds=%s", Url.GAME_URL, p1)
	}, true)
end

return {
	new = function()
		-- upvalues: getProductInfo (copy), getEconomyProductInfo (copy), getPlayerName (copy), getAssetBundles (copy), getHumanoidDescriptionFromCostumeId (copy), getAssetFavoriteCount (copy), getBundleFavoriteCount (copy), getFavoriteForAsset (copy), getFavoriteForBundle (copy), createFavoriteForAsset (copy), deleteFavoriteForAsset (copy), createFavoriteForBundle (copy), deleteFavoriteForBundle (copy), getModelFromUserId (copy), getCollectibleResellableInstances (copy), getVersionInfo (copy), getExperiencePlayability (copy), getExperienceInfo (copy), getItemDetails (copy), getPreviewAvatar (copy), getBatchItemDetails (copy), getBatchItemDetailsV2 (copy)
		local config = {
			getProductInfo = getProductInfo,
			getEconomyProductInfo = getEconomyProductInfo,
			getPlayerName = getPlayerName,
			getAssetBundles = getAssetBundles,
			getHumanoidDescriptionFromCostumeId = getHumanoidDescriptionFromCostumeId,
			getAssetFavoriteCount = getAssetFavoriteCount,
			getBundleFavoriteCount = getBundleFavoriteCount,
			getFavoriteForAsset = getFavoriteForAsset,
			getFavoriteForBundle = getFavoriteForBundle,
			createFavoriteForAsset = createFavoriteForAsset,
			deleteFavoriteForAsset = deleteFavoriteForAsset,
			createFavoriteForBundle = createFavoriteForBundle,
			deleteFavoriteForBundle = deleteFavoriteForBundle,
			getModelFromUserId = getModelFromUserId,
			getCollectibleResellableInstances = getCollectibleResellableInstances,
			getVersionInfo = getVersionInfo,
			getExperiencePlayability = getExperiencePlayability,
			getExperienceInfo = getExperienceInfo,
			getItemDetails = getItemDetails,
			getPreviewAvatar = getPreviewAvatar,
			getBatchItemDetails = getBatchItemDetails,
			getBatchItemDetailsV2 = getBatchItemDetailsV2
		}
		setmetatable(config, {
			__tostring = function(): string
				return "Service(Network)"
			end
		})
		
		return config
	end
}