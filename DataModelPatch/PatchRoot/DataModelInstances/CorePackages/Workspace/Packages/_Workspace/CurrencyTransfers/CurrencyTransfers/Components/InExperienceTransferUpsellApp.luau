local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local ReactModule = require(CurrencyTransfers.Parent.React)
local InExperienceRobuxTransferSubscriptionUpsellModule = require(CurrencyTransfers.Components.InExperienceRobuxTransferSubscriptionUpsell)
local UseRobuxTransferSubscriptionUpsellListenerEffectModule = require(CurrencyTransfers.Hooks.useRobuxTransferSubscriptionUpsellListenerEffect)

return function()
	-- upvalues: ReactModule (copy), UseRobuxTransferSubscriptionUpsellListenerEffectModule (copy), InExperienceRobuxTransferSubscriptionUpsellModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	UseRobuxTransferSubscriptionUpsellListenerEffectModule((ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})))
	
	return if UseStateResult then ReactModule.createElement("ScreenGui", {
		DisplayOrder = 8,
		ScreenInsets = Enum.ScreenInsets.None,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		SubscriptionUpsell = ReactModule.createElement(InExperienceRobuxTransferSubscriptionUpsellModule, { onClose = UseResult })
	}) else nil
end