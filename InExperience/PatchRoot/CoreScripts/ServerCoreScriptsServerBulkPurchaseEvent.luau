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
	local var8 = if fFlagFilterOutShopOnlyItemsOnBulkPurchase then { ShopOnly = "ShopOnly" } else nil
	local _ = {
		Limited = "Limited",
		LimitedUnique = "LimitedUnique",
		Collectible = "Collectible"
	}
	local t_1 = {
		Bundle = Enum.MarketplaceProductType.AvatarBundle,
		Asset = Enum.MarketplaceProductType.AvatarAsset
	}
	
	local function _(p0) --[[ line: 77 | named "getBatchItemDetailsServerSide" ]]
		-- upvalues: url (ref), fFlagAXEnableTimedOptionsServerScript (ref), httpService (ref), httpRbxApiService (ref)
		local ok, status = pcall(function() --[[ line: 78 ]]
			-- upvalues: url (copy), fFlagAXEnableTimedOptionsServerScript (copy), p0 (ref), httpService (copy), httpRbxApiService (copy)
			local var15
			local text = url.CATALOG_URL .. "v1/catalog/items/details"
			local _ = nil
			
			if fFlagAXEnableTimedOptionsServerScript then
				local t = {}
				
				for i, v in p0 do
					table.insert(t, { id = v.id, itemType = v.itemType })
				end
				var15 = httpService:JSONEncode({ items = t })
			else
				var15 = httpService:JSONEncode({ items = p0 })
			end
			return httpService:JSONDecode(httpRbxApiService:PostAsyncFullUrl(text, var15, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson))
		end)
		
		return if ok then status else nil
	end
	
	local function isLimited(p1) --[[ line: 121 ]]
		local itemRestrictions = p1.itemRestrictions
		
		return if (itemRestrictions and table.find(itemRestrictions, "Limited")) == nil then if (itemRestrictions and table.find(itemRestrictions, "LimitedUnique")) == nil then (itemRestrictions and table.find(itemRestrictions, "Collectible")) ~= nil else true else true
	end
	
	local _ = function(p2) --[[ line: 132 | named "validatePlayer" ]]
		return p2.UserId and p2.UserId > 0
	end
	
	local function validateItem(p3) --[[ line: 143 ]]
		return type(p3) == "table" and p3.id ~= nil and (p3.itemType ~= nil and type(p3.itemType) == "number") and (type(p3.id) == "number" and p3.id ~= 0 and (p3.itemType == Enum.AvatarItemType.Asset.Value or p3.itemType == Enum.AvatarItemType.Bundle.Value))
	end
	
	local function validateIncomingItems(a) --[[ line: 161 ]]
		-- upvalues: fIntBulkPurchaseRequestLimit (ref), validateItem (ref), fFlagAXEnableTimedOptionsServerScript (ref)
		local t = {}
		
		if not a then
			return nil
		elseif type(a) ~= "table" then
			return nil
		elseif fIntBulkPurchaseRequestLimit < #a then
			return nil
		end
		local var17 = 0
		
		for i, v in a do
			if fIntBulkPurchaseRequestLimit <= var17 then break end
			if validateItem(v) then
				table.insert(t, {
					id = v.id,
					itemType = v.itemType,
					PurchaseOptions = if fFlagAXEnableTimedOptionsServerScript then v.PurchaseOptions else nil
				})
				var17 += 1
			end
		end
		return t
	end
	
	local _ = function(p4) --[[ line: 195 | named "isThrottled" ]]
		-- upvalues: t (ref), fIntBulkPurchaseThrottleLimit (ref)
		local var18 = t[p4]
		
		if var18 and tick() < var18 then
			return true
		end
		t[p4] = tick() + fIntBulkPurchaseThrottleLimit
		
		return false
	end
	
	playersService.PlayerRemoving:Connect(function(p5) --[[ line: 204 ]]
		-- upvalues: t (ref)
		t[p5] = nil
	end)
	serverSideBulkPurchaseEvent.OnServerEvent:Connect(function(p6, p7) --[[ line: 208 ]]
		-- upvalues: t (ref), fIntBulkPurchaseThrottleLimit (ref), validateIncomingItems (ref), url (ref), fFlagAXEnableTimedOptionsServerScript (ref), httpService (ref), httpRbxApiService (ref), isLimited (ref), fFlagFilterOutShopOnlyItemsOnBulkPurchase (ref), var8 (ref), t_1 (ref), marketplaceService (ref)
		local var19
		if p6.UserId then
			var19 = p6.UserId > 0
		end
		if not var19 then return end
		local var21
		local var20 = t[p6]
		
		if var20 and tick() < var20 then
			var21 = true
		else
			t[p6] = tick() + fIntBulkPurchaseThrottleLimit
			var21 = false
		end
		if var21 then return end
		local var22 = validateIncomingItems(p7)
		
		if var22 == nil or #var22 == 0 then return end
		local ok, status = pcall(function() --[[ line: 78 ]]
			-- upvalues: url (copy), fFlagAXEnableTimedOptionsServerScript (copy), var22 (ref), httpService (copy), httpRbxApiService (copy)
			local var15
			local text = url.CATALOG_URL .. "v1/catalog/items/details"
			local _ = nil
			
			if fFlagAXEnableTimedOptionsServerScript then
				local t = {}
				
				for i, v in var22 do
					table.insert(t, { id = v.id, itemType = v.itemType })
				end
				var15 = httpService:JSONEncode({ items = t })
			else
				var15 = httpService:JSONEncode({ items = var22 })
			end
			return httpService:JSONDecode(httpRbxApiService:PostAsyncFullUrl(text, var15, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson))
		end)
		var20 = if ok then status else nil
		local var23 = if fFlagAXEnableTimedOptionsServerScript then {} else nil
		
		if fFlagAXEnableTimedOptionsServerScript then
			for i, v in var22 do
				if v.PurchaseOptions and var23 then
					var23[v.id] = v.PurchaseOptions
				end
			end
		end
		local t_2 = {}
		
		if var20 ~= nil then
			for i, v in var20.data do
				if (v.saleLocationType ~= "MyExperiencesOnly" and v.saleLocationType ~= "ExperiencesById" and v.saleLocationType ~= "ExperiencesDevApiOnly" or v.unitsAvailableForConsumption == 0 and isLimited(v)) and (not fFlagFilterOutShopOnlyItemsOnBulkPurchase or not var8 or v.saleLocationType ~= var8.ShopOnly or v.unitsAvailableForConsumption == 0 and isLimited(v)) then
					table.insert(t_2, {
						Id = tostring(v.id),
						Type = t_1[v.itemType],
						PurchaseOptions = if fFlagAXEnableTimedOptionsServerScript and var23 and var23[v.id] then var23[v.id] else nil
					})
				end
			end
		end
		if #t_2 > 0 then
			marketplaceService:PromptBulkPurchase(p6, t_2, {})
		end
	end)
end