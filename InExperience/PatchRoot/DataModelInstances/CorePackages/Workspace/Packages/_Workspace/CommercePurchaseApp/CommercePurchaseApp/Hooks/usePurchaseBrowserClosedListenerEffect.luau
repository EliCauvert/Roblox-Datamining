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

return function()
	-- upvalues: useDispatch (ref), useSelector (ref), selectPromptStateModule (ref), selectCommerceProductIdModule (ref), selectCheckoutSessionIdModule (ref), reactModule (ref), commerceService (ref), commercePurchasePromptStateEnumModule (ref), commercePurchaseEndedModule (ref)
	local var1 = useDispatch()
	local var2 = useSelector(selectPromptStateModule)
	local var3 = useSelector(selectCommerceProductIdModule)
	local var4 = useSelector(selectCheckoutSessionIdModule)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), commerceService (copy), var2 (ref), commercePurchasePromptStateEnumModule (copy), var3 (ref), var4 (ref), commercePurchaseEndedModule (copy)
		local var5 = if var1 then commerceService.PurchaseBrowserClosed:Connect(function()
			-- upvalues: var2 (copy), commercePurchasePromptStateEnumModule (copy), commerceService (copy), var3 (copy), var4 (copy), var1 (copy), commercePurchaseEndedModule (copy)
			if var2 == commercePurchasePromptStateEnumModule.Checkout then
				commerceService:SignalPromptCommerceProductPurchaseFinished(var3, true, var4)
				var1(commercePurchaseEndedModule())
			end
		end) else nil
		
		return function()
			-- upvalues: var5 (write)
			if var5 then
				var5:Disconnect()
				var5 = nil
			end
		end
	end, { var1, var2, var3, var4 })
end