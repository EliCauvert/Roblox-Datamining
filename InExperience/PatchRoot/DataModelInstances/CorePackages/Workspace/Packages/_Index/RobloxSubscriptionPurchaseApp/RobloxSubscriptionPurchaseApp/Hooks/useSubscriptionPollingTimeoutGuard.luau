local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)
local FinalizeRobloxSubscriptionUpsellFlowModule = require(RobloxSubscriptionPurchaseApp.Actions.finalizeRobloxSubscriptionUpsellFlow)
local TransitionToErrorModule = require(RobloxSubscriptionPurchaseApp.Actions.transitionToError)
local ErrorReasonModule = require(RobloxSubscriptionPurchaseApp.Enums.ErrorReason)
local RobloxSubscriptionPurchasePollingTimeoutSeconds = game:DefineFastInt("RobloxSubscriptionPurchasePollingTimeoutSeconds", 4)

return function() --[[ Line: 20 | Named "useSubscriptionPollingTimeoutGuard" ]]
	-- upvalues: RobloxSubscriptionStoreModule (copy), ReactModule (copy), SignalsReactModule (copy), PromptStateModule (copy), RobloxSubscriptionPurchasePollingTimeoutSeconds (copy), TransitionToErrorModule (copy), ErrorReasonModule (copy), FinalizeRobloxSubscriptionUpsellFlowModule (copy)
	local GetResult = RobloxSubscriptionStoreModule.get()
	local UseRefResult = ReactModule.useRef(GetResult)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetResult.getPromptState)
	ReactModule.useEffect(function() --[[ Line: 28 ]]
		-- upvalues: UseSignalStateResult (copy), PromptStateModule (upval), RobloxSubscriptionPurchasePollingTimeoutSeconds (upval), UseRefResult (copy), TransitionToErrorModule (upval), ErrorReasonModule (upval), FinalizeRobloxSubscriptionUpsellFlowModule (upval)
		if UseSignalStateResult ~= PromptStateModule.SubscriptionStatusPolling then return end
		local Flag = false
		task.delay(RobloxSubscriptionPurchasePollingTimeoutSeconds, function() --[[ Line: 36 ]]
			-- upvalues: Flag (ref), UseRefResult (upval), PromptStateModule (upval), TransitionToErrorModule (upval), ErrorReasonModule (upval), FinalizeRobloxSubscriptionUpsellFlowModule (upval)
			if Flag then return end
			local Current = UseRefResult.current
			
			if Current.getPromptState() == PromptStateModule.SubscriptionStatusPolling then
				if Current.getIsNativePurchase() then
					TransitionToErrorModule(ErrorReasonModule.GenericError, "useSubscriptionPollingTimeoutGuard")
					
					return
				end
				FinalizeRobloxSubscriptionUpsellFlowModule(false)
			end
		end)
		
		return function() --[[ Line: 55 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {
		UseSignalStateResult,
		(SignalsReactModule.useSignalState(GetResult.getIsNativePurchase))
	})
end