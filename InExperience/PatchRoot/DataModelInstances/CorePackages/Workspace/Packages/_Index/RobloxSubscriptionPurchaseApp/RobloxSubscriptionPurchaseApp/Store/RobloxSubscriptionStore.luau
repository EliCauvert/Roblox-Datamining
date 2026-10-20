local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local SignalsModule = require(RobloxSubscriptionPurchaseApp.Parent.Signals)
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)
local _ = require(RobloxSubscriptionPurchaseApp.Enums.RobloxSubscriptionFlowCompleteReason)
local _ = require(RobloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)
local _ = require(RobloxSubscriptionPurchaseApp.Enums.ErrorReason)
local _ = require(RobloxSubscriptionPurchaseApp.types)
local v1 = nil

local function v8()
	-- upvalues: SignalsModule (copy), PromptStateModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(PromptStateModule.Unspecified)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Signal3, Signal2_2 = SignalsModule.createSignal(false)
	local Signal4, Signal2_3 = SignalsModule.createSignal({})
	local Signal5, Signal2_4 = SignalsModule.createSignal("")
	local Signal6, Signal2_5 = SignalsModule.createSignal(false)
	local Signal7, Signal2_6 = SignalsModule.createSignal({})
	local Signal8, Signal2_7 = SignalsModule.createSignal({})
	local Signal9, Signal2_8 = SignalsModule.createSignal(nil)
	local Signal10, Signal2_9 = SignalsModule.createSignal(nil)
	local Callback1 = nil
	local Callback2 = nil
	local Callback = nil
	local OnCtaOverride = nil
	
	return {
		getPromptState = Signal,
		setPromptState = Signal2,
		getRobloxSubscriptionProduct = Signal1,
		setRobloxSubscriptionProduct = Signal2_1,
		getPurchaseFlowOptions = Signal8,
		setPurchaseFlowOptions = Signal2_7,
		getDidTryPurchasing = Signal3,
		setDidTryPurchasing = Signal2_2,
		getPaymentSessionId = Signal5,
		setPaymentSessionId = Signal2_4,
		getEntryContext = Signal7,
		setEntryContext = Signal2_6,
		getErrorReason = Signal9,
		setErrorReason = Signal2_8,
		getReferrerId = Signal10,
		setReferrerId = Signal2_9,
		setOnFlowComplete = function(Value)
			-- upvalues: Callback1 (ref)
			Callback1 = Value
		end,
		triggerOnFlowComplete = function(p1)
			-- upvalues: Callback1 (ref)
			if Callback1 then
				Callback1(p1)
			end
		end,
		getPurchaseUIOptions = Signal4,
		setPurchaseUIOptions = Signal2_3,
		getIsNativePurchase = Signal6,
		setIsNativePurchase = Signal2_5,
		getRobloxSubscriptionProductId = SignalsModule.createComputed(function(p1)
			-- upvalues: Signal1 (copy)
			local SignalResult = Signal1(p1)
			
			return SignalResult and SignalResult.ProductKey and SignalResult.ProductKey.Id or ""
		end),
		setOnUnmountUI = function(Value)
			-- upvalues: Callback2 (ref)
			Callback2 = Value
		end,
		triggerUnmountUI = function()
			-- upvalues: Callback2 (ref)
			if Callback2 then
				Callback2()
				Callback2 = nil
			end
		end,
		setOnBackButtonActivated = function(Value)
			-- upvalues: Callback (ref)
			Callback = Value
		end,
		triggerOnBackButtonActivated = function()
			-- upvalues: Callback (ref)
			if Callback then
				Callback()
			end
		end,
		setOnCtaOverride = function(Value)
			-- upvalues: OnCtaOverride (ref)
			OnCtaOverride = Value
		end,
		getOnCtaOverride = function()
			-- upvalues: OnCtaOverride (ref)
			return OnCtaOverride
		end
	}
end

return {
	get = function()
		-- upvalues: v1 (ref), SignalsModule (copy), v8 (copy)
		if v1 == nil then
			v1 = SignalsModule.createComputed(v8)(false)
		end
		return v1
	end,
	cleanup = function()
		-- upvalues: v1 (ref)
		v1 = nil
	end
}