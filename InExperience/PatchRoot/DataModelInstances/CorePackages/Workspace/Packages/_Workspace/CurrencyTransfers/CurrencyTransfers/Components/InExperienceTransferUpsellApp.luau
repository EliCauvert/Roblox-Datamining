local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local reactModule = require(currencyTransfers.Parent.React)
local inExperienceRobuxTransferSubscriptionUpsellModule = require(currencyTransfers.Components.InExperienceRobuxTransferSubscriptionUpsell)
local useRobuxTransferSubscriptionUpsellListenerEffectModule = require(currencyTransfers.Hooks.useRobuxTransferSubscriptionUpsellListenerEffect)

return function()
	-- upvalues: reactModule (ref), useRobuxTransferSubscriptionUpsellListenerEffectModule (ref), inExperienceRobuxTransferSubscriptionUpsellModule (ref)
	local var4, var5 = reactModule.useState(false)
	local var6 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5(false)
	end, {})
	useRobuxTransferSubscriptionUpsellListenerEffectModule(reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5(true)
	end, {}))
	
	return if var4 then reactModule.createElement("ScreenGui", {
		DisplayOrder = 8,
		ScreenInsets = Enum.ScreenInsets.None,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		SubscriptionUpsell = reactModule.createElement(inExperienceRobuxTransferSubscriptionUpsellModule, { onClose = var6 })
	}) else nil
end