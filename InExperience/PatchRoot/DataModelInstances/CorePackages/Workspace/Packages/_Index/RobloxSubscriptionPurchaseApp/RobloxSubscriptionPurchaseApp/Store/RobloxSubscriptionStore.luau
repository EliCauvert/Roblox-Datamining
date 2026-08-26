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
	local var21 = signalsModule.createComputed(function(p1)
		-- upvalues: var5 (ref)
		local var22 = var5(p1)
		
		return var22 and (var22.ProductKey and (var22.ProductKey.Id or ""))
	end)
	local var22 = nil
	local var23 = nil
	local var24 = nil
	local var25 = nil
	
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
		setOnFlowComplete = function(value)
			-- upvalues: var22 (write)
			var22 = value
		end,
		triggerOnFlowComplete = function(p1)
			-- upvalues: var22 (write)
			if var22 then
				var22(p1)
			end
		end,
		getPurchaseUIOptions = var9,
		setPurchaseUIOptions = var10,
		getIsNativePurchase = var13,
		setIsNativePurchase = var14,
		getRobloxSubscriptionProductId = var21,
		setOnUnmountUI = function(value)
			-- upvalues: var23 (write)
			var23 = value
		end,
		triggerUnmountUI = function()
			-- upvalues: var23 (write)
			if var23 then
				var23()
				var23 = nil
			end
		end,
		setOnBackButtonActivated = function(value)
			-- upvalues: var24 (write)
			var24 = value
		end,
		triggerOnBackButtonActivated = function()
			-- upvalues: var24 (write)
			if var24 then
				var24()
			end
		end,
		setOnCtaOverride = function(value)
			-- upvalues: fFlagRobloxPlusFAEFreeTrialModule (copy), var25 (write)
			if fFlagRobloxPlusFAEFreeTrialModule then
				var25 = value
				
				return
			end
		end,
		getOnCtaOverride = function()
			-- upvalues: fFlagRobloxPlusFAEFreeTrialModule (copy), var25 (write)
			return if fFlagRobloxPlusFAEFreeTrialModule then var25 else nil
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