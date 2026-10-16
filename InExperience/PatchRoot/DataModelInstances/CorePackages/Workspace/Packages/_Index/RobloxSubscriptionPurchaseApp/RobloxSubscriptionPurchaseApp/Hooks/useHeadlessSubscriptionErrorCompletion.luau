local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)
local CompleteRobloxSubscriptionUpsellFlowModule = require(RobloxSubscriptionPurchaseApp.Actions.completeRobloxSubscriptionUpsellFlow)

return function() --[[ Line: 14 | Named "useHeadlessSubscriptionErrorCompletion" ]]
	-- upvalues: RobloxSubscriptionStoreModule (copy), SignalsReactModule (copy), ReactModule (copy), PromptStateModule (copy), CompleteRobloxSubscriptionUpsellFlowModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(RobloxSubscriptionStoreModule.get().getPromptState)
	ReactModule.useEffect(function() --[[ Line: 18 ]]
		-- upvalues: UseSignalStateResult (copy), PromptStateModule (upval), CompleteRobloxSubscriptionUpsellFlowModule (upval)
		if UseSignalStateResult == PromptStateModule.Error then
			CompleteRobloxSubscriptionUpsellFlowModule()
		end
	end, { UseSignalStateResult })
end