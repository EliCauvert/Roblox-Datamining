local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local CorePackages = game:GetService("CorePackages")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local Url = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Url
local FIntBulkPurchaseRequestLimit = require(CorePackages.Workspace.Packages.SharedFlags).FIntBulkPurchaseRequestLimit
local FIntBulkPurchaseThrottleLimit = require(CorePackages.Workspace.Packages.SharedFlags).FIntBulkPurchaseThrottleLimit
local FFlagFilterOutShopOnlyItemsOnBulkPurchase = require(CorePackages.Workspace.Packages.SharedFlags).FFlagFilterOutShopOnlyItemsOnBulkPurchase
local FFlagAXEnableTimedOptionsServerScript = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXEnableTimedOptionsServerScript

if require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase then
	local ServerSideBulkPurchaseEvent = Instance.new("RemoteEvent")
	ServerSideBulkPurchaseEvent.Name = "ServerSideBulkPurchaseEvent"
	ServerSideBulkPurchaseEvent.Parent = RobloxReplicatedStorage
	local NewCurrentTimes = {}
	local Config = if FFlagFilterOutShopOnlyItemsOnBulkPurchase then { ShopOnly = "ShopOnly" } else nil
	local config = {
		Bundle = Enum.MarketplaceProductType.AvatarBundle,
		Asset = Enum.MarketplaceProductType.AvatarAsset
	}
	
	local function _(Items)
		-- upvalues: Url (copy), FFlagAXEnableTimedOptionsServerScript (copy), HttpService (copy), HttpRbxApiService (copy)
		local Success, Result = pcall(function()
			-- upvalues: Url (upval), FFlagAXEnableTimedOptionsServerScript (upval), Items (copy), HttpService (upval), HttpRbxApiService (upval)
			local Text = Url.CATALOG_URL .. "v1/catalog/items/details"
			local Json = nil
			
			if FFlagAXEnableTimedOptionsServerScript then
				local Items = {}
				
				for _, value in Items do
					table.insert(Items, { id = value.id, itemType = value.itemType })
				end
				Json = HttpService:JSONEncode({ items = Items })
			else
				Json = HttpService:JSONEncode({ items = Items })
			end
			return HttpService:JSONDecode((HttpRbxApiService:PostAsyncFullUrl(Text, Json, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson)))
		end)
		
		return if Success then Result else nil
	end
	
	local function isLimited(p1): boolean
		local ItemRestrictions = p1.itemRestrictions
		local FoundIndex = ItemRestrictions and table.find(ItemRestrictions, "LimitedUnique")
		local FoundIndex1 = ItemRestrictions and table.find(ItemRestrictions, "Collectible")
		
		return (ItemRestrictions and table.find(ItemRestrictions, "Limited")) ~= nil or FoundIndex ~= nil or FoundIndex1 ~= nil
	end
	
	local _ = function(Player: Player): boolean
		return Player.UserId and Player.UserId > 0 or false
	end
	
	local function validateItem(p1): boolean
		return type(p1) == "table" and p1.id ~= nil and p1.itemType ~= nil and type(p1.itemType) == "number" and type(p1.id) == "number" and p1.id ~= 0 and (p1.itemType == Enum.AvatarItemType.Asset.Value or p1.itemType == Enum.AvatarItemType.Bundle.Value)
	end
	
	local function validateIncomingItems(List)
		-- upvalues: FIntBulkPurchaseRequestLimit (copy), validateItem (copy), FFlagAXEnableTimedOptionsServerScript (copy)
		local List1 = {}
		
		if not List then
			return nil
		end
		if type(List) ~= "table" then
			return nil
		end
		if FIntBulkPurchaseRequestLimit < #List then
			return nil
		end
		local Count = 0
		
		for _, value in List do
			if FIntBulkPurchaseRequestLimit <= Count then break end
			if validateItem(value) then
				table.insert(List1, {
					id = value.id,
					itemType = value.itemType,
					PurchaseOptions = if FFlagAXEnableTimedOptionsServerScript then value.PurchaseOptions else nil
				})
				Count += 1
			end
		end
		return List1
	end
	
	local _ = function(Key): boolean
		-- upvalues: NewCurrentTimes (copy), FIntBulkPurchaseThrottleLimit (copy)
		local NewCurrentTime = NewCurrentTimes[Key]
		
		if NewCurrentTime and tick() < NewCurrentTime then
			return true
		else
			NewCurrentTimes[Key] = tick() + FIntBulkPurchaseThrottleLimit
			
			return false
		end
	end
	
	Players.PlayerRemoving:Connect(function(Player)
		-- upvalues: NewCurrentTimes (copy)
		NewCurrentTimes[Player] = nil
	end)
	ServerSideBulkPurchaseEvent.OnServerEvent:Connect(function(Player: Player, p1)
		-- upvalues: NewCurrentTimes (copy), FIntBulkPurchaseThrottleLimit (copy), validateIncomingItems (copy), Url (copy), FFlagAXEnableTimedOptionsServerScript (copy), HttpService (copy), HttpRbxApiService (copy), isLimited (copy), FFlagFilterOutShopOnlyItemsOnBulkPurchase (copy), Config (copy), config (copy), MarketplaceService (copy)
		if (not Player.UserId or Player.UserId <= 0) and true then return end
		local NewCurrentTime = NewCurrentTimes[Player]
		local Flag = nil
		
		if NewCurrentTime and tick() < NewCurrentTime then
			Flag = true
		else
			NewCurrentTimes[Player] = tick() + FIntBulkPurchaseThrottleLimit
			Flag = false
		end
		if Flag then return end
		local ValidateIncomingItemsResult = validateIncomingItems(p1)
		
		if ValidateIncomingItemsResult == nil or #ValidateIncomingItemsResult == 0 then return end
		local Success, Result = pcall(function()
			-- upvalues: Url (upval), FFlagAXEnableTimedOptionsServerScript (upval), ValidateIncomingItemsResult (copy), HttpService (upval), HttpRbxApiService (upval)
			local Text = Url.CATALOG_URL .. "v1/catalog/items/details"
			local Json = nil
			
			if FFlagAXEnableTimedOptionsServerScript then
				local Items = {}
				
				for _, value in ValidateIncomingItemsResult do
					table.insert(Items, { id = value.id, itemType = value.itemType })
				end
				Json = HttpService:JSONEncode({ items = Items })
			else
				Json = HttpService:JSONEncode({ items = ValidateIncomingItemsResult })
			end
			return HttpService:JSONDecode((HttpRbxApiService:PostAsyncFullUrl(Text, Json, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson)))
		end)
		local Result1 = if Success then Result else nil
		local T = if FFlagAXEnableTimedOptionsServerScript then {} else nil
		
		if FFlagAXEnableTimedOptionsServerScript then
			for _, value in ValidateIncomingItemsResult do
				if value.PurchaseOptions and T then
					T[value.id] = value.PurchaseOptions
				end
			end
		end
		local List = {}
		
		if Result1 ~= nil then
			for _, entry in Result1.data do
				if (entry.saleLocationType ~= "MyExperiencesOnly" and entry.saleLocationType ~= "ExperiencesById" and entry.saleLocationType ~= "ExperiencesDevApiOnly" or entry.unitsAvailableForConsumption == 0 and isLimited(entry)) and (not FFlagFilterOutShopOnlyItemsOnBulkPurchase or not Config or entry.saleLocationType ~= Config.ShopOnly or entry.unitsAvailableForConsumption == 0 and isLimited(entry)) then
					table.insert(List, {
						Id = tostring(entry.id),
						Type = config[entry.itemType],
						PurchaseOptions = if FFlagAXEnableTimedOptionsServerScript and T and T[entry.id] then T[entry.id] else nil
					})
				end
			end
		end
		if #List > 0 then
			MarketplaceService:PromptBulkPurchase(Player, List, {})
		end
	end)
end