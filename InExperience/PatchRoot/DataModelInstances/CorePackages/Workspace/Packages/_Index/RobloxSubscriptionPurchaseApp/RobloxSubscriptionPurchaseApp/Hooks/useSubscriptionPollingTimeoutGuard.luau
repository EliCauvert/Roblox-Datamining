local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local finalizeRobloxSubscriptionUpsellFlowModule = require(robloxSubscriptionPurchaseApp.Actions.finalizeRobloxSubscriptionUpsellFlow)
local transitionToErrorModule = require(robloxSubscriptionPurchaseApp.Actions.transitionToError)
local errorReasonModule = require(robloxSubscriptionPurchaseApp.Enums.ErrorReason)
local robloxSubscriptionPurchasePollingTimeoutSeconds = game:DefineFastInt("RobloxSubscriptionPurchasePollingTimeoutSeconds", 4)

return function()
	-- upvalues: robloxSubscriptionStoreModule (ref), reactModule (ref), signalsReactModule (ref), promptStateModule (ref), robloxSubscriptionPurchasePollingTimeoutSeconds (ref), transitionToErrorModule (ref), errorReasonModule (ref), finalizeRobloxSubscriptionUpsellFlowModule (ref)
	local var1 = robloxSubscriptionStoreModule.get()
	local var2 = reactModule.useRef(var1)
	local var3 = signalsReactModule.useSignalState(var1.getPromptState)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), promptStateModule (copy), robloxSubscriptionPurchasePollingTimeoutSeconds (copy), var2 (ref), transitionToErrorModule (copy), errorReasonModule (copy), finalizeRobloxSubscriptionUpsellFlowModule (copy)
		if var3 == promptStateModule.SubscriptionStatusPolling then
			local var4 = false
			task.delay(robloxSubscriptionPurchasePollingTimeoutSeconds, function()
				-- upvalues: var4 (write), var2 (copy), promptStateModule (copy), transitionToErrorModule (copy), errorReasonModule (copy), finalizeRobloxSubscriptionUpsellFlowModule (copy)
				if var4 then return end
				local current = var2.current
				
				if current.getPromptState() == promptStateModule.SubscriptionStatusPolling then
					if current.getIsNativePurchase() then
						transitionToErrorModule(errorReasonModule.GenericError, "useSubscriptionPollingTimeoutGuard")
						
						return
					end
					finalizeRobloxSubscriptionUpsellFlowModule(false)
				end
			end)
			
			return function()
				-- upvalues: var4 (write)
				var4 = true
			end
		end
	end, {
		var3,
		signalsReactModule.useSignalState(var1.getIsNativePurchase)
	})
end