local gifting = script:FindFirstAncestor("Gifting")
local parent = gifting.Parent
local dataHydrationModule = require(parent.DataHydration)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(gifting.Stores.createCanGiftStore)
local _ = require(gifting.Models.FindRecipientsResponseModel)
local getCanGiftStoreModule = require(gifting.Stores.getCanGiftStore)
local itemGiftabilityCacheKeyModule = require(gifting.Stores.itemGiftabilityCacheKey)
local _ = require(gifting.Types)
local dataStatus = dataHydrationModule.DataStatus
local buildItemGiftabilityKey = itemGiftabilityCacheKeyModule.buildItemGiftabilityKey
local t = {}
local t_1 = {
	isLoading = false,
	isLoadingMore = false,
	hasFailed = false,
	nextCursor = nil,
	recipients = {}
}

local function buildItemsSignature(value)
	-- upvalues: buildItemGiftabilityKey (ref)
	if value == nil or #value == 0 then
		return nil
	end
	local t = {}
	
	for i, v in value do
		table.insert(t, buildItemGiftabilityKey(v))
	end
	return table.concat(t, ",")
end

local function requestPages(p1, p2, p3, p4, p5)
	local t = {}
	
	local function requestPage(p6)
		-- upvalues: p5 (ref), t (ref), p2 (ref), p3 (ref), p1 (ref)
		local var1 = p5[#t + 1]
		
		if var1 == nil or var1.query.cursor ~= p6 then
			local t_1 = { items = p2, searchTerm = p3, cursor = p6 }
			table.insert(t, { query = t_1, result = p1.getAndFetchRecipients(t_1) })
			
			return
		end
		table.insert(t, var1)
	end
	
	requestPage(nil)
	
	for i, v in p4 do
		requestPage(v)
	end
	return t
end

local function createPagesSignal(value)
	-- upvalues: signalsModule (ref), dataStatus (ref)
	return signalsModule.createComputed(function(p6)
		-- upvalues: value (ref), dataStatus (copy)
		local t = {}
		local var1 = false
		local var2 = false
		local var3 = false
		local var4 = nil
		
		for i, v in value do
			local var5 = v.result.status(p6)
			local var6 = v.result.data(p6)
			
			if var5 == dataStatus.NotReady then
				if i == 1 then
					var1 = true
				else
					var2 = true
				end
			elseif var5 == dataStatus.Failed then
				var3 = true
			end
			if var6 ~= nil and var5 ~= dataStatus.Failed then
				for i_1, v_1 in var6.recipients do
					table.insert(t, v_1)
				end
			end
			if i == #value then
				var4 = if var5 == dataStatus.Ready and var6 ~= nil then var6.nextCursor else nil
			end
		end
		return {
			recipients = t,
			isLoading = var1,
			isLoadingMore = var2,
			hasFailed = var3,
			nextCursor = var4
		}
	end)
end

local var7 = signalsModule.createComputed(function()
	-- upvalues: t_1 (ref)
	return t_1
end)

return function(p7, p8)
	-- upvalues: getCanGiftStoreModule (ref), reactModule (ref), buildItemsSignature (ref), t (ref), requestPages (ref), var7 (ref), createPagesSignal (ref), signalsReactModule (ref), dataStatus (ref)
	local var8 = getCanGiftStoreModule(false)
	p8 = p8 or ""
	local var9, var10 = reactModule.useState(nil)
	local var11 = buildItemsSignature(p7)
	local var12 = `{var11 or ""}\0{p8}`
	local var13 = if var9 == nil or var9.searchKey ~= var12 then t else var9.cursors
	local var14 = reactModule.useRef(p7)
	var14.current = p7
	local var15 = reactModule.useRef(nil)
	local var16 = reactModule.useMemo(function()
		-- upvalues: var14 (ref), var11 (ref), var15 (ref), var12 (ref), requestPages (copy), var8 (ref), p8 (ref), var13 (ref)
		local current = var14.current
		
		if current == nil or var11 == nil then
			return {}
		end
		local current_1 = var15.current
		local var17 = requestPages(var8, current, p8, var13, if current_1 == nil or current_1.searchKey ~= var12 then {} else current_1.pages)
		var15.current = { searchKey = var12, pages = var17 }
		
		return var17
	end, { var8, var11, p8, var13 })
	local var17 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: var16 (ref), var7 (copy), createPagesSignal (copy)
		return if #var16 == 0 then var7 else createPagesSignal(var16)
	end, { var16 }))
	local nextCursor = var17.nextCursor
	
	return {
		recipients = var17.recipients,
		isLoading = var17.isLoading,
		isLoadingMore = var17.isLoadingMore,
		hasFailed = var17.hasFailed,
		hasMore = nextCursor ~= nil,
		loadMore = reactModule.useCallback(function()
			-- upvalues: nextCursor (ref), var13 (ref), var10 (ref), var12 (ref)
			if nextCursor == nil then
				return
			end
			local cloned = table.clone(var13)
			table.insert(cloned, nextCursor)
			var10({ searchKey = var12, cursors = cloned })
		end, { nextCursor, var13, var12 }),
		retry = reactModule.useCallback(function()
			-- upvalues: var16 (ref), dataStatus (copy), var8 (ref)
			for i, v in var16 do
				if v.result.status(false) == dataStatus.Failed then
					var8.getAndFetchRecipients(v.query)
				end
			end
		end, { var8, var16 })
	}
end