local commerceService = game:GetService("CommerceService")
local commercePurchaseApp = script:FindFirstAncestor("CommercePurchaseApp")
local parent = commercePurchaseApp.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local commercePurchasePromptStateEnumModule = require(commercePurchaseApp.Enums.CommercePurchasePromptStateEnum)
local selectPromptStateModule = require(commercePurchaseApp.Store.Selectors.selectPromptState)
local selectCommerceProductIdModule = require(commercePurchaseApp.Store.Selectors.selectCommerceProductId)
local selectCheckoutSessionIdModule = require(commercePurchaseApp.Store.Selectors.selectCheckoutSessionId)
local commercePurchaseEndedModule = require(commercePurchaseApp.Store.Actions.CommercePurchaseEnded)

return function() --[[ line: 16 | named "usePurchaseBrowserClosedListenerEffect" ]]
	-- upvalues: useDispatch (ref), useSelector (ref), selectPromptStateModule (ref), selectCommerceProductIdModule (ref), selectCheckoutSessionIdModule (ref), reactModule (ref), commerceService (ref), commercePurchasePromptStateEnumModule (ref), commercePurchaseEndedModule (ref)
	local var8 = useDispatch()
	local var9 = useSelector(selectPromptStateModule)
	local var10 = useSelector(selectCommerceProductIdModule)
	local var11 = useSelector(selectCheckoutSessionIdModule)
	reactModule.useEffect(function() --[[ line: 21 ]]
		-- upvalues: var8 (ref), commerceService (copy), var9 (ref), commercePurchasePromptStateEnumModule (copy), var10 (ref), var11 (ref), commercePurchaseEndedModule (copy)
		local var12 = if var8 then commerceService.PurchaseBrowserClosed:Connect(function() --[[ line: 24 ]]
			-- upvalues: var9 (copy), commercePurchasePromptStateEnumModule (copy), commerceService (copy), var10 (copy), var11 (copy), var8 (copy), commercePurchaseEndedModule (copy)
			if var9 == commercePurchasePromptStateEnumModule.Checkout then
				commerceService:SignalPromptCommerceProductPurchaseFinished(var10, true, var11)
				var8(commercePurchaseEndedModule())
			end
		end) else nil
		
		return function() --[[ line: 35 ]]
			-- upvalues: var12 (write)
			if var12 then
				var12:Disconnect()
				var12 = nil
			end
		end
	end, { var8, var9, var10, var11 })
end