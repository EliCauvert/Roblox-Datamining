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
	local var9 = robloxSubscriptionStoreModule.get()
	local var10 = reactModule.useRef(var9)
	local var11 = signalsReactModule.useSignalState(var9.getPromptState)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), promptStateModule (copy), robloxSubscriptionPurchasePollingTimeoutSeconds (copy), var10 (ref), transitionToErrorModule (copy), errorReasonModule (copy), finalizeRobloxSubscriptionUpsellFlowModule (copy)
		if var11 == promptStateModule.SubscriptionStatusPolling then
			local var12 = false
			task.delay(robloxSubscriptionPurchasePollingTimeoutSeconds, function()
				-- upvalues: var12 (write), var10 (copy), promptStateModule (copy), transitionToErrorModule (copy), errorReasonModule (copy), finalizeRobloxSubscriptionUpsellFlowModule (copy)
				if var12 then return end
				local current = var10.current
				
				if current.getPromptState() == promptStateModule.SubscriptionStatusPolling then
					if current.getIsNativePurchase() then
						transitionToErrorModule(errorReasonModule.GenericError, "useSubscriptionPollingTimeoutGuard")
						
						return
					end
					finalizeRobloxSubscriptionUpsellFlowModule(false)
				end
			end)
			
			return function()
				-- upvalues: var12 (write)
				var12 = true
			end
		end
	end, {
		var11,
		signalsReactModule.useSignalState(var9.getIsNativePurchase)
	})
end