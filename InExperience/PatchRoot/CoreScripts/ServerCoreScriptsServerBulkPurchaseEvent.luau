local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local corePackagesService = game:GetService("CorePackages")
local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local url = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Url
local fFlagAXEnableInspectAndBuyBulkPurchase = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase
local fIntBulkPurchaseRequestLimit = require(corePackagesService.Workspace.Packages.SharedFlags).FIntBulkPurchaseRequestLimit
local fIntBulkPurchaseThrottleLimit = require(corePackagesService.Workspace.Packages.SharedFlags).FIntBulkPurchaseThrottleLimit
local fFlagFilterOutShopOnlyItemsOnBulkPurchase = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagFilterOutShopOnlyItemsOnBulkPurchase
local fFlagAXEnableTimedOptionsServerScript = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAXEnableTimedOptionsServerScript

if fFlagAXEnableInspectAndBuyBulkPurchase then
	local serverSideBulkPurchaseEvent = Instance.new("RemoteEvent")
	serverSideBulkPurchaseEvent.Name = "ServerSideBulkPurchaseEvent"
	serverSideBulkPurchaseEvent.Parent = robloxReplicatedStorageService
	local t = {}
	local _ = {
		MyExperiencesOnly = "MyExperiencesOnly",
		ExperiencesById = "ExperiencesById",
		ExperiencesDevApiOnly = "ExperiencesDevApiOnly"
	}
	local var1 = if fFlagFilterOutShopOnlyItemsOnBulkPurchase then { ShopOnly = "ShopOnly" } else nil
	local _ = {
		Limited = "Limited",
		LimitedUnique = "LimitedUnique",
		Collectible = "Collectible"
	}
	local t_1 = {
		Bundle = Enum.MarketplaceProductType.AvatarBundle,
		Asset = Enum.MarketplaceProductType.AvatarAsset
	}
	
	local function _(p1)
		-- upvalues: url (ref), fFlagAXEnableTimedOptionsServerScript (ref), httpService (ref), httpRbxApiService (ref)
		local ok, status = pcall(function()
			-- upvalues: url (copy), fFlagAXEnableTimedOptionsServerScript (copy), p1 (ref), httpService (copy), httpRbxApiService (copy)
			local var2
			local text = url.CATALOG_URL .. "v1/catalog/items/details"
			local _ = nil
			
			if fFlagAXEnableTimedOptionsServerScript then
				local t = {}
				
				for i, v in p1 do
					table.insert(t, { id = v.id, itemType = v.itemType })
				end
				var2 = httpService:JSONEncode({ items = t })
			else
				var2 = httpService:JSONEncode({ items = p1 })
			end
			return httpService:JSONDecode(httpRbxApiService:PostAsyncFullUrl(text, var2, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson))
		end)
		
		return if ok then status else nil
	end
	
	local function isLimited(p2)
		local itemRestrictions = p2.itemRestrictions
		
		return if (itemRestrictions and table.find(itemRestrictions, "Limited")) == nil then if (itemRestrictions and table.find(itemRestrictions, "LimitedUnique")) == nil then (itemRestrictions and table.find(itemRestrictions, "Collectible")) ~= nil else true else true
	end
	
	local _ = function(p2)
		return p2.UserId and p2.UserId > 0
	end
	
	local function validateItem(p2)
		return type(p2) == "table" and p2.id ~= nil and (p2.itemType ~= nil and type(p2.itemType) == "number") and (type(p2.id) == "number" and p2.id ~= 0 and (p2.itemType == Enum.AvatarItemType.Asset.Value or p2.itemType == Enum.AvatarItemType.Bundle.Value))
	end
	
	local function validateIncomingItems(a)
		-- upvalues: fIntBulkPurchaseRequestLimit (ref), validateItem (ref), fFlagAXEnableTimedOptionsServerScript (ref)
		local t = {}
		
		if not a then
			return nil
		elseif type(a) ~= "table" then
			return nil
		elseif fIntBulkPurchaseRequestLimit < #a then
			return nil
		end
		local var2 = 0
		
		for i, v in a do
			if fIntBulkPurchaseRequestLimit <= var2 then break end
			if validateItem(v) then
				table.insert(t, {
					id = v.id,
					itemType = v.itemType,
					PurchaseOptions = if fFlagAXEnableTimedOptionsServerScript then v.PurchaseOptions else nil
				})
				var2 += 1
			end
		end
		return t
	end
	
	local _ = function(p2)
		-- upvalues: t (ref), fIntBulkPurchaseThrottleLimit (ref)
		local var3 = t[p2]
		
		if var3 and tick() < var3 then
			return true
		end
		t[p2] = tick() + fIntBulkPurchaseThrottleLimit
		
		return false
	end
	
	playersService.PlayerRemoving:Connect(function(p2)
		-- upvalues: t (ref)
		t[p2] = nil
	end)
	serverSideBulkPurchaseEvent.OnServerEvent:Connect(function(p2, p3)
		-- upvalues: t (ref), fIntBulkPurchaseThrottleLimit (ref), validateIncomingItems (ref), url (ref), fFlagAXEnableTimedOptionsServerScript (ref), httpService (ref), httpRbxApiService (ref), isLimited (ref), fFlagFilterOutShopOnlyItemsOnBulkPurchase (ref), var1 (ref), t_1 (ref), marketplaceService (ref)
		local var3
		if p2.UserId then
			var3 = p2.UserId > 0
		end
		if not var3 then return end
		local var4
		local var5 = t[p2]
		
		if var5 and tick() < var5 then
			var4 = true
		else
			t[p2] = tick() + fIntBulkPurchaseThrottleLimit
			var4 = false
		end
		if var4 then return end
		local var6 = validateIncomingItems(p3)
		
		if var6 == nil or #var6 == 0 then return end
		local ok, status = pcall(function()
			-- upvalues: url (copy), fFlagAXEnableTimedOptionsServerScript (copy), var6 (ref), httpService (copy), httpRbxApiService (copy)
			local var7
			local text = url.CATALOG_URL .. "v1/catalog/items/details"
			local _ = nil
			
			if fFlagAXEnableTimedOptionsServerScript then
				local t = {}
				
				for i, v in var6 do
					table.insert(t, { id = v.id, itemType = v.itemType })
				end
				var7 = httpService:JSONEncode({ items = t })
			else
				var7 = httpService:JSONEncode({ items = var6 })
			end
			return httpService:JSONDecode(httpRbxApiService:PostAsyncFullUrl(text, var7, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson))
		end)
		var5 = if ok then status else nil
		local var8 = if fFlagAXEnableTimedOptionsServerScript then {} else nil
		
		if fFlagAXEnableTimedOptionsServerScript then
			for i, v in var6 do
				if v.PurchaseOptions and var8 then
					var8[v.id] = v.PurchaseOptions
				end
			end
		end
		local t_2 = {}
		
		if var5 ~= nil then
			for i, v in var5.data do
				if (v.saleLocationType ~= "MyExperiencesOnly" and v.saleLocationType ~= "ExperiencesById" and v.saleLocationType ~= "ExperiencesDevApiOnly" or v.unitsAvailableForConsumption == 0 and isLimited(v)) and (not fFlagFilterOutShopOnlyItemsOnBulkPurchase or not var1 or v.saleLocationType ~= var1.ShopOnly or v.unitsAvailableForConsumption == 0 and isLimited(v)) then
					table.insert(t_2, {
						Id = tostring(v.id),
						Type = t_1[v.itemType],
						PurchaseOptions = if fFlagAXEnableTimedOptionsServerScript and var8 and var8[v.id] then var8[v.id] else nil
					})
				end
			end
		end
		if #t_2 > 0 then
			marketplaceService:PromptBulkPurchase(p2, t_2, {})
		end
	end)
end