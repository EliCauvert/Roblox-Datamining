local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local completeRobloxSubscriptionUpsellFlowModule = require(robloxSubscriptionPurchaseApp.Actions.completeRobloxSubscriptionUpsellFlow)

return function()
	-- upvalues: robloxSubscriptionStoreModule (ref), signalsReactModule (ref), reactModule (ref), promptStateModule (ref), completeRobloxSubscriptionUpsellFlowModule (ref)
	local var1 = signalsReactModule.useSignalState(robloxSubscriptionStoreModule.get().getPromptState)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), promptStateModule (copy), completeRobloxSubscriptionUpsellFlowModule (copy)
		if var1 == promptStateModule.Error then
			completeRobloxSubscriptionUpsellFlowModule()
		end
	end, { var1 })
end