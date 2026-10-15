local gifting = script:FindFirstAncestor("Gifting")
local parent = gifting.Parent
local dataHydrationModule = require(parent.DataHydration)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local dataStatus = dataHydrationModule.DataStatus
local _ = require(gifting.Models.CanGiftResponseModel)
local _ = require(gifting.Stores.createCanGiftStore)
local getCanGiftStoreModule = require(gifting.Stores.getCanGiftStore)
local giftEligibilityModule = require(gifting.Enums.GiftEligibility)
local _ = require(gifting.Types)
local buildItemGiftabilityKey = require(gifting.Stores.itemGiftabilityCacheKey).buildItemGiftabilityKey
local t = {}

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

local function createEligibilitySignal(value, p1)
	-- upvalues: signalsModule (ref), giftEligibilityModule (ref), t (ref), dataStatus (ref)
	local var1 = p1 ~= nil and #p1 > 0
	local senderEligibility = value.getSenderEligibility()
	local var2 = if p1 == nil or #p1 <= 0 then {} else value.getAndFetchItemGiftabilities(p1)
	
	return signalsModule.createComputed(function(p2)
		-- upvalues: senderEligibility (ref), giftEligibilityModule (copy), t (copy), var2 (ref), dataStatus (copy), var1 (ref)
		local var3 = senderEligibility.status(p2)
		local var4 = senderEligibility.data(p2)
		local var5 = if var4 ~= nil then giftEligibilityModule.Unknown else var4.eligibility
		local var6 = if var4 ~= nil then t else var4.requiredActions
		local var7 = false
		local var8 = false
		local var9 = false
		
		for i, v in var2 do
			local var10 = v.status(p2)
			
			if var10 == dataStatus.NotReady then
				var7 = true
			elseif var10 == dataStatus.Failed then
				var8 = true
			end
			local var11 = v.data(p2)
			
			if var11 == nil or not var11.isGiftable then
				var9 = true
			end
		end
		local var12 = if var3 ~= dataStatus.NotReady then var7 else true
		local var13 = if var3 ~= dataStatus.Failed then var8 else true
		
		return {
			canGift = not var12 and (not var13 and (var5 == giftEligibilityModule.Eligible and not var9)),
			areItemsGiftable = var1 and (not var7 and (not var8 and not var9)),
			senderEligibility = var5,
			requiredActions = var6,
			isLoading = var12,
			hasFailed = var13
		}
	end)
end

return function(p2, p3)
	-- upvalues: getCanGiftStoreModule (ref), buildItemsSignature (ref), reactModule (ref), createEligibilitySignal (ref), signalsReactModule (ref)
	local var3 = (if p3 then p3.store else nil) or getCanGiftStoreModule(false)
	local var4 = buildItemsSignature(p2)
	local var5 = reactModule.useRef(p2)
	var5.current = p2
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: createEligibilitySignal (copy), var3 (ref), var5 (ref)
		return createEligibilitySignal(var3, var5.current)
	end, { var3, var4 }))
end