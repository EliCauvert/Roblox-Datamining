local corePackagesService = game:GetService("CorePackages")
local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")
local promiseModule = require(corePackagesService.Packages.Promise)
local avatarEditorService = game:GetService("AvatarEditorService")
local url = require(corePackagesService.Workspace.Packages.Http).Url
local _ = require(corePackagesService.Packages.LuauPolyfill)
local _ = require(corePackagesService.Workspace.Packages.AvatarExperienceInspectAndBuy)
local formattedText = string.format("https://develop.%s", url.DOMAIN)
local AXEnableIaBRbxClientFeature = game:DefineFastFlag("AXEnableIaBRbxClientFeature", false)
local inspectAndBuyFeature = game:DefineFastString("InspectAndBuyFeature", "InspectAndBuy")

local function _(p1, p2, p3, p4)
	-- upvalues: httpService (ref)
	return httpService:RequestInternal(p1):Start(function(p5, p6)
		-- upvalues: p2 (ref), httpService (copy), p3 (ref), p4 (ref)
		if not p5 or p6.StatusCode ~= 200 then
			p4(p6)
			
			return
		end
		local body
		local var1 = true
		local _ = nil
		
		if p2 and p6.Body ~= "null" then
			local ok, status = pcall(httpService.JSONDecode, httpService, p6.Body)
			var1 = ok
			body = status
		else
			body = p6.Body
		end
		if var1 then
			p3(body)
			
			return
		end
		p4("Could not parse JSON.")
	end)
end

local function createYieldingPromise(p1, p2)
	-- upvalues: AXEnableIaBRbxClientFeature (ref), inspectAndBuyFeature (ref), promiseModule (ref), httpService (ref)
	if AXEnableIaBRbxClientFeature then
		p1.Headers = p1.Headers or {}
		p1.Headers["rbx-client-feature"] = inspectAndBuyFeature
	end
	return promiseModule.new(function(p3, p4)
		-- upvalues: p1 (ref), p2 (ref), httpService (copy)
		coroutine.wrap(function()
			-- upvalues: p1 (copy), p2 (copy), p3 (ref), p4 (ref), httpService (copy)
			local _ = httpService:RequestInternal(p1):Start(function(p5, p6)
				-- upvalues: p2 (ref), httpService (copy), p3 (ref), p4 (ref)
				if not p5 or p6.StatusCode ~= 200 then
					p4(p6)
					
					return
				end
				local body
				local var1 = true
				local _ = nil
				
				if p2 and p6.Body ~= "null" then
					local ok, status = pcall(httpService.JSONDecode, httpService, p6.Body)
					var1 = ok
					body = status
				else
					body = p6.Body
				end
				if var1 then
					p3(body)
					
					return
				end
				p4("Could not parse JSON.")
			end)
		end)()
	end)
end

local function getPreviewAvatar(p1)
	-- upvalues: url (ref), httpService (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "POST",
		Url = url.APIS_URL .. "look-api/v1/looks/purchase-details",
		Body = httpService:JSONEncode({ assets = p1 }),
		Headers = { ["Content-Type"] = "application/json" }
	}, true)
end

local function getProductInfo(p1)
	-- upvalues: promiseModule (ref), marketplaceService (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: marketplaceService (copy), p1 (ref)
		local ok, status = pcall(function()
			-- upvalues: marketplaceService (copy), p1 (copy)
			return marketplaceService:GetProductInfoAsync(p1)
		end)
		
		if ok then
			p2(status)
			
			return
		end
		p3("Failure in getProductInfo: ", tostring(status))
	end)
end

local function getBatchItemDetails(p1, p2)
	-- upvalues: promiseModule (ref), avatarEditorService (ref)
	return promiseModule.new(function(p3, p4)
		-- upvalues: avatarEditorService (copy), p1 (ref), p2 (ref)
		local ok, status = pcall(function()
			-- upvalues: avatarEditorService (copy), p1 (copy), p2 (copy)
			return avatarEditorService:GetBatchItemDetailsAsync(p1, p2)
		end)
		
		if ok then
			p3(status)
			
			return
		end
		p4("Failure in batchGetItemDetails: ", tostring(status))
	end)
end

local function getBatchItemDetailsV2(p1)
	-- upvalues: url (ref), httpService (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "POST",
		Url = url.CATALOG_URL .. "v1/catalog/items/details",
		Body = httpService:JSONEncode({ items = p1 }),
		Headers = { ["Content-Type"] = "application/json" }
	}, true)
end

local function getItemDetails(p1, p2)
	-- upvalues: promiseModule (ref), avatarEditorService (ref)
	return promiseModule.new(function(p3, p4)
		-- upvalues: avatarEditorService (copy), p1 (ref), p2 (ref)
		local ok, status = pcall(function()
			-- upvalues: avatarEditorService (copy), p1 (copy), p2 (copy)
			return avatarEditorService:GetItemDetailsAsync(p1, p2)
		end)
		
		if ok then
			p3(status)
			
			return
		end
		p4("Failure in getItemDetails: ", tostring(status))
	end)
end

local function getPlayerName(p1)
	-- upvalues: promiseModule (ref), playersService (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: playersService (copy), p1 (ref)
		local ok, status = pcall(function()
			-- upvalues: playersService (copy), p1 (copy)
			return playersService:GetNameFromUserIdAsync(p1)
		end)
		
		if ok then
			p2(status)
			
			return
		end
		p3("Failure in getPlayerName: ", tostring(status))
	end)
end

local function getAssetBundles(value)
	-- upvalues: url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = url.CATALOG_URL .. "v1/assets/" .. tostring(value) .. "/bundles"
	}, true)
end

local function getHumanoidDescriptionFromCostumeId(p1)
	-- upvalues: promiseModule (ref), playersService (ref)
	return promiseModule.new(function(p2, _)
		-- upvalues: playersService (copy), p1 (ref)
		spawn(function()
			-- upvalues: playersService (copy), p1 (copy), p2 (ref)
			local var1 = playersService:GetHumanoidDescriptionFromOutfitIdAsync(p1)
			
			if var1 then
				p2(var1)
			end
		end)
	end)
end

local function getAssetFavoriteCount(value)
	-- upvalues: url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = url.CATALOG_URL .. "v1/favorites/assets/" .. tostring(value) .. "/count"
	}, false)
end

local function getBundleFavoriteCount(p1)
	-- upvalues: url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = url.CATALOG_URL .. "v1/favorites/bundles/" .. tostring(p1) .. "/count"
	}, false)
end

local function getFavoriteForAsset(value)
	-- upvalues: playersService (ref), url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = url.CATALOG_URL .. "v1/favorites/users/" .. tostring(playersService.LocalPlayer.UserId) .. "/assets/" .. tostring(value) .. "/favorite"
	}, true)
end

local function getFavoriteForBundle(p1)
	-- upvalues: playersService (ref), url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = url.CATALOG_URL .. "v1/favorites/users/" .. tostring(playersService.LocalPlayer.UserId) .. "/bundles/" .. tostring(p1) .. "/favorite"
	}, true)
end

local function createFavoriteForAsset(value)
	-- upvalues: playersService (ref), url (ref), httpService (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "POST",
		Url = url.CATALOG_URL .. "v1/favorites/users/" .. tostring(playersService.LocalPlayer.UserId) .. "/assets/" .. tostring(value) .. "/favorite",
		Body = httpService:JSONEncode({})
	}, true)
end

local function deleteFavoriteForAsset(value)
	-- upvalues: playersService (ref), url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "DELETE",
		Url = url.CATALOG_URL .. "v1/favorites/users/" .. tostring(playersService.LocalPlayer.UserId) .. "/assets/" .. tostring(value) .. "/favorite"
	}, true)
end

local function createFavoriteForBundle(p1)
	-- upvalues: playersService (ref), url (ref), httpService (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "POST",
		Url = url.CATALOG_URL .. "v1/favorites/users/" .. tostring(playersService.LocalPlayer.UserId) .. "/bundles/" .. tostring(p1) .. "/favorite",
		Body = httpService:JSONEncode({})
	}, true)
end

local function deleteFavoriteForBundle(p1)
	-- upvalues: playersService (ref), url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "DELETE",
		Url = url.CATALOG_URL .. "v1/favorites/users/" .. tostring(playersService.LocalPlayer.UserId) .. "/bundles/" .. tostring(p1) .. "/favorite"
	}, true)
end

local function getEconomyProductInfo(p1)
	-- upvalues: url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = url.ECONOMY_URL .. "v1/products/" .. tostring(p1) .. "?showPurchasable=true"
	}, true)
end

local function getModelFromUserId(p1)
	-- upvalues: promiseModule (ref), playersService (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: playersService (copy), p1 (ref)
		spawn(function()
			-- upvalues: playersService (copy), p1 (copy), p2 (ref), p3 (ref)
			local var1 = playersService:CreateHumanoidModelFromUserIdAsync(p1)
			
			if var1 then
				p2(var1)
				
				return
			end
			p3("Failure in getModelFromUserId")
		end)
	end)
end

local function getCollectibleResellableInstances(p1, p2)
	-- upvalues: url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = string.format("%smarketplace-sales/v1/item/%s/resellable-instances?%s", url.APIS_URL, p1, url:makeQueryString({
			ownerType = "User",
			cursor = "",
			limit = 500,
			ownerId = tostring(p2)
		}))
	}, true)
end

local function getVersionInfo(p1)
	-- upvalues: formattedText (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = string.format("%sv1/assets/%s/saved-versions", formattedText, p1)
	}, true)
end

local function getExperiencePlayability(p1)
	-- upvalues: url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = string.format("%sv1/games/multiget-playability-status?universeIds=%s", url.GAME_URL, p1)
	}, true)
end

local function getExperienceInfo(p1)
	-- upvalues: url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = string.format("%sv1/games?universeIds=%s", url.GAME_URL, p1)
	}, true)
end

return {
	new = function()
		-- upvalues: getProductInfo (ref), getEconomyProductInfo (ref), getPlayerName (ref), getAssetBundles (ref), getHumanoidDescriptionFromCostumeId (ref), getAssetFavoriteCount (ref), getBundleFavoriteCount (ref), getFavoriteForAsset (ref), getFavoriteForBundle (ref), createFavoriteForAsset (ref), deleteFavoriteForAsset (ref), createFavoriteForBundle (ref), deleteFavoriteForBundle (ref), getModelFromUserId (ref), getCollectibleResellableInstances (ref), getVersionInfo (ref), getExperiencePlayability (ref), getExperienceInfo (ref), getItemDetails (ref), getPreviewAvatar (ref), getBatchItemDetails (ref), getBatchItemDetailsV2 (ref)
		local t = {
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
		setmetatable(t, {
			__tostring = function()
				return "Service(Network)"
			end
		})
		
		return t
	end
}