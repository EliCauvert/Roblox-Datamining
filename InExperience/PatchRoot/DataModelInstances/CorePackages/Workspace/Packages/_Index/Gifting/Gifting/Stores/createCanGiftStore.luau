local httpService = game:GetService("HttpService")
local gifting = script:FindFirstAncestor("Gifting")
local parent = gifting.Parent
local dataHydrationModule = require(parent.DataHydration)
local promiseModule = require(parent.Promise)
local createDataCache = dataHydrationModule.createDataCache
local createDataResolver = dataHydrationModule.createDataResolver
local _ = require(gifting.Models.CanGiftResponseModel)
local _ = require(gifting.Models.FindRecipientsResponseModel)
local giftModelUtilsModule = require(gifting.Models.GiftModelUtils)
local postCanGiftModule = require(gifting.WebApi.postCanGift)
local postFindRecipientsModule = require(gifting.WebApi.postFindRecipients)
local itemGiftabilityCacheKeyModule = require(gifting.Stores.itemGiftabilityCacheKey)
local _ = require(gifting.Types)
local dataStatus = dataHydrationModule.DataStatus
local buildItemGiftabilityKey = itemGiftabilityCacheKeyModule.buildItemGiftabilityKey
local parseItemGiftabilityKey = itemGiftabilityCacheKeyModule.parseItemGiftabilityKey

local function buildRecipientsKey(p1)
	-- upvalues: buildItemGiftabilityKey (ref), httpService (ref)
	local t = {}
	
	for i, v in p1.items do
		table.insert(t, buildItemGiftabilityKey(v))
	end
	return httpService:JSONEncode({ t, p1.searchTerm or "", p1.cursor or "" })
end

return function(p2)
	-- upvalues: postCanGiftModule (ref), postFindRecipientsModule (ref), createDataCache (ref), createDataResolver (ref), parseItemGiftabilityKey (ref), buildItemGiftabilityKey (ref), dataStatus (ref), promiseModule (ref), giftModelUtilsModule (ref), buildRecipientsKey (ref)
	local var1 = if p2 and p2.postCanGift then p2.postCanGift else postCanGiftModule
	local var2 = if p2 and p2.postFindRecipients then p2.postFindRecipients else postFindRecipientsModule
	local var3 = if p2 then p2.network else nil
	local var4 = createDataCache(45)
	local var5 = createDataCache(45)
	local var6 = createDataResolver({
		replaceItems = true,
		requestBatchSize = 20,
		queueProcessDelaySec = 0,
		cache = var5,
		fetchFn = function(p3)
			-- upvalues: parseItemGiftabilityKey (copy), var1 (ref), var3 (ref), var4 (ref), buildItemGiftabilityKey (copy), dataStatus (copy), promiseModule (copy)
			local t = {}
			
			for i in p3 do
				local var7 = parseItemGiftabilityKey(i)
				
				if var7 ~= nil then
					table.insert(t, var7)
				end
			end
			return var1({ items = t }, var3):andThen(function(p4)
				-- upvalues: var4 (copy), buildItemGiftabilityKey (copy)
				var4.replaceItem("sender", {
					eligibility = p4.eligibility,
					requiredActions = p4.requiredActions
				})
				local t = {}
				
				for i, v in p4.items do
					t[buildItemGiftabilityKey(v.item)] = v
				end
				return t
			end):catch(function(p5)
				-- upvalues: var4 (copy), dataStatus (copy), promiseModule (copy)
				if var4.getItem("sender").status(false) ~= dataStatus.Ready then
					var4.markItemsAsFailed({ "sender" })
				end
				return promiseModule.reject(p5)
			end)
		end
	})
	
	local function _(p4)
		-- upvalues: giftModelUtilsModule (copy)
		return p4 ~= nil and giftModelUtilsModule.nonEmptyString(p4.itemId)
	end
	
	local _ = function()
		-- upvalues: var5 (ref)
		local invalid = var5.getItem("invalid")
		var5.markItemsAsFailed({ "invalid" })
		
		return invalid
	end
	
	local t = {}
	local var8 = createDataResolver({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCache(45, 0),
		fetchFn = function(p4)
			-- upvalues: t (write), var2 (ref), var3 (ref)
			local var9 = t[p4]
			
			return var2({
				limit = 25,
				items = var9.items,
				searchTerm = if var9.searchTerm ~= "" then nil else var9.searchTerm,
				cursor = var9.cursor
			}, var3)
		end
	})
	
	local _ = function(p4)
		-- upvalues: buildRecipientsKey (copy), t (write)
		local var9 = buildRecipientsKey(p4)
		t[var9] = p4
		
		return var9
	end
	
	return {
		getSenderEligibility = function()
			-- upvalues: var4 (ref)
			return var4.getItem("sender")
		end,
		getAndFetchItemGiftability = function(p4)
			-- upvalues: giftModelUtilsModule (copy), var5 (ref), var6 (ref), buildItemGiftabilityKey (copy)
			if p4 ~= nil and giftModelUtilsModule.nonEmptyString(p4.itemId) then
				return var6.getAndFetchItem(buildItemGiftabilityKey(p4))
			end
			local invalid = var5.getItem("invalid")
			var5.markItemsAsFailed({ "invalid" })
			
			return invalid
		end,
		getAndFetchItemGiftabilities = function(p4)
			-- upvalues: giftModelUtilsModule (copy), buildItemGiftabilityKey (copy), var6 (ref), var5 (ref)
			local t = {}
			local var9 = false
			
			for i, v in p4 do
				if v ~= nil and giftModelUtilsModule.nonEmptyString(v.itemId) then
					table.insert(t, buildItemGiftabilityKey(v))
				else
					var9 = true
				end
			end
			local andFetchItems = var6.getAndFetchItems(t)
			
			if var9 then
				local invalid = var5.getItem("invalid")
				var5.markItemsAsFailed({ "invalid" })
				andFetchItems.invalid = invalid
			end
			return andFetchItems
		end,
		getAndFetchRecipients = function(p5)
			-- upvalues: var8 (ref), buildRecipientsKey (copy), t (write)
			local getAndFetchItem = var8.getAndFetchItem
			local var10 = buildRecipientsKey(p5)
			t[var10] = p5
			
			return getAndFetchItem(var10)
		end,
		clear = function()
			-- upvalues: var4 (ref), var6 (ref), t (write), var8 (ref)
			var4.clear()
			var6.clear()
			t = {}
			var8.clear()
		end,
		dispose = function()
			-- upvalues: var4 (ref), var6 (ref), t (write), var8 (ref)
			var4.dispose()
			var6.dispose()
			t = {}
			var8.dispose()
		end
	}
end