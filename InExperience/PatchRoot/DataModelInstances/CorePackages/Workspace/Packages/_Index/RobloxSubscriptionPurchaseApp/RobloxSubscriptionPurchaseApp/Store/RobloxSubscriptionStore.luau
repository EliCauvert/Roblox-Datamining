local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local signalsModule = require(robloxSubscriptionPurchaseApp.Parent.Signals)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local _ = require(robloxSubscriptionPurchaseApp.Enums.RobloxSubscriptionFlowCompleteReason)
local _ = require(robloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local _ = require(robloxSubscriptionPurchaseApp.Enums.ErrorReason)
local _ = require(robloxSubscriptionPurchaseApp.types)
local fFlagRobloxPlusFAEFreeTrialModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusFAEFreeTrial)
local var1 = nil

local var2 = function()
	-- upvalues: signalsModule (ref), promptStateModule (ref), fFlagRobloxPlusFAEFreeTrialModule (ref)
	local var3, var4 = signalsModule.createSignal(promptStateModule.Unspecified)
	local var5, var6 = signalsModule.createSignal(nil)
	local var7, var8 = signalsModule.createSignal(false)
	local var9, var10 = signalsModule.createSignal({})
	local var11, var12 = signalsModule.createSignal("")
	local var13, var14 = signalsModule.createSignal(false)
	local var15, var16 = signalsModule.createSignal({})
	local var17, var18 = signalsModule.createSignal({})
	local var19, var20 = signalsModule.createSignal(nil)
	local var21, var22 = signalsModule.createSignal(nil)
	local var23 = signalsModule.createComputed(function(p1)
		-- upvalues: var5 (ref)
		local var24 = var5(p1)
		
		return var24 and (var24.ProductKey and (var24.ProductKey.Id or ""))
	end)
	local var24 = nil
	local var25 = nil
	local var26 = nil
	local var27 = nil
	
	return {
		getPromptState = var3,
		setPromptState = var4,
		getRobloxSubscriptionProduct = var5,
		setRobloxSubscriptionProduct = var6,
		getPurchaseFlowOptions = var17,
		setPurchaseFlowOptions = var18,
		getDidTryPurchasing = var7,
		setDidTryPurchasing = var8,
		getPaymentSessionId = var11,
		setPaymentSessionId = var12,
		getEntryContext = var15,
		setEntryContext = var16,
		getErrorReason = var19,
		setErrorReason = var20,
		getReferrerId = var21,
		setReferrerId = var22,
		setOnFlowComplete = function(value)
			-- upvalues: var24 (write)
			var24 = value
		end,
		triggerOnFlowComplete = function(p1)
			-- upvalues: var24 (write)
			if var24 then
				var24(p1)
			end
		end,
		getPurchaseUIOptions = var9,
		setPurchaseUIOptions = var10,
		getIsNativePurchase = var13,
		setIsNativePurchase = var14,
		getRobloxSubscriptionProductId = var23,
		setOnUnmountUI = function(value)
			-- upvalues: var25 (write)
			var25 = value
		end,
		triggerUnmountUI = function()
			-- upvalues: var25 (write)
			if var25 then
				var25()
				var25 = nil
			end
		end,
		setOnBackButtonActivated = function(value)
			-- upvalues: var26 (write)
			var26 = value
		end,
		triggerOnBackButtonActivated = function()
			-- upvalues: var26 (write)
			if var26 then
				var26()
			end
		end,
		setOnCtaOverride = function(value)
			-- upvalues: fFlagRobloxPlusFAEFreeTrialModule (copy), var27 (write)
			if fFlagRobloxPlusFAEFreeTrialModule then
				var27 = value
				
				return
			end
		end,
		getOnCtaOverride = function()
			-- upvalues: fFlagRobloxPlusFAEFreeTrialModule (copy), var27 (write)
			return if fFlagRobloxPlusFAEFreeTrialModule then var27 else nil
		end
	}
end

return {
	get = function()
		-- upvalues: var1 (write), signalsModule (ref), var2 (ref)
		if var1 == nil then
			var1 = signalsModule.createComputed(var2)(false)
		end
		return var1
	end,
	cleanup = function()
		-- upvalues: var1 (write)
		var1 = nil
	end
}