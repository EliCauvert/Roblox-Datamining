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

local function _(p0, p1, p2, p3) --[[ line: 29 | named "request" ]]
	-- upvalues: httpService (ref)
	return httpService:RequestInternal(p0):Start(function(p4, p5) --[[ line: 30 ]]
		-- upvalues: p1 (ref), httpService (copy), p2 (ref), p3 (ref)
		if not p4 or p5.StatusCode ~= 200 then
			p3(p5)
			
			return
		end
		local body
		local var32 = true
		local _ = nil
		
		if p1 and p5.Body ~= "null" then
			local ok, status = pcall(httpService.JSONDecode, httpService, p5.Body)
			var32 = ok
			body = status
		else
			body = p5.Body
		end
		if var32 then
			p2(body)
			
			return
		end
		p3("Could not parse JSON.")
	end)
end

local function createYieldingPromise(p6, p7) --[[ line: 52 ]]
	-- upvalues: AXEnableIaBRbxClientFeature (ref), inspectAndBuyFeature (ref), promiseModule (ref), httpService (ref)
	if AXEnableIaBRbxClientFeature then
		p6.Headers = p6.Headers or {}
		p6.Headers["rbx-client-feature"] = inspectAndBuyFeature
	end
	return promiseModule.new(function(p8, p9) --[[ line: 57 ]]
		-- upvalues: p6 (ref), p7 (ref), httpService (copy)
		coroutine.wrap(function() --[[ line: 58 ]]
			-- upvalues: p6 (copy), p7 (copy), p8 (ref), p9 (ref), httpService (copy)
			local _ = httpService:RequestInternal(p6):Start(function(p10, p11) --[[ line: 30 ]]
				-- upvalues: p7 (ref), httpService (copy), p8 (ref), p9 (ref)
				if not p10 or p11.StatusCode ~= 200 then
					p9(p11)
					
					return
				end
				local body
				local var32 = true
				local _ = nil
				
				if p7 and p11.Body ~= "null" then
					local ok, status = pcall(httpService.JSONDecode, httpService, p11.Body)
					var32 = ok
					body = status
				else
					body = p11.Body
				end
				if var32 then
					p8(body)
					
					return
				end
				p9("Could not parse JSON.")
			end)
		end)()
	end)
end

local function getPreviewAvatar(p12) --[[ line: 67 ]]
	-- upvalues: url (ref), httpService (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "POST",
		Url = url.APIS_URL .. "look-api/v1/looks/purchase-details",
		Body = httpService:JSONEncode({ assets = p12 }),
		Headers = { ["Content-Type"] = "application/json" }
	}, true)
end

local function getProductInfo(p13) --[[ line: 85 ]]
	-- upvalues: promiseModule (ref), marketplaceService (ref)
	return promiseModule.new(function(p14, p15) --[[ line: 86 ]]
		-- upvalues: marketplaceService (copy), p13 (ref)
		local ok, status = pcall(function() --[[ line: 87 ]]
			-- upvalues: marketplaceService (copy), p13 (copy)
			return marketplaceService:GetProductInfoAsync(p13)
		end)
		
		if ok then
			p14(status)
			
			return
		end
		p15("Failure in getProductInfo: ", tostring(status))
	end)
end

local function getBatchItemDetails(p16, p17) --[[ line: 102 ]]
	-- upvalues: promiseModule (ref), avatarEditorService (ref)
	return promiseModule.new(function(p18, p19) --[[ line: 103 ]]
		-- upvalues: avatarEditorService (copy), p16 (ref), p17 (ref)
		local ok, status = pcall(function() --[[ line: 104 ]]
			-- upvalues: avatarEditorService (copy), p16 (copy), p17 (copy)
			return avatarEditorService:GetBatchItemDetailsAsync(p16, p17)
		end)
		
		if ok then
			p18(status)
			
			return
		end
		p19("Failure in batchGetItemDetails: ", tostring(status))
	end)
end

local function getBatchItemDetailsV2(p20) --[[ line: 121 ]]
	-- upvalues: url (ref), httpService (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "POST",
		Url = url.CATALOG_URL .. "v1/catalog/items/details",
		Body = httpService:JSONEncode({ items = p20 }),
		Headers = { ["Content-Type"] = "application/json" }
	}, true)
end

local function getItemDetails(p21, p22) --[[ line: 139 ]]
	-- upvalues: promiseModule (ref), avatarEditorService (ref)
	return promiseModule.new(function(p23, p24) --[[ line: 140 ]]
		-- upvalues: avatarEditorService (copy), p21 (ref), p22 (ref)
		local ok, status = pcall(function() --[[ line: 141 ]]
			-- upvalues: avatarEditorService (copy), p21 (copy), p22 (copy)
			return avatarEditorService:GetItemDetailsAsync(p21, p22)
		end)
		
		if ok then
			p23(status)
			
			return
		end
		p24("Failure in getItemDetails: ", tostring(status))
	end)
end

local function getPlayerName(p25) --[[ line: 156 ]]
	-- upvalues: promiseModule (ref), playersService (ref)
	return promiseModule.new(function(p26, p27) --[[ line: 157 ]]
		-- upvalues: playersService (copy), p25 (ref)
		local ok, status = pcall(function() --[[ line: 158 ]]
			-- upvalues: playersService (copy), p25 (copy)
			return playersService:GetNameFromUserIdAsync(p25)
		end)
		
		if ok then
			p26(status)
			
			return
		end
		p27("Failure in getPlayerName: ", tostring(status))
	end)
end

local function getAssetBundles(value) --[[ line: 173 ]]
	-- upvalues: url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = url.CATALOG_URL .. "v1/assets/" .. tostring(value) .. "/bundles"
	}, true)
end

local function getHumanoidDescriptionFromCostumeId(p28) --[[ line: 186 ]]
	-- upvalues: promiseModule (ref), playersService (ref)
	return promiseModule.new(function(p29, _) --[[ line: 187 ]]
		-- upvalues: playersService (copy), p28 (ref)
		spawn(function() --[[ line: 188 ]]
			-- upvalues: playersService (copy), p28 (copy), p29 (ref)
			local var33 = playersService:GetHumanoidDescriptionFromOutfitIdAsync(p28)
			
			if var33 then
				p29(var33)
			end
		end)
	end)
end

local function getAssetFavoriteCount(value) --[[ line: 201 ]]
	-- upvalues: url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = url.CATALOG_URL .. "v1/favorites/assets/" .. tostring(value) .. "/count"
	}, false)
end

local function getBundleFavoriteCount(p30) --[[ line: 214 ]]
	-- upvalues: url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = url.CATALOG_URL .. "v1/favorites/bundles/" .. tostring(p30) .. "/count"
	}, false)
end

local function getFavoriteForAsset(value) --[[ line: 227 ]]
	-- upvalues: playersService (ref), url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = url.CATALOG_URL .. "v1/favorites/users/" .. tostring(playersService.LocalPlayer.UserId) .. "/assets/" .. tostring(value) .. "/favorite"
	}, true)
end

local function getFavoriteForBundle(p31) --[[ line: 246 ]]
	-- upvalues: playersService (ref), url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = url.CATALOG_URL .. "v1/favorites/users/" .. tostring(playersService.LocalPlayer.UserId) .. "/bundles/" .. tostring(p31) .. "/favorite"
	}, true)
end

local function createFavoriteForAsset(value) --[[ line: 265 ]]
	-- upvalues: playersService (ref), url (ref), httpService (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "POST",
		Url = url.CATALOG_URL .. "v1/favorites/users/" .. tostring(playersService.LocalPlayer.UserId) .. "/assets/" .. tostring(value) .. "/favorite",
		Body = httpService:JSONEncode({})
	}, true)
end

local function deleteFavoriteForAsset(value) --[[ line: 285 ]]
	-- upvalues: playersService (ref), url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "DELETE",
		Url = url.CATALOG_URL .. "v1/favorites/users/" .. tostring(playersService.LocalPlayer.UserId) .. "/assets/" .. tostring(value) .. "/favorite"
	}, true)
end

local function createFavoriteForBundle(p32) --[[ line: 304 ]]
	-- upvalues: playersService (ref), url (ref), httpService (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "POST",
		Url = url.CATALOG_URL .. "v1/favorites/users/" .. tostring(playersService.LocalPlayer.UserId) .. "/bundles/" .. tostring(p32) .. "/favorite",
		Body = httpService:JSONEncode({})
	}, true)
end

local function deleteFavoriteForBundle(p33) --[[ line: 324 ]]
	-- upvalues: playersService (ref), url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "DELETE",
		Url = url.CATALOG_URL .. "v1/favorites/users/" .. tostring(playersService.LocalPlayer.UserId) .. "/bundles/" .. tostring(p33) .. "/favorite"
	}, true)
end

local function getEconomyProductInfo(p34) --[[ line: 343 ]]
	-- upvalues: url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = url.ECONOMY_URL .. "v1/products/" .. tostring(p34) .. "?showPurchasable=true"
	}, true)
end

local function getModelFromUserId(p35) --[[ line: 356 ]]
	-- upvalues: promiseModule (ref), playersService (ref)
	return promiseModule.new(function(p36, p37) --[[ line: 357 ]]
		-- upvalues: playersService (copy), p35 (ref)
		spawn(function() --[[ line: 358 ]]
			-- upvalues: playersService (copy), p35 (copy), p36 (ref), p37 (ref)
			local var34 = playersService:CreateHumanoidModelFromUserIdAsync(p35)
			
			if var34 then
				p36(var34)
				
				return
			end
			p37("Failure in getModelFromUserId")
		end)
	end)
end

local function getCollectibleResellableInstances(p38, p39) --[[ line: 373 ]]
	-- upvalues: url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = string.format("%smarketplace-sales/v1/item/%s/resellable-instances?%s", url.APIS_URL, p38, url:makeQueryString({
			ownerType = "User",
			cursor = "",
			limit = 500,
			ownerId = tostring(p39)
		}))
	}, true)
end

local function getVersionInfo(p40) --[[ line: 390 ]]
	-- upvalues: formattedText (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = string.format("%sv1/assets/%s/saved-versions", formattedText, p40)
	}, true)
end

local function getExperiencePlayability(p41) --[[ line: 399 ]]
	-- upvalues: url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = string.format("%sv1/games/multiget-playability-status?universeIds=%s", url.GAME_URL, p41)
	}, true)
end

local function getExperienceInfo(p42) --[[ line: 408 ]]
	-- upvalues: url (ref), createYieldingPromise (ref)
	return createYieldingPromise({
		Method = "GET",
		Url = string.format("%sv1/games?universeIds=%s", url.GAME_URL, p42)
	}, true)
end

return {
	new = function() --[[ line: 419 ]]
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
			__tostring = function() --[[ line: 452 ]]
				return "Service(Network)"
			end
		})
		
		return t
	end
}