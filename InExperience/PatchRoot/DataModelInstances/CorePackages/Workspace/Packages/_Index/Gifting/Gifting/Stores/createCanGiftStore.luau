local HttpService = game:GetService("HttpService")
local Gifting = script:FindFirstAncestor("Gifting")
local Parent = Gifting.Parent
local DataHydrationModule = require(Parent.DataHydration)
local PromiseModule = require(Parent.Promise)
local CreateDataCacheFunction = DataHydrationModule.createDataCache
local CreateDataResolverFunction = DataHydrationModule.createDataResolver
local _ = require(Gifting.Models.CanGiftResponseModel)
local _ = require(Gifting.Models.FindRecipientsResponseModel)
local GiftModelUtilsModule = require(Gifting.Models.GiftModelUtils)
local PostCanGiftModule = require(Gifting.WebApi.postCanGift)
local PostFindRecipientsModule = require(Gifting.WebApi.postFindRecipients)
local ItemGiftabilityCacheKeyModule = require(Gifting.Stores.itemGiftabilityCacheKey)
local _ = require(Gifting.Types)
local DataStatus = DataHydrationModule.DataStatus
local BuildItemGiftabilityKeyFunction = ItemGiftabilityCacheKeyModule.buildItemGiftabilityKey
local ParseItemGiftabilityKeyFunction = ItemGiftabilityCacheKeyModule.parseItemGiftabilityKey

local function buildRecipientsKey(p1) --[[ Line: 80 ]]
	-- upvalues: BuildItemGiftabilityKeyFunction (copy), HttpService (copy)
	local List = {}
	
	for _, item in p1.items do
		table.insert(List, BuildItemGiftabilityKeyFunction(item))
	end
	return HttpService:JSONEncode({ List, p1.searchTerm or "", p1.cursor or "" })
end

return function(p2) --[[ Line: 89 | Named "createCanGiftStore" ]]
	-- upvalues: PostCanGiftModule (copy), PostFindRecipientsModule (copy), CreateDataCacheFunction (copy), CreateDataResolverFunction (copy), ParseItemGiftabilityKeyFunction (copy), BuildItemGiftabilityKeyFunction (copy), DataStatus (copy), PromiseModule (copy), GiftModelUtilsModule (copy), buildRecipientsKey (copy)
	local PostCanGift = if p2 and p2.postCanGift then p2.postCanGift else PostCanGiftModule
	local PostFindRecipients = if p2 and p2.postFindRecipients then p2.postFindRecipients else PostFindRecipientsModule
	local Network = if p2 then p2.network else nil
	local DataCache = CreateDataCacheFunction(45)
	local DataCache1 = CreateDataCacheFunction(45)
	local DataResolver = CreateDataResolverFunction({
		replaceItems = true,
		requestBatchSize = 20,
		queueProcessDelaySec = 0,
		cache = DataCache1,
		fetchFn = function(List) --[[ Line: 105 ]]
			-- upvalues: ParseItemGiftabilityKeyFunction (upval), PostCanGift (copy), Network (copy), DataCache (copy), BuildItemGiftabilityKeyFunction (upval), DataStatus (upval), PromiseModule (upval)
			local Items = {}
			
			for i in List do
				local ParseItemGiftabilityKeyResult = ParseItemGiftabilityKeyFunction(i)
				
				if ParseItemGiftabilityKeyResult ~= nil then
					table.insert(Items, ParseItemGiftabilityKeyResult)
				end
			end
			return PostCanGift({ items = Items }, Network):andThen(function(Result) --[[ Line: 117 ]]
				-- upvalues: DataCache (upval), BuildItemGiftabilityKeyFunction (upval)
				DataCache.replaceItem("sender", {
					eligibility = Result.eligibility,
					requiredActions = Result.requiredActions
				})
				local t = {}
				
				for _, item in Result.items do
					t[BuildItemGiftabilityKeyFunction(item.item)] = item
				end
				return t
			end):catch(function(Err) --[[ Line: 129 ]]
				-- upvalues: DataCache (upval), DataStatus (upval), PromiseModule (upval)
				if DataCache.getItem("sender").status(false) ~= DataStatus.Ready then
					DataCache.markItemsAsFailed({ "sender" })
				end
				return PromiseModule.reject(Err)
			end)
		end
	})
	
	local function _(p3) --[[ Line: 139 | Named "isValidItem" ]]
		-- upvalues: GiftModelUtilsModule (upval)
		return p3 ~= nil and GiftModelUtilsModule.nonEmptyString(p3.itemId)
	end
	
	local _ = function() --[[ Line: 144 | Named "invalidItemResult" ]]
		-- upvalues: DataCache1 (copy)
		local InvalidItem = DataCache1.getItem("invalid")
		DataCache1.markItemsAsFailed({ "invalid" })
		
		return InvalidItem
	end
	
	local T = {}
	local DataResolver1 = CreateDataResolverFunction({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheFunction(45, 0),
		fetchFn = function(p3) --[[ Line: 158 ]]
			-- upvalues: T (ref), PostFindRecipients (copy), Network (copy)
			local Entry = T[p3]
			
			return PostFindRecipients({
				limit = 25,
				items = Entry.items,
				searchTerm = if Entry.searchTerm == "" then nil else Entry.searchTerm,
				cursor = Entry.cursor
			}, Network)
		end
	})
	
	local _ = function(p3) --[[ Line: 169 | Named "recipientsKeyFor" ]]
		-- upvalues: buildRecipientsKey (upval), T (ref)
		local RecipientsKey = buildRecipientsKey(p3)
		T[RecipientsKey] = p3
		
		return RecipientsKey
	end
	
	return {
		getSenderEligibility = function() --[[ Line: 176 ]]
			-- upvalues: DataCache (copy)
			return (DataCache.getItem("sender"))
		end,
		getAndFetchItemGiftability = function(p3) --[[ Line: 180 ]]
			-- upvalues: GiftModelUtilsModule (upval), DataCache1 (copy), DataResolver (copy), BuildItemGiftabilityKeyFunction (upval)
			if p3 ~= nil and GiftModelUtilsModule.nonEmptyString(p3.itemId) then
				return (DataResolver.getAndFetchItem(BuildItemGiftabilityKeyFunction(p3)))
			else
				local InvalidItem = DataCache1.getItem("invalid")
				DataCache1.markItemsAsFailed({ "invalid" })
				
				return InvalidItem
			end
		end,
		getAndFetchItemGiftabilities = function(List) --[[ Line: 187 ]]
			-- upvalues: GiftModelUtilsModule (upval), BuildItemGiftabilityKeyFunction (upval), DataResolver (copy), DataCache1 (copy)
			local List1 = {}
			local Flag = false
			
			for _, value in List do
				if value ~= nil and GiftModelUtilsModule.nonEmptyString(value.itemId) then
					table.insert(List1, BuildItemGiftabilityKeyFunction(value))
				else
					Flag = true
				end
			end
			local AndFetchItems = DataResolver.getAndFetchItems(List1)
			
			if Flag then
				local InvalidItem = DataCache1.getItem("invalid")
				DataCache1.markItemsAsFailed({ "invalid" })
				AndFetchItems.invalid = InvalidItem
			end
			return AndFetchItems
		end,
		getAndFetchRecipients = function(p3) --[[ Line: 204 ]]
			-- upvalues: DataResolver1 (copy), buildRecipientsKey (upval), T (ref)
			local GetAndFetchItemFunction = DataResolver1.getAndFetchItem
			local RecipientsKey = buildRecipientsKey(p3)
			T[RecipientsKey] = p3
			
			return (GetAndFetchItemFunction(RecipientsKey))
		end,
		clear = function() --[[ Line: 208 ]]
			-- upvalues: DataCache (copy), DataResolver (copy), T (ref), DataResolver1 (copy)
			DataCache.clear()
			DataResolver.clear()
			T = {}
			DataResolver1.clear()
		end,
		dispose = function() --[[ Line: 214 ]]
			-- upvalues: DataCache (copy), DataResolver (copy), T (ref), DataResolver1 (copy)
			DataCache.dispose()
			DataResolver.dispose()
			T = {}
			DataResolver1.dispose()
		end
	}
end