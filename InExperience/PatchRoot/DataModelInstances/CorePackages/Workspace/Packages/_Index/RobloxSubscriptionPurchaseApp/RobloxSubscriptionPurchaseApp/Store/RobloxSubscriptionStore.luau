local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local signalsModule = require(robloxSubscriptionPurchaseApp.Parent.Signals)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local _ = require(robloxSubscriptionPurchaseApp.Enums.RobloxSubscriptionFlowCompleteReason)
local _ = require(robloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local _ = require(robloxSubscriptionPurchaseApp.Enums.ErrorReason)
local _ = require(robloxSubscriptionPurchaseApp.types)
local fFlagRobloxPlusFAEFreeTrialModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusFAEFreeTrial)
local var4 = nil

local var5 = function() --[[ line: 57 ]]
	-- upvalues: signalsModule (ref), promptStateModule (ref), fFlagRobloxPlusFAEFreeTrialModule (ref)
	local var6, var7 = signalsModule.createSignal(promptStateModule.Unspecified)
	local var8, var9 = signalsModule.createSignal(nil)
	local var10, var11 = signalsModule.createSignal(false)
	local var12, var13 = signalsModule.createSignal({})
	local var14, var15 = signalsModule.createSignal("")
	local var16, var17 = signalsModule.createSignal(false)
	local var18, var19 = signalsModule.createSignal({})
	local var20, var21 = signalsModule.createSignal({})
	local var22, var23 = signalsModule.createSignal(nil)
	local var24 = signalsModule.createComputed(function(p0) --[[ line: 69 ]]
		-- upvalues: var8 (ref)
		local var29 = var8(p0)
		
		return var29 and (var29.ProductKey and (var29.ProductKey.Id or ""))
	end)
	local var25 = nil
	local var26 = nil
	local var27 = nil
	local var28 = nil
	
	return {
		getPromptState = var6,
		setPromptState = var7,
		getRobloxSubscriptionProduct = var8,
		setRobloxSubscriptionProduct = var9,
		getPurchaseFlowOptions = var20,
		setPurchaseFlowOptions = var21,
		getDidTryPurchasing = var10,
		setDidTryPurchasing = var11,
		getPaymentSessionId = var14,
		setPaymentSessionId = var15,
		getEntryContext = var18,
		setEntryContext = var19,
		getErrorReason = var22,
		setErrorReason = var23,
		setOnFlowComplete = function(value) --[[ line: 81 ]]
			-- upvalues: var25 (write)
			var25 = value
		end,
		triggerOnFlowComplete = function(p1) --[[ line: 85 ]]
			-- upvalues: var25 (write)
			if var25 then
				var25(p1)
			end
		end,
		getPurchaseUIOptions = var12,
		setPurchaseUIOptions = var13,
		getIsNativePurchase = var16,
		setIsNativePurchase = var17,
		getRobloxSubscriptionProductId = var24,
		setOnUnmountUI = function(value) --[[ line: 115 ]]
			-- upvalues: var26 (write)
			var26 = value
		end,
		triggerUnmountUI = function() --[[ line: 119 ]]
			-- upvalues: var26 (write)
			if var26 then
				var26()
				var26 = nil
			end
		end,
		setOnBackButtonActivated = function(value) --[[ line: 91 ]]
			-- upvalues: var27 (write)
			var27 = value
		end,
		triggerOnBackButtonActivated = function() --[[ line: 95 ]]
			-- upvalues: var27 (write)
			if var27 then
				var27()
			end
		end,
		setOnCtaOverride = function(value) --[[ line: 101 ]]
			-- upvalues: fFlagRobloxPlusFAEFreeTrialModule (copy), var28 (write)
			if fFlagRobloxPlusFAEFreeTrialModule then
				var28 = value
				
				return
			end
		end,
		getOnCtaOverride = function() --[[ line: 108 ]]
			-- upvalues: fFlagRobloxPlusFAEFreeTrialModule (copy), var28 (write)
			return if fFlagRobloxPlusFAEFreeTrialModule then var28 else nil
		end
	}
end

return {
	get = function() --[[ line: 159 ]]
		-- upvalues: var4 (write), signalsModule (ref), var5 (ref)
		if var4 == nil then
			var4 = signalsModule.createComputed(var5)(false)
		end
		return var4
	end,
	cleanup = function() --[[ line: 166 ]]
		-- upvalues: var4 (write)
		var4 = nil
	end
}