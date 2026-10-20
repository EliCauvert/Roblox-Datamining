local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local AvatarExperienceSearch = script:FindFirstAncestor("AvatarExperienceSearch")
local Parent = AvatarExperienceSearch.Parent
local DashModule = require(Parent.Dash)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local SafeAppStorageService = require(Parent.AXCommon).Lib.SafeAppStorageService
local GetLocalUserIdModule = require(script.Parent.getLocalUserId)
local GetFIntAXMaxRecentlyViewedSearchItemsModule = require(AvatarExperienceSearch.Flags.GetFIntAXMaxRecentlyViewedSearchItems)

local function _()
	-- upvalues: GetLocalUserIdModule (copy), Players (copy)
	return GetLocalUserIdModule(Players) or "defaultUserId"
end

local function getItems()
	-- upvalues: GetLocalUserIdModule (copy), Players (copy), SafeAppStorageService (copy), HttpService (copy), MutedErrorFunction (copy)
	local LocalUserIdModule = GetLocalUserIdModule(Players) or "defaultUserId"
	local AXMarketplaceRecentlyViewedItemsItem = SafeAppStorageService.getItem("AXMarketplaceRecentlyViewedItems")
	
	if not AXMarketplaceRecentlyViewedItemsItem or AXMarketplaceRecentlyViewedItemsItem == "" then
		AXMarketplaceRecentlyViewedItemsItem = "{}"
	end
	local Items = {}
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), AXMarketplaceRecentlyViewedItemsItem (ref), LocalUserIdModule (copy), Items (ref)
		local Data = HttpService:JSONDecode(AXMarketplaceRecentlyViewedItemsItem)
		
		if Data.userId == LocalUserIdModule then
			Items = Data.items
		end
	end)
	
	if Success == false then
		MutedErrorFunction(`RecentlyViewedSearchItemsAppStorage getItems JSONDecode error: {Result}`)
	end
	return Items
end

local _ = function(Id, ItemType)
	-- upvalues: getItems (copy), DashModule (copy)
	return DashModule.filter(getItems(), function(p1): boolean
		-- upvalues: Id (copy), ItemType (copy)
		return p1.id ~= Id or p1.itemType ~= ItemType
	end)
end

local _ = function(List)
	-- upvalues: GetLocalUserIdModule (copy), Players (copy), HttpService (copy), SafeAppStorageService (copy), MutedErrorFunction (copy)
	local LocalUserIdModule = GetLocalUserIdModule(Players) or "defaultUserId"
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), LocalUserIdModule (copy), List (copy), SafeAppStorageService (upval)
		SafeAppStorageService.setItem("AXMarketplaceRecentlyViewedItems", (HttpService:JSONEncode({ userId = LocalUserIdModule, items = List })))
		SafeAppStorageService.flush()
	end)
	
	if Success == false then
		MutedErrorFunction(`RecentlyViewedSearchItemsAppStorage saveItems JSONEncode error: {Result}`)
	end
end

return {
	clearItems = function()
		-- upvalues: SafeAppStorageService (copy)
		SafeAppStorageService.setItem("AXMarketplaceRecentlyViewedItems", "{}")
		SafeAppStorageService.flush()
	end,
	getItems = function()
		-- upvalues: getItems (copy)
		return (getItems())
	end,
	removeItem = function(Id, ItemType)
		-- upvalues: getItems (copy), DashModule (copy), GetLocalUserIdModule (copy), Players (copy), HttpService (copy), SafeAppStorageService (copy), MutedErrorFunction (copy)
		local FilterResult = DashModule.filter(getItems(), function(p1): boolean
			-- upvalues: Id (copy), ItemType (copy)
			return p1.id ~= Id or p1.itemType ~= ItemType
		end)
		local LocalUserIdModule = GetLocalUserIdModule(Players) or "defaultUserId"
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), LocalUserIdModule (copy), FilterResult (copy), SafeAppStorageService (upval)
			SafeAppStorageService.setItem("AXMarketplaceRecentlyViewedItems", (HttpService:JSONEncode({ userId = LocalUserIdModule, items = FilterResult })))
			SafeAppStorageService.flush()
		end)
		
		if Success == false then
			MutedErrorFunction(`RecentlyViewedSearchItemsAppStorage saveItems JSONEncode error: {Result}`)
		end
		return FilterResult
	end,
	addItem = function(Id, ItemType)
		-- upvalues: getItems (copy), DashModule (copy), GetFIntAXMaxRecentlyViewedSearchItemsModule (copy), GetLocalUserIdModule (copy), Players (copy), HttpService (copy), SafeAppStorageService (copy), MutedErrorFunction (copy)
		local FilterResult = DashModule.filter(getItems(), function(p1): boolean
			-- upvalues: Id (copy), ItemType (copy)
			return p1.id ~= Id or p1.itemType ~= ItemType
		end)
		table.insert(FilterResult, 1, { id = Id, itemType = ItemType })
		
		if GetFIntAXMaxRecentlyViewedSearchItemsModule() < #FilterResult then
			table.remove(FilterResult)
		end
		local LocalUserIdModule = GetLocalUserIdModule(Players) or "defaultUserId"
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), LocalUserIdModule (copy), FilterResult (copy), SafeAppStorageService (upval)
			SafeAppStorageService.setItem("AXMarketplaceRecentlyViewedItems", (HttpService:JSONEncode({ userId = LocalUserIdModule, items = FilterResult })))
			SafeAppStorageService.flush()
		end)
		
		if Success == false then
			MutedErrorFunction(`RecentlyViewedSearchItemsAppStorage saveItems JSONEncode error: {Result}`)
		end
		return FilterResult
	end
}