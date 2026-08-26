local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local reactModule = require(currencyTransfers.Parent.React)
local inExperienceRobuxTransferSubscriptionUpsellModule = require(currencyTransfers.Components.InExperienceRobuxTransferSubscriptionUpsell)
local useRobuxTransferSubscriptionUpsellListenerEffectModule = require(currencyTransfers.Hooks.useRobuxTransferSubscriptionUpsellListenerEffect)

return function()
	-- upvalues: reactModule (ref), useRobuxTransferSubscriptionUpsellListenerEffectModule (ref), inExperienceRobuxTransferSubscriptionUpsellModule (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(false)
	end, {})
	useRobuxTransferSubscriptionUpsellListenerEffectModule(reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(true)
	end, {}))
	
	return if var1 then reactModule.createElement("ScreenGui", {
		DisplayOrder = 8,
		ScreenInsets = Enum.ScreenInsets.None,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		SubscriptionUpsell = reactModule.createElement(inExperienceRobuxTransferSubscriptionUpsellModule, { onClose = var3 })
	}) else nil
end